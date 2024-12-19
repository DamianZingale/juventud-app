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
        <h1>Editar Materia</h1>
        <!-- Formulario de edición de materia -->
        <form method="post" action="ServletPlanesEstudio">
            <!-- ID Materia -->
            <div class="mb-3">
                <label for="idMateria" class="form-label">ID Materia</label>
                <input type="text" class="form-control" id="idMateria" name="idMateria" value="${materia.idMateria}" readonly required>
            </div>

            <!-- Año Actual -->
            <div class="mb-3">
                <label for="año" class="form-label">Año Actual</label>
                <input type="number" class="form-control" id="año" name="año" value="${materia.idAñoPlan}" readonly required>
            </div>

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
          

            <!-- Nombre Actual -->
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre Actual</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="${materia.materia}" readonly required>
            </div>

            <!-- Nuevo Nombre -->
            <div class="mb-3">
                <label for="nuevoNombre" class="form-label">Escriba Nuevo Nombre</label>
                <input type="text" class="form-control" id="nuevoNombre" name="nuevoNombre" required>
            </div>

            <!-- Periodo Actual -->
            <div class="mb-3">
                <label for="periodo" class="form-label">Periodo Actual</label>
                <input type="text" class="form-control" id="periodoViejo" name="periodoViejo" value="${materia.periodo}" readonly required>
            </div>

            <!-- Nuevo Periodo -->
            <div class="mb-3">
                <label for="periodo" class="form-label">Seleccione el Nuevo Periodo</label>
                <div>
                   <input type ="radio" name = "periodo" value = "1"/> Anual
                   <input type ="radio" name = "periodo" value = "2"/> Bimestre
                   <input type ="radio" name = "periodo" value = "3"/> Trimestre
                   <input type ="radio" name = "periodo" value = "4"/> Cuatrimestre
                   <input type ="radio" name = "periodo" value = "5"/> Semestre
                </div>
            </div>

            <!-- Botón de actualización -->
            <button type="submit" class="btn btn-warning" name="btnActualizarMateria">Actualizar Materia</button>
        </form>

        <!-- Enlace de cancelación -->
       <form method="get" action="ServletPlanesEstudio">
    <input type="submit" class="btn btn-primary" name="btnVolverActivos" value="Volver a los Planes Activos"
        onclick="return confirm('¿Estás seguro de que deseas VOLVER A LOS PLANES ACTIVOS?');">
</form>
    </div>

    <!-- Bootstrap JS y Popper.js (si es necesario para componentes dinámicos) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>

</html>
