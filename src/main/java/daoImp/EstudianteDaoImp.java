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
import models.Plan_Estudios;

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
    
    public List<Estudiante> obtenerTodos()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Estudiante> listE = new ArrayList<Estudiante>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select Id_usuario, nombre, apellido, DNI from estudiante WHERE estudiante.estado = 1 AND estudiante.tipo_usuario = 'Estudiante';");
			 while(rs.next())
			 {
				 Plan_Estudios p = new Plan_Estudios();
				 Casa c = new Casa();
				 Estudiante e = new Estudiante();
				 e.setId_usuario(rs.getInt("Id_usuario"));
				 e.setNombre(rs.getString("nombre"));
				 e.setApellido(rs.getString("apellido"));
				 e.setDNI(rs.getString("DNI"));
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
    
    public List<Casa> obtenerCasas()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Casa> listC = new ArrayList<Casa>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select casa.ciudad from estudiante inner join casa  WHERE estudiante.estado = 1 AND estudiante.tipo_usuario = 'Estudiante' AND estudiante.id_casa = casa.id_casa;");
			 while(rs.next())
			 {
				 Casa c = new Casa();
				 c.setCiudad(rs.getString("casa.ciudad"));
				 listC.add(c);
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
    
    public List<Plan_Estudios> obtenerPlan_Estudios()
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Plan_Estudios> listP = new ArrayList<Plan_Estudios>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select plan_estudio.carrera, plan_estudio.institucion from estudiante inner join plan_estudio WHERE estudiante.estado = 1 AND estudiante.tipo_usuario = 'Estudiante' AND estudiante.id_plan = plan_estudio.id_plan;");
			 while(rs.next())
			 {
				 Plan_Estudios p = new Plan_Estudios();
				 p.setCarrera(rs.getString("plan_estudio.carrera"));
				 p.setInstitucion(rs.getString("plan_estudio.institucion"));
				 listP.add(p);
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
		 return listP;
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

}
