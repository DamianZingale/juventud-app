package daoImp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario {

	ConnectionManager cn = null;
    PreparedStatement ps = null; 
    ResultSet rs = null;

    public DaoUsuario() {
        cn = new ConnectionManager();
    }
    
    public String InicioUsuario(String usuario, String contrasenia) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "SELECT (username, password, tipo_usuario) FROM usuario WHERE username = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, usuario);
            rs = ps.executeQuery();

            if (rs.next()) {
                String user = rs.getString("username");
                String password = rs.getString("password");
                String tipo = rs.getString("tipo_usuario");
                
                if(password.equals(contrasenia)){
                	
                	return tipo;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
         
    }
    


}
