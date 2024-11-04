<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
    <h2>Request Access to Software</h2>
    <form action="requestAccess" method="post">
        <label for="softwareId">Software Name:</label>
        <select name="softwareId" id="softwareId" required>
            <%-- Dynamically populate software options from the database --%>
            <% 
                Connection conn = (Connection) application.getAttribute("dbConnection");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT id, name FROM software");
                while (rs.next()) {
            %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
            <% } %>
        </select><br><br>

        <label for="accessType">Access Type:</label>
        <select name="accessType" id="accessType" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>

        <label for="reason">Reason for Request:</label><br>
        <textarea name="reason" id="reason" rows="4" cols="50" required></textarea><br><br>

        <button type="submit">Submit Request</button>
    </form>

    <p><a href="login.jsp">Back to Login</a></p>
</body>
</html>
