<%@page import="java.sql.*"%>
<%@page import="ConnectionProvider.ConnectionProviders"%>

<%
String id=request.getParameter("id");
try{
	Connection conn=ConnectionProviders.getCon();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from bookissue where id='"+id+"'"); 
	response.sendRedirect("bookissue.jsp?delete=deleted");

}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("bookissue.jsp?delete=invalid");

}
%>