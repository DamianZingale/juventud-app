package daoImp;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class ConnectionManager {
    private String host = "jdbc:mysql://localhost:3306/db_juventud?useSSL=false";
    private String user = "root";
    private String password = "root";
    private Connection cn;

    public ConnectionManager() {
      
    }

    public Connection conexion() {
        try {
            cn = DriverManager.getConnection(host, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "No se pudo establecer conexión con la base de datos");
           
        }
        return cn;
    }

    public Statement statement() {
        if (cn != null) {
            try {
                return cn.createStatement();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void closeConnection() {
        try {
            if (cn != null && !cn.isClosed()) {
                cn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
