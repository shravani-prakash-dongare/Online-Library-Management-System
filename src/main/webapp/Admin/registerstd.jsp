<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.Serial"%>
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
<title>Registered Student</title>
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
			<%
					String delete = request.getParameter("delete");
					if ("invalid".equals(delete)) {
					%>
					<div class="text-center alert alert-danger">Something Went
						Wrong on Server.! Try Again</div>
					<%
					}
					%>
					<%
					if ("deleted".equals(delete)) {
					%>

					<div class="text-center alert alert-success">Successfully
						Deleted</div>
					<%
					}
					%>

				<div class="card-body">
					<h5 class="text-dark fw-bold">Registered Student</h5>
					<hr style="margin-top: 15px; border: 2px solid green;">
					<div class="container-fluid px-4 text-center align-items-center ">
						<div class="row g-3  align-items-center">
						<div class="table-responsive">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Sr. No</th>
										<th>Student ID</th>
										<th>Student name</th>
										<th>Email ID</th>
										<th>Mobile No.</th>
										<th>Reg. Date</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>

								<%
								try {
									Class.forName("com.mysql.cj.jdbc.Driver");
									Connection con = ConnectionProviders.getCon();
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery("SELECT * FROM student");

									int serialNo = 1;
									while (rs.next()) {
										String creationDate = rs.getString(5);
								%>
								<tr>
									<td><%=serialNo++%></td>
									<td><%=rs.getString(8)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4)%></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><a class="btn btn-primary btn-sm"
										data-bs-toggle="modal" data-bs-target="#demoedit"
										data-id="<%=rs.getInt(8)%>"> Edit</a> <a
										href="delete5.jsp?id=<%=rs.getString("id")%>"
										class="btn btn-danger btn-sm"
										onclick="return confirm('Are you sure you want to Delete?');">Delete</a>
									</td>
								</tr>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>


							</table>
						</div>
					</div>
				</div>
				</div>
			</div>

			<!-- -Edit modal Start -->
			<div class="modal" id="demoedit">
				<div class="modal-dialog text-dark">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Edit</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body">
							<form class="container" action="registerstdEdit.jsp"
								method="post">
								<!-- Hidden input to hold the ID for submission -->
								<input type="hidden" id="editCategoryId" name="id">

								<!-- Display input for showing the ID, but disabled -->
								<div class="form-group">
									<label for="editCategoryIdDisplay">Student ID</label> <input
										type="text" class="form-control" id="editCategoryIdDisplay"
										disabled>
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Status</label> <select
										class="form-control" name="status">
										<option>Active</option>
										<option>Inactive</option>
									</select>
								</div>

								<div class="input-box">
									<button type="submit" class="btn btn-primary mt-2">Update</button>
								</div>
							</form>
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
		
		
		 var editModal = document.getElementById('demoedit');
	        editModal.addEventListener('show.bs.modal', function (event) {
	            var button = event.relatedTarget;
	            var id = button.getAttribute('data-id');
	            
	            // Set the hidden input value
	            var modalIdInput = editModal.querySelector('#editCategoryId');
	            modalIdInput.value = id;

	            // Set the display input value
	            var modalIdDisplay = editModal.querySelector('#editCategoryIdDisplay');
	            modalIdDisplay.value = id;
	        });
		    // Function to get URL parameters
		    function getQueryParams() {
		        const params = {};
		        window.location.search.substring(1).split("&").forEach(pair => {
		            const [key, value] = pair.split("=");
		            params[key] = decodeURIComponent(value);
		        });
		        return params;
		    }

		    // Check if the msg or msg1 parameter is present in the URL
		    const params = getQueryParams();
		    if (params.msg === "valid") {
		        alert(" added successfully!");
		    } else if (params.msg === "invalid") {
		        alert("Failed to add category. Please try again.");
		    } else if (params.msg === "error") {
		        alert("An error occurred while adding the category. Please try again.");
		    }

		    if (params.msg1 === "valid") {
		        alert("updated successfully!");
		    } else if (params.msg1 === "invalid") {
		        alert("Failed to update category. Please try again.");
		    }
	</script>
</body>

</html>
</html>