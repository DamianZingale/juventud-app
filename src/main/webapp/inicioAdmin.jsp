<%@page import="models.Usuario"%>
<%@page import="models.Administrador"%>
<%@page import="models.Estudiante"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css"
	href="./css/inicioAdmin.css">
  </head>
  <body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicioAdmin.jsp">Gesti�n de estudiantes</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="agregarStudent.jsp">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletCasas?Action=1">Casas</a></li>
                        <li class="nav-item"><a class="nav-link" href="planesEstudio.jsp">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="informes.jsp">Informes</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletestudiantesListado?Action=1">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <title>Bienvenido administrador!</title>
  
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

    	if (usuario instanceof Administrador) {
        	Administrador admin = (Administrador) usuario;
        	nombreUsuario = admin.getNombre();
        	apellidoUsuario = admin.getApellido();
        	correoUsuario = admin.getEmail();
    	} else if (usuario instanceof Estudiante) {
        	Estudiante estudiante = (Estudiante) usuario;
        	nombreUsuario = estudiante.getNombre();
        	apellidoUsuario = estudiante.getApellido();
        	correoUsuario = estudiante.getEmail();
    	}
		%>
        <p><strong><%= nombreUsuario + " " + apellidoUsuario %></strong></p>
		<p title="<%= correoUsuario %>"><%= correoUsuario %></p>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item text-danger" href="LoguinOut">Cerrar sesi�n</a>
      </div>
    </div>
  </div>
</nav>

<!-- Contenido principal -->
<div class="menu-container py-4">
  <ul class="menu-list list-unstyled text-center">
    <li><a href="agregarStudent.jsp">Agregar nuevo estudiante</a></li>
    <li><a href="ServletCasas?Action=1">Casas</a></li>
    <li><a href="planesEstudio.jsp">Planes de estudio</a></li>
    <li><a href="informes.jsp">Informes</a></li>
    <li><a href="ServletestudiantesListado?Action=1">Ver estudiantes</a></li>
  </ul>
</div>

<!-- Footer -->
<footer class="footer text-center bg-primary text-white py-3">
  <div class="container">
    <div class="row justify-content-around">
      <!-- Contact Info -->
      <div class="col-md-4">
        <h5>Informaci�n de contacto</h5>
        <address>
          <p>Email: <a href="mailto:example@example.com" class="text-white">example@example.com</a></p>
          <p>Tel�fono: <a href="tel:+1234567890" class="text-white">+54 (2281) 567-890</a></p>
        </address>
      </div>
      <!-- Social Media Links -->
      <div class="col-md-4">
        <h5>S�guenos en nuestras redes sociales</h5>
        <nav class="social-icons" aria-label="Social media links">
          <ul class="list-inline">
            <li class="list-inline-item"><a href="https://facebook.com" target="_blank" aria-label="Facebook" class="text-white"> <i class="fab fa-facebook"></i></a></li>
            <li class="list-inline-item"><a href="https://instagram.com" target="_blank" aria-label="Instagram" class="text-white"> <i class="fab fa-instagram"></i></a></li>
          </ul>
        </nav>
      </div>
    </div>
    <hr class="bg-white">
    <p>2024 Your Company. All rights reserved.</p>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
