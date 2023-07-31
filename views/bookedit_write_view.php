<h3>Enter New Book</h3>
<?php
    if(isset($error)){
    echo $error; }
    ?>
<?php echo form_open_multipart('bookedit/write'); ?>
    <div class="form-group">
        <label for="book_title">Book Title</label>
        <input type="text" name="book_title" class="form-control form-width" value="<?php echo
        set_value('book_title'); ?>" />
        <?php echo form_error('book_title'); ?>
    </div>
    <div class="form-group">
        <label for="author">Author</label>
        <input type="text" name="author" class="form-control form-width" value="<?php echo
        set_value('author'); ?>" />
        <?php echo form_error('author'); ?>
    </div>
    <div class="form-group">
        <label for="description">Description</label>
        <textarea name="description" class="form-control form-width textarea-height" style="height:400px;"><?php echo
        set_value('description'); ?></textarea>
        <?php echo form_error('description'); ?>
    </div>
    <div class="form-group">
        <label for="picture">Picture</label>
        <input type="file" name="userfile" class="form-control form-width" value="<?php echo
        set_value('userfile'); ?>">
        <?php echo form_error('userfile'); ?>
        <!-- in CI3, this file input MUST be called userfile by default. Else, you have to refer to it in your controller
        code. -->
    </div>
    <div class="form-group"><input type="submit" value="Submit" class="btn" /></div>
</form>