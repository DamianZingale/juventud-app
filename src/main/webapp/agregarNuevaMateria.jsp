<%@ page import="java.util.List" %>
<%@ page import="models.Periodo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Materia</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 800px;
            margin-top: 30px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }

        h1 {
            color: #007bff;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Agregar Nueva Materia</h1>
        <!-- Formulario de edición de materia -->
        <form method="post" action="ServletPlanesEstudio">
            <!-- ID plan -->
           <label for="idPlan" class="form-label">ID Plan</label>
			<input type="text" class="form-control" id="idPlan" name="idPlan" value="${plan.idPlan}" readonly required>



            <!-- Año Nuevo -->
            <div class="mb-3">
                <label for="año" class="form-label">Seleccione Nuevo Año</label>
				<div>
    			<select name="nuevoAño" id="nuevoAño" class="form-control">
      			  <!-- Aquí se insertan las opciones generadas desde el servlet -->
        		<%= request.getAttribute("opcionesAños") %>
    			</select>
				</div>
				</div>
         

            <!-- Nuevo Nombre -->
            <div class="mb-3">
                <label for="nuevoNombre" class="form-label">Escriba Nuevo Nombre</label>
                <input type="text" class="form-control" id="nuevoNombre" name="nuevoNombre" required>
            </div>

            <!-- Nuevo Periodo -->
            <div class="mb-3">
                <label for="periodo" class="form-label">Seleccione el Periodo Correspondiente</label>
                <div>
                   <input type ="radio" name = "nuevoPeriodo" value = "1"/> Anual
                   <input type ="radio" name = "nuevoPeriodo" value = "2"/> Bimestre
                   <input type ="radio" name = "nuevoPeriodo" value = "3"/> Trimestre
                   <input type ="radio" name = "nuevoPeriodo" value = "4"/> Cuatrimestre
                   <input type ="radio" name = "nuevoPeriodo" value = "5"/> Semestre
                </div>
            </div>

            <!-- Botón de agregar materia -->
            <input type="submit" class="btn btn-success" name="btnAgregarMateria" value="Agregar Materia"
                onclick="return confirm('¿Estás seguro de que deseas AGREGAR esta MATERIA? Seras redireccionado a los Planes Activos');">
	</form>
        <!-- Enlace de cancelación -->
        <form method="get" action="ServletPlanesEstudio">
    <input type="submit" class="btn btn-primary" name="btnVolverActivos" value="Volver a los Planes Activos"
        onclick="return confirm('¿Estás seguro de que deseas VOLVER A LOS PLANES ACTIVOS?');">

    </div>

    <!-- Bootstrap JS y Popper.js (si es necesario para componentes dinámicos) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>

</html>
