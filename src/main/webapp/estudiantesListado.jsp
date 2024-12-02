<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Estudiante"%>
<%@page import="models.Casa"%>
<%@page import="models.Plan_Estudios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planes de Estudio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/planesEstudio.css">
    <link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
<script type="text/javascript">
function PopUp(id) {
  if (confirm("Desea dar baja a este estudiante?")) {
	window.location.href = "ServletestudiantesListado?Action=3&Id=" + id.toString();
  }
}
</script>
</head>
<body>
    <!-- Barra de Bienvenida -->
    <div class="welcome-bar">
        Estudiantes
    </div>
<%
	List<Estudiante> listE = new ArrayList<Estudiante>();
	List<Casa> listC = new ArrayList<Casa>();
	List<Plan_Estudios> listP = new ArrayList<Plan_Estudios>();
	if (request.getAttribute("listaEst") != null) {
	listE = (List<Estudiante>) request.getAttribute("listaEst");
	listC = (List<Casa>) request.getAttribute("listaCasas");
	listP = (List<Plan_Estudios>) request.getAttribute("listaPlanes");
	}
%>
    <!-- Contenedor Principal -->
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary">Listado de Estudiantes</h2>
            <button class="btn btn-primary" onclick="window.location.href='agregarStudent.jsp'">Agregar un nuevo estudiante</button>
        </div>

        <!-- Tabla de Planes -->
            <table id="table_id" class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Dni</th>
                        <th scope="col">Nombre de la Carrera que cursa</th>
                        <th scope="col">Institucion</th>
                        <th scope="col">Ciudad</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>     
                    <%
                    	int x = 0;
                    	for(Estudiante e : listE) {
                    %>
                    <tr>
                    	<th scope="col"> <button type="submit" class="btn btn-primary" name="btnVerPerfil" onclick="window.location.href='ServletestudiantesListado?Action=2&Id=<%= Integer.toString(e.getId_usuario()) %>'" >Ver perfil</button></th>
                    	<th scope="col"><%= e.getNombre() %></th>
                    	<th scope="col"><%= e.getApellido() %></th>
                    	<th scope="col"><%= e.getDNI() %></th>
                    	<th scope="col"><%= listP.get(x).getCarrera() %></th>
                    	<th scope="col"><%= listP.get(x).getInstitucion() %></th>
                    	<th scope="col"><%= listC.get(x).getCiudad() %></th>
                		<th scope="col"> <button type="submit" class="btn btn-danger" name="btnDarBaja" onclick="PopUp(<%= Integer.toString(e.getId_usuario())%>)">Dar de baja</button></th>
                    </tr>
                    <%
                    	x++;
                    	}
                    %>
   				</tbody>
            </table>

    </div>

    <footer class="footer text-center">
    <div class="container">
        <div class="row justify-content-around">
            <!-- Contact Info -->
            <div class="col-md-4">
                <h5>Información de contacto</h5>
                <address>
                    <p>Email: <a href="mailto:example@example.com">example@example.com</a></p>
                    <p>Teléfono: <a href="tel:+1234567890">+54 (2281) 567-890</a></p>
                </address>
            </div>
            <!-- Social Media Links -->
            <div class="col-md-4">
                <h5>Siguenos en nuestras redes sociales</h5>
                <nav class="social-icons" aria-label="Social media links">
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="https://facebook.com" target="_blank" aria-label="Facebook"> <i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="https://instagram.com" target="_blank" aria-label="Instagram"> <i class="fab fa-instagram"></i></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <hr class="bg-white">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </div>
</footer>
</body>
</html>