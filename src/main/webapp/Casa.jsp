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
  </head>
  <body>
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
                    %>
                        <option value="<%= C.getId_casa() %>"><%= C.getNombre_casa() %> - <%= C.getDireccion() %></option>
                     <%
                    	}
                     %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary" name="btnMostrarCasa" value="<%= IdC %>">Mostrar Integrantes</button>
                <button type="submit" class="btn btn-primary" name="btnAgregarCasa" value="<%= IdC %>">Agregar nueva Casa</button>
                <button type="submit" class="btn btn-primary" name="btnDarBajaCasa">Dar de baja Casa</button>
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