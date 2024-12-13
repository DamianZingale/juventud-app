package Logica;

import java.sql.SQLException;
import java.util.List;

import models.Casa;
import models.Ciudad;
import models.EstudianteListado;

public interface LogicaCasas {

	public List<Ciudad> ObtenerCiudades();
	
	public List<Casa> ObtenerCasasXCiudad(String id);
	
	public List<EstudianteListado> obtenerTodosXcasa(String id);
	
	public boolean existeCiudad(String name) throws SQLException;
	
	public void ejecutarSPAgregarCiudad(String name) throws SQLException;
	
	public Ciudad obtenerCiudad(String id);
	
	public boolean existeCasa(Casa C) throws SQLException;
	
	public void ejecutarSPAgregarCasa(Casa C) throws SQLException;
	
	public List<Casa> ObtenerCasas();
	
	public Casa obtenerEstado(String id);
	
	public void ejecutarSPBajaCasa(String id) throws SQLException;
	
	public void ejecutarSPAltaCasa(String id) throws SQLException;
}
