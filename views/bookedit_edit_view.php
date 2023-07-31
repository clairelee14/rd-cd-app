<h1>Edit Book</h1>
<?php
if($results){
foreach($results as $row){
$book_title = $row->book_title;
$author = $row->author;
$description = $row->description;
$id = $row->book_id;
 echo $book_title; //just to test
}
}
?>
<?php echo form_open_multipart("bookedit/edit/$id"); ?>
    <div class="form-group">
    <label for="book_title">Book Title</label>
    <input type="text" name="book_title" class="form-control form-width" value="<?php echo
    set_value('book_title', $book_title); ?>" />
    <?php echo form_error('book_title'); ?>
    </div>
    <div class="form-group">
    <label for="author">Author</label>
    <input type="text" name="author" class="form-control form-width" value="<?php echo
    set_value('author', $author); ?>" />
    <?php echo form_error('author'); ?>
    </div>
    <div class="form-group">
    <label for="description">Description</label>
    <textarea name="description" class="form-control form-width textarea-height" style="height:400px;"><?php echo
    set_value('description', $description); ?></textarea>
    <?php echo form_error('description'); ?>
    </div>
    <div class="form-group"><input type="submit" value="Submit" class="btn" /></div>
</form>