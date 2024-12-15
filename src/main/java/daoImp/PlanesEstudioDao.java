package daoImp;

import daoImp.ConnectionManager;
import models.MateriasPorAño;
import models.PlanEstudio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlanesEstudioDao {

    private final ConnectionManager connectionManager;

    public PlanesEstudioDao(ConnectionManager connectionManager) {
        this.connectionManager = connectionManager;
    }
    public PlanesEstudioDao() {
		this.connectionManager = new ConnectionManager();
    	
    }
    private static final String SELECT_PLANES_ACTIVOS_QUERY = "SELECT id_plan, institucion, carrera, resolucion," +
            " cantidad_años FROM db_juventud.plan_estudio WHERE estado = 1";
    
    //LISTADO DE PLANES DE ESTUDIO ACTIVOS
    public List<PlanEstudio> obtenerPlanesDeEstudioACTIVOS() {
        List<PlanEstudio> planes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = connectionManager.connect();
            pst = conn.prepareStatement(SELECT_PLANES_ACTIVOS_QUERY);
            rs = pst.executeQuery();

            while (rs.next()) {
                PlanEstudio plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                plan.setResolucion(rs.getString("resolucion"));
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                planes.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return planes;
    }

    private static final String SELECT_PLANES_TODOS_QUERY = "SELECT id_plan, institucion, carrera, resolucion," +
            " cantidad_años FROM db_juventud.plan_estudio";
    
    //TODOS LOS PLANES DE ESTUDIO
    public List<PlanEstudio> obtenerPlanesDeEstudioTODOS() {
        List<PlanEstudio> planes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = connectionManager.connect();
            pst = conn.prepareStatement(SELECT_PLANES_TODOS_QUERY);
            rs = pst.executeQuery();

            while (rs.next()) {
                PlanEstudio plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                plan.setResolucion(rs.getString("resolucion"));
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                planes.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return planes;
    }

    private static final String SELECT_PLANES_INACTIVOS_QUERY = "SELECT id_plan, institucion, carrera, resolucion," +
            " cantidad_años FROM db_juventud.plan_estudio WHERE estado = 0";
    
    //PLANES DE ESTUDIO INACTIVOS
    public List<PlanEstudio> obtenerPlanesDeEstudioINACTIVOS() {
        List<PlanEstudio> planes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = connectionManager.connect();
            pst = conn.prepareStatement(SELECT_PLANES_INACTIVOS_QUERY);
            rs = pst.executeQuery();

            while (rs.next()) {
                PlanEstudio plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                plan.setResolucion(rs.getString("resolucion"));
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                planes.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return planes;
    }
    
    //AGREGAR PLAN DE ESTUDIO
    public int agregarPlan(PlanEstudio plan) {
        String sql = "INSERT INTO db_juventud.plan_estudio (institucion, carrera, resolucion, cantidad_años) VALUES (?, ?, ?, ?)";
        int filas = 0;
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = connectionManager.connect();
            pst = conn.prepareStatement(sql);

            pst.setString(1, plan.getInstitucion());
            pst.setString(2, plan.getCarrera());
            pst.setString(3, plan.getResolucion());
            pst.setInt(4, plan.getCantidadAnios());

            filas = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return filas;
    }

    public PlanEstudio obtenerPlanPorId(int idPlan) {
        PlanEstudio planEstudio = null;
        String sql = "SELECT id_plan, institucion, carrera, resolucion, cantidad_años FROM db_juventud2.plan_estudio WHERE id_plan = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            conn = connectionManager.connect();
            statement = conn.prepareStatement(sql);

            statement.setInt(1, idPlan);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                planEstudio = new PlanEstudio();
                planEstudio.setIdPlan(resultSet.getInt("id_plan"));
                planEstudio.setInstitucion(resultSet.getString("institucion"));
                planEstudio.setCarrera(resultSet.getString("carrera"));
                planEstudio.setResolucion(resultSet.getString("resolucion"));
                planEstudio.setCantidadAnios(resultSet.getInt("cantidad_años"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return planEstudio;
    }
    
    //UPDATE DE PLAN DE ESTUDIO
    public int actualizarPlan(PlanEstudio plan) {
        String sql = "UPDATE db_juventud.plan_estudio SET institucion = ?, carrera = ?, resolucion = ?, cantidad_años = ? WHERE id_plan = ?";
        int filas = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connectionManager.connect();
            stmt = conn.prepareStatement(sql);

            stmt.setString(1, plan.getInstitucion());
            stmt.setString(2, plan.getCarrera());
            stmt.setString(3, plan.getResolucion());
            stmt.setInt(4, plan.getCantidadAnios());
            stmt.setInt(5, plan.getIdPlan());

            filas = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return filas;
    }
    
    //ELIMINAR PLAN DE ESTUDIO
    public int eliminarPlan(int idPlan) {
        String sql = "UPDATE db_juventud.plan_estudio SET estado = false WHERE id_plan = ?";
        int filas = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connectionManager.connect();
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, idPlan);
            filas = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return filas;
    }
    
    //ALTA DE PLAN DE ESTUDIOS
    public int darAltaPlan(int idPlan) {
        String sql = "UPDATE db_juventud.plan_estudio SET estado = true WHERE id_plan = ?";
        int filas = 0;
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = connectionManager.connect();
            stmt = conn.prepareStatement(sql);

            stmt.setInt(1, idPlan);
            filas = stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return filas;
    }

    private static final String SELECT_DETALLE_QUERY = "SELECT añoPlan.id AS idAñoPlan, añoPlan.año AS año, MateriaPlan.nombre AS materia, Periodo.nombre AS periodo FROM añoPlan LEFT JOIN MateriaPlan ON añoPlan.id = MateriaPlan.id_añoPlan LEFT JOIN Periodo ON MateriaPlan.periodo = Periodo.id WHERE añoPlan.id_plan = ? ORDER BY añoPlan.año, MateriaPlan.nombre";
    
    //LISTADO DE MATERIAS POR PLAN DE ESTUDIO
    public List<MateriasPorAño> obtenerMateriasXPlan(int idPlan) {
        List<MateriasPorAño> materias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = connectionManager.connect();
            pst = conn.prepareStatement(SELECT_DETALLE_QUERY);

            pst.setInt(1, idPlan);
            rs = pst.executeQuery();

            while (rs.next()) {
                int cuatrimestre = rs.getInt("idAñoPlan");
                String materia = rs.getString("materia") != null ? rs.getString("materia") : "Sin materias";
                String periodo = rs.getString("periodo");

                MateriasPorAño materiaXcuatri = new MateriasPorAño(cuatrimestre, materia, periodo);
                materias.add(materiaXcuatri);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar conexion de la base de datos: " + e.getMessage());
                e.printStackTrace();
            }
        }
        return materias;
    }
}
