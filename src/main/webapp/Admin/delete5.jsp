<%@page import="java.sql.*"%>
<%@page import="ConnectionProvider.ConnectionProviders"%>

<%
String id=request.getParameter("id");
try{
	Connection conn=ConnectionProviders.getCon();
	Statement st =conn.createStatement();
	st.executeUpdate("delete from student where id='"+id+"'"); 
	response.sendRedirect("registerstd.jsp?delete=deleted");

}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("registerstd.jsp?delete=invalid");

}
%>