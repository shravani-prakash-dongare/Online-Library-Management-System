<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.*, ConnectionProvider.ConnectionProviders"%>
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
<title>Student Dashboard</title>
</head>
<style>
.box-info {
	display: flex;
	flex-wrap: wrap;
	padding: 0;
	margin: 20px 0;
}

.box-info li {
	list-style: none;
	background: #fff;
	padding: 10px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	flex: 1 1 calc(33.333% - 20px);
	margin: 10px;
}

.box-info li .i1 {
	font-size: 3rem;
	color: white;
	margin-right: 20px;
	padding: 10px;
	background: #46c0c0;
	border-radius: 5px;
}

.box-info li .i2 {
	font-size: 3rem;
	color: white;
	margin-right: 20px;
	padding: 10px;
	background: #df4538;
	border-radius: 5px;
}

.box-info li .text {
	display: flex;
	flex-direction: column;
}

.box-info li .text p {
	margin: 0;
	color: Black;
	font-size: 1rem;
}

.card {
	min-height: 90vh;
}

hr {
	margin-top: 15px;
	border: 2px solid green;
}
</style>
<body class="text-light">


	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->

		<jsp:include page="sidebar.jsp" />
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
							class="nav-link  second-text fw-bold" href="login.jsp"> <i
								class="fas fa-user me-2"></i>Logout
						</a>
					</ul>
				</div>
			</nav>
			<div class="card">
				<%
				String msg = request.getParameter("msg");
				if ("valid".equals(msg)) {
				%>
				<div class="text-center alert alert-success fs-5">Password
					Changed..!</div>
				<%
				} else if ("same".equals(msg)) {
				%>
				<div class="text-center alert alert-danger fs-5">Current
					Password and New Password are the Same</div>
				<%
				} else if ("notsame".equals(msg)) {
				%>
				<div class="text-center alert alert-danger fs-5">New Password
					and Confirm Password do not Match</div>
				<%
				} else if ("invalidcurrent".equals(msg)) {
				%>
				<div class="text-center alert alert-danger fs-5">Current
					Password is Incorrect</div>
				<%
				} else if ("invaliduser".equals(msg)) {
				%>
				<div class="text-center alert alert-danger fs-5">User Not
					Found</div>
				<%
				} else if ("error".equals(msg)) {
				%>
				<div class="text-center alert alert-danger fs-5">An Error
					Occurred. Please Try Again Later</div>
				<%
				}
				%>
				<div class="card-body">
					<h5 class="text-dark fw-bold">Welcome to Admin Dashboard</h5>
					<hr>
					<div
						class="container-fluid px-4 text-center align-items-center mb-5">
						<div class="row g-3 my-2 align-items-center">

							<ul class="box-info">

								<li><i class='fas fa-book-open i2'></i> <a
									href="bookissue.jsp" style="text-decoration: none;"><span
										class="text">
											<p>Book issued</p>
											<p>
												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection con = ConnectionProviders.getCon();
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery("SELECT COUNT(id) FROM bookissue");
													while (rs.next()) {
												%>
												<b><%=rs.getString(1)%></b>
												<%
												}
												} catch (Exception e) {
												e.printStackTrace();
												}
												%>
											</p>
									</span></a></li>
								<li><i class='fas fa-book-open i1 bg-success'></i> <span
									class="text"> <a href="bookissue.jsp"
										style="text-decoration: none;"><p>Book Returned</p>
											<p>
												<%
												try {
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection con = ConnectionProviders.getCon();
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery("SELECT COUNT(id) FROM bookissue WHERE returndt IS NOT NULL");
													while (rs.next()) {
												%>
												<b><%=rs.getString(1)%></b>
												<%
												}
												} catch (Exception e) {
												e.printStackTrace();
												}
												%>
											</p></a>
								</span></li>

							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /#page-content-wrapper -->

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
