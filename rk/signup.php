<?php
    require('inc/header.inc.php');
    ?>
    <link rel="stylesheet" href="/styles/dialogs.inc.css">
    <div class="signup-form">
        <h2>Sign Up Form</h2>
        <form method="post" action="">
            <label for="email">Email:</label>
            <input type="text" name="email" placeholder="Email Address">
            <input type="submit" value="Submit">
        </form>
    </div>
    <?php
    require('inc/footer.inc.php');
?>