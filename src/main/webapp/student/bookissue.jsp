<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ConnectionProvider.ConnectionProviders"%>
<%@page import="java.sql.*"%>
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
.card {
	height: 90vh;
}
</style>
<body class="text-light">
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->

		<%@include file="sidebar.jsp"%>
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

				<div class="card-body">
					<h5 class="text-dark fw-bold">Manage Book Issue</h5>
					<hr style="margin-top: 15px; border: 2px solid green;">
					<div class="container-fluid px-4 text-center align-items-center ">
						<div class="row g-3  align-items-center">
						<div class="table-responsive">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Sr. No</th>
										<th>Book Name</th>
										<th>ISBN</th>
										<th>Issue Date</th>
										<th>Return Date</th>
										<th>Fine in (Rs.)</th>
									</tr>
								</thead>
								<tbody>
									<%
									try {
										Class.forName("com.mysql.cj.jdbc.Driver");
										Connection con1 = ConnectionProviders.getCon();
										String studentUid = (String) session.getAttribute("uid");
										PreparedStatement ps = con1.prepareStatement(
										"SELECT student.name, bookissue.id, bookissue.uid, bookissue.isbn, bookissue.bookname, bookissue.issuedate, bookissue.returndt, bookissue.fine FROM student JOIN bookissue ON student.uuid = bookissue.uid WHERE  bookissue.uid = ?");
										ps.setString(1, studentUid);
										ResultSet rs1 = ps.executeQuery();

										int serialNo = 1;
										while (rs1.next()) {
											String creationDate = rs1.getString("returndt");
											String fine = rs1.getString("fine");
									%>
									<tr>
										<td><%=serialNo++%></td>
										<td><%=rs1.getString("bookname")%></td>
										<td><%=rs1.getString("isbn")%></td>
										<td><%=rs1.getString("issuedate")%></td>
										<td><%=(creationDate != null) ? creationDate : "Not Yet Updated"%></td>
										<td><%=(fine != null) ? fine : "0"%></td>
									</tr>
									<%
									}
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
								</tbody>
							</table>
						</div>
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
