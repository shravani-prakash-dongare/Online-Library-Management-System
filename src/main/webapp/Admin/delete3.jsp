<%@page import="java.sql.*"%>
<%@page import="ConnectionProvider.ConnectionProviders"%>

<%
String id=request.getParameter("id");
try{
	Connection conn=ConnectionProviders.getCon();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from book where id='"+id+"'"); 
	response.sendRedirect("bookauthor.jsp?delete=deleted");

}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("bookauthor.jsp?delete=invalid");

}
%>