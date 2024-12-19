<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.PlanEstudio" %>
<%@ page import="models.MateriasPorAño" %>
<%@ page import="models.Periodo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Plan de Estudio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        h1, h2 {
            text-align: center;
            color: #000;
        }
        table {
            width: 60%;
            margin: 40px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #008CBA;
            color: #fff;
        }
        .tabla-detalle td {
            background-color: #e0f7ff;
        }
        input[readonly] {
            width: calc(100% - 10px);
            font-size: 18px;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #e0f7ff;
            color: #000;
            pointer-events: none;
        }
        .btn {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #000;
            color: #fff;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #333;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }
        .form-group {
        margin-bottom: 20px; /* Aumenta el espacio entre los elementos del formulario */
        }

label {
    display: block; /* Asegura que el label se muestre en su propia línea */
    margin-bottom: 5px; /* Añade un poco de espacio debajo del label */
}
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-primary">Agregar Materias al Plan de Estudio</h1>

        <% PlanEstudio ultimoPlan = (PlanEstudio) request.getAttribute("ultimoPlan"); %>
        <h2>Detalle del Plan</h2>
        <table class="tabla-detalle">
            <tr>
                <th>ID Plan</th>
                <td><input type="text" class="form-control" value="<%= ultimoPlan != null ? ultimoPlan.getIdPlan() : "" %>" readonly></td>               
            </tr>
            <tr>
                <th>Institución</th>
                <td><input type="text" class="form-control" value="<%= ultimoPlan != null ? ultimoPlan.getInstitucion() : "" %>" readonly></td>
            </tr>
            <tr>
                <th>Carrera</th>
                <td><input type="text" class="form-control" value="<%= ultimoPlan != null ? ultimoPlan.getCarrera() : "" %>" readonly></td>
            </tr>
            <tr>
                <th>Resolución</th>
                <td><input type="text" class="form-control" value="<%= ultimoPlan != null ? ultimoPlan.getResolucion() : "" %>" readonly></td>
            </tr>
            <tr>
                <th>Cantidad de Años</th>
                <td><input type="number" class="form-control" value="<%= ultimoPlan != null ? ultimoPlan.getCantidadAnios() : "" %>" readonly></td>
            </tr>
        </table>

        <h2>Materias Cargadas</h2>
        <table>
            <thead>
                <tr>
                    <th>Año</th>
                    <th>Materia</th>
                    <th>Período</th>
                </tr>
            </thead>
            <tbody>
                <% List<MateriasPorAño> materiasPorAño = (List<MateriasPorAño>) request.getAttribute("materiasPorAño"); %>
<% if (materiasPorAño != null && !materiasPorAño.isEmpty()) { %>
    <% for (MateriasPorAño materia : materiasPorAño) { %>
        <tr>
            <td><%= materia.getIdAñoPlan() %></td>
            <td><%= materia.getMateria() %></td>
            <td><%= materia.getPeriodo() %></td>
        </tr>
    <% } %>
<% } else { %>
    <tr>
        <td colspan="3">No hay materias para mostrar.</td>
    </tr>
<% } %>
            </tbody>
        </table>

<form action="ServletPlanesEstudio" method="post">
    <input type="hidden" name="idPlanSeleccionado" id="idPlanSeleccionado" value="<%= ultimoPlan != null ? ultimoPlan.getIdPlan() : "" %>">

    <div class="form-group">
        <label for="año" class="form-label">Seleccione Nuevo Año</label>
  <div>
    <select name="nuevoAño" id="nuevoAño" class="form-control">
    
    
    <%= request.getAttribute("opcionesAños") %>
</select>
  </div>

    <div class="form-group">
        <label for="materia">Escriba el Nombre de la Materia:</label>
        <input type="text" class="form-control" name="txtMateria" placeholder="Introduce el nombre de la materia" required>
    </div>

    <div class="form-group">
        <label for="periodo" class="form-label">Seleccione el Periodo Correspondiente</label>
                <div>
                   <input type ="radio" name = "nuevoPeriodo" value = "1"/> Anual
                   <input type ="radio" name = "nuevoPeriodo" value = "2"/> Bimestre
                   <input type ="radio" name = "nuevoPeriodo" value = "3"/> Trimestre
                   <input type ="radio" name = "nuevoPeriodo" value = "4"/> Cuatrimestre
                   <input type ="radio" name = "nuevoPeriodo" value = "5"/> Semestre
                </div>

    <div class="btn-container">
     <input type="submit" class="btn btn-success" name="btnAgregarMateria1" value="Agregar Materia"
                onclick="return confirm('¿Estás seguro de que deseas AGREGAR esta MATERIA?');">
       </form>
        <form method="get" action="ServletPlanesEstudio">
    <input type="submit" class="btn btn-primary" name="btnVolverActivos" value="Volver a los Planes Activos"
        onclick="return confirm('¿Estás seguro de que deseas VOLVER A LOS PLANES ACTIVOS?');">
	</form>
        
    </div>



    </div>
</body>
</html>
