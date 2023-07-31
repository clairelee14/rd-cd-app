<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="<?php echo base_url(); ?>/css/styles.css" rel="stylesheet">
  <title>
    <?php
      if(APP_NAME){
      $title = APP_NAME;
      }
      if(isset($heading)){
      $title = $heading;
      }
      echo $title;
    ?>
  </title>

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- 1. AddChat css -->
  <link href="<?php echo base_url('assets/addchat/css/addchat.min.css') ?>" rel="stylesheet">
</head>
<body>
  <!-- 2. AddChat widget -->
  <div id="addchat_app" 
      data-baseurl="<?php echo base_url() ?>"
      data-csrfname="<?php echo $this->security->get_csrf_token_name() ?>"
      data-csrftoken="<?php echo $this->security->get_csrf_hash() ?>"
  ></div>
  <div class="container">
    <ul id="dropdown1" class="dropdown-content #ffb74d orange lighten-2">
      <li><a href="<?php echo base_url(); ?>/litawards">Literary Awards</a></li>
      <li><a href="<?php echo base_url(); ?>/litawards/pulitzer">Pulitzer Prize</a></li>
      <li><a href="<?php echo base_url(); ?>/litawards/newbery">John Newbery Medal</a></li>
      <li><a href="<?php echo base_url(); ?>/litawards/booker">Man Booker Award</a></li>
      <li><a href="<?php echo base_url(); ?>/litawards/nobel">Nobel Prize- Fiction</a></li>
    </ul>

    <ul id="dropdown3" class="dropdown-content #ffb74d orange lighten-2">
      <li><a href="<?php echo base_url(); ?>/auth/login"><i class="material-icons">person_outline</i>Login</a></li>
      <li class="divider"></li>
      <li><a href="<?php echo base_url(); ?>/register"><i class="material-icons">person_add</i>Register New Account</a></li>
      <li class="divider"></li>
    </ul>

    <ul id="dropdown2" class="dropdown-content #ffb74d orange lighten-2">
      <li><a href="<?php echo base_url(); ?>/bookedit/write"><i class="material-icons">create</i>Add A New Fave Book</a></li>
      <li class="divider"></li>
      <li><a href="<?php echo base_url(); ?>/auth/logout"><i class="material-icons">call_missed</i>Logout</a></li>
      <li class="divider"></li>
    </ul>

    <nav class="#e65100 orange darken-4">
      <div class="nav-wrapper">
        <a href="<?php echo base_url(); ?>" class="brand-logo"><i class="material-icons">home</i></a>
        <ul class="right hide-on-med-and-down">
          <li><a href="<?php echo base_url(); ?>/bookedit/">Books<i class="material-icons right">book</i></a></li>
          <!-- Dropdown Trigger -->
          <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Literary Awards<i class="material-icons right">arrow_drop_down</i></a></li>
          <?php if ($this->ion_auth->logged_in()) : ?>
            <?php
            $user_id = $this->ion_auth->user()->row()->id ;
            $username = $this->ion_auth->user()->row()->username ;
            ?>
          <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Logged in: <?php echo $username; ?><i class="material-icons right">arrow_drop_down</i></a></li>
          <li><a href="<?php echo base_url(); ?>/bookedit/favourites/<?php echo $user_id ?>">Fave Books<i class="material-icons right">favorite</i></a></li>
          <?php else: ?>
            <li><a class="dropdown-trigger" href="<?php echo base_url()?>auth/login" data-target="dropdown3">Login/Register</a></li>
          <?php endif; ?> 
        </ul>
      </div>
    </nav>
  <?php $message = $this->session->userdata('message'); ?>
  <?php if(isset($message)): ?>
  <h3 class="#aed581 light-green lighten-2" id="message"><i class="material-icons">thumb_up</i> <?php echo $message; ?></h3>
  <?php endif; ?>
  <?php $this->session->unset_userdata('message'); ?>