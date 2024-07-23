<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="ConnectionProvider.ConnectionProviders" %>
<%
    String authors = request.getParameter("authors");

    try {
        // Get the current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();
        // Format the date and time if needed (optional)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);

        // Establish connection to the database
        Connection con = ConnectionProviders.getCon();
        String query = "INSERT INTO authors (author, adddt) VALUES ( ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, authors);
        ps.setString(2, formattedDateTime);  // Set the current date and time

        int row = ps.executeUpdate();
        if (row > 0) {
            response.sendRedirect("bookauthor.jsp?msg=valid");
        } else {
            response.sendRedirect("bookauthor.jsp?msg=invalid");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("bookauthor.jsp?msg=invalid");
    }
%>
