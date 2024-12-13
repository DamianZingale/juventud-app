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
