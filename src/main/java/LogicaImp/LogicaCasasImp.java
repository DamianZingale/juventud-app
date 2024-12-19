package LogicaImp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Logica.LogicaCasas;
import dao.CasasDao;
import daoImp.CasasDaoImp;
import models.Casa;
import models.Ciudad;
import models.EstudianteListado;

public class LogicaCasasImp implements LogicaCasas {
	
	CasasDao dao = new CasasDaoImp();

	public List<Ciudad> ObtenerCiudades()
	{
		return (ArrayList<Ciudad>) dao.ObtenerCiudades();
	}
	
	public List<Casa> ObtenerCasasXCiudad(String id)
	{
		return (ArrayList<Casa>) dao.ObtenerCasasXCiudad(id);
	}
	
	public List<EstudianteListado> obtenerTodosXcasa(String id)
	{
		return (ArrayList<EstudianteListado>) dao.obtenerTodosXcasa(id);
	}
	
	public boolean existeCiudad(String name) throws SQLException
	{
		return dao.existeCiudad(name);
	}
	
	public void ejecutarSPAgregarCiudad(String name) throws SQLException
	{
		dao.ejecutarSPAgregarCiudad(name);
	}
	
	public Ciudad obtenerCiudad(String id)
	{
		return dao.obtenerCiudad(id);
	}
	
	public boolean existeCasa(Casa C) throws SQLException
	{
		return dao.existeCasa(C);
	}
	
	public void ejecutarSPAgregarCasa(Casa C) throws SQLException
	{
		dao.ejecutarSPAgregarCasa(C);
	}
	
	public List<Casa> ObtenerCasas()
	{
		return (ArrayList<Casa>)dao.ObtenerCasas();
	}
	
	public Casa obtenerEstado(String id)
	{
		return dao.obtenerEstado(id);
	}
	
	public void ejecutarSPBajaCasa(String id) throws SQLException
	{
		dao.ejecutarSPBajaCasa(id);
	}
	
	public void ejecutarSPAltaCasa(String id) throws SQLException
	{
		dao.ejecutarSPAltaCasa(id);
	}
	
	public ArrayList<Casa> ObtenerCasasDisponibles()
	{
		return (ArrayList<Casa>) dao.ObtenerCasasDisponibles();
	}
}
