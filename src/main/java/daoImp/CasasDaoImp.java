package daoImp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.CasasDao;
import models.Casa;
import models.Ciudad;
import models.Estudiante;
import models.EstudianteListado;

public class CasasDaoImp implements CasasDao {

	ConnectionManager cn = null;
    PreparedStatement ps = null; 
    ResultSet rs = null;
    
    public CasasDaoImp() {
        cn = new ConnectionManager();
    }
    
    public List<Ciudad> ObtenerCiudades()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Ciudad> listC = new ArrayList<Ciudad>();
    	try
		 {
   		 conexion = cn.connect();
		 rs= cn.query("Select id_ciudad, nombre_ciudad from ciudad");
		 
		 while(rs.next())
		 {
			 Ciudad C = new Ciudad();
			 C.setId_ciudad(rs.getInt("id_ciudad"));
			 C.setNombre_ciudad(rs.getString("nombre_ciudad"));
			 
			 listC.add(C);
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
    	return listC;
    }
    
    public List<Casa> ObtenerCasasXCiudad(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Casa> listC = new ArrayList<Casa>();
    	try
		 {
   		 conexion = cn.connect();
		 rs= cn.query("Select id_casa, nombre_casa, domicilio_casa, estado, ciudad.id_ciudad, nombre_ciudad from casa INNER JOIN ciudad WHERE ciudad.id_ciudad = casa.id_ciudad AND casa.id_ciudad = " + id);
		 
		 while(rs.next())
		 {
			 Casa C = new Casa();
			 Ciudad Ci = new Ciudad();
			 Ci.setId_ciudad(rs.getInt("ciudad.id_ciudad"));
			 Ci.setNombre_ciudad(rs.getString("nombre_ciudad"));
			 C.setId_casa(rs.getInt("id_casa"));
			 C.setNombre_casa(rs.getString("nombre_casa"));
			 C.setDireccion(rs.getString("domicilio_casa"));
			 C.setEstado(rs.getBoolean("estado"));
			 C.setCiudad(Ci);
			 
			 listC.add(C);
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
    	return listC;
    }
    
    public List<EstudianteListado> obtenerTodosXcasa(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select usuario.Id_usuario, usuario.nombre, usuario.apellido, usuario.DNI, usuario.mail, usuario.telefono, usuario.estado, plan_estudio.carrera, plan_estudio.institucion from usuario\r\n" + 
			 		"inner join plan_estudio WHERE usuario.estado = 1 AND usuario.tipo_usuario = 'Estudiante' AND usuario.id_casa = " + id + " AND usuario.id_plan = plan_estudio.id_plan;");
			 while(rs.next())
			 {
				 EstudianteListado e = new EstudianteListado();
				 e.setId_usuario(rs.getInt("usuario.Id_usuario"));
				 e.setNombre(rs.getString("usuario.nombre"));
				 e.setApellido(rs.getString("usuario.apellido"));
				 e.setDNI(rs.getString("usuario.DNI"));
				 e.setCorreo(rs.getString("usuario.mail"));
				 e.setTelefono(rs.getString("usuario.telefono"));
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
    
    public boolean existeCiudad(String name) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "SELECT COUNT(*) FROM ciudad WHERE nombre_ciudad = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, name);
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
    
    public void ejecutarSPAgregarCiudad(String name) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AgregarCiudad(?)");
            cst.setString(1, name);
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
    
    public Ciudad obtenerCiudad(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	Ciudad c = new Ciudad();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("SELECT Id_ciudad, Nombre_Ciudad FROM Ciudad WHERE Id_Ciudad = " + id);
			 while(rs.next())
			 {
				 c.setId_ciudad(rs.getInt("Id_ciudad"));
				 c.setNombre_ciudad(rs.getString("Nombre_Ciudad"));
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
		 return c;
    }
    
    public boolean existeCasa(Casa C) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "SELECT COUNT(*) FROM casa WHERE nombre_casa = ? AND domicilio_casa = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, C.getNombre_casa());
            ps.setString(2, C.getDireccion());
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
    
    public void ejecutarSPAgregarCasa(Casa C) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AgregarCasa(?,?,?,?)");
            cst.setString(1, C.getNombre_casa());
            cst.setString(2, C.getDireccion());
            cst.setInt(3, C.getCiudad().getId_ciudad());
            cst.setInt(4, C.getCapacidad());
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
    
    public List<Casa> ObtenerCasas()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Casa> listC = new ArrayList<Casa>();
    	try
		 {
   		 conexion = cn.connect();
		 rs= cn.query("Select casa.id_casa, nombre_casa, domicilio_casa, ciudad.id_ciudad, nombre_ciudad, casa.capacidad - (Select Count(*) from usuario where usuario.id_casa = casa.id_casa) AS Disponibilidad from casa \r\n" + 
		 		"INNER JOIN ciudad WHERE casa.estado = 1 AND ciudad.id_ciudad = casa.id_ciudad;");
		 
		 while(rs.next())
		 {
			 Casa C = new Casa();
			 Ciudad Ci = new Ciudad();
			 Ci.setId_ciudad(rs.getInt("ciudad.id_ciudad"));
			 Ci.setNombre_ciudad(rs.getString("nombre_ciudad"));
			 C.setId_casa(rs.getInt("id_casa"));
			 C.setNombre_casa(rs.getString("nombre_casa"));
			 C.setDireccion(rs.getString("domicilio_casa"));
			 C.setCiudad(Ci);
			 C.setCapacidad(rs.getInt("Disponibilidad"));
			 
			 listC.add(C);
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
    	return listC;
    }
    
    public Casa obtenerEstado(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	Casa c = new Casa();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("SELECT estado FROM Casa WHERE Id_Casa = " + id);
			 while(rs.next())
			 {
				 c.setEstado(rs.getBoolean("estado"));
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
		 return c;
    }
    
    public void ejecutarSPBajaCasa(String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL BajaCasa(?)");
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
    
    public void ejecutarSPAltaCasa(String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AltaCasa(?)");
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
