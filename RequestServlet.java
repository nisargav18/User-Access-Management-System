

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String softwareId = request.getParameter("softwareId");
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");
        String username = (String) request.getSession().getAttribute("username");

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO requests (user_id, software_id, access_type, reason, status) " +
                         "VALUES ((SELECT id FROM users WHERE username = ?), ?, ?, ?, 'Pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, Integer.parseInt(softwareId));
            ps.setString(3, accessType);
            ps.setString(4, reason);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("requestAccess.jsp");
    }
}
