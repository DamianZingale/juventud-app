package Logica;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Historia_Clinica;
import models.PlanEstudio;
import models.Referente;

public interface LogicaUsuario {

	public ArrayList<EstudianteListado> listarEstudiantes();
	
	public ArrayList<EstudianteListado> listarEstudiantesInactivos();
	
	public EstudianteListado ObtenerEstudiante(String id);
	
	public Historia_Clinica ObtenerHistoriaClinica(String id);
	
	public List<Referente> obtenerReferentes(String id);
	
	public void BajaEstudiante(String id);
	
	public void AltaEstudiante(String id);
	
	public boolean existeHistoriaClinica(String id) throws SQLException;
	
	public void ejecutarSPAgregarHistoriaClinica(Historia_Clinica c, String id);
	
	public void ejecutarSPActualizarHistoriaClinica(Historia_Clinica c, String id);
	
	public void ejecutarSPAgregarReferente(Referente r, String id);
	
	public void ejecutarSPEliminarReferente(String IdU, String IdR);
	
	public ArrayList<PlanEstudio> ObtenerPlanesEstudio();
}
