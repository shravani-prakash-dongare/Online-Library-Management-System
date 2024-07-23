
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
<title>Dashboard</title>
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
</style>
<body>
	<div class="bg-dark" id="sidebar-wrapper">
		<div class="sidebar-heading py-4 text-light  border-bottom">
			<span class="fs-5 mb-5 text-uppercase"
				style="letter-spacing: 1px; font-weight: normal;">Student
				Role</span>
			<div class=" mt-3" style="font-size: 15px; foont-weight: normal;">
				<%=session.getAttribute("email")%></div>

		</div>
		<div class="list-group list-group-flush my-3">
			<a href="studentDashboard.jsp"
				class="list-group-item list-group-item-action bg-transparent  active"><i
				class="fas fa-tachometer-alt me-2"></i>Dashboard</a> <a
				class="nav-link  list-group-item list-group-item-action bg-transparent second-text fw-bold"
				href="profile.jsp" role="button" aria-expanded="false"><i
				class="fas fa-file me-2"></i> My Profile</a> <a
				class="nav-link  list-group-item list-group-item-action bg-transparent second-text fw-bold"
				href="bookissue.jsp" role="button" aria-expanded="false"><i
				class="fas fa-book-open"></i> Issued Book </a> <a
				href="changePassword.jsp"
				class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
				data-bs-toggle="modal" data-bs-target="#pwd"><i
				class="fas fa-key me-2"></i>Change Password</a> <a href="login.jsp"
				class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"
				onclick="return confirm('Are you sure you want to Logout?');"><i
				class="fas fa-power-off me-2"></i>Logout</a>
		</div>
	</div>

	<div class="modal margin" id="pwd">
		<div class="modal-dialog text-dark">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Change Password</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form action="pwdAction.jsp" method="post">
						<div class="container">
							<input type="hidden" class="form-control" name="email"
								value="<%=session.getAttribute("email")%>">
							<div class="form-group mb-3">
								<input type="password" class="form-control" name="cpass"
									placeholder="Enter Current Password." required>
							</div>
							<div class="form-group mb-3">
								<input type="password" class="form-control" name="npass"
									placeholder="Enter New Password." required>
							</div>
							<div class="form-group mb-3">
								<input type="password" class="form-control" name="conpass"
									placeholder="Enter New Password Again." required>
							</div>
							<button type="submit"
								class="btn Registerbtn  btn-primary text-center">Update</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>