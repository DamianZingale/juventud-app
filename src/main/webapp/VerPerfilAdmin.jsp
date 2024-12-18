<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.EstudianteListado"%>
<%@page import="models.Referente"%>
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
		$('#table_id').DataTable();
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
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menú Principal</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="agregarStudent.jsp">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="localidades.jsp">Casas</a></li>
                        <li class="nav-item"><a class="nav-link" href="planesEstudio.jsp">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="estudiantesListado.jsp">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
<%
	List<Referente> listR = new ArrayList<Referente>();
	EstudianteListado e = new EstudianteListado();
	Historia_Clinica c = new Historia_Clinica();
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
                            <input type="text" class="form-control" value="<%= c.getEnfermedades_preexistentes() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Medicaciones</label>
                            <input type="text" class="form-control" value="<%= c.getMedicaciones() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Operaciones</label>
                            <input type="text" class="form-control" value="<%= c.getOperaciones() %>" readonly="readonly">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Alergias</label>
                            <input type="text" class="form-control" value="<%= c.getAlergias() %>" readonly="readonly">
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