
<%@page import="ConnectionProvider.ConnectionProviders"%> 
<%@page import="java.sql.*"%>
<% 
 String uname = request.getParameter("email");
 String pass = request.getParameter("pwd");

 try {
 	Connection con = ConnectionProviders.getCon();
 	PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE uname = ? AND pass = ?");
 	ps.setString(1, uname);
 	ps.setString(2, pass);
 	ResultSet rs = ps.executeQuery();
 	if (rs.next()) {
 		
         
 		response.sendRedirect("Dashboard.jsp");
 	} else {
 		response.sendRedirect("login.jsp?msg=invalid");
 	}

 } catch (Exception e) {
 	// TODO: handle exception
 	e.printStackTrace();
 }
 %>