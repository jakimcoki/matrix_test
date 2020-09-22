<?php include('save_form.php') ?>
<!DOCTYPE html>
<html>
<head>
 <title>Home Page</title>  
 <link rel="stylesheet" type="text/css" href="style_css.css">
    <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.2.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery-1.8.3.js"></script>
    <script type="text/javascript" language="javascript" src="jquery_ui/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" language="javascript" src="jquery_ui/js/jquery-ui-1.10.4.custom.js"></script>
    <script type="text/javascript" language="javascript" src="jquery_ui/js/jquery-ui-1.10.4.custom.min.js"></script>
</head>

<script>
$(document).ready(function(){
	
	
	
	// var arr = $("[name='language[]']"); 
	// $temp = 1;
	// $.each( arr, function( i, val ) {
		// $(this).val('PHP'+$temp);
		// $temp++;
    // });
	// var arr1 = $("[name='experience[]']"); 
	// $temp1 = 1;
	// $.each( arr1, function( i, val ) {
		// $(this).val($temp1);
		// $temp1++;
    // });
	// var arr2 = $("[name='company[]']"); 
	// $temp2 = 1;
	// $.each( arr2, function( i, val ) {
		// $(this).val('ITGMA'+$temp2);
		// $temp2++;
    // });
	
    $("#addNewRow_first").click(function(){
            var int_var = $(this).parent().find('tr:last').find('td:first').attr("vrednost");
			if (int_var == undefined){
				int_var = 1;
				//alert(int_var);
				$("#KL_new").append('<tr style="border: 1px solid #6297BC;">'+
                              '<td vrednost="'+int_var+'"><input type="hidden" name="id_name_pos[]" value="" /><textarea type="text" name="language[]"></textarea></td>'+
                              '<td><textarea type="text" name="experience[]"></textarea></td>'+
                              '<td><textarea type="text" name="company[]"></textarea></td>'+
                              '<td><img src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>'+
                              '</tr>');
			}else {
				//alert(int_var);
				int_var++;
				$("#KL_new").append('<tr style="border: 1px solid #6297BC;">'+
                              '<td vrednost="'+int_var+'"><input type="hidden" name="id_name_pos[]" value="" /><textarea type="text" name="language[]"></textarea></td>'+
                              '<td><textarea type="text" name="experience[]"></textarea></td>'+
                              '<td><textarea type="text" name="company[]"></textarea></td>'+
                              '<td><img src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>'+
                              '</tr>');
			}
		    
    });
	
	

	
  });
</script>
<script type="text/javascript">
    function deleteThisRow($this){
           $($this).parent().parent().remove();
    }
	function RemoveRowFirst($this){
                var int_var = $($this).parent().find('tr:last').find('td:first').attr("vrednost");
                //alert(int_var);
				if(int_var>0){
					$($this).parent().find('tr:last').remove();
				}
    }

</script>
<body>

