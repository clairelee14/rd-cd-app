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
                        <!-- <?php echo $row->excerpt ?> -->
                    </div>
                    <div class="card-action">
                        <a href="<?php echo base_url(); ?>/bookedit/detail/<?php echo $row->book_id ?>" class="btn #bf360c deep-orange darken-4">read more<i class="material-icons right">add</i></a>
                        <?php echo form_open('/'); ?>
                            <!-- <button>Favourited<i class="material-icons right">favorite</i></button> -->
                        <input type="hidden" name="book_id" value="<?php echo $row->book_id; ?>">
                            <button type="submit" class="btn #4caf50 green">Favorite<i class="material-icons right">favorite_border</i></button>
                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        <?php endforeach;?>
        <?php endif; ?>
    </div>
    <script>
        $(document).ready(function() {
        $(".favorite-btn").click(function(event) {
            event.preventDefault();
            var button = $(this);
            var bookId = button.data("bookid");
            $.ajax({
            type: "POST",
            url: "<?php echo base_url('bookedit/add_favourite'); ?>",
            data: {
                "book_id": bookId
            },
            success: function(result) {
                if (result == "success") {
                // Toggle the icon
                var icon = button.find("i.material-icons.right");
                if (icon.text() == "favorite_border") {
                    icon.text("favorite");
                } else {
                    icon.text("favorite_border");
                }
                }
            }
            });
        });
        });
    </script>