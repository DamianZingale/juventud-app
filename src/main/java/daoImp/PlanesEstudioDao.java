package daoImp;

import models.MateriasPorAño;
import models.Periodo;
import models.PlanEstudio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlanesEstudioDao {

    private static final String SELECT_PLANES_ACTIVOS_QUERY = "SELECT id_plan, institucion, carrera, resolucion, cantidad_años FROM db_juventud.plan_estudio WHERE estado = 1";

    public List<PlanEstudio> obtenerPlanesDeEstudioACTIVOS() {
        List<PlanEstudio> planes = new ArrayList<>();
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement pst = conn.prepareStatement(SELECT_PLANES_ACTIVOS_QUERY);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                PlanEstudio plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_Plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                String resolucion = rs.getString("resolucion");
                plan.setResolucion(resolucion);
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                planes.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cm.closeConnection();
        }
        System.out.println("Retorna la lista de ACTIVOS del DAO " + planes);
        return planes;
    }

    private static final String SELECT_PLANES_TODOS_QUERY = "SELECT id_plan, institucion, carrera, resolucion, cantidad_años FROM db_juventud.plan_estudio";

    public List<PlanEstudio> obtenerPlanesDeEstudioTODOS() {
        List<PlanEstudio> planes = new ArrayList<>();
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement pst = conn.prepareStatement(SELECT_PLANES_TODOS_QUERY);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                PlanEstudio plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_Plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                plan.setResolucion(rs.getString("resolucion"));
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                planes.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cm.closeConnection();
        }
        System.out.println("Retorna TODA la lista del DAO " + planes);
        return planes;
    }

    private static final String SELECT_PLANES_INACTIVOS_QUERY = "SELECT id_plan, institucion, carrera, resolucion, cantidad_años FROM db_juventud.plan_estudio WHERE estado = 0";

    public List<PlanEstudio> obtenerPlanesDeEstudioINACTIVOS() {
        List<PlanEstudio> planes = new ArrayList<>();
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement pst = conn.prepareStatement(SELECT_PLANES_INACTIVOS_QUERY);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                PlanEstudio plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_Plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                plan.setResolucion(rs.getString("resolucion"));
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                planes.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cm.closeConnection();
        }
        System.out.println("Retorna TODA la lista del DAO " + planes);
        return planes;
    }

    public int agregarPlan(PlanEstudio plan) {
        String sql = "INSERT INTO db_juventud.plan_estudio (institucion, carrera, resolucion, cantidad_años) VALUES (?, ?, ?, ?)";
        int filas = 0;
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, plan.getInstitucion());
            pst.setString(2, plan.getCarrera());
            pst.setString(3, plan.getResolucion());
            pst.setInt(4, plan.getCantidadAnios());

            filas = pst.executeUpdate();
            System.out.println("Se insertaron " + filas + " filas en la base de datos.");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cm.closeConnection();
        }

        return filas;
    }

    public int agregarMateria(MateriasPorAño materia) {
        String sql = "INSERT INTO materiaplan (nombre, periodo, id_añoPlan) VALUES (?, ?, ?)";
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, materia.getMateria());
            stmt.setInt(2, materia.getIDPeriodo());
            stmt.setInt(3, materia.getIdAñoPlan());
            return stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cm.closeConnection();
        }
        return 0;
    }

    public boolean eliminarMateria(int idMateria) throws SQLException {
        String sql = "DELETE FROM materiaplan WHERE id = ?";
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idMateria);
            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;
        } finally {
            cm.closeConnection();
        }
    }

    public static PlanEstudio obtenerPlanPorId(int idPlan) throws SQLException {
        PlanEstudio planEstudio = null;
        String sql = "SELECT id_Plan, institucion, carrera, resolucion, cantidad_años FROM db_juventud.plan_estudio WHERE id_Plan = ?";
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, idPlan);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    planEstudio = new PlanEstudio();
                    planEstudio.setIdPlan(resultSet.getInt("id_Plan"));
                    planEstudio.setInstitucion(resultSet.getString("institucion"));
                    planEstudio.setCarrera(resultSet.getString("carrera"));
                    planEstudio.setCantidadAnios(resultSet.getInt("cantidad_años"));
                    planEstudio.setResolucion(resultSet.getString("resolucion"));
                }
            }
        } finally {
            cm.closeConnection();
        }
        System.out.println("Retorna el plan seleccionado según ID del DAO " + planEstudio);
        return planEstudio;
    }

    public PlanEstudio obtenerUltimoPlan() {
        PlanEstudio plan = null;
        String sql = "SELECT * FROM db_juventud.plan_estudio ORDER BY id_plan DESC LIMIT 1";
        ConnectionManager cm = new ConnectionManager();

        try (Connection conn = cm.connect();
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

            if (rs.next()) {
                plan = new PlanEstudio();
                plan.setIdPlan(rs.getInt("id_Plan"));
                plan.setInstitucion(rs.getString("institucion"));
                plan.setCarrera(rs.getString("carrera"));
                plan.setCantidadAnios(rs.getInt("cantidad_años"));
                plan.setResolucion(rs.getString("resolucion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cm.closeConnection();
        }
        return plan;
    }


//--------------------------------------------------------------------------------------------------------   	 
    public int actualizarPlan(PlanEstudio Plan) {
        int filas = 0;
        String sql = "UPDATE db_juventud.plan_estudio "
                + "SET institucion = ?, carrera = ?, resolucion = ?, cantidad_años = ? "
                + "WHERE id_plan = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, Plan.getInstitucion());
            stmt.setString(2, Plan.getCarrera());
            stmt.setString(3, Plan.getResolucion());
            stmt.setInt(4, Plan.getCantidadAnios());
            stmt.setInt(5, Plan.getIdPlan());

            filas = stmt.executeUpdate();
            System.out.println("Se Actualizaron: " + filas + " filas en la base de datos - DAO");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return filas;
    }

    //--------------------------------------------------------------------------------------------------------

    public boolean actualizarMateriaYPlan(MateriasPorAño materiaPorAño) {
        String sql = "UPDATE materiaplan SET nombre = ?, periodo = ?, id_añoPlan = ? WHERE id = ?";
        boolean actualizado = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            ps = conn.prepareStatement(sql);

            System.out.println("Nombre nuevo a settear: " + materiaPorAño.getMateria());
            System.out.println("Periodo nuevo a settear: " + materiaPorAño.getIDPeriodo());
            System.out.println("ID AñoPlan a settear: " + materiaPorAño.getIdAñoPlan());
            System.out.println("ID Materia a settear: " + materiaPorAño.getIdMateria());

            ps.setString(1, materiaPorAño.getMateria());
            ps.setInt(2, materiaPorAño.getIDPeriodo());
            ps.setInt(3, materiaPorAño.getIdAñoPlan());
            ps.setInt(4, materiaPorAño.getIdMateria());

            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                actualizado = true;
                System.out.println("Materia y AñoPlan actualizados correctamente.");
            } else {
                System.out.println("No se encontró la materia a actualizar.");
            }
        } catch (SQLException e) {
            System.err.println("Error al actualizar Materia y AñoPlan: " + e.getMessage());
            e.printStackTrace();
        } finally {
           
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return actualizado;
    }

    //--------------------------------------------------------------------------------------------------------

    public int eliminarPlan(int idPlan) {
        int filas = 0;
        System.out.println("DAO" + idPlan + " DAO");
        String sql = "UPDATE db_juventud.plan_estudio SET estado = false WHERE id_plan = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idPlan);

            filas = stmt.executeUpdate();
            System.out.println("Se eliminaron: " + filas + " filas en la base de datos - DAO");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return filas;
    }

    //--------------------------------------------------------------------------------------------------------

    public int darAltaPlan(int Plan) {
        int filas = 0;
        System.out.println("DAO" + Plan + " DAO");
        String sql = "UPDATE db_juventud.plan_estudio SET estado = true WHERE id_plan = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Plan);

            filas = stmt.executeUpdate();
            System.out.println("Se da de alta: " + filas + " fila en la base de datos - DAO");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
           
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return filas;
    }

  //--------------------------------------------------------------------------------------------------------
 
 // Método para obtener las materias por cuatrimestre asociadas al plan
    private static final String SELECT_DETALLE_QUERY =        
        "SELECT  \r\n" + 
        "añoPlan.año AS año, \r\n" + 
        "materiaplan.nombre AS materia, \r\n" + 
        "COALESCE(periodo.nombre, 'Sin periodo') AS periodo \r\n" + 
        "FROM añoPlan \r\n" + 
        "LEFT JOIN materiaplan ON añoPlan.id = materiaplan.id_añoPlan \r\n" + 
        "LEFT JOIN periodo ON materiaplan.periodo = periodo.id \r\n" + 
        "WHERE añoPlan.id_plan = ? \r\n" + 
        "ORDER BY añoPlan.año, MateriaPlan.nombre;";

    // Método para obtener las materias por plan
    public static List<MateriasPorAño> obtenerMateriasXPlan(int idPlan) throws SQLException {
        List<MateriasPorAño> materias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pst = conn.prepareStatement(SELECT_DETALLE_QUERY);
            pst.setInt(1, idPlan);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                int cuatrimestre = rs.getInt("año");
                String materia = rs.getString("materia") != null ? rs.getString("materia") : "Sin materias";
                String periodo = rs.getString("periodo");
                MateriasPorAño materiaXcuatri = new MateriasPorAño(cuatrimestre, materia, periodo);
                materias.add(materiaXcuatri);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener las materias por plan: " + e.getMessage());
            throw e;  // Re-lanzamos la excepción para manejarla en la capa superior
        } finally {
            
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }
        
        return materias;
    }

    //--------------------------------------------------------------------------------------------------------

    // Consulta para obtener las materias por plan con ID
    private static final String SELECT_DETALLE_PLAN_QUERY =        
        "SELECT  \r\n" + 
        "materiaplan.id AS ID, \r\n" + 
        "añoPlan.año AS año, \r\n" + 
        "materiaplan.nombre AS materia, \r\n" + 
        "COALESCE(periodo.nombre, 'Sin periodo') AS periodo \r\n" + 
        "FROM añoPlan \r\n" + 
        "LEFT JOIN materiaplan ON añoPlan.id = materiaplan.id_añoPlan \r\n" + 
        "LEFT JOIN periodo ON materiaplan.periodo = periodo.id \r\n" + 
        "WHERE añoPlan.id_plan = ? \r\n" + 
        "ORDER BY añoPlan.año, MateriaPlan.nombre;";

    // Método para obtener las materias por plan con ID
    public static List<MateriasPorAño> obtenerMateriasXPlanID(int idPlan) throws SQLException {
        List<MateriasPorAño> materias = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pst = conn.prepareStatement(SELECT_DETALLE_PLAN_QUERY);
            pst.setInt(1, idPlan);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("ID");
                int año = rs.getInt("año");
                String materia = rs.getString("materia") != null ? rs.getString("materia") : "Sin materias";
                String periodo = rs.getString("periodo");
                MateriasPorAño materiaXaño = new MateriasPorAño(id, año, materia, periodo);
                materias.add(materiaXaño);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener las materias por plan con ID: " + e.getMessage());
            throw e;
        } finally {
           
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }
        
        return materias;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener una sola materia por ID
    public static MateriasPorAño obtenerUnaMateria(int materiaId) throws SQLException {
    	MateriasPorAño materia = null;
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String query = "SELECT "
                + "materiaplan.id AS ID, "
                + "añoPlan.año AS año, "
                + "materiaplan.nombre AS materia, "
                + "COALESCE(periodo.nombre, 'Sin periodo') AS periodo "
                + "FROM añoPlan "
                + "LEFT JOIN materiaplan ON añoPlan.id = materiaplan.id_añoPlan "
                + "LEFT JOIN periodo ON materiaplan.periodo = periodo.id "
                + "WHERE materiaplan.id = ?";  // Filtramos por el ID de la materia
        
        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            statement = conn.prepareStatement(query);
            statement.setInt(1, materiaId);
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                materia = new MateriasPorAño();
                materia.setIdMateria(resultSet.getInt("ID"));
                materia.setIdAñoPlan(resultSet.getInt("año"));
                materia.setMateria(resultSet.getString("materia"));
                materia.setPeriodo(resultSet.getString("periodo"));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener la materia: " + e.getMessage());
            throw e;
        } finally {
            
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }
        
        return materia;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener los periodos
    public static List<String> obtenerPeriodos() {
        List<String> periodos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT COALESCE(nombre, 'Sin Periodo') AS nombre FROM db_juventud.periodo";

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                periodos.add(rs.getString("nombre"));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener los periodos desde la base de datos: " + e.getMessage());
        } finally {
           
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }
        
        return periodos;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener los IDs de los periodos
    public static List<Periodo> obtenerIDPeriodos() {
        List<Periodo> periodos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT id, COALESCE(nombre, 'Sin Periodo') AS nombre FROM periodo";

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Periodo periodo = new Periodo();
                periodo.setIdPeriodo(rs.getInt("id"));
                periodo.setNombre(rs.getString("nombre"));
                periodos.add(periodo);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener los periodos: " + e.getMessage());
        } finally {
            
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return periodos;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener los años de un plan
    public static List<Integer> obtenerAños(int idPlan) {
        List<Integer> años = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql = "SELECT año FROM db_juventud.añoPlan WHERE id_Plan = ?";

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, idPlan);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                años.add(rs.getInt("año"));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener los años desde la base de datos: " + e.getMessage());
        } finally {
           
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return años;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener los años por materia
    public static List<Integer> obtenerAñosPorMateria(int idMateria) throws SQLException {
        String sqlPlan = "SELECT p.id_plan FROM MateriaPlan m "
                         + "JOIN añoPlan a ON m.id_añoPlan = a.id "
                         + "JOIN plan_estudio p ON a.id_plan = p.id_plan "
                         + "WHERE m.id = ?";
        
        String sqlAños = "SELECT a.año FROM añoPlan a WHERE a.id_plan = ?";

        List<Integer> años = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstPlan = null;
        PreparedStatement pstAños = null;
        ResultSet rsPlan = null;
        ResultSet rsAños = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pstPlan = conn.prepareStatement(sqlPlan);
            pstPlan.setInt(1, idMateria);
            rsPlan = pstPlan.executeQuery();
            
            if (rsPlan.next()) {
                int idPlan = rsPlan.getInt("id_plan");

                pstAños = conn.prepareStatement(sqlAños);
                pstAños.setInt(1, idPlan);
                rsAños = pstAños.executeQuery();
                
                while (rsAños.next()) {
                    años.add(rsAños.getInt("año"));
                }
            }
        } finally {
           
            try {
                if (rsPlan != null) rsPlan.close();
                if (rsAños != null) rsAños.close();
                if (pstPlan != null) pstPlan.close();
                if (pstAños != null) pstAños.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }
        return años;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener el ID del año plan
    public static int obtenerIdAñoPlan(int idPlan, int año) {
        String sql = "SELECT id FROM añoPlan WHERE id_plan = ? AND año = ?";
        int idAñoPlan = -1;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, idPlan);
            pst.setInt(2, año);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                idAñoPlan = rs.getInt("id");
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el id del año plan: " + e.getMessage());
        } finally {
           
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        return idAñoPlan;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener el ID de año plan por materia
    public static int obtenerIdAnioPlanPorMateria(int idMateria) throws SQLException {
        int idAnioPlan = -1;
        String sql = "SELECT id_añoPlan FROM materiaplan WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idMateria);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                idAnioPlan = rs.getInt("id_añoPlan");
            }
        } finally {
           
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        System.out.println("retorno materiaplan.id_añoPlan = " + idAnioPlan + " - DAO");
        return idAnioPlan;
    }

    //--------------------------------------------------------------------------------------------------------

    // Método para obtener el ID del plan por ID del año plan
    public static int obtenerIdPlanPorId(int idAñoPlan) throws SQLException {
        int id_Plan = -1;
        String sql = "SELECT id_plan FROM añoPlan WHERE id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ConnectionManager cm = new ConnectionManager();
            conn = cm.connect();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idAñoPlan);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                id_Plan = rs.getInt("id_plan");
            }
        } finally {
            
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar los recursos: " + e.getMessage());
            }
        }

        System.out.println("retorno añoPlan.id_plan = " + id_Plan + " - DAO");
        return id_Plan;
    }

    
 }
              
 


