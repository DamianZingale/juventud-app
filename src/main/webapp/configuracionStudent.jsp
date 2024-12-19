<%@ page import="models.Estudiante" %>
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
<title>Configuracion</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href=".juventud-app\src\main\webapp\css\configuracionStudent.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/editarPerfilStudent.css">
<script type="text/javascript">
function PopUp() {
  confirm("Contraseña actual incorrecta");
}
</script>
<script type="text/javascript">
function PopUp2() {
  confirm("Cambio de contraseña exitoso");
}
</script>
  </head>
  <body>
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
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"	href="./configuracionStudent.jsp">Configuración</a></li>
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

	<div class="container py-5">
		<h1 class="text-center mb-5">Configuración</h1>

		<div class="row g-4">
			<div class="col-md-6 mx-auto">
				<div class="card mb-4">
					<div class="card-header">
						<h5 class="card-title mb-0">Seguridad</h5>
					</div>
					<div class="card-body">
						<form method="get" action="CambioPassword">
							<div class="mb-3">
								<label for="currentPassword" class="form-label">Contraseña
									actual</label> 
								<input type="password" class="form-control"
									name="currentPassword" required>
							</div>
							<div class="mb-3">
								<label for="newPassword" class="form-label">Nueva
									contraseña</label> 
                                <input type="password" class="form-control" name="newPassword" required minlength="8" title="La contraseña debe tener al menos 8 caracteres.">
							</div>
							<div class="mb-3">
								<label for="confirmPassword" class="form-label">Confirmar
									nueva contraseña</label> 
                                <input type="password" class="form-control" name="confirmPassword" required minlength="8" title="La contraseña debe tener al menos 8 caracteres.">
							</div>
							<button type="submit" class="btn btn-primary" name="btnCambiar" value="<%= E.getUserName() %>">Cambiar
								contraseña</button>
							
                            <script type="text/javascript">	
							$('[name="confirmPassword"]').blur(function() {
							    var pw1 = $('[name="newPassword"]').val();
							    var pw2 = $('[name="confirmPassword"]').val();
							    if(pw2 != pw1) {
							        alert('La nueva contraseña no coinciden');
							    }
							});
							</script>
							
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