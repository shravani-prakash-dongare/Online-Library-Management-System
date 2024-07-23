<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Book</title>
<style>
.card {
	height: 90vh;
}
</style>
</head>
<body class="text-light">
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<%@ include file="sidebar.jsp"%>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h3 class="m-0 text-center text-dark">Online Library
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
							class="nav-link second-text fw-bold" href="login.jsp"> <i
								class="fas fa-user me-2"></i>Logout
						</a></li>
					</ul>
				</div>
			</nav>
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-between">
						<span class="text-dark fw-bold">Manage Book</span>
						<button class="btn btn-success" type="button"
							data-bs-toggle="modal" data-bs-target="#demo">Add New
							Book</button>
					</div>

					<div class="modal fade" id="demo" tabindex="-1"
						aria-labelledby="demoLabel" aria-hidden="true">
						<div class="modal-dialog text-dark">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="demoLabel">Add Book</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body">
									<form class="container" action="addBook.jsp" method="post">
										<div class="mb-3">
											<label for="bookName" class="form-label">Book name</label> <input
												type="text" class="form-control" id="bookName" name="book">
										</div>
										<div class="mb-3">
											<label for="bookCategory" class="form-label">Category</label>
											<select class="form-select" id="bookCategory" name="category">
												<%
												Connection con = null;
												PreparedStatement ps = null;
												ResultSet rs = null;
												try {
													con = ConnectionProviders.getCon();
													ps = con.prepareStatement("Select category from category");
													rs = ps.executeQuery();
													while (rs.next()) {
												%>
												<option><%=rs.getString("category")%></option>
												<%
												}
												} catch (Exception e) {
												e.printStackTrace();
												} finally {
												try {
												if (rs != null)
													rs.close();
												} catch (SQLException e) {
												e.printStackTrace();
												}
												try {
												if (ps != null)
													ps.close();
												} catch (SQLException e) {
												e.printStackTrace();
												}
												try {
												if (con != null)
													con.close();
												} catch (SQLException e) {
												e.printStackTrace();
												}
												}
												%>
											</select>
										</div>
										<div class="mb-3">
											<label for="bookAuthor" class="form-label">Author</label> <select
												class="form-select" id="bookAuthor" name="author">
												<%
												Connection con1 = null;
												PreparedStatement ps1 = null;
												ResultSet rs1 = null;
												try {
													con1 = ConnectionProviders.getCon();
													ps1 = con1.prepareStatement("Select author from authors");
													rs1 = ps1.executeQuery();
													while (rs1.next()) {
												%>
												<option><%=rs1.getString("author")%></option>
												<%
												}
												} catch (Exception e) {
												e.printStackTrace();
												} finally {
												try {
												if (rs1 != null)
													rs1.close();
												} catch (SQLException e) {
												e.printStackTrace();
												}
												try {
												if (ps1 != null)
													ps1.close();
												} catch (SQLException e) {
												e.printStackTrace();
												}
												try {
												if (con1 != null)
													con1.close();
												} catch (SQLException e) {
												e.printStackTrace();
												}
												}
												%>
											</select>
										</div>
										<div class="mb-3">
											<label for="isbnNumber" class="form-label">ISBN
												Number</label> <input type="number" class="form-control"
												id="isbnNumber" name="isbnno">
										</div>
										<div class="mb-3">
											<label for="bookPrice" class="form-label">Price</label> <input
												type="number" class="form-control" id="bookPrice"
												name="price">
										</div>
										<button type="submit" class="btn btn-primary mt-2">Save
											Book</button>
									</form>
								</div>
							</div>
						</div>
					</div>
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

					<hr class="mt-3 mb-3" style="border: 2px solid green;">
					<div class="container-fluid px-4 text-center">
						<div class="row g-3">
							<div class="table-responsive">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Sr. No</th>
											<th>Book Name</th>
											<th>Category</th>
											<th>Author</th>
											<th>ISBN Number</th>
											<th>Price</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<%
										Connection con2 = null;
										Statement st = null;
										ResultSet rs2 = null;
										try {
											Class.forName("com.mysql.cj.jdbc.Driver");
											con2 = ConnectionProviders.getCon();
											st = con2.createStatement();
											rs2 = st.executeQuery("SELECT * FROM book");
											int serialNo = 1;
											while (rs2.next()) {
										%>
										<tr>
											<td><%=serialNo++%></td>
											<td><%=rs2.getString(2)%></td>
											<td><%=rs2.getString(3)%></td>
											<td><%=rs2.getString(4)%></td>
											<td><%=rs2.getString(5)%></td>
											<td><%=rs2.getString(6)%> Rs.</td>
											<td><a class="btn btn-primary btn-sm"
												data-bs-toggle="modal" data-bs-target="#demoedit"
												data-id="<%=rs2.getInt("id")%>">Edit</a> <a
												href="delete3.jsp?id=<%=rs2.getInt("id")%>"
												class="btn btn-danger btn-sm"
												onclick="return confirm('Are you sure you want to delete?');">Delete</a>
											</td>
										</tr>
										<%
										}
										} catch (Exception e) {
										e.printStackTrace();
										} finally {
										try {
										if (rs2 != null)
											rs2.close();
										} catch (SQLException e) {
										e.printStackTrace();
										}
										try {
										if (st != null)
											st.close();
										} catch (SQLException e) {
										e.printStackTrace();
										}
										try {
										if (con2 != null)
											con2.close();
										} catch (SQLException e) {
										e.printStackTrace();
										}
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

	<!-- Edit modal Start -->
	<div class="modal fade" id="demoedit" tabindex="-1"
		aria-labelledby="demoeditLabel" aria-hidden="true">
		<div class="modal-dialog text-dark">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="demoeditLabel">Book</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form class="container" action="bookedit.jsp" method="post">
						<div class="mb-3">
							<label for="editBookName" class="form-label">Book name</label> <input
								type="text" class="form-control" id="editBookName" name="book">
						</div>
						<div class="mb-3">
							<label for="editBookCategory" class="form-label">Category</label>
							<select class="form-select" id="editBookCategory" name="category">
								<%
								Connection con3 = null;
								PreparedStatement ps3 = null;
								ResultSet rs3 = null;
								try {
									con3 = ConnectionProviders.getCon();
									ps3 = con3.prepareStatement("Select category from category");
									rs3 = ps3.executeQuery();
									while (rs3.next()) {
								%>
								<option><%=rs3.getString("category")%></option>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								} finally {
								try {
								if (rs3 != null)
									rs3.close();
								} catch (SQLException e) {
								e.printStackTrace();
								}
								try {
								if (ps3 != null)
									ps3.close();
								} catch (SQLException e) {
								e.printStackTrace();
								}
								try {
								if (con3 != null)
									con3.close();
								} catch (SQLException e) {
								e.printStackTrace();
								}
								}
								%>
							</select>
						</div>
						<div class="mb-3">
							<label for="editBookAuthor" class="form-label">Author</label> <select
								class="form-select" id="editBookAuthor" name="author">
								<%
								Connection con4 = null;
								PreparedStatement ps4 = null;
								ResultSet rs4 = null;
								try {
									con4 = ConnectionProviders.getCon();
									ps4 = con4.prepareStatement("Select author from authors");
									rs4 = ps4.executeQuery();
									while (rs4.next()) {
								%>
								<option><%=rs4.getString("author")%></option>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								} finally {
								try {
								if (rs4 != null)
									rs4.close();
								} catch (SQLException e) {
								e.printStackTrace();
								}
								try {
								if (ps4 != null)
									ps4.close();
								} catch (SQLException e) {
								e.printStackTrace();
								}
								try {
								if (con4 != null)
									con4.close();
								} catch (SQLException e) {
								e.printStackTrace();
								}
								}
								%>
							</select>
						</div>
						<div class="mb-3">
							<label for="editISBNNumber" class="form-label">ISBN
								Number</label> <input type="number" class="form-control"
								id="editISBNNumber" name="isbnno">
						</div>
						<div class="mb-3">
							<label for="editBookPrice" class="form-label">Price</label> <input
								type="number" class="form-control" id="editBookPrice"
								name="price">
						</div>
						<input type="hidden" id="editCategoryId" name="id">
						<button type="submit" class="btn btn-outline-primary mt-2">UPDATE</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function () {
            el.classList.toggle("toggled");
        };

        function getQueryParams() {
            const params = {};
            window.location.search.substring(1).split("&").forEach(pair => {
                const [key, value] = pair.split("=");
                params[key] = decodeURIComponent(value);
            });
            return params;
        }

        const params = getQueryParams();
        if (params.msg === "valid") {
            alert("Added successfully!");
        } else if (params.msg === "invalid") {
            alert("Failed to add. Please try again.");
        } else if (params.msg === "error") {
            alert("An error occurred while adding. Please try again.");
        }

        if (params.msg1 === "valid") {
            alert("Updated successfully!");
        } else if (params.msg1 === "invalid") {
            alert("Failed to update. Please try again.");
        }

        var editModal = document.getElementById('demoedit');
        editModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var id = button.getAttribute('data-id');
            var modalIdInput = editModal.querySelector('#editCategoryId');
            modalIdInput.value = id;
        });
    </script>
</body>
</html>