<div class="header">
    <h1>Home Page</h1>
	<?php if (isset($_SESSION['verified'])) : ?>
      <div class="verified" >
      	<h3>
          <?php 
          	echo $_SESSION['verified']; 
          ?>
      	</h3>
      </div>
    <?php endif ?>
	
	<?php  if (isset($_SESSION['id'])) : ?>
    	<p style="display:none;">Your ID <strong><?php echo $_SESSION['id']; ?></strong></p>
    	
    <?php endif ?>
	<?php  if (isset($_SESSION['flag'])) : ?>
    	<p style="display:none;">Your Flag status <strong><?php echo $_SESSION['flag']; ?></strong></p>
    	
    <?php endif ?>
	<div class="">
  	<!-- notification message -->
  	<?php if (isset($_SESSION['success'])) : ?>
      <div class="error success" >
      	<h3>
          <?php 
          	echo $_SESSION['success']; 
          	unset($_SESSION['success']);
          ?>
      	</h3>
      </div>
    <?php endif ?>
	<!-- logged in user information -->
	<?php if(count($errors) > 0):?>
	   <div class="erros">
	      <?php foreach($errors as $error): ?>
		     <?php echo '*'.$error.'<br />'; ?>
		  <?php endforeach?>
	   </div>
	<?php endif//!@#456As?>
    <?php  if (isset($_SESSION['username'])) : ?>
    	<p style="margin-top:-1.5%;font-size:30px;float: left;">Welcome <strong><?php echo $_SESSION['username']; ?></strong></p>
    	<p style="margin-top:-1.5%;font-size:30px;float: right;"> <a href="index.php?logout=1" style="color: red;">Logout</a> </p>
    <?php endif ?>
	<!-- when account is activated insert other information-->
	<?php //echo $flag;  ?>
	<?php if (isset($_SESSION['flag']) && $_SESSION['flag'] == '1' && $flag == '1') : ?>
	    <div>
    	<form method="post" action="index.php" >
		<?php  if (isset($_SESSION['id'])) : ?>
		<input style="display:none;"  type="text" name="id" value="<?php echo $_SESSION['id']; ?>"/>
		<?php endif ?>
		<?php  if (isset($_SESSION['user_info_ok']) && $_SESSION['user_info_ok'] == 'success') : ?>
		<input style="display:none;" type="text" name="id" value="<?php echo $_SESSION['id']; ?>"/>
		        <input style="display:none;" type="text" name="sex" value="<?php if(isset($_SESSION['sex'])) echo $_SESSION['sex']; ?>"/>
				<input style="display:none;" type="text" name="first_name" value="<?php if(isset($_SESSION['first_name'])) echo $_SESSION['first_name']; ?>"/>
				<input style="display:none;" type="text" name="last_name" value="<?php if(isset($_SESSION['last_name'])) echo $_SESSION['last_name']; ?>"/>
				<div class="all_input1">
				 <label style="font-weight: bold;">First Name: <strong style="color:blue;"><?php if(isset($_SESSION['first_name'])) echo $_SESSION['first_name']; ?></strong></label>
				 <p style="font-size:30px;float: left;"></p>
				</div> 
				<div class="all_input1">
				 <label style="font-weight: bold;">Last Name: <strong style="color:blue;"><?php if(isset($_SESSION['last_name'])) echo $_SESSION['last_name']; ?></strong></label>
				 
				</div> 
				<div class="all_input1">
				 <label style="font-weight: bold;">Gender: <strong style="color:blue;"><?php if(isset($_SESSION['sex'])) echo $_SESSION['sex']; ?></strong></label>
				 <br />
				 <button type="submit" name="edit_changes_other" value="Edit Information" class="btn">Edit Information</button>
				 <input type="submit" value="Print your CV" id="print"  name="print" onclick="PrintForm();"/>
	    </div> 
		<?php else:?>
		     <div class="all_input1">
				 <label style="font-weight: bold;">First Name</label>
				 <input type="text" name="first_name" value="<?php if(isset($_POST['first_name'])) echo $_POST['first_name']; ?>"/>
				</div> 
				<div class="all_input1">
				 <label style="font-weight: bold;">Last Name</label>
				 <input type="text" name="last_name" value="<?php if(isset($_POST['last_name'])) echo $_POST['last_name']; ?>"/>
				</div> 
				<div class="all_input1">
				 <label style="font-weight: bold;">Gender</label>
				 <?php if(isset($_SESSION['sex'])){$selected = $_SESSION['sex'];}?>
				 <select name="sex" id="sex">
					<option value=""></option>
					<option value="male"<?php if(isset($_SESSION['sex']) && $selected == 'male'){echo("selected");}?> >Male</option>
					<option value="female"<?php if(isset($_SESSION['sex']) && $selected == 'female'){echo("selected");}?>>Female</option>
				</select>
				
				</div> 
		<?php endif ?>
		<?php  if (isset($_SESSION['user_languages_ok']) && $_SESSION['user_languages_ok'] == 'success') : ?>
		    <?php //echo "<pre>";print_r($arr_info); echo "</pre>";
			//echo $_SESSION['first_name'].' '.$_SESSION['last_name'];
			$get_languages = implode(', ', array_map(function ($arr_info1) {
				return $arr_info1['language'];
			}, $arr_info));
			echo "<br /><strong style='color:blue;'>".$_SESSION['first_name'].' '.$_SESSION['last_name'].'</strong> your skills are <strong style="color:blue;">'.$get_languages."</strong><br /><br />";
			foreach ($arr_info as $key => $value){
				$language = $arr_info[$key]['language'];
				$experience = $arr_info[$key]['experience'];
				$company = $arr_info[$key]['company'];
			    echo '<strong style="color:blue;">'.$language."</strong> experience <strong style='color:blue;'>".$experience."</strong> years and worked at <strong style='color:blue;'>".$company."</strong><br />";
			}
			 ?>
		<?php else:?>
		
		
		
		<?php if(!$num_rows_info)://echo "<pre>";print_r($arr_info); echo "</pre>";?>
		      <table width="100%" id="KL_new" class="table1">
                      <tr>
                      <th>Programming Language</th>
                      <th>Years of experience</th>
                      <th>Company</th>
                      </tr>
                          <tr style="border: 1px solid #6297BC;">
                              <td vrednost="1"><textarea type="text" name="language[]"></textarea></td>
                              <td><textarea type="text" name="experience[]"></textarea></td>
                              <td><textarea type="text" name="company[]"/></textarea></td>
                              <td><img  src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>
                          </tr>
                            <tr style="border: 1px solid #6297BC;">
                              <td vrednost="2"><textarea type="text" name="language[]"></textarea></td>
                              <td><textarea type="text" name="experience[]"></textarea></td>
                              <td><textarea type="text" name="company[]"></textarea></td>
                              <td><img src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>
                          </tr>
                           <tr style="border: 1px solid #6297BC;">
                              <td vrednost="3"><textarea type="text" name="language[]"></textarea></td>
                              <td><textarea type="text" name="experience[]"></textarea></td>
                              <td><textarea type="text" name="company[]"></textarea></td>
                              <td><img src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>
                          </tr>
                            <tr style="border: 1px solid #6297BC;">
                              <td vrednost="4"><textarea type="text" name="language[]"></textarea></td>
                              <td><textarea type="text" name="experience[]"></textarea></td>
                              <td><textarea type="text" name="company[]"></textarea></td>
                              <td><img src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>
                          </tr>
                      </table>
					  <br />
                      <input id="addNewRow_first" type="button" value="Add New Row" name="add_new_row" style="float: right;"  class="add_new_row" /><br />
                      <input id="removeNewRow_first" type="button" value="Delete Row" name="remove_new_row" style="float: right; margin-top: 5px;"  class="remove_new_row" onclick="RemoveRowFirst(this);"/>
		
		<?php else:?>
        		<table width="100%" id="KL_new" class="table1">
					<tr>
						  <th>Programming Language</th>
						  <th>Years of experience</th>
						  <th>Company</th>
					</tr>
					<?php $i = 1; foreach ($arr_info as $key => $value){?>
					      
					<tr style="border: 1px solid #6297BC;">
                              <td vrednost="<?php echo $i; ?>"><textarea type="text" name="language[]" value="<?php echo $arr_info[$key]['language']; ?>"><?php echo $arr_info[$key]['language']; ?></textarea></td>
                              <td><textarea type="text" name="experience[]"><?php echo $arr_info[$key]['experience']; ?></textarea></td>
                              <td><textarea type="text" name="company[]"/><?php echo $arr_info[$key]['company']; ?></textarea></td>
                              <td><img  src="close_pop.png" alt="Избриши ред" height="30" width="30" onclick="deleteThisRow(this);"></img></td>
                          </tr>
					<?php $i++;}  ?>	  
				</table>
					  <br />
                      <input id="addNewRow_first" type="button" value="Add New Row" name="add_new_row" style="float: right;"  class="add_new_row" /><br />
                      <input id="removeNewRow_first" type="button" value="Delete Row" name="remove_new_row" style="float: right; margin-top: 5px;"  class="remove_new_row" onclick="RemoveRowFirst(this);"/>
		<?php endif ?>
		<?php endif ?>	
		<?php  if (isset($_SESSION['save_changes']) && $_SESSION['save_changes'] == 'ok') : ?>
		
		 <?php else:?>
		 <div class="all_input">
		 <button type="submit" name="save_changes_other" value="Save Changes" class="btn">Save Changes</button>
		 </div>
		 <?php endif ?>
		</form></div>
    	
    <?php endif ?>
</div>
</div>


</body>
</html>