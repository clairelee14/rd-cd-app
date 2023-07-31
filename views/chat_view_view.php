<h2>My Messages</h2>
<?php if (!empty($messages)): ?>
  <ul>
    <?php foreach ($messages as $message): ?>
      <li>
        <a href="<?php echo base_url('/chat/details/'.$message->id); ?>">
          <?php echo $message->message_body; ?>
        </a>
      </li>
    <?php endforeach; ?>
  </ul>
<?php else: ?>
  <p>No messages found.</p>
<?php endif; ?>