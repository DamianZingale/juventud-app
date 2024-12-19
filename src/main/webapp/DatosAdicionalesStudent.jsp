<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Referente"%>
<%@page import="models.Historia_Clinica"%>
<%@ page import="models.Estudiante" %>
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
<title>Datos adicionales</title>
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
</head>
<body>
<%
Estudiante E = new Estudiante();
if(session.getAttribute("usuario") != null)
{
	E = (Estudiante) session.getAttribute("usuario");
}
else
{
	%>
	<script type="text/javascript">
		window.location.href = "index.jsp";
	</script>
	<%
}
%>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="homeStudent.jsp">Direccion de Juventud</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
							<li class="nav-item"><a class="nav-link" href="homeStudent.jsp">Inicio</a></li>
							<li class="nav-item"><a class="nav-link" href="./configuracionStudent.jsp">Configuraci�n</a></li>
							<li class="nav-item"><a class="nav-link active" aria-current="page"	href="ServletDatosAdicionales?Action=1&Id=<%= E.getId_usuario() %>">Datos adicionales (Obligatorio)</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
		
		        	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
<!-- Z�calo superior -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <!-- Bot�n del men� desplegable a la izquierda -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menuCollapse" aria-controls="menuCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Texto centrado -->
    <span class="navbar-text mx-auto text-center">
      Bienvenido al programa para estudiantes
    </span>

    <!-- Dropdown de cierre de sesi�n a la derecha -->
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
    	// Recuperar el usuario desde la sesi�n
    	Object usuario = session.getAttribute("usuario");

    	String nombreUsuario = "Usuario no autenticado";
    	String apellidoUsuario= "";
    	String correoUsuario = "No disponible";

    	if (usuario instanceof Estudiante) {
        	Estudiante estudiante = (Estudiante) usuario;
        	nombreUsuario = estudiante.getNombre();
        	apellidoUsuario = estudiante.getApellido();
        	correoUsuario = estudiante.getEmail();
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
	Historia_Clinica c = new Historia_Clinica();
	String N = "";
	if (request.getAttribute("Hist") != null) {
		c = (Historia_Clinica) request.getAttribute("Hist");
	}
%>
<div class="container py-5">
    <h1 class="text-center mb-5"></h1>

    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Informaci�n Adicional</h5>
                </div>
                <div class="card-body">
                	<form method="get" action="ServletDatosAdicionales">
                        <div class="mb-3">
                        	<input type="hidden" name="Id" value="<%= E.getId_usuario() %>">
                            <label class="form-label">Enfermedades Preexistentes (Ej: Diabetes, Hipertension, Etc)</label>
                            <input type="text" class="form-control" name="txtEnfermedades" value="<% if(c.getEnfermedades_preexistentes() != null){ %><%=c.getEnfermedades_preexistentes()%><%; } else{ %><%= N %> <%} %>">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Medicaciones (Ej: Metformina, Enalapril, Etc)</label>
                            <input type="text" class="form-control" name="txtMedicaciones" value="<% if(c.getMedicaciones() != null){ %><%=c.getMedicaciones() %><%; } else{ %><%= N %> <%} %>">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Operaciones</label>
                            <input type="text" class="form-control" name="txtOperaciones" value="<% if(c.getOperaciones() != null){ %><%=c.getOperaciones() %><%; } else{ %><%= N %> <%} %>">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Alergias (Ej: Mani, Polvo, Etc)</label>
                            <input type="text" class="form-control" name="txtAlergias" value="<% if(c.getAlergias() != null){ %><%=c.getAlergias() %><%; } else{ %><%= N %> <%} %>">
                        </div>
						
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary" name="Action" value="2">Guardar y continuar</button>
                        </div>
                	</form>
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
                <h5>Informaci�n de contacto</h5>
                <address>
                    <p>Email: <a href="mailto:direjuventudtapalque@gmail.com">direjuventudtapalque@gmail.com</a></p>
                    <p>Tel�fono: <a href="tel:2281492831">+54 (2281) 492831</a></p>
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