package daoImp;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import models.Administrador;
import models.Estudiante;


public class DaoUsuario {

	ConnectionManager cn = null;
    PreparedStatement ps = null; 
    ResultSet rs = null;

    public DaoUsuario() {
        cn = new ConnectionManager();
    }
    //TRAER USUARIO SEGUN username
    public Object InicioUsuario(String usuario) throws SQLException {
        Connection conexion = null;
        //PreparedStatement ps = null;
        //ResultSet rs = null;
        Estudiante E = new Estudiante();
        Administrador A = new Administrador();

        try {
          
            conexion = cn.connect(); 
            String sql = "SELECT * FROM usuario WHERE username = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, usuario);
            rs = ps.executeQuery();

            if (rs.next()) {
               
                if (rs.getString("tipo_usuario").equals("Administrador")) {
                    A.setNombre(rs.getString("nombre"));
                    A.setApellido(rs.getString("apellido"));  
                    A.setDNI(rs.getString("DNI"));
                    A.setFuncion(rs.getString("tipo_usuario"));
                    A.setId_admin(rs.getInt("id_usuario")); 
                    A.setUserName(rs.getString("username"));
                    A.setPassword(rs.getString("password"));
                    A.setEmail(rs.getString("mail"));
                    return A;
                } else {
                    E.setNombre(rs.getString("nombre"));
                    E.setApellido(rs.getString("apellido")); 
                    E.setDNI(rs.getString("DNI"));
                    E.setFuncion(rs.getString("tipo_usuario"));
                    E.setId_usuario(rs.getInt("id_usuario"));  
                    E.setUserName(rs.getString("username"));
                    E.setPassword(rs.getString("password"));
                    E.setEmail(rs.getString("mail"));
                    E.setDomicilio(rs.getString("domicilio"));
                    E.setFecha_nac(rs.getDate("fecha_nacimiento").toString());
                    return E;
                }
            }

        } catch (SQLException e) {
          
            System.err.println("Error al consultar la base de datos: " + e.getMessage());
            e.printStackTrace();
        } finally {
            
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }

        return null; 
    }
    
    //TRAER CONTRASEÑA DE USUARIO SEGUN SU EMAIL
    public String Password (String mail) throws SQLException {
    	
    	Connection conexion = null;
    	String password = null;
    	
    	try {
    		String consulta = "SELECT password FROM usuario WHERE mail= ?";
    		conexion = cn.connect();
    		ps= conexion.prepareStatement(consulta);
    		ps.setString(1, mail);
    		rs= ps.executeQuery();
    		
    		if(rs.next()) {
    			password = rs.getString("password");
    		}
    		
    		
    	} catch (SQLException e) {
          
            System.err.println("Error al consultar la base de datos: " + e.getMessage());
            e.printStackTrace();
        } finally {
            
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
    	return password;
    }

}
