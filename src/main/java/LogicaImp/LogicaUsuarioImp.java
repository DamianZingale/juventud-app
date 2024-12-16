package LogicaImp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import Logica.LogicaUsuario;
import dao.EstudianteDao;
import daoImp.DaoUsuario;
import daoImp.EstudianteDaoImp;
import daoImp.PlanesEstudioDao;
import models.Administrador;
import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Historia_Clinica;
import models.PlanEstudio;
import models.Referente;

public class LogicaUsuarioImp implements LogicaUsuario {

	private EstudianteDao dao = new EstudianteDaoImp();
	private PlanesEstudioDao daoP = new PlanesEstudioDao();
	private DaoUsuario U = new DaoUsuario();
	
	public ArrayList<EstudianteListado> listarEstudiantes() {
		return (ArrayList<EstudianteListado>) dao.obtenerTodos();
	}
	
	public ArrayList<EstudianteListado> listarEstudiantesInactivos() {
		return (ArrayList<EstudianteListado>) dao.obtenerInactivos();
	}
	
	public EstudianteListado ObtenerEstudiante(String id)
	{
		return dao.ObtenerEstudiante(id);
	}
	
	public Historia_Clinica ObtenerHistoriaClinica(String id)
	{
		return dao.ObtenerHistoriaClinica(id);
	}
	
	public List<Referente> obtenerReferentes(String id)
	{
		return (ArrayList<Referente>) dao.obtenerReferentes(id);
	}
	
	public void BajaEstudiante(String id)
	{
		try {
			dao.ejecutarSPBajaEstudiante(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void AltaEstudiante(String id)
	{
		try {
			dao.ejecutarSPAltaEstudiante(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//COMPROBACION DE INICIO
	public Object ComprobarInicio(String usuario, String contrasenia) {
	    System.err.println("Inicio de función: ComprobarInicio");
	    try {
	        // Recuperar usuario desde la base de datos como Object
	        Object USER = U.InicioUsuario(usuario);
	        
	        if (USER != null) {
	            if (USER instanceof Administrador) {//ver si es Administrador 
	                Administrador admin = (Administrador) USER;
	                if (admin.getPassword().equalsIgnoreCase(contrasenia)) {
	                    return admin; // Devolver el objeto Administrador
	                }
	            } else if (USER instanceof Estudiante) {//ver si es estudiante
	                Estudiante estudiante = (Estudiante) USER;
	                if (estudiante.getPassword().equals(contrasenia)) {
	                    return estudiante; // Devolver el objeto Estudiante
	                }
	            }
	        }
	    } catch (Exception e) {
	        System.err.println("Error al comprobar el inicio de sesión: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return null; // Devuelve null si no se autentica
	}
	
	//RECUPERO DE CONTRASEÑA SEGUN MAIL
	public String RecuperoConMail (String mail) {
		try {
			
			String password = U.Password(mail);
			return password;
		}catch (Exception e) {
			 System.err.println("Error al comprobar el usuario: " + e.getMessage());
		        e.printStackTrace();
		}
		return null;
	}
	
	public boolean existeHistoriaClinica(String id) throws SQLException
	{
		return dao.existeHistoriaClinica(id);
	}
	
	public void ejecutarSPAgregarHistoriaClinica(Historia_Clinica c, String id)
	{
		try {
			dao.ejecutarSPAgregarHistoriaClinica(c, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ejecutarSPActualizarHistoriaClinica(Historia_Clinica c, String id)
	{
		try {
			dao.ejecutarSPActualizarHistoriaClinica(c, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ejecutarSPAgregarReferente(Referente r, String id)
	{
		try {
			dao.ejecutarSPAgregarReferente(r, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ejecutarSPEliminarReferente(String IdU, String IdR)
	{
		try {
			dao.ejecutarSPEliminarReferente(IdU, IdR);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<PlanEstudio> ObtenerPlanesEstudio()
	{
		return (ArrayList<PlanEstudio>) daoP.obtenerPlanesDeEstudioACTIVOS();
	}
}
