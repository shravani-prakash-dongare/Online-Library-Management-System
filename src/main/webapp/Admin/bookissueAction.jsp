<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="ConnectionProvider.ConnectionProviders"%>
<%
String uuid = request.getParameter("uuid");
String isbn = request.getParameter("isbn");
String bookname = request.getParameter("bname");

try {
	Connection con = ConnectionProviders.getCon();
	String query = "INSERT INTO bookissue (uid,bookname,isbn) VALUES ( ?, ?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, uuid); // Set the current date and time
	ps.setString(2,bookname);
	ps.setString(3, isbn);
	int row = ps.executeUpdate();
	if (row > 0) {
		response.sendRedirect("bookissue.jsp?msg=valid");
	} else {
		response.sendRedirect("bookissue.jsp?msg=invalid");
	}
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("bookissue.jsp?msg=invalid");
}
%>
