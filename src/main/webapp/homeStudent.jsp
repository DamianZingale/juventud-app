<%@ page import="models.Estudiante" %>
<%@ page import="models.PlanEstudio" %>
<%@ page import="models.MateriasEstudiante" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Juventud</title>
<link rel="stylesheet" type="text/css" href="./css/homeStudent.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<header>
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
				<a class="navbar-brand" href="homeStudent.jsp">Dirrecion de Juventud</a>
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
							<li class="nav-item"><a class="nav-link active" aria-current="page" href="homeStudent.jsp">Inicio</a></li>
							<li class="nav-item"><a class="nav-link" href="./configuracionStudent.jsp">Configuración</a></li>
							<li class="nav-item"><a class="nav-link" href="ServletDatosAdicionales?Action=1&Id=<%= E.getId_usuario() %>">Datos adicionales (Obligatorio)</a></li>
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

	</header>
	<div class="container-fluid p-0">
		<div class="section-hero mb-4">
			<div class="text-center">
			<%
        if (E != null) { 
    %>
        <h1 class="display-4"><%= E.getNombre() + " " + E.getApellido() %></h1>
    <%
        } else { 
    %>
        <h1 class="display-4">Nombre no disponible</h1>
    <%
        }
    %>
			</div>
		</div>

		<div class="container section-tabs">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="encurso-tab"
						data-bs-toggle="tab" data-bs-target="#encurso" type="button"
						role="tab" aria-controls="encurso" aria-selected="true">Materias
						en Curso</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pendientes-tab" data-bs-toggle="tab"
						data-bs-target="#pendientes" type="button" role="tab"
						aria-controls="pendientes" aria-selected="false">Materias
						Pendientes</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="completas-tab" data-bs-toggle="tab"
						data-bs-target="#completas" type="button" role="tab"
						aria-controls="completas" aria-selected="false">Materias
						Completas</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="encurso" role="tabpanel"
					aria-labelledby="encurso-tab">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Materia</th>
									<th>Año</th>
									<th>Cuatrimestre</th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Programación I</td>
									<td>2023</td>
									<td>1</td>
									<td>
										<button class="btn btn-danger btn-sm">Dar de baja</button>
										<button class="btn btn-primary btn-sm" data-bs-toggle="modal"
											data-bs-target="#uploadGradeModal">Cargar nota</button>
									</td>
								</tr>
								<tr>
									<td>Matemática Discreta</td>
									<td>2023</td>
									<td>1</td>
									<td>
										<button class="btn btn-danger btn-sm">Dar de baja</button>
										<button class="btn btn-primary btn-sm" data-bs-toggle="modal"
											data-bs-target="#uploadGradeModal">Cargar nota</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<%@ page import="java.util.Map" %>


<div class="tab-pane fade" id="pendientes" role="tabpanel" aria-labelledby="pendientes-tab">
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Materia</th>
                    <th>Año</th>
                    <th>Cuatrimestre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<MateriasEstudiante> materiasPendientes = (List<MateriasEstudiante>) request.getAttribute("materiasPendientes");
                    if (materiasPendientes != null && !materiasPendientes.isEmpty()) {
                        for (MateriasEstudiante materia : materiasPendientes) {
                %>
                <tr>
                    <td><%= materia.getNombre_materia() %></td>
                    <td><%= materia.getAño_materia() %></td>
                    <td><%= materia.getCuatrimestre_materia() %></td>
                    <td>
                        <button class="btn btn-success btn-sm">Cursar</button>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">No hay materias pendientes.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>




				<div class="tab-pane fade" id="completas" role="tabpanel"
					aria-labelledby="completas-tab">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Materia</th>
									<th>Año</th>
									<th>Cuatrimestre</th>
									<th>Nota Final</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Introducción a la Programación</td>
									<td>2022</td>
									<td>2</td>
									<td>8</td>
								</tr>
								<tr>
									<td>Álgebra</td>
									<td>2022</td>
									<td>2</td>
									<td>7</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal para cargar nota -->
		<div class="modal fade" id="uploadGradeModal" tabindex="-1"
			aria-labelledby="uploadGradeModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="uploadGradeModalLabel">Cargar
							Nota</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="uploadGradeForm">
							<div class="mb-3">
								<label for="gradeFile" class="form-label">Subir
									comprobante (PDF, JPEG, o PNG)</label> <input type="file"
									class="form-control" id="gradeFile"
									accept=".pdf,.jpeg,.jpg,.png" required>
							</div>
							<div class="mb-3">
								<label for="gradeValue" class="form-label">Nota obtenida</label>
								<input type="number" class="form-control" id="gradeValue"
									min="0" max="10" step="0.1" required>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" form="uploadGradeForm"
							class="btn btn-primary">Cargar Nota</button>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>