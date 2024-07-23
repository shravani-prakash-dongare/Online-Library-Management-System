<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="ConnectionProvider.ConnectionProviders"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String authors = request.getParameter("authors");
    String id=request.getParameter("id");
  

        try {
        	// Get the current date and time
            LocalDateTime currentDateTime = LocalDateTime.now();
            // Format the date and time if needed (optional)
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String formattedDateTime = currentDateTime.format(formatter);

        	Connection con=ConnectionProviders.getCon();
            String query = "update authors set author =?, updatedt=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, authors);
            ps.setString(2,formattedDateTime );
            ps.setString(3,id );

            int row = ps.executeUpdate();
            if (row > 0) {
                response.sendRedirect("bookauthor.jsp?msg1=valid");
            } else {
            	 response.sendRedirect("bookauthor.jsp?msg1=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookauthor.jsp?msg1=invalid");
    }
%>