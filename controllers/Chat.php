<?php

class Chat extends CI_Controller {
    public function __construct(){
        parent::__construct();
        $this->load->model('chat_model');
        $this->load->library('session');
        $this->load->helper('url');
    }

    public function index(){
        if(!is_numeric($id)){
            redirect('/', 'location');
          }
  
        if (!$this->ion_auth->logged_in())
        {
        redirect('/auth/login/');
        }else{
        $data['author_id'] = $this->ion_auth->user()->row()->id;
        }

        $data['result'] = $this->chat_model->get_messages($user_id);
        $this->load->view('includes/header', $data);
        $this->load->view('chat_view_view', $data);
        $this->load->view('includes/footer');
    }

    public function details(){
        if(!is_numeric($id)){
            redirect('/', 'location');
          }
  
        if (!$this->ion_auth->logged_in())
        {
        redirect('/auth/login/');
        }else{
        $data['author_id'] = $this->ion_auth->user()->row()->id;
        }

        $data['result'] = $this->chat_model->get_messages($id);
        $this->load->view('includes/header', $data);
        $this->load->view('chat_details_view', $data);
        $this->load->view('includes/footer');
    }
}