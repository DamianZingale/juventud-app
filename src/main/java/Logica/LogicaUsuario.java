package Logica;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Plan_Estudios;

public interface LogicaUsuario {

	public ArrayList<EstudianteListado> listarEstudiantes();
	
	public Estudiante ObtenerEstudiante(String id);
	
	public void BajaEstudiante(String id);
}
