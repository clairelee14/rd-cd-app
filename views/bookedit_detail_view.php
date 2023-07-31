<h1><?php echo $heading; ?></h1>
<?php if(($results)) : ?>
<?php foreach($results as $row): ?>
<div class="well">
    <h3><?php echo $row->book_title ?></h3>
    <p><?php echo $this->typography->nl2br_except_pre($row->description); ?></p>
    <p><strong>favourite book added by:</strong> <?php echo $this->typography->nl2br_except_pre($row->username); ?></p>
    <?php if (isset($this->ion_auth->user()->row()->id) && $this->ion_auth->user()->row()->id == $row->author_id) : ?>
        <a href="<?php echo base_url() . "bookedit/edit/" . $row->book_id ;?>" class="btn #f9a825 yellow darken-3"> <i
                class="material-icons left">edit</i>Edit</a>
        <a href="<?php echo base_url() ."bookedit/delete/" .$row->book_id;?>" class="btn #dd2c00 deep-orange accent-4"> <i
                class="material-icons left">delete</i>Delete</a>
    <?php endif; ?>
</div>
<?php endforeach;?>
<?php else:?>
<p>No results</p>
<?php endif; ?>

<!-- <a href="<?php echo base_url() ."bookedit/edit/" .$row->book_id;?>" class="btn #f9a825 yellow darken-3"> <i
class="material-icons left">edit</i>Edit</a>
<a href="<?php echo base_url() ."bookedit/delete/" .$row->book_id;?>" class="btn #dd2c00 deep-orange accent-4"> <i
class="material-icons left">delete</i>Delete</a> -->