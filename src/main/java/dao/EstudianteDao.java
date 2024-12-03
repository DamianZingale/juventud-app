package dao;

import java.sql.SQLException;
import java.util.List;

import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Plan_Estudios;

public interface EstudianteDao {
    
    public void ejecutarSPAltaEstudiante(Estudiante estudiante) throws SQLException;

    public boolean existeDni(String dni) throws SQLException;
    
    public List<EstudianteListado> obtenerTodos();
    
    public Estudiante ObtenerEstudiante(String id);
    
    public void ejecutarSPBajaEstudiante(String id) throws SQLException;
}
