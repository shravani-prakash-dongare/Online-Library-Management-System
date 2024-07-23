<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="Stylesheet" href="../CSS1/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<title>Admin Dashboard</title>
</head>
<style>
:root {
	--main-bg-color: #009d63;
	--main-text-color: #000;
	--second-text-color: #bbbec5;
}

.primary-text {
	color: var(--main-text-color);
}

.second-text {
	color: var(--second-text-color);
}

.primary-bg {
	background-color: var(--main-bg-color);
}

.secondary-bg {
	background-color: var(--second-bg-color);
}

.rounded-full {
	border-radius: 100%;
}

#wrapper {
	overflow-x: hidden;
}

#sidebar-wrapper {
	min-height: 100vh;
	margin-left: -15rem;
	-webkit-transition: margin 0.25s ease-out;
	-moz-transition: margin 0.25s ease-out;
	-o-transition: margin 0.25s ease-out;
	transition: margin 0.25s ease-out;
}

#sidebar-wrapper .sidebar-heading {
	padding: 0.875rem 1.25rem;
	font-size: 1.2rem;
}

#sidebar-wrapper .list-group {
	width: 15rem;
}

#page-content-wrapper {
	min-width: 100vw;
}

#wrapper.toggled #sidebar-wrapper {
	margin-left: 0;
}

#menu-toggle {
	cursor: pointer;
}

.list-group-item {
	border: none;
	padding: 20px 30px;
}

.list-group-item.active {
	background-color: transparent;
	color: white;
	font-weight: bold;
	border: none;
}

@media ( min-width : 768px) {
	#sidebar-wrapper {
		margin-left: 0;
	}
	#page-content-wrapper {
		min-width: 0;
		width: 100%;
	}
	#wrapper.toggled #sidebar-wrapper {
		margin-left: -15rem;
	}
}

ul.box-info {
	display: flex;
	padding: 0;
	margin: 20px 0;
}

ul.box-info li {
	list-style: none;
	background: #fff;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	width: 30%;
	
}

ul.box-info li .i1 {
	font-size: 3rem;
	color: white;
	margin-right: 20px;
	padding: 10px;
	background: #46c0c0;
	border-radius: 5px;
}

ul.box-info li .i2 {
	font-size: 3rem;
	color: white;
	margin-right: 20px;
	padding: 10px;
	background: #df4538;
	border-radius: 5px;
}

ul.box-info li .text {
	display: flex;
	flex-direction: column;
}

ul.box-info li .text p {
	margin: 0;
	color: Black;
	font-size: 1rem;
}
</style>
<body class="text-light">
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->

		<div class="bg-dark" id="sidebar-wrapper">
			<div
				class="sidebar-heading py-4 text-light  border-bottom">
				<span class="fs-5 mb-5 text-uppercase"
					style="letter-spacing: 1px; font-weight: normal;">Student
					Role</span>
				<div class=" mt-3" style="font-size: 15px; foont-weight: normal;">
					Shrau@123gmail.com</div>

			</div>
			<div class="list-group list-group-flush my-3">
				<a href="dashboard.jsp"
					class="list-group-item list-group-item-action bg-transparent  active"><i
					class="fas fa-tachometer-alt me-2"></i>Dashboard</a> <a
					class="nav-link  list-group-item list-group-item-action bg-transparent second-text fw-bold"
					href="#" role="button" aria-expanded="false"><i
					class="fas fa-file me-2"></i> My Profile</a> <a
					class="nav-link  list-group-item list-group-item-action bg-transparent second-text fw-bold"
					href="#" role="button" aria-expanded="false"><i
					class="fas fa-book-open"></i> Issued Book </a> <a
					href="changePassword.jsp"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
					class="fas fa-lock me-2"></i>Change Password</a> <a href="admin.jsp"
					class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
					class="fas fa-power-off me-2"></i>Logout</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h3 class=" m-0 text-center text-dark">Online Library
						Management System</h3>
				</div>

				<button class="navbar-toggler text-dark" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link  second-text fw-bold" href="admin.jsp"> <i
								class="fas fa-user me-2"></i>Logout
						</a>
					</ul>
				</div>
			</nav>

			<div class="container-fluid px-4 text-center align-items-center mb-5">
				<div class="row g-3 my-2 align-items-center">

					<ul class="box-info">
						<li><i class='fas fa-book-open i1'></i> <span class="text">
								<p> Book Issued</p>
								<p><b>2834</b></p>
						</span></li>
						<li><i class='fas fa-book-open i2'></i> <span class="text">
								<p>Book Not Return yet</p>
								<p><b>2834</b></p>
						</span></li>

					</ul>

				</div>
			</div>



		</div>
	</div>

	<!-- /#page-content-wrapper -->
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		var el = document.getElementById("wrapper");
		var toggleButton = document.getElementById("menu-toggle");

		toggleButton.onclick = function() {
			el.classList.toggle("toggled");
		};
	</script>
</body>

</html>
