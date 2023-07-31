<h3><?php echo $heading ?></h3>
<div class="book-container">
    <?php if(($results)) : ?>
    <?php foreach($results as $row): ?>
    <div class="book-card">
        <?php $heading = $row->book_title; ?>
        <div class="row">
            <div class="col s12 m4 l3">
                <div class="card medium">
                    <div class="card-image">
                        <img src="<?php echo base_url(); ?>uploads/thumbnails/<?php echo $row->book_img ?>">
                    </div>
                    <div class="card-content">
                        <span class="card-title"><?php echo $row->book_title ?></span>
                    </div>
                    <div class="card-action">
                        <a href="<?php echo base_url(); ?>/bookedit/detail/<?php echo $row->book_id ?>" class="btn #bf360c deep-orange darken-4">read more<i class="material-icons right">add</i></a>
                    </div>
                </div>
            </div>
        <?php endforeach;?>
        <?php endif; ?>
    </div>