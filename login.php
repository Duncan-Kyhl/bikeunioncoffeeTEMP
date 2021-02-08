<?php
pg_connect ( string $connection_string , int $connect_type = ? ) : resource

?>
<!DOCTYPE html>
<html lang="en" >
  <head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
	<link href="style.css" rel="stylesheet">

  </head>
  
  <body><link href="style.css" rel="stylesheet">
	<!-- partial:index.partial.html -->
	<body class="align">
	  
	  <div class="grid">
		<img src="https://lh3.googleusercontent.com/proxy/QdjrkEhr_zPpiluYB8r7GgRK47dljQ7-DTIeTZbnw1bLi6JP9inhHiAfAb866ln_PAZqtB7bjC3D0v2_Ynvn-Io7lImWjoIvHOPM_M_e8pSL4WH8Tr2Odi1GISa2Z09W5nU" width="200">
		<h1 align="center">Login</h1>
		
		<form method="post" class="form login">

		  <div class="form__field">
			<label for="login__username" name="username">

			  <span class="hidden">Username</span>
			</label>
			<input id="login__username" type="text" name="username" class="form__input" placeholder="Username" required>
		  </div>

		  <div class="form__field">
			<label for="login__password">

			  <span class="hidden">Password</span>
			</label>
			<input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
		  </div>

		  <div class="form__field">
			<input type="submit" name="submit" value="Sign In">
		  </div>

		</form>

		<p class="text--center">Not a member? <br>
		  Ask your supervisor to create an account!<br>

	  </div>


	</body>
	<!-- partial -->

  </body>
</html>
