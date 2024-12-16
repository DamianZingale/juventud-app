package dao;

import java.sql.SQLException;
import java.util.List;

import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Historia_Clinica;
import models.Referente;

public interface EstudianteDao {
    
    public void ejecutarSPAltaEstudiante(Estudiante estudiante) throws SQLException;

    public boolean existeDni(String dni) throws SQLException;
    
    public List<EstudianteListado> obtenerTodos();
    
    public List<EstudianteListado> obtenerInactivos();
    
    public EstudianteListado ObtenerEstudiante(String id);
    
    public Historia_Clinica ObtenerHistoriaClinica(String id);
    
    public List<Referente> obtenerReferentes(String id);
    
    public void ejecutarSPBajaEstudiante(String id) throws SQLException;
    
    public void ejecutarSPAltaEstudiante(String id) throws SQLException;
    
    public boolean existeHistoriaClinica(String id) throws SQLException;
    
    public void ejecutarSPAgregarHistoriaClinica(Historia_Clinica c, String id) throws SQLException;
    
    public void ejecutarSPActualizarHistoriaClinica(Historia_Clinica c, String id) throws SQLException;
    
    public void ejecutarSPAgregarReferente(Referente r, String id) throws SQLException;
    
    public void ejecutarSPEliminarReferente(String IdU, String IdR) throws SQLException;
    
}
