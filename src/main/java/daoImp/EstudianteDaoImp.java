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
import models.Historia_Clinica;
import models.Referente;

public class EstudianteDaoImp implements EstudianteDao {

    ConnectionManager cn = null;
    PreparedStatement ps = null; 
    ResultSet rs = null;
    
    public EstudianteDaoImp() {
        cn = new ConnectionManager();
    }
    //ALTA DE ESTUDIANTE
    
    public void ejecutarSPAltaEstudiante(Estudiante estudiante) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AltaEstudiante(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            if (existeDni(estudiante.getDNI())) {
                throw new IllegalArgumentException("El DNI ya existe");
            }

            cst.setString(1, estudiante.getDNI());
            cst.setString(2, estudiante.getNombre());
            cst.setString(3, estudiante.getApellido());
            cst.setString(4, estudiante.getEmail());
            cst.setString(5, estudiante.getUserName());
            cst.setString(6, estudiante.getPassword()); 
            cst.setInt(7, estudiante.getCasa().getId_casa());
            cst.setString(8, estudiante.getFecha_nac());
            cst.setString(9, estudiante.getDomicilio());
            cst.setString(10, estudiante.getTelefono());
            cst.setInt(11, estudiante.getPlan_estudio().getIdPlan());

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
    //COMPROBACION EXISTE DNI
    public boolean existeDni(String dni) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "SELECT COUNT(*) FROM usuario WHERE dni = ?";
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
    //LISTADO DE ESTUDIANTES
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
    //LISTADO ESTUDIANTES INACTIVOS
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
    
    //OBTENER ESTUDIANTE
    
    public EstudianteListado ObtenerEstudiante(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	EstudianteListado e = new EstudianteListado();
    	try
		 {
   		 conexion = cn.connect();
		 rs= cn.query("Select usuario.nombre, usuario.apellido, usuario.DNI, usuario.fecha_nacimiento, usuario.domicilio, usuario.mail, usuario.telefono, plan_estudio.carrera, plan_estudio.institucion, ciudad.nombre_ciudad, casa.nombre_casa from usuario\r\n" + 
		 		"inner join plan_estudio \r\n" + 
		 		"inner join casa  \r\n" + 
		 		"inner join ciudad WHERE usuario.tipo_usuario = 'Estudiante' AND usuario.id_casa = casa.id_casa AND casa.id_ciudad = ciudad.id_ciudad AND usuario.id_plan = plan_estudio.id_plan AND usuario.id_usuario = " + id);
		 
		 while(rs.next())
		 {
			 e.setNombre(rs.getString("usuario.nombre"));
			 e.setApellido(rs.getString("usuario.apellido"));
			 e.setDNI(rs.getString("usuario.DNI"));
			 e.setCorreo(rs.getString("usuario.mail"));
			 e.setTelefono(rs.getString("usuario.telefono"));
			 e.setCiudad(rs.getString("ciudad.nombre_ciudad"));
			 e.setCarrera(rs.getString("plan_estudio.carrera"));
			 e.setInstitución(rs.getString("plan_estudio.institucion"));
			 e.setFechaNacimiento(rs.getString("usuario.fecha_nacimiento"));
			 e.setDomicilio(rs.getString("usuario.domicilio"));
			 e.setCasa(rs.getString("casa.nombre_casa"));
		 }
		 
		 }
		 catch(Exception e1)
		 {
			 e1.printStackTrace();
		 }
		 finally
		 {
			 cn.closeConnection();;
		 }
    	return e;
    }
    
    public Historia_Clinica ObtenerHistoriaClinica(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	Historia_Clinica c = new Historia_Clinica();
    	try
		 {
   		 conexion = cn.connect();
		 rs= cn.query("Select historia_clinica.enfermedades_preexistentes, historia_clinica.medicacion, historia_clinica.operaciones, historia_clinica.alergias from historia_clinica\r\n" + 
		 		"inner join usuario WHERE usuario.id_historia_clinica = historia_clinica.id_historia_clinica AND usuario.id_usuario = " + id);
		 
		 while(rs.next())
		 {
			 c.setEnfermedades_preexistentes(rs.getString("historia_clinica.enfermedades_preexistentes"));
			 c.setMedicaciones(rs.getString("historia_clinica.medicacion"));
			 c.setOperaciones(rs.getString("historia_clinica.operaciones"));
			 c.setAlergias(rs.getString("historia_clinica.alergias"));
		 }
		 
		 }
		 catch(Exception e1)
		 {
			 e1.printStackTrace();
		 }
		 finally
		 {
			 cn.closeConnection();;
		 }
    	return c;
    }
    
    public List<Referente> obtenerReferentes(String id)
    {
    	ResultSet rs = null;
    	Connection conexion = null;
    	List<Referente> listR = new ArrayList<Referente>();
    	try
		 {
    		 conexion = cn.connect();
			 rs= cn.query("Select referente.id_referente, referente.nombre_referente, referente.apellido_referente, referente.DNI_referente, referente.domicilio_referente, referente.telefono_referente, referente.rol_referente from referente\r\n" + 
			 		"inner join estudiante_referente\r\n" + 
			 		"inner join usuario WHERE usuario.id_usuario = estudiante_referente.id_estudiante AND estudiante_referente.id_referente = referente.id_referente AND usuario.id_usuario = " + id);
			 while(rs.next())
			 {
				 Referente r = new Referente();
				 r.setId_referente(rs.getInt("referente.id_referente"));
				 r.setNombre(rs.getString("referente.nombre_referente"));
				 r.setApellido(rs.getString("referente.apellido_referente"));
				 r.setDNI(rs.getString("referente.DNI_referente"));
				 r.setDomicilio(rs.getString("referente.domicilio_referente"));
				 r.setTelefono(rs.getString("referente.telefono_referente"));
				 r.setRol(rs.getString("referente.rol_referente"));
				 listR.add(r);
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
		 return listR;
    }
    //BAJA DE ESTUDIANTE
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
    //ALTA DE ESTUDIANTE
    public void ejecutarSPAltaEstudiante(String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL DarAltaEstudiante(?)");
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
    
    public boolean existeHistoriaClinica(String id) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "Select COUNT(*) from historia_clinica\r\n" + 
            		"inner join usuario WHERE usuario.id_historia_clinica = historia_clinica.id_historia_clinica AND usuario.id_usuario = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, id);
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
    
    public void ejecutarSPAgregarHistoriaClinica(Historia_Clinica c, String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AgregarHistoriaClinica(?, ?, ?, ?, ?)");
            cst.setString(1, id);
            cst.setString(2, c.getEnfermedades_preexistentes());
            cst.setString(3, c.getMedicaciones());
            cst.setString(4, c.getOperaciones());
            cst.setString(5, c.getAlergias());
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
    
    public void ejecutarSPActualizarHistoriaClinica(Historia_Clinica c, String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL ActualizarHistoriaClinica(?, ?, ?, ?, ?)");
            cst.setString(1, id);
            cst.setString(2, c.getEnfermedades_preexistentes());
            cst.setString(3, c.getMedicaciones());
            cst.setString(4, c.getOperaciones());
            cst.setString(5, c.getAlergias());
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
    
    public void ejecutarSPAgregarReferente(Referente r, String id) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AgregarReferente(?, ?, ?, ?, ?, ?, ?)");
            cst.setString(1, id);
            cst.setString(2, r.getNombre());
            cst.setString(3, r.getApellido());
            cst.setString(4, r.getDNI());
            cst.setString(5, r.getDomicilio());
            cst.setString(6, r.getTelefono());
            cst.setString(7, r.getRol());
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
    
    public void ejecutarSPEliminarReferente(String IdU, String IdR) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL EliminarReferente(?, ?)");
            cst.setString(1, IdU);
            cst.setString(2, IdR);
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
