package daoImp;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ConnectionManager  {
	static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error al cargar el driver JDBC", e);
        }
    }
    private ArrayList<String> variables;
    private String host = "jdbc:mysql://localhost:3306/db_juventud?useSSL=false";
    private String user = "root";
    private String password = "root";
    private Connection cn;
/*
    public ConnectionManager() throws IOException {
    try {
        CargarEnv cargarEnv = new CargarEnv();
        cargarEnv.ejecutar(); 
        variables = cargarEnv.getVariables();

        for (String variable : variables) {
            if (variable.startsWith("DB_HOST=")) {
                host = variable.substring("DB_HOST=".length()).trim();
            } else if (variable.startsWith("DB_USER=")) {
                user = variable.substring("DB_USER=".length()).trim();
            } else if (variable.startsWith("DB_PASSWORD=")) {
                password = variable.substring("DB_PASSWORD=".length()).trim();
            }
        }

        if (host == null || user == null || password == null) {
            throw new IllegalStateException("Faltan variables de conexión en el archivo .env");
        }

    } catch (Exception e) { 
        System.err.println("Ocurrió un error inesperado: " + e.getMessage());
    }
}
*/
    public Connection connect() {
        try {
            cn = DriverManager.getConnection(host, user, password);
            System.out.println("Conexión establecida con éxito.");
        } catch (SQLException e) {
            System.err.println("Error al conectar con la base de datos: " + e.getMessage());
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
    
    public ResultSet query(String query)
	{
		Statement st;
		ResultSet rs=null;
		try
		{
			st= cn.createStatement();
			rs= st.executeQuery(query);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return rs;
	}
}
