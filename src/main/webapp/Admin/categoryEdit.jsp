<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="ConnectionProvider.ConnectionProviders"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String cat = request.getParameter("category");
    String  status= request.getParameter("status");
    String id=request.getParameter("id");
  

        try {
        	// Get the current date and time
            LocalDateTime currentDateTime = LocalDateTime.now();
            // Format the date and time if needed (optional)
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = currentDateTime.format(formatter);

        	Connection con=ConnectionProviders.getCon();
            String query = "update category set category =?,status=?, updatedt=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cat);
            ps.setString(2,status );
            ps.setString(3, formattedDateTime);
            ps.setString(4, id);

            int row = ps.executeUpdate();
            if (row > 0) {
                response.sendRedirect("categories.jsp?msg1=valid");
            } else {
            	 response.sendRedirect("categories.jsp?msg1=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("categories.jsp?msg1=invalid");
    }
%>