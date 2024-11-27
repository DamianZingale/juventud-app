package dao;

import java.sql.SQLException;
import java.util.List;

import models.Estudiante;

public interface EstudianteDao {
    
    public void ejecutarSPAltaEstudiante(Estudiante estudiante) throws SQLException;

    public boolean existeDni(String dni) throws SQLException;
    
    public List<Estudiante> obtenerTodos();
}
