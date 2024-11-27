<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Estudiante"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planes de Estudio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/planesEstudio.css">
</head>
<body>
    <!-- Barra de Bienvenida -->
    <div class="welcome-bar">
        Estudiantes
    </div>
<%
	List<Estudiante> listE = new ArrayList<Estudiante>();
	if (request.getAttribute("listaEst") != null) {
	listE = (List<Estudiante>) request.getAttribute("listaEst");
	}
%>
    <!-- Contenedor Principal -->
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary">Listado de Estudiantes</h2>
            <button class="btn btn-primary" onclick="window.location.href='agregarStudent.jsp'">Agregar un nuevo estudiante</button>
        </div>

        <!-- Tabla de Planes -->
        <form method="GET" action="ServletestudiantesListado">
            <table class="table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Seleccionar</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Dni</th>
                        <th scope="col">Nombre de la Carrera que cursa</th>
                    </tr>
                    <%
                    	for(Estudiante e : listE) {
                    %>
                    <tr>
                    	<th scope="col"></th>
                    	<th scope="col"><% e.getNombre(); %></th>
                    	<th scope="col"><% e.getApellido(); %></th>
                    	<th scope="col"><% e.getDNI(); %></th>
                    	<th scope="col"></th>
                    </tr>
                    <%
                    	}
                    %>
                </thead>

            </table>

            <!-- Botones de acción -->
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-warning mr-2" name="action" value="edit">Editar Seleccionado</button>
                <button type="submit" class="btn btn-danger" name="action" value="delete">Eliminar Seleccionado</button>
            </div>
        </form>
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