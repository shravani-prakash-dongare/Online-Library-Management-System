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
	
	<link rel="Stylesheet" href="style.css">
</head>

<body>
	<div class="row bg-custom text-light" id="home">
		<br>
		<div class="col s10">
			<i class="fa fa-clock-o" aria-hidden="true"> Monday-Saturday, 8AM
				to 10PM</i>
		</div>
		<i class="fa fa-mobile" aria-hidden="true"> Call us Now - +91 1234
			5678 90</i><br> <br>

	</div>
	<div class="row sticky-nav">
		<!-- Add the sticky-nav class here -->
		<div class="col s12 ">
			<nav class="navbackground">
				<div class="nav-wrapper ">
					<img src="img/logo.jfif" alt="Unsupported Image" class="brand-logo">
					<a href="#" data-target="mobile-demo"
						class="sidenav-trigger colour" style="color: black;"><i
						class="material-icons">&#9776;</i></a>

					<ul class="right hide-on-med-and-down">
						<li><a href="#home" class="hover" onclick="changecolor()" >Home</a></li>
						<li><a href="#about" class="hover" onclick="changecolor()" >About</a></li>
						<li><a class="waves-effect waves-light btn" href="student/login.jsp">Student Login</a></li>
						<li><a class="waves-effect waves-light btn" href="Admin/login.jsp">Admin Login</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<ul class="sidenav" id="mobile-demo">
		<li><a href="#home" onclick="changecolor()" class="hover">Home</a></li>
		<li><a href="#about" onclick="changecolor()" class="hover">About</a></li>
		<li><a class="waves-effect waves-light btn" href="student/login.jsp">Student Login</a></li>
		<li><a class="waves-effect waves-light btn" href="Admin/login.jsp">Admin Login</a></li>
	</ul>

	<div class="carousel carousel-slider center">
		<div class="carousel-fixed-item center">
			<div class="container">
				<main class="main1">
					<section class="text-center background text-dark">
						<h3 class="container divpart p1">
							<br>Welcome to Online Library Management System
						</h3>
						<p>Online Library Management System is an Automated Library
							System that handles the various functions of the library.</p>
						<a href="Viewservice.jsp"
							class="btn btn-outline-warning btn1 mt-3"> Read More</a> <br>
						<br>
					</section>
				</main>
			</div>
		</div>
		<div class="carousel-item backimg1 white-text" href="#one!"></div>
		<div class="carousel-item backimg2 white-text" href="#two!"></div>
		<div class="carousel-item backimg1 white-text" href="#three!"></div>
		<div class="carousel-item backimg2 white-text" href="#four!"></div>
	</div>

	<div class="row  container about" id="about">
		<div class="section">
			<h5 class="center" style="font-weight:700;">ABOUT US</h5>
			<hr>
			<p>Library Management System is an application which refers to
				library systems which are generally small or medium in size. It is
				used by librarians to manage the library record various transactions
				like issue of books, return of books, addition of new books,
				addition of new students etc. Books and student maintenance modules
				are also included in this system which would keep track of the
				students using the library and also a detailed description about the
				books a library contains.</p>
		</div>
		<div class="col s6">
			<img src="img/lib2.jfif" alt="Unsupported Image" class="brand-logo">
		</div>
		<div class="col s6">
			<h5>MAIN PURPOSE ARE USED TO ONLINE LIBRARY MANAGEMENT SYSTEM</h5>
			<p>The purpose of this project is to provide a friendly
				environment to maintain the details of books and library members.</p>
			<ul class="collection">
				<li class="collection-item"><i class="fa fa-check-circle-o icolor" aria-hidden="true"></i>The document only
					covers the requirements specifications for the Library Management
					System. This document does not provide any other information about
					Library Management System.</li>
				<li class="collection-item"><i class="fa fa-check-circle-o icolor"
					 aria-hidden="true"></i> The main purpose of
					this project is to maintain easy circulation system using computers
					and to provide different reports.</li>
				<li class="collection-item"><i class="fa fa-check-circle-o icolor"
					 aria-hidden="true"></i> Improved user
					service through greater access to accurate information.</li>
			</ul><p>The purpose of this project is to provide a friendly
				environment to maintain the details of books and library members.</p>
		</div>

	</div>

	<footer style="background: #edecec;">
		<div class="row ">
			<br> <br>
			<div class="col s12 m6 l3">
				<h5>Online Library Management System</h5>
				<p>
					<br> Sector C Indrapuri <br> Bhopal M.P. <br> <br>
					<b>Phone: </b>+91 1234567890<br> <b>Email: </b>librarymgmt@gmail.com
				</p>
				<i class="fa fa-instagram i" aria-hidden="true"></i> <i
					class="fa fa-facebook i" aria-hidden="true"></i> <i
					class="fa fa-twitter i" aria-hidden="true"></i> <i
					class="fa fa-skype i " aria-hidden="true"></i> <i
					class="fa fa-linkedin i" aria-hidden="true"></i>
			</div>
			<div class="col s12 m6 l3">
				<h6>Useful Links</h6>
				<p>
					<a><i class="fa fa-angle-right" aria-hidden="true"></i> Home</a><br>
					<br> <a><i class="fa fa-angle-right" aria-hidden="true"></i>
						About us</a><br>
				</p>
			</div>
			<div class="col s12 m6 l3 ">
				<h6>Our Service</h6>
				<p>
					<a> <i class="fa fa-angle-right" aria-hidden="true"></i> Web
						Design
					</a><br> <br> <a><i class="fa fa-angle-right"
						aria-hidden="true"></i> web development</a><br>
				</p>
			</div>
			<div class="col s12 m6 l3">
				<h6>Our Newsletter</h6>
					<a>To Subscribe our Online Library Management System </a><br>
					<br>
				<div class="row">
					<div class="input-field col s7">
						<input id="email" type="email" class="validate"> <label
							for="email">Email</label>
					</div>
					<div class="input-field col s3">
						<button class="btn waves-effect waves-light" type="submit"
							name="action">Subscribe</button>
					</div>
				</div>
				<br>
			</div>
		</div>

		<div class="center" style="background: #e7e6e6;">
			<br> &copy; CopyRight<b> Online Library Management System</b>
			All Right Reserved <br> Designed by: Shrau Patil <br> <br>
		</div>
	</footer>
	
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.carousel');
			var instances = M.Carousel.init(elems, {
				fullWidth : true,
				indicators : true
			});

			function autoplay() {
				instances.forEach(function(instance) {
					instance.next();
				});
				setTimeout(autoplay, 4500);
			}
			autoplay();
		});

		document.addEventListener('DOMContentLoaded', function() {
			var navs = document.querySelectorAll('.sidenav');
			var instances = M.Sidenav.init(navs, {});
		});

		$(document).ready(function() {
			$('.sidenav').sidenav();
		});
		
		
		var color1= document.Selector('color');
		var color= document.getElementById('color').style.color;
		
		function changecolor(color){
			color="#3ec9bd";
		}
		
		color1.onclick=changecolor();
	</script>
</body>
</html>
