<?php 
    //connect to the database
    $db = mysqli_connect('localhost','root','','matrix_test_db');
	
	
	session_start();
	//define inputs
		$username = '';
		$email = '';
		$pass = '';
		$conf_pass = '';
		$errors = array();
	
	
	//when the Register button is clicked
	if(isset($_POST['btn_new_member'])){
		
		$id = uniqid();
		$username = mysqli_real_escape_string($db,$_POST['username']);
		$email = mysqli_real_escape_string($db,$_POST['email']);
		$pass = mysqli_real_escape_string($db,$_POST['pass']);
		$conf_pass = mysqli_real_escape_string($db,$_POST['conf_pass']);
		
		
		//validation that all fields are filled
		if(empty($username)){
			array_push($errors,'Username is required');
		}
		if(empty($email)){
			array_push($errors,'Email is required');
		}
		else {
			if (validateEmail($email) == false){
				array_push($errors,'Incorect Email');
			}
		}
		if(empty($pass)){
			array_push($errors,'Password is required');
		}
		if(empty($conf_pass)){
			array_push($errors,'Confirm Password is required');
		}
		else if($pass != $conf_pass){
			array_push($errors,'Passwords do not match');
		}
		
		//if count errors is 0, save user to database
		if(count($errors) == 0){
			//Validate if pass is ok
			if (validatePass($pass) != ''){
				$text_pass = validatePass($pass);
				array_push($errors,$text_pass);	
			}else {
				
				//chech if user with email and username already exist
				$query_check_username = "SELECT * FROM users where username='$username'";
				$result_check_username = mysqli_query($db, $query_check_username);
				$query_check_email = "SELECT * FROM users where email='$email'";
				$result_check_email = mysqli_query($db, $query_check_email);
				if(mysqli_num_rows($result_check_username) != 0){
				   array_push($errors,'User with this username already exists');
				}else if(mysqli_num_rows($result_check_email) != 0){
				   array_push($errors,'User with this email already exists');	
				}else{	
				//echo $query;die; ////!@#456As
					//echo 'Everithing are ok'; //Then save user in db
					$flag = '0';
					$password = md5($pass);
					
					$query = "INSERT INTO users (id,username,email,password,flag)
							VALUES ('$id','$username','$email','$password','$flag')";
					//echo $query;die;
					
					//sentActivationLink($id,$_POST);
					$result = mysqli_query($db, $query);
					if (!$result) {
						die('Invalid query: ' . mysqli_connect_errno());
					}
					else {
						$query_flag = "SELECT * FROM users where id='$id'";
						$result_flag = mysqli_query($db, $query_flag);
						if(mysqli_num_rows($result_flag) == 1){
							while($row_flag = mysqli_fetch_assoc($result_flag)){
								$flag = $row_flag['FLAG'];
							}
						}
						if($flag == '0'){
							$_SESSION['id'] = $id;
							$_SESSION['username'] = $username;
							$_SESSION['success'] = "You are now logged in";
							$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"."?code=";
							$_SESSION['verified'] = 'Please activate your account via email link <a href="'.$actual_link.$id.'">Activate account</a>';
							header('location: index.php'); // reddirect to home page
						}else {
							$_SESSION['id'] = $id;
							$_SESSION['username'] = $username;
							$_SESSION['success'] = "You are now logged in";
							$_SESSION['verified'] = '';
							header('location: index.php'); // reddirect to home page
						}
						
					}
				}
			}
			
			
		}
		
	}
	//LOGIN
	if(isset($_POST['btn_login'])){
		
		$username = mysqli_real_escape_string($db,$_POST['log_user']);
		$pass = mysqli_real_escape_string($db,$_POST['log_pass']);
		
		//validation that all fields are filled
		if(empty($username)){
			array_push($errors,'Please enter your username');
		}
		if(empty($pass)){
			array_push($errors,'Please enter your pass');
		}
		
		if(count($errors) == 0){
			
			$time=time()-30;
			$ip_address=getIpAddr();
			$query=mysqli_query($db,"select count(*) as total_count from loginlogs where TryTime > $time and IpAddress='$ip_address'");
			$check_login_row=mysqli_fetch_assoc($query);
		    $total_count=$check_login_row['total_count'];
			//echo $total_count;die;
			if($total_count==3){
			    array_push($errors,'To many failed login attempts. Please login after 30 sec');
			}else {
				$password = md5($pass);
				$query = "SELECT * FROM users where username='$username' AND password='$password'";
					//echo $query;die;
				$result = mysqli_query($db, $query);
				if(mysqli_num_rows($result) == 1){
					
					while($row = mysqli_fetch_assoc($result)){
						$id = $row['id'];
						$flag = $row['FLAG'];
					}
					//echo $flag;die;
					//echo mysqli_fetch_assoc($result['id']);die;
					if($flag == '0'){
						$_SESSION['flag'] = $flag;
						$_SESSION['id'] = $id;
						$_SESSION['username'] = $username;
						$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"."?code=";
						$_SESSION['verified'] = 'Please activate your account via email link <a href="'.$actual_link.''.$id.'">Activate account</a>';
						$_SESSION['success'] = "You are now logged in";
						mysqli_query($db,"delete from loginlogs where IpAddress='$ip_address'");
						header('location: index.php'); // reddirect to home page
					}else {
						$_SESSION['flag'] = $flag;
						$_SESSION['id'] = $id;
						$_SESSION['username'] = $username;
						//$_SESSION['verified'] = '';
						$_SESSION['success'] = "You are now logged in";
						mysqli_query($db,"delete from loginlogs where IpAddress='$ip_address'");
						header('location: index.php'); // reddirect to home page
					}
					
				}else {
					$total_count++;
					$rem_attm=3-$total_count;
					if($rem_attm==0){
						$msg="To many failed login attempts. Please login after 30 sec";
						//echo $msg;
						array_push($errors,$msg);
					}else{
						$msg="Please enter valid login details.<br/>$rem_attm attempts remaining";
						array_push($errors,$msg);
					}
					$try_time=time();
					$id_log = uniqid(); 
					//echo "insert into loginlogs(Id,IpAddress,TryTime) values('$id_log','$ip_address','$try_time')";
					$rezult_log = mysqli_query($db,"insert into loginlogs(Id,IpAddress,TryTime) values('$id_log','$ip_address','$try_time')");
					if (!$rezult_log) {
						die('Invalid query: ' . mysqli_connect_errno());
					}else {
						$username = '';
						$pass = '';
						array_push($errors,'please enter correct user or password');
					    //header('location: login_member.php');
					}
					
					
				}
			}
			
			
		}
		
	}
	
	//Check if user have insert information jakim.coki123456666 !@#456As
	if(isset($_SESSION['id'])){	
		
		// $flag = 1;
		$sql_flag = "Select * from users where id='".$_SESSION['id']."'";
		$result_flag = mysqli_query($db, $sql_flag);
		while($row_flag = mysqli_fetch_assoc($result_flag)){
		    $flag = $row_flag['FLAG'];
		}
		//echo $flag;
		
		
		$id = $_SESSION['id'];
		$sql_user = "Select *,count(*) as count from user_information where user_id='".$id."'";
		$result_user = mysqli_query($db, $sql_user);
				//print_r($result_check_user);die;
				while($row_count_user = mysqli_fetch_assoc($result_user)){
						$count_user = $row_count_user['count'];
						$first_name_user = $row_count_user["first_name"];
						$last_name_user = $row_count_user["last_name"];
						$sex_user = $row_count_user["sex"];
				}
		if($count_user == '0'){
			
			unset($_SESSION['user_info_ok']);
			unset($_SESSION['save_changes']);
			
		}else {
			//echo $sex_user;
			$_SESSION['save_changes'] = 'ok';
			$_SESSION['user_info_ok'] = 'success';
			$_SESSION['first_name'] = $first_name_user;
			$_SESSION['last_name'] = $last_name_user;
			$_SESSION['sex'] = $sex_user;
			
		}
		
		
		//check user_programming_languages
		$sql_info = "Select * from user_experience where user_id='".$id."'";
		//echo $sql_info;
		$result_info = mysqli_query($db, $sql_info);
		$arr_info = array(); 
		while($row_count_info = mysqli_fetch_assoc($result_info)){
		   $arr_info[]= $row_count_info; 
		}
		$num_rows_info = mysqli_num_rows($result_info);
		if(!$num_rows_info){
			unset($_SESSION['user_languages_ok']);
			//if table is empty
		}else {
			$_SESSION['user_languages_ok'] = 'success';
			
			//print_r($arr_info);
		}
		// echo "<pre>";//!@#456As
			 // print_r($arr_info);
			 // echo "</pre>";die;
		
	}
	//INSERT or UPDATE OTHER INFORMATON FOR User
	if(isset($_POST['save_changes_other'])){
		 // echo "<pre>";//!@#456As
			 // print_r($_POST);
			 // echo "</pre>".count($_POST);die;
		
		if (count($_POST) > 0) {
			    foreach ($_POST as $key => $value) {
					//echo $key.'<br />';
					if (empty($_POST[$key])) {
					$message = ucwords($key) . " field is required<br />";
					$message_replace = str_replace('_',' ',$message);
					array_push($errors,$message_replace);
					break;
				   }
				}
				/* Validation to check if sex is selected */
				if (! isset($message)) {
					if (! isset($_POST["sex"])) {
						$message_sex = " Gender field is required";
						array_push($errors,$message_sex);
					}
				}
				if(count($errors) == 0){
					
					
					$id =  $_POST['id'];
					$first_name = $_POST["first_name"];
					$last_name = $_POST["last_name"];
					$sex = $_POST["sex"];
					
					$sql_check_user = "Select *,count(*) as count from user_information where user_id='".$id."'";
					//echo $sql_check_user; die;
					$result_check_user = mysqli_query($db, $sql_check_user);
					//print_r($result_check_user);die;
					while($row_count = mysqli_fetch_assoc($result_check_user)){
								$count = $row_count['count'];
								$first_name = $row_count["first_name"];
								$last_name = $row_count["last_name"];
								$sex = $row_count["sex"];
					}
					
					if($count == '0'){
						$id_user =  uniqid(); 
						$status = '1';
						$first_name = $_POST["first_name"];
						$last_name = $_POST["last_name"];
						$sex = $_POST["sex"];
						$query = "INSERT INTO user_information (id,first_name,last_name,sex,user_id,status)
								VALUES ('$id_user','$first_name','$last_name','$sex','$id','$status')";
							//	echo $query;die;
						$result = mysqli_query($db, $query);	
						if (!$result) {
							die('Invalid query: ' . mysqli_connect_errno());
						}
						else {
							$_SESSION['user_info_ok'] = 'success';
							$_SESSION['first_name'] = $first_name;
							$_SESSION['last_name'] = $last_name;
							$_SESSION['sex'] = $sex;
						}
					}else {
						// echo "<pre>";//!@#456As
					 // print_r($_POST);
					// echo "</pre>";die;
					
						$_SESSION['user_info_ok'] = 'success';
						$_SESSION['first_name'] = $first_name;
						$_SESSION['last_name'] = $last_name;
						$_SESSION['sex'] = $sex;
						$query_update = "UPDATE user_information SET first_name = '".$_POST["first_name"]."',last_name = '".$_POST["last_name"]."',sex = '".$_POST["sex"]."' WHERE user_id = '$id'";
						//echo $query_update;die;
						$result = mysqli_query($db, $query_update);
						//header('location: index.php');
					}
					
					// echo "<pre>";//!@#456As
					 // print_r($errors);
					// echo "</pre>";die;
					//Insert or update data for table
					$sql_info_table = "Select * from user_experience where user_id='".$id."'";
					$result_info = mysqli_query($db, $sql_info_table);
					$num_rows_info = mysqli_num_rows($result_info);
					//echo $num_rows_info;die;
					if(!$num_rows_info){
						//if table is empty
							foreach ($_REQUEST['language'] as $key => $value){
								$id =  $_POST['id'];
								$id_lang = uniqid(); 
								$language = $value;
								$experience = $_REQUEST['experience'][$key];
								$company = $_REQUEST['company'][$key];
								$flag = '1';
								
								$sql_table = "INSERT INTO user_experience
									 (id,language,experience,company,user_id,flag) 
									  VALUES 
									 ('{$id_lang}',
									   '{$language}',
									  '{$experience}','{$company}',
									  '{$id}','{$flag}')";
									  //echo $sql_table;die;
								$result_table = mysqli_query($db, $sql_table);
								if (!$result_table) {
									die('Invalid query Line 211: ' . mysqli_connect_errno());
								}	  
							}
							$_SESSION['user_info_ok'] = 'success';
					}else {
						//echo $_SESSION['id']."<pre>";//!@#456As
							//print_r($_REQUEST['language']);
						//echo "</pre>";die;
						$sql_del = "delete from user_experience where user_id = '".$_SESSION['id']."'";
						$result_del = mysqli_query($db, $sql_del);
						foreach ($_REQUEST['language'] as $key => $value){
								$id =  $_POST['id'];
								$id_lang = uniqid(); 
								$language = $value;
								$experience = $_REQUEST['experience'][$key];
								$company = $_REQUEST['company'][$key];
								$flag = '1';
								
								$sql_table = "INSERT INTO user_experience
									 (id,language,experience,company,user_id,flag) 
									  VALUES 
									 ('{$id_lang}',
									   '{$language}',
									  '{$experience}','{$company}',
									  '{$id}','{$flag}')";
									  //echo $sql_table;die;
								$result_table = mysqli_query($db, $sql_table);
								if (!$result_table) {
									die('Invalid query Line 211: ' . mysqli_connect_errno());
								}	  
							}
						$_SESSION['user_info_ok'] = 'success';
						
						//print_r($arr_info);
					}
				header('location: index.php');	
				}
		}//
	}
	
	//click Edit information
	if(isset($_POST['edit_changes_other'])){
		unset($_SESSION['user_info_ok']);
        unset($_SESSION['user_languages_ok']);
		unset($_SESSION['save_changes']);
		
		$sql_table = "Select * from user_experience where user_id='".$_SESSION['id']."'";
		//echo $sql_info;
		$result_table = mysqli_query($db, $sql_table);
		$arr_table = array(); 
		while($row_count_info = mysqli_fetch_assoc($result_info)){
		   $arr_info[]= $row_count_info; 
		}
		
		
	}
	
    //LOGOUT
	if(isset($_GET['logout'])){
		session_destroy();
		unset($_SESSION['username']);
		unset($_SESSION['id']);
		unset($_SESSION['save_changes']);
		header('location: login_member.php'); // reddirect to login page
	}
	
	
	//Activate account via mail
	if(isset($_GET['code'])){
		$id = $_GET['code'];
		$query = "UPDATE users SET FLAG = '1' WHERE id = '$id'";
		$result = mysqli_query($db, $query);
		
		$_SESSION['success_activated'] = "Thank your account has been activated";
		header('location: thank_youpage.php');
	}
	
	//Print DOCS
	
	if(isset($_POST['print'])){
		require_once 'class/PHPWord/PHPWord.php';
		$PHPWord = new PHPWord();
		$sql = "SELECT Users.username,Users.email, user_information.first_name, user_information.last_name,user_experience.language
				FROM Users
				LEFT JOIN user_information ON Users.id = user_information.user_id
				LEFT JOIN user_experience  ON Users.id = user_experience.user_id
				Where Users.id='".$_SESSION['id']."'
				ORDER BY Users.username;";
		$result = mysqli_query($db,$sql);
		//$row =    mysqli_fetch_array($result);
		$skills = '';
		while($row_lt = mysqli_fetch_array($result)) {
		    $skills .= $row_lt['language'].', ';
			$first_name = $row_lt['first_name'];
			$last_name = $row_lt['last_name'];
			$email = $row_lt['email'];
		}
		$document = $PHPWord->loadTemplate('class/PHPWord/Templates/cv_test_-_Copy.docx');
		//echo $row['first_name'];
		
		//echo $skills;die;
		 
		$document->setValue('skills', $skills);
		$document->setValue('first_name', $first_name);
		$document->setValue('last_name', $last_name);
		$document->setValue('email', $email);
		
		// echo "<pre>";
		// print_r(mysqli_fetch_array($result));
		// echo "<pre>";die;
		
		
		
		
		$document->download('cv_test.docx');       
	}
	
