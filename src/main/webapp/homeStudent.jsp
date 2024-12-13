<%@ page import="models.Estudiante" %>
<%@ page import="models.PlanEstudio" %>

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
<title>Juventud</title>
<link rel="stylesheet" type="text/css" href="./css/homeStudent.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<header>

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
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="homeStudent.jsp">Inicio</a></li>
							<li class="nav-item"><a class="nav-link"
								href="./perfilStudent.jsp">Perfil</a></li>
							<li class="nav-item"><a class="nav-link"
								href="./configuracionStudent.jsp">Configuración</a></li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div class="container-fluid p-0">
		<div class="section-hero mb-4">
			<div class="text-center">
			<%
        Estudiante E = (Estudiante) session.getAttribute("usuario");
        if (E != null) { 
    %>
        <h1 class="display-4"><%= E.getNombre() + " " + E.getApellido() %></h1>
        <p class="lead">Carrera no disponible</p>
    <%
        } else { 
    %>
        <h1 class="display-4">Nombre no disponible</h1>
        <p class="lead">Carrera no disponible</p>
    <%
        }
    %>
			</div>
		</div>

		<div class="container section-tabs">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="encurso-tab"
						data-bs-toggle="tab" data-bs-target="#encurso" type="button"
						role="tab" aria-controls="encurso" aria-selected="true">Materias
						en Curso</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pendientes-tab" data-bs-toggle="tab"
						data-bs-target="#pendientes" type="button" role="tab"
						aria-controls="pendientes" aria-selected="false">Materias
						Pendientes</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="completas-tab" data-bs-toggle="tab"
						data-bs-target="#completas" type="button" role="tab"
						aria-controls="completas" aria-selected="false">Materias
						Completas</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="encurso" role="tabpanel"
					aria-labelledby="encurso-tab">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Materia</th>
									<th>Año</th>
									<th>Cuatrimestre</th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Programación I</td>
									<td>2023</td>
									<td>1</td>
									<td>
										<button class="btn btn-danger btn-sm">Dar de baja</button>
										<button class="btn btn-primary btn-sm" data-bs-toggle="modal"
											data-bs-target="#uploadGradeModal">Cargar nota</button>
									</td>
								</tr>
								<tr>
									<td>Matemática Discreta</td>
									<td>2023</td>
									<td>1</td>
									<td>
										<button class="btn btn-danger btn-sm">Dar de baja</button>
										<button class="btn btn-primary btn-sm" data-bs-toggle="modal"
											data-bs-target="#uploadGradeModal">Cargar nota</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="pendientes" role="tabpanel"
					aria-labelledby="pendientes-tab">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Materia</th>
									<th>Año</th>
									<th>Cuatrimestre</th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Álgebra Lineal</td>
									<td>2023</td>
									<td>2</td>
									<td>
										<button class="btn btn-success btn-sm">Cursar</button>
									</td>
								</tr>
								<tr>
									<td>Física I</td>
									<td>2023</td>
									<td>2</td>
									<td>
										<button class="btn btn-success btn-sm">Cursar</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="completas" role="tabpanel"
					aria-labelledby="completas-tab">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Materia</th>
									<th>Año</th>
									<th>Cuatrimestre</th>
									<th>Nota Final</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Introducción a la Programación</td>
									<td>2022</td>
									<td>2</td>
									<td>8</td>
								</tr>
								<tr>
									<td>Álgebra</td>
									<td>2022</td>
									<td>2</td>
									<td>7</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal para cargar nota -->
		<div class="modal fade" id="uploadGradeModal" tabindex="-1"
			aria-labelledby="uploadGradeModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="uploadGradeModalLabel">Cargar
							Nota</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form id="uploadGradeForm">
							<div class="mb-3">
								<label for="gradeFile" class="form-label">Subir
									comprobante (PDF, JPEG, o PNG)</label> <input type="file"
									class="form-control" id="gradeFile"
									accept=".pdf,.jpeg,.jpg,.png" required>
							</div>
							<div class="mb-3">
								<label for="gradeValue" class="form-label">Nota obtenida</label>
								<input type="number" class="form-control" id="gradeValue"
									min="0" max="10" step="0.1" required>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" form="uploadGradeForm"
							class="btn btn-primary">Cargar Nota</button>
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
						<p>
							Email: <a href="mailto:example@example.com">example@example.com</a>
						</p>
						<p>
							Teléfono: <a href="tel:+1234567890">+54 (2281) 567-890</a>
						</p>
					</address>
				</div>
				<!-- Social Media Links -->
				<div class="col-md-4">
					<h5>Siguenos en nuestras redes sociales</h5>
					<nav class="social-icons" aria-label="Social media links">
						<ul class="list-inline">
							<li class="list-inline-item"><a href="https://facebook.com"
								target="_blank" aria-label="Facebook"> <svg class="icon"
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path
											d="M512 256C512 114.6 397.4 0 256 0S0 114.6 0 256C0 376 82.7 476.8 194.2 504.5V334.2H141.4V256h52.8V222.3c0-87.1 39.4-127.5 125-127.5c16.2 0 44.2 3.2 55.7 6.4V172c-6-.6-16.5-1-29.6-1c-42 0-58.2 15.9-58.2 57.2V256h83.6l-14.4 78.2H287V510.1C413.8 494.8 512 386.9 512 256h0z" />
                    </svg>
							</a></li>
							<li class="list-inline-item"><a href="https://instagram.com"
								target="_blank" aria-label="Instagram"> <svg class="icon"
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                        <path
											d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z" />
                    </svg>
							</a></li>
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