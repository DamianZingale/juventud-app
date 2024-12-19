<%@ page import="java.util.List" %>
<%@ page import="models.MateriasPorAño" %>
<%@page import="models.Usuario"%>
<%@page import="models.Administrador"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle del Plan de Estudio</title>
    <style>
          body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        h1, h2 {
            text-align: center;
            color: #000; /* Negro */
        }
        table {
            width: 60%;
            margin: 40px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #008CBA; /* Celeste */
            color: #fff;
        }
        .tabla-detalle td {
            background-color: #e0f7ff; /* Fondo m�s claro */
        }
        /* Estilo para inputs no editables */
        input[readonly] {
            width: calc(100% - 10px); /* Ajusta el ancho para evitar desbordes */
            box-sizing: border-box; /* Incluye padding y border en el c�lculo del ancho */
            font-size: 18px; /* Tama�o de letra m�s grande */
            padding: 10px;
            border: none; /* Sin contorno */
            border-radius: 4px; /* Bordes redondeados */
            background-color: #e0f7ff; /* Celeste claro */
            color: #000; /* Color de texto */
            pointer-events: none; /* Desactiva la interacci�n del usuario */
        }
        .btn {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #000; /* Negro */
            color: #fff;
            text-decoration: none;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #333;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }
    </style>
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
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu Principal</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <li class="nav-item"><a class="nav-link" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletAgregarStudent?Action=1">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletCasas?Action=1">Casas</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="ServletPlanesEstudio?btnMostrarActivos=Planes+Activos">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="informes.jsp">Informes</a></li>
                        <li class="nav-item"><a class="nav-link" href="ServletestudiantesListado?Action=1">Listado de estudiantes</a></li>
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
        <a class="dropdown-item text-danger" href="LoguinOut">Cerrar sesion</a>
      </div>
    </div>
  </div>
</nav>

<h1>Detalle del Plan de Estudio</h1>
<table class="tabla-detalle">
    <form method="post" action="ServletPlanesEstudio">
        <tr>
            <th>ID Plan</th>
            <td><input type="text" class="form-control" name="idPlanSeleccionado" value="${plan.idPlan}" readonly></td>
        </tr>
        <tr>
            <th>Institucion</th>
            <td><input type="text" class="form-control" id="institucion" name="txtCamb_Institucion" value="${plan.institucion}" readonly></td>
        </tr>
        <tr>
            <th>Carrera</th>
            <td><input type="text" class="form-control" id="carrera" name="txtCamb_Carrera" value="${plan.carrera}" readonly></td>
        </tr>
          <tr>
            <th>Resolucion</th>
            <td><input type="text" class="form-control" id="carrera" name="txtCamb_Resolucion" value="${plan.resolucion}" readonly></td>
        </tr>
        <tr>
            <th>Cantidad de Años</th>
            <td><input type="number" class="form-control" id="cantidadAnios" name="txtCamb_CantidadAnios" value="${plan.cantidadAnios}" readonly></td>
        </tr>
       
    </form>
</table>

<h2>Materias por Año</h2>
<table>
    <thead>
        <tr>
            <th>Año</th>
            <th>Materia</th>
            <th>Periodo</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Obtenemos la lista de materias desde el request o session
            List<MateriasPorAño> materiasPorAño = (List<MateriasPorAño>) request.getAttribute("materiasPorAño");
            
            // Verificamos que la lista no sea null y tenga elementos
            if (materiasPorAño != null) {
                for (MateriasPorAño materia : materiasPorAño) {
        %>
            <tr>
                <td><%= materia.getAñoCursada() %></td>
                <td><%= materia.getMateria() %></td>
                <td><%= materia.getPeriodo() %></td>
             
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="2">No hay materias para mostrar.</td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>

<div class="btn-container">
    <a href="paginaAnterior.jsp" class="btn">Volver</a>
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

</body>
</html>