// FUNCTIONS
function validateEmail($email){
	$temp = false;
	if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
      $temp = false;
    }
	else {
      $temp = true;
	}
	return $temp;
}	


function validatePass($pass){
	
   $password = $pass;
   $text = '';

// Validate password strength
	$uppercase = preg_match('@[A-Z]@', $password);
	$lowercase = preg_match('@[a-z]@', $password);
	$number    = preg_match('@[0-9]@', $password);
	$specialChars = preg_match('@[^\w]@', $password);

	if(!$uppercase || !$lowercase || !$number || !$specialChars || strlen($password) < 8) {
		$text = 'Password should be at least 8 characters in length and should include at least one upper case letter, one number, and one special character.';
	}
	//else {
	//	$text = 'Strong Password';
	//}
	return $text;
}

function getIpAddr(){
	if (!empty($_SERVER['HTTP_CLIENT_IP'])){
		$ipAddr=$_SERVER['HTTP_CLIENT_IP'];
	}elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
		$ipAddr=$_SERVER['HTTP_X_FORWARDED_FOR'];
	}else{
		$ipAddr=$_SERVER['REMOTE_ADDR'];
	}
	return $ipAddr;
}

function sentActivationLink($id,$all_inputs){
	
	//echo "<pre>";//!@#456As
    // print_r($all_inputs);
    //echo "</pre>";die;
	//foreach($all_inputs as $key=>$value){
	///	echo $key. "=>>>>>". $value.'<br />';
	//}
	$email = $all_inputs['email'];
	$username = $all_inputs['username'];
	//echo $email.'----'.$username;
	$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"."?code=" . $id;
	$toEmail = $email;
	$subject = "User Registration Activation Email";
	$content = "Click this link to activate your account. <a href='" . $actual_link . "'>" . $actual_link . "</a>";
	$mailHeaders = "From: Admin\r\n";
	if(mail($toEmail, $subject, $content, $mailHeaders))
		echo "Email sent";
    else
		echo "Email sending failed";
	//mail($toEmail, $subject, $content, $mailHeaders);
	//echo $actual_link;die;
	//die;
	
}

