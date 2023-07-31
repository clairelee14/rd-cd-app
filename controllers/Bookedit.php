<?php
  defined('BASEPATH') OR exit('No direct script access allowed');

  class Bookedit extends CI_Controller {

    function __construct()
    {
      parent::__construct();
      $this->load->helper('form'); // loading this for the entire class/controller
      $this->load->library('form_validation'); // loading this for the entire class/controller
      $this->load->database(); // ummm…ditto
    }

    public function index(){
      $data['heading'] = "Book Club";
      $this->load->model('bookedit_model');
      $data['results'] = $this->bookedit_model->get_books();

      $this->load->view('includes/header', $data);
      $this->load->view('bookedit_read_view',$data);
      $this->load->view('includes/footer');

      if($this->ion_auth->logged_in()){
        $user_id = $this->ion_auth->user()->row()->id;
        $book_id = $this->input->post('book_id');
        if(!empty($book_id)) {
          $this->bookedit_model->add_favourite($user_id, $book_id);
        }
      }
      // echo "<pre>";
      // print_r($data);
      // echo "</pre>";
      }

      public function favourites($user_id){
        if (!$this->ion_auth->logged_in())
          {
          redirect('/auth/login/');
          }else{
          $data['author_id'] = $this->ion_auth->user()->row()->id;
          $user_id = $this->ion_auth->user()->row()->id;
          }

          $get_favorite_books = $this->Bookedit_model->get_favourite_books($user_id);
          $data['get_favorite_books'] = $get_favorite_books;
          $this->load->view('bookedit_read_view', $data);

          $data['heading'] = "My Favourite Books";
          $this->load->model('bookedit_model');
          $data['results'] = $this->bookedit_model->get_favourite_books($user_id);

          $this->load->view('includes/header',$data);
          $this->load->view('favourite_books_view',$data);
          $this->load->view('includes/footer');

      }
    
      public function detail($id)
      {
        /* We need to add some security and a "graceful exit: in case of a URL manipulation or other
        error that prevents us from getting the required $id */
        if(!is_numeric($id)){ /* if this parameter is missing, or wrong format...*/
        /* best to just redirect*/
        redirect('/', 'location');
        }
        $this->load->library('typography');
        $data['heading'] = "Book Synopsis";
        $this->load->model('bookedit_model');
        $data['results'] = $this->bookedit_model->get_book_detail($id);

        $this->load->view('includes/header',$data);
        $this->load->view('bookedit_detail_view',$data);
        $this->load->view('includes/footer');
      }// \ detail

      public function delete($id)
      {
        if(!is_numeric($id)){ /* if this parameter is missing, or wrong format...*/
          /* best to just redirect*/
          redirect('/', 'location');
          }

        if (!$this->ion_auth->logged_in())
          {
          redirect('/auth/login/');
          }else{
          $data['author_id'] = $this->ion_auth->user()->row()->id;
          }

          $this->load->library('typography');
          $data['heading'] = "Top 100 Books Details";
          $this->load->model('bookedit_model');
          $this->bookedit_model->delete_book($id);
  
          $this->load->view('includes/header',$data);
          $this->load->view('bookedit_detail_view',$data);
          $this->load->view('includes/footer');

          $this->session->set_userdata('message', 'Delete Successful');

          redirect("bookedit/index", 'location');
      }

      public function write()
      {
        if (!$this->ion_auth->logged_in())
        {
        redirect('/auth/login/');
        }else{
        $data['author_id'] = $this->ion_auth->user()->row()->id;
        }

        $this->form_validation->set_error_delimiters('<div class="#e57373 red lighten-2">', '</div>');
        $this->form_validation->set_rules('book_title', 'Book title','required|min_length[4]|max_length[80]');
        $this->form_validation->set_rules('author', 'Author','required|min_length[2]|max_length[60]');
        $this->form_validation->set_rules('description', 'Description','required|min_length[20]|max_length[3000]');
        $this->load->library('image_lib'); 

        // Validation Library was loaded in the constructor.
        if ($this->form_validation->run() == FALSE)
        {
          $this->load->view('includes/header');
          $this->load->view('bookedit_write_view');
          $this->load->view('includes/footer');
        }
          else
        {
          $config['upload_path'] = 'uploads/thumbnails/'; 
          $config['allowed_types'] = 'gif|jpg|png|jpeg';
          $config['max_size'] = '10000'; 
          $config['max_width'] = '4000'; 
          $config['max_height'] = '3000';

          $this->load->model('bookedit_model');
          $this->load->library('upload', $config);

          if ($this->upload->do_upload('userfile')) {
            $upload_data = $this->upload->data();

            $this->load->library('image_lib');
            $config1['image_library'] = 'gd2';
            $config1['source_image'] = 'uploads/'. $upload_data['file_name'];
            $config1['new_image'] = 'uploads/thumbnails/'. $upload_data['file_name'];
            $config1['create_thumb'] = FALSE;
            $config1['maintain_ratio'] = TRUE;
            $config1['width'] = 300;
            $config1['height']= 300;

            $this->image_lib->initialize($config1);
            $this->image_lib->resize();
            $this->image_lib->clear();

            $data['book_img']=$upload_data['file_name'];
          }else {
            $error = array('error' => $this->upload->display_errors()); 
            $this->load->view('includes/header');
            $this->load->view('bookedit_write_view', $error);// this will display upload errors thru
            $this->load->view('includes/footer');
            return;
          }

          $data['book_title'] = $this->input->post('book_title');
          $data['author'] = $this->input->post('author');
          $data['description'] = $this->input->post('description');
          $data['author_id'] = $this->ion_auth->user()->row()->id;

          $this->bookedit_model->insert_book($data);

          $this->session->set_userdata('message', 'Insert Successful');

          redirect("bookedit/index", 'location');
        }
      } // \ write

      public function edit($id) // we change the name to edit from write and we add the $id parameter
      {
        if(!is_numeric($id)){
          redirect('/', 'location');
        }

        if (!$this->ion_auth->logged_in())
          {
          redirect('/auth/login/');
          }else{
          $data['author_id'] = $this->ion_auth->user()->row()->id;
          }

        $this->form_validation->set_error_delimiters('<div class="#e57373 red lighten-2">', '</div>');
        $this->form_validation->set_rules('book_title', 'Book Title',
        'required|min_length[3]|max_length[40]');
        $this->form_validation->set_rules('author', 'Author',
        'required|min_length[3]|max_length[40]');
        $this->form_validation->set_rules('description', 'Description',
        'required|min_length[20]|max_length[3000]');

        $this->load->model('bookedit_model');
        $data['results'] = $this->bookedit_model->get_book_detail($id);

        if ($this->form_validation->run() == FALSE)
        {
          $data['results']= $this->bookedit_model->get_book_detail($id);
          $this->load->view('includes/header');
          $this->load->view('bookedit_edit_view', $data); // a new view here
          $this->load->view('includes/footer');

        }
        else
        {
        $data['book_title'] = $this->input->post('book_title');
        $data['author'] = $this->input->post('author');
        $data['description']= $this->input->post('description');
        $this->bookedit_model->edit_book($data, $id);

        $this->session->set_userdata('message', 'Edit Successful');
        redirect('bookedit/edit/' . $id, 'location');

        }
      } // \ edit
  }