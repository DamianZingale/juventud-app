package Logica;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Casa;
import models.Estudiante;
import models.Plan_Estudios;

public interface LogicaUsuario {

	public ArrayList<Estudiante> listarEstudiantes();
	
	public ArrayList<Casa> obtenerCasasEstudiantes();
	
	public ArrayList<Plan_Estudios> obtenerPlan_EstudiosEstudiantes();
	
	public Estudiante ObtenerEstudiante(String id);
	
	public void BajaEstudiante(String id);
}
