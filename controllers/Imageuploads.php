<?php
defined('BASEPATH') OR exit('No direct script access allowed');
    
class Imageuploads extends CI_Controller {

    public function index() {
    }

    public function uploadimage() { 
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger">', '</div>'); $this->form_validation->set_rules('title', 'Title', 'required|min_length[4]');
        
        if ($this->form_validation->run() == FALSE){ 
            $this->load->view('includes/header'); 
            $this->load->view('upload_view'); 
            $this->load->view('includes/footer');
        } else{
            $config['upload_path'] = 'uploads/'; $config['allowed_types'] = 'gif|jpg|png';
            $config['max_size'] = '10000';
            $config['max_width'] = '4000';
            $config['max_height'] = '3000';

            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload()) {
                $error = array('error' => $this->upload->display_errors()); 
                $this->load->view('includes/header');
                $this->load->view('upload_view', $error);// this will display upload errors thru
                $this->load->view('includes/footer'); }else{
                echo "all good";
            } }
    } // end uploadimage()
}