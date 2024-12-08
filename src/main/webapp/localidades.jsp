<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Ciudad"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/localidades.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

    <title>Ciudades</title>
</head>
<body>
    <!-- Barra de Bienvenida -->
    <div class="welcome-bar">
        Ciudades
    </div>
<%
	List<Ciudad> listC = new ArrayList<Ciudad>();
	if (request.getAttribute("listaCiu") != null) {
	listC = (List<Ciudad>) request.getAttribute("listaCiu");
	}
%>
    <!-- Contenedor del Menú -->
    <div class="menu-container">
        <ul class="menu-list">
        <%
        	for(Ciudad C : listC)
        	{
        %>
            <li><a href="ServletCasas?Action=2&Id=<%= C.getId_ciudad() %>"><%= C.getNombre_ciudad() %></a></li>
        <%
        	}
        %>
        </ul>
    </div>

	<div class="menu-container">
			<button type="submit" class="btn btn-primary" onclick="window.location.href = 'AgregarCiudad.jsp'">Agregar nueva ciudad</button>
	</div>
    <footer class="footer text-center">
    <div class="container">
        <div>
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
