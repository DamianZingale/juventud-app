<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Casa"%>
<%@page import="models.PlanEstudio"%>
<%@page import="models.Usuario"%>
<%@page import="models.Administrador"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Juventud</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/editarPerfilStudent.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="./css/inicioAdmin.css">
<script type="text/javascript">
function PopUp() {
	confirm("Estudiante agregado exitosamente");
}
</script>
<script type="text/javascript">
function PopUp2() {
	confirm("DNI ya existente");
}
</script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Agregar nuevo Estudiante - Dashboard Estudiantil</a>
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
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="ServletAgregarStudent?Action=1">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletCasas?Action=1">Casas</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletPlanesEstudio?btnMostrarActivos=Planes+Activos">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="informes.jsp">Informes</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletestudiantesListado?Action=1">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    
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
        <a class="dropdown-item text-danger" href="LoguinOut">Cerrar sesiï¿½n</a>
      </div>
    </div>
  </div>
</nav>

 <%
 	String id;
	if (request.getAttribute("PopUp") != null) {
		
		id = request.getAttribute("PopUp").toString();
		switch (id) {
		case "1":
		{
				%>
					<script type="text/javascript">
					PopUp();
					</script>
				<%
			break;
		}
		case "2":
		{
				%>
					<script type="text/javascript">
					PopUp2();
					</script>
				<%
			break;
		}
		default:
			break;
		}
	}
	List<Casa> listC = new ArrayList<Casa>();
 	List<PlanEstudio> listP = new ArrayList<PlanEstudio>();
	if (request.getAttribute("listCasa") != null) {
		listC = (List<Casa>) request.getAttribute("listCasa");
	}
	if (request.getAttribute("listPlan") != null) {
		listP = (List<PlanEstudio>) request.getAttribute("listPlan");
	}
 %>
<div class="container py-5">
    <h1 class="text-center mb-5">AGREGAR NUEVO ESTUDIANTE</h1>

    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Información Personal</h5>
                </div>
                <div class="card-body">
                    <form action="ServletAgregarStudent" method="get">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Primer y segundo nombre si corresponde</label>
                            <input type="text" class="form-control" name="txtNombres" required>
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido/s</label>
                            <input type="text" class="form-control" name="txtApellido" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Fecha de nacimiento</label>
                            <input type="Date" class="form-control" name="txtFecha" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="DNI" class="form-label">DNI</label>
                            <input type="text" class="form-control" name="txtDNI" required>
                        </div>

                        <div class="mb-3">
                            <label for="mail" class="form-label">E-mail</label>
                            <input type="email" class="form-control" name="txtEmail" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Telefono</label>
                            <input type="text" class="form-control" name="txtTelefono" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Domicilio</label>
                            <input type="text" class="form-control" name="txtDomicilio" required>
                        </div>

                        <!-- Dropdown dependiente de Casas -->
                        <div class="mb-3">
                            <label for="casa" class="form-label">Selecciona una casa</label>
                            <select class="form-control" name="casa" required>
                                <%
			                    	for(Casa C : listC)
			                    	{
			                    %>
			                        	<option value="<%= C.getId_casa() %>"><%= C.getNombre_casa() %> - <%= C.getDireccion() %> (<%= C.getCiudad().getNombre_ciudad() %>)</option>
			                    <%
			                    	}
			                    %>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Selecciona un plan de estudio</label>
                            <select class="form-control" name="plan" required>
                                <%
			                    	for(PlanEstudio P : listP)
			                    	{
			                    %>
			                        	<option value="<%= P.getIdPlan() %>"><%= P.getResolucion() %> - <%= P.getCarrera() %> (<%= P.getInstitucion() %>)</option>
			                    <%
			                    	}
			                    %>
                            </select>
                        </div>

					<div class="d-flex justify-content-end">
       				 <button type="submit" class="btn btn-success mr-2" name="btnAgregarEstudiante" value="add">Agregar Estudiante</button>
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
