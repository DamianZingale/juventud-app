package daoImp;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.io.IOException;  

import models.Estudiante;

public class EstudianteDao {
    
    ConnectionManager cn = null;
    PreparedStatement ps = null; 
    ResultSet rs = null;
    
    public EstudianteDao() {
        try {
            cn = new ConnectionManager();
        } catch (IOException e) {
            e.printStackTrace();  
        }
    }
    
    public void ejecutarSPAltaEstudiante(Estudiante estudiante) throws SQLException { 
        CallableStatement cst = null;
        Connection conexion = null; 

        try {
            conexion = cn.connect(); 

            cst = conexion.prepareCall("CALL AltaEstudiante(?, ?, ?, ?, ?, ?, ?)");

            if (existeDni(estudiante.getDNI())) {
                throw new IllegalArgumentException("El DNI ya existe");
            }

            cst.setString(1, estudiante.getNombre());
            cst.setString(2, estudiante.getApellido());
            cst.setString(3, estudiante.getDNI());
            cst.setString(4, estudiante.getEmail());
            cst.setString(5, estudiante.getUserName());
            cst.setString(6, estudiante.getPassword()); 
            cst.setInt(7, estudiante.getCasa().getId_casa());

            cst.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        } finally {
            try {
                if (cst != null) {
                    cst.close();
                }
                if (conexion != null) {
                    conexion.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean existeDni(String dni) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conexion = null;

        try {
            conexion = cn.connect(); 

            String sql = "SELECT COUNT(*) FROM estudiantes WHERE dni = ?";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, dni);
            rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; 
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false; 
    }
}
