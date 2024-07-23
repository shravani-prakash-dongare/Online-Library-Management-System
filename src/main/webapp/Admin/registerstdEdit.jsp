<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="ConnectionProvider.ConnectionProviders"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%

    String status= request.getParameter("status");
    String id=request.getParameter("id");
  
        try {
        	
        	Connection con=ConnectionProviders.getCon();
            String query ="update student set status=? where uuid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,status);
            ps.setString(2,id);

            int row = ps.executeUpdate();
            if (row > 0) {
                response.sendRedirect("registerstd.jsp?msg1=valid");
            } else {
            	 response.sendRedirect("registerstd.jsp?msg1=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("registerstd.jsp?msg1=invalid");
    }
%>