<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Casa"%>
<%@page import="models.EstudianteListado"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Casas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css"
	href="./css/casasAzul.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
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
function PopUp(id, ciudad) {
	  if (confirm("Desea dar baja esta casa?")) {
		  window.location.href = "ServletCasas?Action=5&Id=" + id.toString() + "&c=" + ciudad.toString();
	  }
	  else
	  {
		  window.location.href = "ServletCasas?Action=2&Id=" + ciudad.toString();
	  }
}
</script>
<script type="text/javascript">
function PopUp2(id, ciudad) {
	  if (confirm("Desea dar de alta esta casa?")) {
		  window.location.href = "ServletCasas?Action=6&Id=" + id.toString() + "&c=" + ciudad.toString();
	  }
	  else
	  {
		  window.location.href = "ServletCasas?Action=2&Id=" + ciudad.toString();
	  }
}
</script>
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
                        <li class="nav-item"><a class="nav-link" href="agregarStudent.jsp">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="ServletCasas?Action=1">Casas</a></li>
                        <li class="nav-item"><a class="nav-link" href="planesEstudio.jsp">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="informes.jsp">Informes</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletestudiantesListado?Action=1">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
 <%
	List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
	List<Casa> listC = new ArrayList<Casa>();
	String IdC = null;
	if (request.getAttribute("listCasa") != null) {
	listC = (List<Casa>) request.getAttribute("listCasa");
	}
	if (request.getAttribute("listaEst") != null) {
		listE = (List<EstudianteListado>) request.getAttribute("listaEst");
	}
	if(request.getAttribute("IdCiudad") != null)
	{
		IdC = request.getAttribute("IdCiudad").toString();
	}
	
	String id;
	String IdCasa = null;
	if (request.getAttribute("PopUp") != null) {
		
		id = request.getAttribute("PopUp").toString();
		switch (id) {
		case "1":
		{
			if(request.getAttribute("Casa") != null)
			{
				IdCasa = request.getAttribute("Casa").toString();
				%>
					<script type="text/javascript">
					PopUp(<%= IdCasa%>,<%= IdC %>);
					</script>
				<%
			}
			break;
		}
		case "2":
		{
			if(request.getAttribute("Casa") != null)
			{
				IdCasa = request.getAttribute("Casa").toString();
				%>
					<script type="text/javascript">
					PopUp2(<%= IdCasa%>,<%= IdC %>);
					</script>
				<%
			}
			break;
		}
		default:
			break;
		}
	}
%>
<div class="container">
    <div class="card">
        <div class="card-header">
            Casas
        </div>

        <div class="card-body">
        <form method="post" action="ServletCasas">
                <div class="form-group">
                    <label for="casaId">Seleccione una casa:</label>
                    <select name="casaId" id="casaId" class="form-control">
                    <%
                    	for(Casa C : listC)
                    	{
                    		if(C.isEstado())
                    		{

                    %>
                        		<option value="<%= C.getId_casa() %>"><%= C.getNombre_casa() %> - <%= C.getDireccion() %></option>
                     <%
                    		}
                    		else
                    		{
                    			%>
                    			<option value="<%= C.getId_casa() %>"><%= C.getNombre_casa() %> - <%= C.getDireccion() %> (Inactiva)</option>
                    			<%
                    		}
                    	}
                     %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary" name="btnMostrarCasa" value="<%= IdC %>">Mostrar Integrantes</button>
                <button type="submit" class="btn btn-primary" name="btnAgregarCasa" value="<%= IdC %>">Agregar nueva Casa</button>
         <div class="form-group"></div>
         <div class="form-group">
                <button type="submit" class="btn btn-danger" name="btnDarBajaCasa" value="<%= IdC %>">Dar de baja Casa</button>
                <button type="submit" class="btn btn-success" name="btnDarAltaCasa" value="<%= IdC %>">Dar de alta Casa</button>
		 </div>
         </form>
         
                <table id="table_id" class="table table-hover">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nombre y Apellido</th>
                        <th scope="col">DNI</th>
                        <th scope="col">Correo</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Carrera Cursando</th>
                        <th scope="col">Instituto</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                    	for(EstudianteListado e : listE)
                    	{
                    %>
                        <tr>
                            <th scope="col"><%= e.getNombre() + " " + e.getApellido() %></th>
	                    	<th scope="col"><%= e.getDNI() %></th>
	                    	<th scope="col"><%= e.getCorreo() %></th>
	                    	<th scope="col"><%= e.getTelefono() %></th>
	                    	<th scope="col"><%= e.getCarrera() %></th>
	                    	<th scope="col"><%= e.getInstitución() %></th>
                        </tr>
                    <%
                    	}
                    %>
                    </tbody>
                </table>
             	<button type="submit" class="btn btn-primary" name="btnVolver" onclick="window.location.href='ServletCasas?Action=1'">Volver a las ciudades</button>
        </div>
    </div>
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