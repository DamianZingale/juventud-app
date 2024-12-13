package daoImp;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.EstudianteDao;
import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.PlanEstudio;

public class EstudianteDaoImp implements EstudianteDao {

    ConnectionManager cn = null;
    PreparedStatement ps = null; 
    ResultSet rs = null;
    
    public EstudianteDaoImp() {
        cn = new ConnectionManager();
    }
    
    public void ejecutarSPAltaEstudiante(Estudiante estudiante) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AltaEstudiante(?, ?, ?, ?, ?, ?, ?)");

            if (existeDni(estudiante.getDNI())) {
                throw new IllegalArgumentException("El DNI ya existe");
            }

            cst.setString(1, estudiante.getNombre());
            cst.setString(2, estudiante.getApellido());
            cst.setString(3, estudiante.getDNI());
            cst.setString(4, estudiante.getEmail());
            cst.setString(5, estudiante.getUserName());
            cst.setString(6, estudiante.getPassword()); 
            cst.setInt(7, estudiante.getCasa().getId_casa());

            cst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        } finally {
            try {
                if (cst != null) {
                    cst.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean existeDni(String dni) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "SELECT COUNT(*) FROM estudiantes WHERE dni = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, dni);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; 
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
        return false; 
    }
    
    public List<EstudianteListado> obtenerTodos()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select usuario.Id_usuario, usuario.nombre, usuario.apellido, usuario.DNI, usuario.mail, usuario.telefono, usuario.estado, plan_estudio.carrera, plan_estudio.institucion, ciudad.nombre_ciudad from usuario\r\n" + 
			 		"inner join plan_estudio \r\n" + 
			 		"inner join casa  \r\n" + 
			 		"inner join ciudad WHERE usuario.estado = 1 AND usuario.tipo_usuario = 'Estudiante' AND usuario.id_casa = casa.id_casa AND casa.id_ciudad = ciudad.id_ciudad AND usuario.id_plan = plan_estudio.id_plan;");
			 while(rs.next())
			 {
				 EstudianteListado e = new EstudianteListado();
				 e.setId_usuario(rs.getInt("usuario.Id_usuario"));
				 e.setNombre(rs.getString("usuario.nombre"));
				 e.setApellido(rs.getString("usuario.apellido"));
				 e.setDNI(rs.getString("usuario.DNI"));
				 e.setCorreo(rs.getString("usuario.mail"));
				 e.setTelefono(rs.getString("usuario.telefono"));
				 e.setCiudad(rs.getString("ciudad.nombre_ciudad"));
				 e.setCarrera(rs.getString("plan_estudio.carrera"));
				 e.setInstitución(rs.getString("plan_estudio.institucion"));
				 e.setEstado(rs.getBoolean("usuario.estado"));
				 listE.add(e);
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.closeConnection();;
		 }
		 return listE;
    }
    
    public List<EstudianteListado> obtenerInactivos()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select usuario.Id_usuario, usuario.nombre, usuario.apellido, usuario.DNI, usuario.mail, usuario.telefono, usuario.estado, plan_estudio.carrera, plan_estudio.institucion, ciudad.nombre_ciudad from usuario\r\n" + 
			 		"inner join plan_estudio \r\n" + 
			 		"inner join casa  \r\n" + 
			 		"inner join ciudad WHERE usuario.estado = 0 AND usuario.tipo_usuario = 'Estudiante' AND usuario.id_casa = casa.id_casa AND casa.id_ciudad = ciudad.id_ciudad AND usuario.id_plan = plan_estudio.id_plan;");
			 while(rs.next())
			 {
				 EstudianteListado e = new EstudianteListado();
				 e.setId_usuario(rs.getInt("usuario.Id_usuario"));
				 e.setNombre(rs.getString("usuario.nombre"));
				 e.setApellido(rs.getString("usuario.apellido"));
				 e.setDNI(rs.getString("usuario.DNI"));
				 e.setCorreo(rs.getString("usuario.mail"));
				 e.setTelefono(rs.getString("usuario.telefono"));
				 e.setCiudad(rs.getString("ciudad.nombre_ciudad"));
				 e.setCarrera(rs.getString("plan_estudio.carrera"));
				 e.setInstitución(rs.getString("plan_estudio.institucion"));
				 e.setEstado(rs.getBoolean("usuario.estado"));
				 listE.add(e);
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.closeConnection();;
		 }
		 return listE;
    }
    
    
    public Estudiante ObtenerEstudiante(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	Estudiante E = new Estudiante();
    	try
		 {
   		 conexion = cn.connect();
		 rs= cn.query("Select Id_usuario, nombre, apellido, DNI from estudiante WHERE estado = 1 AND tipo_usuario = 'Estudiante' AND Id_usuario =" + id);
		 
		 E.setId_usuario(rs.getInt("id_usuario"));
		 E.setNombre(rs.getString("nombre"));
		 E.setApellido(rs.getString("apellido"));
		 E.setDNI(rs.getString("DNI"));
		 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.closeConnection();;
		 }
    	return E;
    }
    
    public void ejecutarSPBajaEstudiante(String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL BajaEstudiante(?)");
            cst.setString(1, id);
            cst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        } finally {
            try {
                if (cst != null) {
                    cst.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void ejecutarSPAltaEstudiante(String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AltaEstudiante(?)");
            cst.setString(1, id);
            cst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        } finally {
            try {
                if (cst != null) {
                    cst.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
}
