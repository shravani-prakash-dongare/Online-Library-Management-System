<%@page import="java.sql.*"%>
<%@page import="ConnectionProvider.ConnectionProviders"%>

<%
String id=request.getParameter("id");
try{
	Connection conn=ConnectionProviders.getCon();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from category where id='"+id+"'"); 
	response.sendRedirect("categories.jsp?delete=deleted");

}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("categories.jsp?delete=invalid");

}


%>