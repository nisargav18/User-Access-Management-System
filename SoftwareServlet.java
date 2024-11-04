import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

/**
 * Servlet implementation class SoftwareServlet
 */
@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevels = request.getParameter("accessLevels");

        // Use the Database class to get the connection
        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO software (name, description, access_levels) VALUES\r\n"
            		+ "('Inventory Management System', 'Manages inventory and stock levels.', 'Read,Write'),\r\n"
            		+ "('Payroll System', 'Handles employee payroll and compensation.', 'Read,Write,Admin'),\r\n"
            		+ "('Customer Relationship Management', 'Manages customer data and interactions.', 'Read,Admin')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, accessLevels);
            ps.executeUpdate();
        } catch (SQLException e) {
            // Log the exception or provide feedback
            e.printStackTrace();
            throw new ServletException("Database error: Unable to save the software record.", e);
        }

        // Redirecting to the JSP page after successful insertion
        response.sendRedirect("createSoftware.jsp");
    }
}
