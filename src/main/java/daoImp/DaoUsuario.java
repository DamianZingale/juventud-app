package daoImp;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Administrador;
import models.Estudiante;
import models.MateriasEstudiante;


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
                    A.setId_usuario(rs.getInt("id_usuario")); 
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
    
   

    public List<MateriasEstudiante> obtenerMateriasPendientes(int id) {
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<MateriasEstudiante> materiasPendientes = new ArrayList<>();

        try {
            String consulta = "SELECT \r\n"
                    + "    m.id_materia, \r\n"
                    + "    m.nombre AS materia, \r\n"
                    + "    ap.año, \r\n"
                    + "    p.nombre AS cuatrimestre, \r\n"
                    + "    em.descripcion AS estado_materia \r\n"
                    + "FROM \r\n"
                    + "    usuario u \r\n"
                    + "JOIN \r\n"
                    + "    inscripcion_materia im ON u.id_usuario = im.id_usuario \r\n"
                    + "JOIN \r\n"
                    + "    materia m ON im.id_materia = m.id_materia \r\n"
                    + "JOIN \r\n"
                    + "    estado_materia em ON m.id_estado_materia = em.id_estado_materia \r\n"
                    + "JOIN \r\n"
                    + "    MateriaPlan mp ON m.id_materia = mp.id_materia \r\n"
                    + "JOIN \r\n"
                    + "    añoPlan ap ON mp.id_añoPlan = ap.id \r\n"
                    + "JOIN \r\n"
                    + "    Periodo p ON mp.periodo = p.id \r\n"
                    + "WHERE \r\n"
                    + "    u.id_usuario = ? \r\n"
                    + "ORDER BY \r\n"
                    + "    ap.año, p.nombre;";

            conexion = cn.connect();
            ps = conexion.prepareStatement(consulta);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                MateriasEstudiante materia = new MateriasEstudiante();
                materia.setId_materia(rs.getInt("id_materia"));
                materia.setNombre_materia(rs.getString("materia"));
                materia.setAño_materia(String.valueOf(rs.getInt("año")));
                materia.setCuatrimestre_materia(rs.getString("cuatrimestre"));
                materia.setEstado_materia(rs.getString("estado_materia"));
                
                materiasPendientes.add(materia);
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

        return materiasPendientes;
    }

}



