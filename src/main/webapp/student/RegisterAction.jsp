<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Random"%>
<%@ page import="ConnectionProvider.ConnectionProviders"%>

<%
String name = request.getParameter("name");
String mobileno = request.getParameter("mobileno");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");
String Conpwd = request.getParameter("Conpwd");
String status = "Active";

if (!pwd.equals(Conpwd)) {
	response.sendRedirect("Register.jsp?msg=wrongpwd");
} else {
	Connection conn = null;
	PreparedStatement ps = null;
	try {
		conn = ConnectionProviders.getCon();

		// Generate a unique number using random number
		Random random = new Random();
		int uniqueNumber = random.nextInt(900000) + 100000; // Generate a 7-digit random number

		String query = "INSERT INTO student (name, mobileno, email, status, password, uuid) VALUES (?, ?, ?, ?, ?, ?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, mobileno);
		ps.setString(3, email);
		ps.setString(4, status);
		ps.setString(5, pwd); // It's recommended to hash the password before storing
		ps.setInt(6, uniqueNumber); // Use unique number instead of UUID

		int row = ps.executeUpdate();
		if (row > 0) {
	response.sendRedirect("Register.jsp?msg=valid");
		} else {
	response.sendRedirect("Register.jsp?msg=invalid");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<h3>Error: " + e.getMessage() + "</h3>");
	} finally {
		try {
	if (ps != null)
		ps.close();
	if (conn != null)
		conn.close();
		} catch (SQLException e) {
	e.printStackTrace();
		}
	}
}
%>
