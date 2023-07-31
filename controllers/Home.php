<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
        // echo "This is home";
        $this->load->view('includes/header');
		$this->load->view('home_view');
        $this->load->view('includes/footer');
	}
    public function books()
	{
        // echo "This is home";
        $this->load->view('includes/header');
		$this->load->view('books_view');
        $this->load->view('includes/footer');
	}
}
