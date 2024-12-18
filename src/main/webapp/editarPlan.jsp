<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Plan de Estudio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicioAdmin.jsp">Gestión de estudiantes</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menú Principal</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletAgregarStudent?Action=1">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletCasas?Action=1">Casas</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="ServletPlanesEstudio?btnMostrarActivos=Planes+Activos">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="informes.jsp">Informes</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletestudiantesListado?Action=1">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Editar Plan de Estudio</h2>

        <!-- Formulario de edición -->
        <form method="post" action="ServletPlanesEstudio">
            
            <label for="institucion">ID Plan</label>
            <input type="text" class="form-control"  name="idPlanSeleccionado" value="${plan.idPlan}" required readonly>
                    
            <div class="form-group">
                <label for="institucion">Institución</label>
                <input type="text" class="form-control" id="institucion" name="txtCamb_Institucion" value="${plan.institucion}" required>
            </div>
            
            <div class="form-group">
                <label for="carrera">Carrera</label>
                <input type="text" class="form-control" id="carrera" name="txtCamb_Carrera" value="${plan.carrera}" required>
            </div>
            <div class="form-group">
                <label for="carrera">Resolucíon</label>
                <input type="text" class="form-control" id="carrera" name="txtCamb_Resolucion" value="${plan.resolucion}" required>
            </div>
            
            <div class="form-group">
                <label for="cantidadAnios">Cantidad de Años</label>
                <input type="number" class="form-control" id="cantidadAnios" name="txtCamb_CantidadAnios" value="${plan.cantidadAnios}" required>
            </div>
            
       
            <form method="post" action="ServletPlanesEstudio">
    		<input type="hidden" name="idPlan" value="${plan.idPlan}">
 		   <input type="submit" class="btn btn-primary" name="btnActualizar" value="Actualizar">
			</form>		
        </form>
    </div>
</body>

</html>
