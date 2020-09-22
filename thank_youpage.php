<?php include('save_form.php') ?>
<!DOCTYPE html>
<html>
<head>
 <title>Thank you</title>  
 <link rel="stylesheet" type="text/css" href="style_css.css">
</head>
<body>

<div class="header">
    <h2>Thank you </h2>
	<div class="content">
  	<!-- notification message -->
  	<?php if (isset($_SESSION['success_activated'])) : ?>
      <div class="error success" >
      	<h3>
          <?php 
          	echo $_SESSION['success_activated']; 
          	unset($_SESSION['success_activated']);
          ?>
      	</h3>
      </div>
    <?php endif ?>
	<!-- logged in user information -->
    <?php  if (isset($_SESSION['username'])) : ?>
    	
		<p>Please Login Again <strong><?php  ?></strong></p>
    	<p> <a href="login_member.php" style="color: red;">Login</a> </p>
    <?php endif?>
	<?php session_destroy();?>
</div>
	
</div>


</body>
</html>