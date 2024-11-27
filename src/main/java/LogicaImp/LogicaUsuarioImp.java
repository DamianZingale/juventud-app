package LogicaImp;

import java.util.ArrayList;

import Logica.LogicaUsuario;
import dao.EstudianteDao;
import daoImp.EstudianteDaoImp;
import models.Estudiante;

public class LogicaUsuarioImp implements LogicaUsuario {

	private EstudianteDao dao = new EstudianteDaoImp();
	
	public ArrayList<Estudiante> listarEstudiantes() {
		return (ArrayList<Estudiante>) dao.obtenerTodos();
	}
}