function send_mail($id_cccc,$email_post){
	require 'class/class.phpmailer.php';
	require 'class/class.smtp.php';
	
    $mail = new PHPMailer();  
    $mail->IsHTML(true);
    $mail->IsSMTP();
    $mail->SMTPAuth = true;
    $mail->SMTPSecure = "ssl";
    $mail->Host = "smtp.gmail.com";
    $mail->Port = 465;
    $mail->Username = "ivano23456@gmail.com";
    $mail->Password = "258963147";
    $fromname = "Idemoo";
    $abcd = 'dasdasdasd';
    $email = $email_post;
    
    echo "$abcd";//!@#456As
    $To = trim($email,"\r\n");
    $tContent   = '';

    $tContent .="<table width='550px' colspan='2' cellpadding='4'>
            <tr>
              <td>
                <table cellspacing='1' cellpadding='1' width='100%' height='100%'>
                <tr><td><h2>Почитувани,<h2></td></tr/>
                <tr><td><p>Во прилог е вашиот сигурносен код преку кој може да пристапите со зачуваната пријава</p><h4><u>".$id_cccc."</u></h4></td></tr>
                <tr><td>Во пријавата ке кликнете на копчето <b>Изберете зачувана пријава</b> и ке ви се појави дополнител панел во кој треба да го внесите вашиот сигурносен код</td></tr>
                <tr><td></td></tr>
                <tr><td>&nbsp;</td></tr> 
                <tr><td>&nbsp;</td></tr> 
                <tr><td>Ви Благодариме на разбирањето</td></tr> 
                <tr><td>Институт за акредитација на Република Македонија</td></tr> 
                </table>
              </td>
            </tr>
            </table>";
      $mail->From = "ivano23456@gmail.com";
      $mail->FromName = $fromname;        
      $mail->Subject = "asdasdsad"; 
      $mail->Body = $tContent;
      $mail->AddAddress($To); 
      $mail->set('X-Priority', '1'); //Priority 1 = High, 3 = Normal, 5 = low
      
      $mail->Send();
      //echo 'datert'; die;
}

function sent_activationMail($id,$email,$username){
	require 'class/class.phpmailer.php';
	require 'class/class.smtp.php';
	$message = '';
	$mail = new PHPMailer;
	$To = trim($email,"\r\n");
	$mail->IsSMTP();
	$mail->Host = "smtpout.secureserver.net";
	$mail->Port = 80;
	$mail->SMTPAuth = true;
	$mail->Username = "XXXXX";
    $mail->Password = "XXXXXX";
	$mail->SMTPSecure = "";
	$mail->From = "info@webslesson.info";
	$mail->FromName = 'Webslesson';  
    $mail->AddAddress($To,$username); 	
	$mail->WordWrap = 50;
	$mail->IsHTML(true);
	$mail->Subject = "Email Verifaction";
	$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"."?code=" . $id;
	$mail->Body = $actual_link;
	
	if($mail->Send()){
		echo 'ok';
	}else {
		echo 'no';
	}
	die;
}

?>  