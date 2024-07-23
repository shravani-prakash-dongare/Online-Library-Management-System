<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>

<!-- Compiled and minified CSS -->

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="Stylesheet" href="css/bootstrap.css">
</head>

<style>
.bg-purple {
	background: purple;
	height: 100vh;
}

.logo {
	border-radius: 100px;
	margin-top: 100px;
	width: 150px;
}

.back {
	background: url(../img/admin.jpg);
	background-color: grey;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<body>
	<div class="row">
		<div class="col-xl-4 bg-purple ">
			<div class="container  m-5">
				<div class="container text-center">
					<img alt="Unsupported images" src="../img/logo.jfif" class="logo">
					<p class="text-center mt-4">
						<b>WelCome Back..!</b>
					</p>
					<h3>Admin Sign to Library Management System</h3>
				</div>
				<br>
				<%
								String msg=request.getParameter("msg");
								
								if("invalid".equals(msg)){
								%>
									<center>
										<font color="red" size="4">Invalid Email And Password...!</font>
									</center>
									<%
									}
									%>
				<form class="container" action="loginAction.jsp" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control"
							placeholder="shraudongare@gmail.com" name="email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Enter Password" name="pwd">
					</div>
					<div class="input-box">
						<button type="submit" class="btn btn-primary mt-2">Log in</button>
						
					</div>


					
				</form>

			</div>
		</div>
		<div class="col-xl-8 back"></div>
	</div>

</body>
</html>
