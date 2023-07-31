<?php
    class Chat_model extends CI_Model {
        public function __construct() {
            parent::__construct();
            $this->load->database();
        }
        function send_message($sender_id, $receiver_id, $message_body){
            $data = array(
                'sender_id' => $sender_id,
                'receiver_id' => $receiver_id,
                'message_body' => $message_body
            );
            $this->db->insert('messages', $data);
        }

        function get_messages($id){
            $this->db->select('users.username as sender, messages.message, messages.timestamp');
            $this->db->from('messages');
            $this->db->join('users', 'messages.sender_id = users.id');
            $this->db->where('receiver_id', $id);
            $this->db->order_by('timestamp', 'desc');
            $query = $this->db->get();
            return $query->result();
        }

        function delete_message($message_id){
            $this->db->where('id', $message_id);
            $this->db->delete('message');
        }

    }