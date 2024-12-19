<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.EstudianteListado"%>
<%@page import="models.Referente"%>
<%@page import="models.Usuario"%>
<%@page import="models.Administrador"%>
<%@page import="models.Historia_Clinica"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Perfil Estudiante</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/editarPerfilStudent.css">
<link rel="stylesheet" type="text/css" href="./css/planesEstudio.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable({
				"language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                }
		});
	});
</script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicioAdmin.jsp">Gestion de estudiantes</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu Principal</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletAgregarStudent?Action=1">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletCasas?Action=1">Casas</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletPlanesEstudio?btnMostrarActivos=Planes+Activos">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="informes.jsp">Informes</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="ServletestudiantesListado?Action=1">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    
    	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
<!-- Zï¿½calo superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <!-- Botï¿½n del menï¿½ desplegable a la izquierda -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menuCollapse" aria-controls="menuCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Texto centrado -->
    <span class="navbar-text mx-auto text-center">
      Bienvenido al programa para estudiantes
    </span>

    <!-- Dropdown de cierre de sesiï¿½n a la derecha -->
    <div class="dropdown">
      <!-- Solo imagen dentro del dropdown -->
      <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <!-- Imagen dentro del dropdown -->
        <img src="img/avatar.jpg" height="80" width="80" class="rounded-circle" alt="Session">
      </a><br>

      <!-- Contenido del Dropdown -->
      <div class="dropdown-menu dropdown-menu-right text-center" aria-labelledby="userDropdown">
        <img src="img/avatar.jpg" height="80" width="80" class="rounded-circle mb-2" alt="Session">
       <%
    	// Recuperar el usuario desde la sesiï¿½n
    	Object usuario = session.getAttribute("usuario");

    	String nombreUsuario = "Usuario no autenticado";
    	String apellidoUsuario= "";
    	String correoUsuario = "No disponible";

    	if (usuario instanceof Administrador) {
        	Administrador admin = (Administrador) usuario;
        	nombreUsuario = admin.getNombre();
        	apellidoUsuario = admin.getApellido();
        	correoUsuario = admin.getEmail();
    	} else {
    		%>
    		<script type="text/javascript">
    			window.location.href = "index.jsp";
    		</script>
    		<%
    	}
		%>
        <p><strong><%= nombreUsuario + " " + apellidoUsuario %></strong></p>
		<p title="<%= correoUsuario %>"><%= correoUsuario %></p>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item text-danger" href="LoguinOut">Cerrar sesion</a>
      </div>
    </div>
  </div>
</nav>
    
<%
	List<Referente> listR = new ArrayList<Referente>();
	EstudianteListado e = new EstudianteListado();
	Historia_Clinica c = new Historia_Clinica();
	String N = "";
	if (request.getAttribute("listaRef") != null) {
	listR = (List<Referente>) request.getAttribute("listaRef");
	}
	if (request.getAttribute("Est") != null) {
		e = (EstudianteListado) request.getAttribute("Est");
	}
	if (request.getAttribute("Hist") != null) {
		c = (Historia_Clinica) request.getAttribute("Hist");
	}
%>
<div class="container py-5">
    <h1 class="text-center mb-5"><%= e.getNombre() + " " + e.getApellido() %></h1>

    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Información Personal</h5>
                </div>
                <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Nombre y Apellido</label>
                            <input type="text" class="form-control" value="<%= e.getNombre() + " " + e.getApellido() %>" readonly="readonly">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">DNI</label>
                            <input type="text" class="form-control" value="<%= e.getDNI() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Fecha de Nacimiento</label>
                            <input type="text" class="form-control" value="<%= e.getFechaNacimiento() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Domicilio</label>
                            <input type="text" class="form-control" value="<%= e.getDomicilio() %>" readonly="readonly">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">E-mail</label>
                            <input type="text" class="form-control" value="<%= e.getCorreo() %>" readonly="readonly">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Telefono</label>
                            <input type="text" class="form-control" value="<%= e.getTelefono() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Carrera</label>
                            <input type="text" class="form-control" value="<%= e.getCarrera() + " - " + e.getInstitución() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Casa</label>
                            <input type="text" class="form-control" value="<%= e.getCasa() + " - " + e.getCiudad() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Enfermedades Preexistentes</label>
                            <input type="text" class="form-control" value="<% if(c.getEnfermedades_preexistentes() != null){ %><%=c.getEnfermedades_preexistentes()%><%; } else{ %><%= N %> <%} %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Medicaciones</label>
                            <input type="text" class="form-control" value="<% if(c.getMedicaciones() != null){ %><%=c.getMedicaciones() %><%; } else{ %><%= N %> <%} %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Operaciones</label>
                            <input type="text" class="form-control" value="<% if(c.getOperaciones() != null){ %><%=c.getOperaciones() %><%; } else{ %><%= N %> <%} %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Alergias</label>
                            <input type="text" class="form-control" value="<% if(c.getAlergias() != null){ %><%=c.getAlergias() %><%; } else{ %><%= N %> <%} %>" readonly="readonly">
                        </div>
						
						<div class="mb-3">
                            <label class="form-label">Referentes</label>
                            <table id="table_id" class="table table-hover">
				                <thead class="thead-dark">
				                    <tr>
				                        <th scope="col">Nombre</th>
				                        <th scope="col">Apellido</th>
				                        <th scope="col">Dni</th>
				                        <th scope="col">Domicilio</th>
				                        <th scope="col">Telefono</th>
				                        <th scope="col">Rol</th>
				                    </tr>
				                </thead>
				                <tbody>     
				                    <%
				                    if(!listR.isEmpty())
				                    {
				                    	for(Referente r : listR) {
				                    %>
				                    <tr>
				                    	<th scope="col"><%= r.getNombre() %></th>
				                    	<th scope="col"><%= r.getApellido() %></th>
				                    	<th scope="col"><%= r.getDNI() %></th>
				                    	<th scope="col"><%= r.getDomicilio() %></th>
				                    	<th scope="col"><%= r.getTelefono() %></th>
				                    	<th scope="col"><%= r.getRol() %></th>
				                    </tr>
				                    <%
				                    	}
				                    }
				                    %>
				   				</tbody>
				            </table>
                        </div>
                        
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary" name="btnVolver" onclick="window.location.href='ServletestudiantesListado?Action=1'">Volver al listado de estudiantes</button>
                        </div>
                </div>
            </div>
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
                    <p>Email: <a href="mailto:direjuventudtapalque@gmail.com">direjuventudtapalque@gmail.com</a></p>
                    <p>Teléfono: <a href="tel:2281492831">+54 (2281) 492831</a></p>
                </address>
            </div>
            <!-- Social Media Links -->
            <div class="col-md-4">
                <h5>Siguenos en nuestras redes sociales</h5>
                <nav class="social-icons" aria-label="Social media links">
                    <ul class="list-inline">
                        <li class="list-inline-item"><a href="https://www.facebook.com/direjuventudtapalque/" target="_blank" aria-label="Facebook"> <i class="fab fa-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="https://www.instagram.com/juventud.tapalque" target="_blank" aria-label="Instagram"> <i class="fab fa-instagram"></i></a></li>
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