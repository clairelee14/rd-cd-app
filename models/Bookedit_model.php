<?php
  class Bookedit_model extends CI_Model {
    function __construct()
    {
      // Call the Model constructor
      parent::__construct();
    }
    function get_books()
    {
      $this->db->select('SUBSTRING(description, 1, 100) as excerpt, ci_books.*');
      $query = $this->db->get('ci_books');
      if ( $query->num_rows() > 0 ){
      return $query->result();
      }else{
      return FALSE;
      }
    }
    function get_book_detail($id)
    {
      $this->db->select('ci_books.*, users.username');
      $this->db->from('ci_books');
      $this->db->join('users', 'ci_books.author_id = users.id');
      $this->db->where('ci_books.book_id', $id);
      $query = $this->db->get();
      if ( $query->num_rows() > 0 ){
      return $query->result();
      }else{
      return FALSE;
      }
    }
    function insert_book($data){
      $this->db->insert('ci_books', $data);
      } 
    
    function add_favourite($user_id, $book_id) {
      $data = array(
        'user_id' => $user_id,
        'book_id' => $book_id
      );
      $this->db->insert('user_favourites', $data);
    }

    function get_favourite_books($user_id) {
      $this->db->select('user_favourites.*, ci_books.*');
      $this->db->from('user_favourites');
      $this->db->join('ci_books', 'user_favourites.book_id = ci_books.book_id');
      $this->db->where('user_id', $user_id);
      $query = $this->db->get();
      if ( $query->num_rows() > 0 ){
        return $query->result();
        }else{
        return FALSE;
        }
    }

    function edit_book($data, $id){
      $this->db->where('book_id', $id);
      $this->db->update('ci_books', $data);
    }

    function delete_book($id){
      $this->db->delete('ci_books', array('book_id' => $id));
    }
  }