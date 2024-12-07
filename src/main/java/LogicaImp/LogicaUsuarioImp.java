package LogicaImp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Logica.LogicaUsuario;
import dao.EstudianteDao;
import daoImp.EstudianteDaoImp;
import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Plan_Estudios;

public class LogicaUsuarioImp implements LogicaUsuario {

	private EstudianteDao dao = new EstudianteDaoImp();
	
	public ArrayList<EstudianteListado> listarEstudiantes() {
		return (ArrayList<EstudianteListado>) dao.obtenerTodos();
	}
	
	public ArrayList<EstudianteListado> listarEstudiantesInactivos() {
		return (ArrayList<EstudianteListado>) dao.obtenerInactivos();
	}
	
	public Estudiante ObtenerEstudiante(String id)
	{
		return dao.ObtenerEstudiante(id);
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
	
	public boolean ComprobarInicio(String usuario, String contrasenia) {
		
		boolean inicio = false;
		
		return inicio;
		
	}
}
