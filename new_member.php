<?php include('save_form.php') ?>
<!DOCTYPE html>
<html>
<head>
 <title>Registration Form</title>  
 <link rel="stylesheet" type="text/css" href="style_css.css">
</head>
<body>

<div class="header">
    <h2>New Member - Registration</h2>
	<?php if(count($errors) > 0):?>
	   <div class="erros">
	      <?php foreach($errors as $error): ?>
		     <?php echo '*'.$error.'<br />'; ?>
		  <?php endforeach?>
	   </div>
	<?php endif//!@#456As?>
    <form method="post" action="new_member.php">
	  <div class="all_input">
	     <label>Username</label>
		 <input type="text" name="username" value="<?php echo $username; ?>"/>
	 </div> 
	 <div class="all_input">
		 <label>Email</label>
		 <input type="text" name="email" value="<?php echo $email; ?>"/>
		</div>
	 <div class="all_input">
		 <label>Password</label>
		 <input type="password" name="pass" />
	</div>
	<div class="all_input">
		 <label>Confirm Password</label>
		 <input type="password" name="conf_pass" />
	</div>
	<div class="all_input">
		 <button type="submit" name="btn_new_member" class="btn">Register</button>
		 
	</div>
	  
	</form>
	<p>
	   Already a member? <a href="login_member.php">Sign in</a>
	</p>
</div>


</body>
</html>