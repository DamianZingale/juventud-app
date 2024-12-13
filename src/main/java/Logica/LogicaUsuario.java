package Logica;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.PlanEstudio;

public interface LogicaUsuario {

	public ArrayList<EstudianteListado> listarEstudiantes();
	
	public ArrayList<EstudianteListado> listarEstudiantesInactivos();
	
	public Estudiante ObtenerEstudiante(String id);
	
	public void BajaEstudiante(String id);
	
	public void AltaEstudiante(String id);
}
