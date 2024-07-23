
<%@page import="ConnectionProvider.ConnectionProviders"%> 
<%@page import="java.sql.*"%>
<% 
 String uname = request.getParameter("email");
 String pass = request.getParameter("pwd");

 try {
 	Connection con = ConnectionProviders.getCon();
 	PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE email = ? AND password = ?");
 	ps.setString(1, uname);
 	ps.setString(2, pass);
 	ResultSet rs = ps.executeQuery();
 	if (rs.next()) {
 		
 		 session.setAttribute("name", rs.getString("name"));
         session.setAttribute("email", rs.getString("email"));
         session.setAttribute("mobileno", rs.getString("mobileno"));
         session.setAttribute("regdate", rs.getString("regdate"));
         session.setAttribute("status", rs.getString("status"));
         session.setAttribute("uid", rs.getString("uuid"));
         
 		response.sendRedirect("studentDashboard.jsp");
 	} else {
 		response.sendRedirect("login.jsp?msg=invalid");
 	}

 } catch (Exception e) {
 	// TODO: handle exception
 	e.printStackTrace();
 }
 %>