import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
   
    private static final String URL = "jdbc:postgresql://localhost:5432/demodb";
    private static final String USER = "1234";
    private static final String PASSWORD = "1234";

    public static Connection getConnection() throws SQLException {
        // Load the PostgreSQL JDBC driver
        try {
            Class.forName("jdbc:postgresql://localhost:5432/demodb");
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // Handle the exception appropriately
            throw new SQLException("PostgreSQL Driver not found!", e);
        }

        // Establish and return a connection to the PostgreSQL database
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
