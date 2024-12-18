<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.PlanEstudio" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planes de Estudio</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

    <style>
        .button-container {
            display: flex;
            justify-content: left;
            gap: 10px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="inicioAdmin.jsp">Gestión de estudiantes</a>
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
    <!-- Barra de Bienvenida -->
    <div class="welcome-bar text-center bg-primary text-white py-2">
        <h1>Planes de Estudio</h1>
    </div>

    <!-- Contenedor Principal -->
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-primary">Listado de Todos los Planes </h2>
        
			<form method="get" action="ServletPlanesEstudio">
                <input type="submit" class="btn btn-success" name="btnFormularioAgregarPlan" value="Agregar Nuevo Plan">
            </form>
            </div>
        <!-- Filtro de Planes de Estudio -->
        <div class="button-container">
            

    <form method="get" action="ServletPlanesEstudio">
        <input type="submit" class="btn btn-secondary" name="btnMostrarActivos" value="Planes Activos" >  
    </form>

    <form method="get" action="ServletPlanesEstudio">
        <input type="submit" class="btn btn-secondary" name="btnMostrarInactivos" value="Planes Inactivos">                    
    </form>         
</div>
        <!-- Tabla de Planes -->
        <%
            // Obtener el filtro de estado (mostrar todos o dados de baja)
            String estadoFiltro = request.getParameter("filtroEstado"); 
            ArrayList<PlanEstudio> listaPlanes = (ArrayList<PlanEstudio>) request.getAttribute("planes");

            // Si no se aplica filtro, mostrar todos los planes
            if (listaPlanes != null) {
        %>
        <table class="table table-bordered table-striped" id="tablaPlanes">
            <thead class="thead-dark">
                <tr>
                   
                    <th>ID Plan</th>
                    <th>Institución</th>
                    <th>Carrera</th>
                    <th>Resolucion</th>
                    <th>Cantidad de Años</th>
    
                    
                </tr>
            </thead>
            <tbody>
                <% 
                    for (PlanEstudio plan : listaPlanes) {
                %>
                <tr>
                    
                    <td><%= plan.getIdPlan() %></td>
                    <td><%= plan.getInstitucion() %></td>
                    <td><%= plan.getCarrera() %></td>
                    <td><%= plan.getResolucion() %></td>
                    <td><%= plan.getCantidadAnios() %></td>
                    
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <% 
            } else {
        %>
        <p class="text-center">No hay planes de estudio disponibles.</p>
        <% } %>

        <!-- Botones de Acción -->
        <div class="d-flex justify-content-end">
            <form method="post" action="/Juventud-App/ServletPlanesEstudio">
                <!-- Campo oculto para almacenar el ID del plan seleccionado -->
                <input type="hidden" name="idPlanSeleccionado" id="idPlanSeleccionado"> 
               
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer text-center bg-dark text-white py-3">
        <div class="container">
            <div class="row justify-content-around">
                <!-- Información de Contacto -->
                <div class="col-md-4">
                    <h5>Información de Contacto</h5>
                    <p>Email: <a href="mailto:example@example.com" class="text-white">example@example.com</a></p>
                    <p>Teléfono: <a href="tel:+1234567890" class="text-white">+54 (2281) 567-890</a></p>
                </div>
                <!-- Redes Sociales -->
                <div class="col-md-4">
                    <h5>Síguenos en Redes Sociales</h5>
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a href="https://facebook.com" target="_blank" class="text-white" aria-label="Facebook">
                                <i class="fab fa-facebook"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="https://instagram.com" target="_blank" class="text-white" aria-label="Instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <hr class="bg-light">
            <p>&copy; 2024 Your Company. Todos los derechos reservados.</p>
        </div>
    </footer>

    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

    <!-- Inicialización de DataTable -->
    <script>
        $(document).ready(function() {
            $('#tablaPlanes').DataTable({
                "pageLength": 6, // Número de filas por página por defecto
                "lengthMenu": [[6, 10, 25, 50, -1], [6, 10, 25, 50, "Todos"]], // Opciones del menú desplegable
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json"
                }
            });
        });

        function setSelectedPlan(idPlan) {
            document.getElementById('idPlanSeleccionado').value = idPlan;
        }

        
    function highlightButton(clickedButton) {
        // Obtener todos los botones principales
        var buttons = document.querySelectorAll('.button-container input[type="submit"]');
        
        // Eliminar la clase 'btn-primary' de todos los botones
        buttons.forEach(function(button) {
            button.classList.remove('btn-primary');
            button.classList.add('btn-secondary'); // Restaurar color original
        });

        // Añadir la clase 'btn-primary' al botón que fue clickeado
        clickedButton.classList.add('btn-primary');
        clickedButton.classList.remove('btn-secondary'); // Quitar color original

        // Ocultar todos los botones adicionales inicialmente
        var botonesAdicionales = document.getElementById('botonesAdicionales');
        botonesAdicionales.style.display = 'none';

        // Mostrar botones específicos según el botón seleccionado
        var btnEditarSeleccionado = document.getElementById('btnEditarSeleccionado');
        var btnEliminarSeleccionado = document.getElementById('btnEliminarSeleccionado');
        var btnAltaPlan = document.getElementById('btnAltaPlan');
        
        if (clickedButton.value === "Todos los Planes") {
            // Ocultar todos los botones adicionales
            btnEditarSeleccionado.style.display = 'none';
            btnEliminarSeleccionado.style.display = 'none';
            btnAltaPlan.style.display = 'none';
        } else if (clickedButton.value === "Planes Activos") {
            // Mostrar solo los botones de "Editar seleccionado" y "Eliminar seleccionado"
            btnEditarSeleccionado.style.display = 'inline-block';
            btnEliminarSeleccionado.style.display = 'inline-block';
            btnAltaPlan.style.display = 'none';
        } else if (clickedButton.value === "Planes Inactivos") {
            // Mostrar solo el botón de "Alta de plan"
            btnEditarSeleccionado.style.display = 'none';
            btnEliminarSeleccionado.style.display = 'none';
            btnAltaPlan.style.display = 'inline-block';
        }

        // Mostrar los botones adicionales
        botonesAdicionales.style.display = 'block';
    }
    </script>
</body>

</html>
