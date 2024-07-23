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

try {

	// Establish connection to the database
	Connection con = ConnectionProviders.getCon();
	String query = "INSERT INTO book (name,category, author, isbn,price) VALUES (?, ?, ?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, bookname);
	ps.setString(2, category);
	ps.setString(3, author); 
	ps.setString(4, isbn);
	ps.setString(5, price);
	int row = ps.executeUpdate();
	if (row > 0) {
		response.sendRedirect("book.jsp?msg=valid");
	} else {
		response.sendRedirect("book.jsp?msg=invalid");
	}
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("book.jsp?msg=invalid");
}
%>
