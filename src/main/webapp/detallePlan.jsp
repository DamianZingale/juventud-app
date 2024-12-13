<%@ page import="java.util.List" %>
<%@ page import="models.MateriasPorAño" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Plan de Estudio</title>
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
            color: #000; /* Negro */
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
            background-color: #008CBA; /* Celeste */
            color: #fff;
        }
        .tabla-detalle td {
            background-color: #e0f7ff; /* Fondo m�s claro */
        }
        /* Estilo para inputs no editables */
        input[readonly] {
            width: calc(100% - 10px); /* Ajusta el ancho para evitar desbordes */
            box-sizing: border-box; /* Incluye padding y border en el c�lculo del ancho */
            font-size: 18px; /* Tama�o de letra m�s grande */
            padding: 10px;
            border: none; /* Sin contorno */
            border-radius: 4px; /* Bordes redondeados */
            background-color: #e0f7ff; /* Celeste claro */
            color: #000; /* Color de texto */
            pointer-events: none; /* Desactiva la interacci�n del usuario */
        }
        .btn {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #000; /* Negro */
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
    </style>
</head>
<body>

<h1>Detalle del Plan de Estudio</h1>
<table class="tabla-detalle">
    <form method="post" action="ServletPlanesEstudio">
        <tr>
            <th>ID Plan</th>
            <td><input type="text" class="form-control" name="idPlanSeleccionado" value="${plan.idPlan}" readonly></td>
        </tr>
        <tr>
            <th>Institucion</th>
            <td><input type="text" class="form-control" id="institucion" name="txtCamb_Institucion" value="${plan.institucion}" readonly></td>
        </tr>
        <tr>
            <th>Carrera</th>
            <td><input type="text" class="form-control" id="carrera" name="txtCamb_Carrera" value="${plan.carrera}" readonly></td>
        </tr>
          <tr>
            <th>Resolucion</th>
            <td><input type="text" class="form-control" id="carrera" name="txtCamb_Resolucion" value="${plan.resolucion}" readonly></td>
        </tr>
        <tr>
            <th>Cantidad de Años</th>
            <td><input type="number" class="form-control" id="cantidadAnios" name="txtCamb_CantidadAnios" value="${plan.cantidadAnios}" readonly></td>
        </tr>
       
    </form>
</table>

<h2>Materias por Año</h2>
<table>
    <thead>
        <tr>
            <th>Año</th>
            <th>Materia</th>
            <th>Periodo</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Obtenemos la lista de materias desde el request o session
            List<MateriasPorAño> materiasPorAño = (List<MateriasPorAño>) request.getAttribute("materiasPorAño");
            
            // Verificamos que la lista no sea null y tenga elementos
            if (materiasPorAño != null) {
                for (MateriasPorAño materia : materiasPorAño) {
        %>
            <tr>
                <td><%= materia.getAño() %></td>
                <td><%= materia.getMateria() %></td>
                <td><%= materia.getPeriodo() %></td>
             
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="2">No hay materias para mostrar.</td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>

<div class="btn-container">
    <a href="paginaAnterior.jsp" class="btn">Volver</a>
</div>

</body>
</html>
