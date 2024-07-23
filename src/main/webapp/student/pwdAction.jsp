<%@ page import="java.sql.*" %>
<%@ page import="ConnectionProvider.ConnectionProviders" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String email = request.getParameter("email");
String cpass = request.getParameter("cpass");
String npass = request.getParameter("npass");
String conpass = request.getParameter("conpass");

if (cpass == null || npass == null || conpass == null) {
    response.sendRedirect("studentDashboard.jsp?msg=error");
} else {
    // Ensure new password and confirm password match
    if (npass.equals(conpass)) {
        // Ensure current password and new password are not the same
        if (!cpass.equals(npass)) {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                conn = ConnectionProviders.getCon();
                ps = conn.prepareStatement("SELECT password FROM student WHERE email=?");
                ps.setString(1, email);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String currentPassword = rs.getString("password");
                    // Check if current password is correct
                    if (currentPassword.equals(cpass)) {
                        ps = conn.prepareStatement("UPDATE student SET password = ? WHERE email = ?");
                        ps.setString(1, npass); // Plain text password for demonstration only
                        ps.setString(2, email);
                        ps.executeUpdate();
                        response.sendRedirect("studentDashboard.jsp?msg=valid");
                    } else {
                        response.sendRedirect("studentDashboard.jsp?msg=invalidcurrent");
                    }
                } else {
                    response.sendRedirect("studentDashboard.jsp?msg=invaliduser");
                }
            } catch (Exception e) {
                e.printStackTrace();
                if (!response.isCommitted()) {
                    response.sendRedirect("studentDashboard.jsp?msg=error");
                }
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("studentDashboard.jsp?msg=same");
        }  
    } else {
        response.sendRedirect("studentDashboard.jsp?msg=notsame");
    }
}
%>
