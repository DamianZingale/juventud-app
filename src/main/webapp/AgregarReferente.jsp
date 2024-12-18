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
<%
Estudiante E = (Estudiante) session.getAttribute("usuario");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Dashboard Estudiantil</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menú</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
							<li class="nav-item"><a class="nav-link" href="homeStudent.jsp">Inicio</a></li>
							<li class="nav-item"><a class="nav-link" href="./perfilStudent.jsp">Perfil</a></li>
							<li class="nav-item"><a class="nav-link" href="./configuracionStudent.jsp">Configuración</a></li>
							<li class="nav-item"><a class="nav-link active" aria-current="page"	href="ServletDatosAdicionales?Action=1&Id=<%= E.getId_usuario() %>">Datos adicionales (Obligatorio)</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
<%
	List<Referente> listR = new ArrayList<Referente>();
	if (request.getAttribute("listaRef") != null) {
	listR = (List<Referente>) request.getAttribute("listaRef");
	}
%>
<div class="container py-5">
    <h1 class="text-center mb-5"></h1>

    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Información Adicional</h5>
                </div>
                <div class="card-body">
                	<form method="get" action="ServletDatosAdicionales">
                        <div style="text-align: center;">
                            <label style="text-align: center;" class="form-label">Agregar Referentes</label>
                        </div>
                        
                        <div class="mb-3">
                        	<input type="hidden" name="Id" value="<%= E.getId_usuario() %>">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="txtNombre" class="form-control"required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Apellido</label>
                            <input type="text" name="txtApellido" class="form-control"required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">DNI</label>
                            <input type="text" name="txtDNI" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Domicilio</label>
                            <input type="text" name="txtDomicilio" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Telefono (Ej: 2281758693)</label>
                            <input type="text" name="txtTelefono" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Rol (Ej: Madre, Padre, Etc)</label>
                            <input type="text" name="txtRol" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary" name="Action" value="3">Agregar referente</button>
                        </div>
                        
                    </form>    
                    
                        <%
                        if(!listR.isEmpty())
	                    {
                        %>
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
				                        <th scope="col"></th>
				                    </tr>
				                </thead>
				                <tbody>     
				                    <%
				                    	for(Referente r : listR) {
				                    %>
				                    <tr>
				                    	<th scope="col"><%= r.getNombre() %></th>
				                    	<th scope="col"><%= r.getApellido() %></th>
				                    	<th scope="col"><%= r.getDNI() %></th>
				                    	<th scope="col"><%= r.getDomicilio() %></th>
				                    	<th scope="col"><%= r.getTelefono() %></th>
				                    	<th scope="col"><%= r.getRol() %></th>
				                    	<th scope="col"><button type="submit" class="btn btn-danger" name="btnEliminar" onclick="window.location.href='ServletDatosAdicionales?Action=4&IdR=<%= r.getId_referente() %>&IdU=<%= E.getId_usuario() %>'">Eliminar</button></th>
				                    </tr>
				                    <%
				                    	}
				                    %>
				   				</tbody>
				            </table>
                        </div>
                        <%
	                    }
                        %>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary" style="float: rigth;" name="btnGuardar" onclick="window.location.href='homeStudent.jsp'">Guardar y Finalizar</button>
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