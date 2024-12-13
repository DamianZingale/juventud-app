<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.PlanEstudio" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!DOCTYPE html> <html lang="en"> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Nuevo Plan de Estudio</title> <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
 </head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuevo Plan de Estudio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-primary">Agregar Nuevo Plan de Estudio</h2>
        
        <form action="/Juventud-App/ServletPlanesEstudio" method="post">
            
            <div class="form-group">
                <label for="institucion">Institución:</label>
                <input type="text" class="form-control" name="txtInstitucion" required>
            </div>
            <div class="form-group">
                <label for="carrera">Carrera:</label>
                <input type="text" class="form-control" name="txtCarrera" required>
            </div>
            <div class="form-group">
                <label for="carrera">Resolucíon:</label>
                <input type="text" class="form-control" name="txtResolucion" required>
            </div>
            <div class="form-group">
                <label for="cantidadAnios">Cantidad de Años:</label>
                <input type="number" class="form-control" id="cantidadAnios" name="txtAnios" required>
            </div>
        <button type="submit" class="btn btn-primary" name="btnAgregarPlan">Agregar Nuevo Plan</button>
  
            <button type="button" class="btn btn-secondary" onclick="location.href='ServletPlanesEstudio?Param=1'">Volver al Inicio</button>
    <%
int filas = 0;
	if(request.getAttribute("cantidadFilas") != null){
		
	filas = (int)request.getAttribute("cantidadFilas");

	}
%>
<%
	if(filas==1){

%>
	Nuevo Plan Agregado con exito
<%
	}
%>
    
    </form>
    </div>
</body>
</html>
