<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<!-- jQuery (necessary for autoplay function if using jQuery syntax) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>
.bg-purple {
	background: purple;
	height: 99vh;
}
.btn{
background:blue;
color:white;
margin:10px;
}

.back {
	background: url(img/lib2.jfif);
	height: 99vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.bgcolor {
	background-size: cover;
	width: 100%;
	height: 99vh;
	background-color: rgba(0, 0, 0, 0.5);
}

.logo {
	border-radius: 100px;
	margin-top: 100px;
	width: 150px;
}

form .input-field {
	background: white;
	border-radius: 5px;
	text-decoration: none;
	height: 40px;
}
</style>
<body>
	<div class="row">
		<div class="col s4 bg-purple">
			<div class="container center">
				<img alt="Unsupported images" src="img/logo.jfif" class="logo">
				<br> <br>
				<p>
					<b>WelCome Back..!</b>
				</p>
				<h5>Student Sign to Library Management System</h5>
				<br>
				<div class="row">
					<form class="col s12 offset-2">
						<div class="row">
							<div class="input-field col s12">
								<input id="email" type="email" class="validate"> <label
									for="email">Email</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<input id="password" type="password" class="validate"> <label
									for="password">Password</label>
							</div>
						</div>
						<input class="btn right" id="submit" type="submit" value="Sign In"> 
						<input id="submit" class="btn right" type="submit" value="Log In">
					</form>
				</div>
			</div>
		</div>


		<div class="col s8 back">
			<div class="bgcolor"></div>
		</div>

	</div>
	<script>
		
	</script>
</body>
</html>
