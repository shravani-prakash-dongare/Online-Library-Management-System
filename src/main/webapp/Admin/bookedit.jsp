<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="ConnectionProvider.ConnectionProviders"%>
<%
String bookname = request.getParameter("book");
String category = request.getParameter("category");
String author = request.getParameter("author");
String isbn = request.getParameter("isbnno");
String price = request.getParameter("price");
String id = request.getParameter("id");

try {
	// Establish connection to the database
	Connection con = ConnectionProviders.getCon();
	String query="update book set name=?,category=?,author=?,isbn=?,price=? where id=?";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, bookname);
	ps.setString(2, category);
	ps.setString(3, author); 
	ps.setString(4, isbn);
	ps.setString(5, price);
	ps.setString(6, id);
	int row = ps.executeUpdate();
	if (row > 0) {
		response.sendRedirect("book.jsp?msg1=valid");
	} else {
		response.sendRedirect("book.jsp?msg1=invalid");
	}
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("book.jsp?msg1=invalid");
}
%>
