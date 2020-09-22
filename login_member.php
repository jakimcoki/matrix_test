<?php include('save_form.php') ?>
<!DOCTYPE html>
<html>
<head>
 <title>Login Form</title>  
 <link rel="stylesheet" type="text/css" href="style_css.css">
</head>
<body>

<div class="header">
    <h2>Login</h2>
	<?php if(count($errors) > 0):?>
	   <div class="erros">
	      <?php foreach($errors as $error): ?>
		     <?php echo '*'.$error.'<br />'; ?>
		  <?php endforeach?>
	   </div>
	<?php endif//!@#456As?>
	<?php //echo getIpAddr(); ?>
    <form method="post" action="login_member.php">
	  <div class="all_input">
	     <label>Username</label>
		 <input type="text" name="log_user" value="<?php echo $username; ?>"/>
	 </div> 
	 
	 <div class="all_input">
		 <label>Password</label>
		 <input type="password" name="log_pass"/>
	</div>
	
	<div class="all_input">
		 <button type="submit" name="btn_login" class="btn">Log In</button>
		 
	</div>
	  
	</form>
	<p>
	    <a style="font-weight: bold; font-size:20px;" href="new_member.php">Create Account</a>
	</p>
</div>


</body>
</html>