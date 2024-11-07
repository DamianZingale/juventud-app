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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/perfilStudent.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Perfil - Dashboard Estudiantil</a>
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
	<div class="container py-5">
		<div class="row g-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Información Personal</h5>
					</div>
					<div class="card-body">
						<div class="text-center mb-4">
							<img src="https://via.placeholder.com/128" alt="Foto de perfil"
								class="rounded-circle profile-image mb-3">
							<h2 class="fs-4 fw-bold">Homero J. Simpson</h2>
							<p class="text-muted">Estudiante de Ingeniería en Sistemas</p>
							<button class="btn btn-primary">
								<a class="btn btn-primary" aria-current="page"
									href="editarPerfilStudent.jsp">Editar Perfil</a>
							</button>
						</div>
						<div class="mt-4">
							<p>
								<strong>Email:</strong> homersimpson@springfield.us
							</p>
							<p>
								<strong>Teléfono:</strong> +54 11 1234-5678
							</p>
							<p>
								<strong>Fecha de Nacimiento:</strong> 12 de mayo, de 1956
							</p>
							<p>
								<strong>Dirección:</strong> Av. Siempreviva 742, Springfield
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Información Académica</h5>
					</div>
					<div class="card-body">
						<div class="mb-3">
							<p class="fw-bold mb-1">Carrera</p>
							<p>Ingeniero Nuclear</p>
						</div>
						<div class="mb-3">
							<p class="fw-bold mb-1">Año de Ingreso</p>
							<p>2020</p>
						</div>
						<div class="mb-3">
							<p class="fw-bold mb-1">Promedio General</p>
							<p>8.5</p>
						</div>
						<div>
							<p class="fw-bold mb-1">Progreso de la Carrera</p>
							<div class="progress mb-2">
								<div class="progress-bar" role="progressbar" style="width: 45%;"
									aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">45%</div>
							</div>
							<p class="text-muted small">45% completado</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Materias Cursadas</h5>
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">Introducción a la Programación</li>
							<li class="list-group-item">Álgebra Lineal</li>
							<li class="list-group-item">Cálculo I</li>
							<li class="list-group-item">Física I</li>
							<li class="list-group-item">Estructura de Datos</li>
						</ul>
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