<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Access Requests</title>
</head>
<body>
    <h2>Pending Access Requests</h2>
    <table border="1">
        <tr>
            <th>Employee Name</th>
            <th>Software Name</th>
            <th>Access Type</th>
            <th>Reason</th>
            <th>Action</th>
        </tr>
        <% 
            Connection conn = (Connection) application.getAttribute("dbConnection");
            Statement stmt = conn.createStatement();
            String sql = "SELECT r.id, u.username, s.name, r.access_type, r.reason FROM requests r " +
                         "JOIN users u ON r.user_id = u.id " +
                         "JOIN software s ON r.software_id = s.id " +
                         "WHERE r.status = 'Pending'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("access_type") %></td>
            <td><%= rs.getString("reason") %></td>
            <td>
                <form action="pendingRequests" method="post">
                    <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                    <button type="submit" name="action" value="approve">Approve</button>
                    <button type="submit" name="action" value="reject">Reject</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>

    <p><a href="login.jsp">Back to Login</a></p>
</body>
</html>
