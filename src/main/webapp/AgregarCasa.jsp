<%@page import="models.Ciudad"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Agregar Casa</title>
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
function PopUp() {
  confirm("La Casa ingresada ya existe");
  window.location.href = "ServletCasas?Action=1";
}
</script>
<script type="text/javascript">
function PopUp2() {
  confirm("Casa ingresada exitosamente");
  window.location.href = "ServletCasas?Action=1";
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
%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicioAdmin.jsp">Gesti�n de estudiantes</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Men� Principal</h5>
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
<div class="container">
    <div class="card">
        <div class="card-header">
            Agregar Casa
        </div>
<%
	Ciudad c = new Ciudad();
	if(request.getAttribute("Ciudad") != null)
	{
		c = (Ciudad)request.getAttribute("Ciudad");
	}
%>
        <div class="card-body">
        	<form method="get" action="ServletCasas">
           	 	<div class="mb-3">
                    <label class="form-label">Ingrese el nombre:</label>
                    <input type="text" class="form-control" name="txtNombre" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ingrese Direccion:</label>
                    <input type="text" class="form-control" name="txtDireccion" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ciudad:</label>
                    <input type="text" class="form-control" name="txtCiudad" value="<%= c.getNombre_ciudad() %>" readonly="readonly" required>
                    <input type="hidden" name="IdCiudad" value="<%= c.getId_ciudad() %>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ingrese Capacidad:</label>
                    <input type="text" onkeypress="return /[0-9]/i.test(event.key)" class="form-control" name="txtCapacidad" required>
                </div>
                <button type="submit" class="btn btn-primary" name="Action" value="4">Agregar Casa</button>
           </form>
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
                    <p>Email: <a href="mailto:example@example.com">example@example.com</a></p>
                    <p>Tel�fono: <a href="tel:+1234567890">+54 (2281) 567-890</a></p>
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