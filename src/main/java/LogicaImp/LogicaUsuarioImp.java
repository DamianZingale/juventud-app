package LogicaImp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Logica.LogicaUsuario;
import dao.EstudianteDao;
import daoImp.EstudianteDaoImp;
import models.Casa;
import models.Estudiante;
import models.Plan_Estudios;

public class LogicaUsuarioImp implements LogicaUsuario {

	private EstudianteDao dao = new EstudianteDaoImp();
	
	public ArrayList<Estudiante> listarEstudiantes() {
		return (ArrayList<Estudiante>) dao.obtenerTodos();
	}
	
	public ArrayList<Casa> obtenerCasasEstudiantes()
	{
		return (ArrayList<Casa>) dao.obtenerCasas();
	}
	
	public ArrayList<Plan_Estudios> obtenerPlan_EstudiosEstudiantes()
	{
		return (ArrayList<Plan_Estudios>) dao.obtenerPlan_Estudios();
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
}
