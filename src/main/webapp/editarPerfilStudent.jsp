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
<link rel="stylesheet" type="text/css"
	href="./css/editarPerfilStudent.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Editar perfil - Dashboard
				Estudiantil</a>
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
		<h1 class="text-center mb-5">Editar Perfil</h1>

		<div class="row">
			<div class="col-md-8 mx-auto">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">Información Personal</h5>
					</div>
					<div class="card-body">
						<form>
							<div class="text-center mb-4">
								<img src="https://via.placeholder.com/150" alt="Foto de perfil"
									class="profile-image mb-3">
								<div>
									<button class="btn btn-light" data-bs-toggle="modal"
										data-bs-target="#changeProfilePhotoModal">Cambiar
										foto</button>
								</div>
							</div>
							<!-- Modal para cambiar foto de perfil -->
							<div class="modal fade" id="changeProfilePhotoModal"
								tabindex="-1" aria-labelledby="changeProfilePhotoModalLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="changeProfilePhotoModalLabel">Cambiar
												Foto de Perfil</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form id="changeProfilePhotoForm">
												<div class="mb-3">
													<label for="profilePhotoFile" class="form-label">Seleccionar
														nueva foto (JPEG o PNG)</label> <input type="file"
														class="form-control" id="profilePhotoFile"
														accept=".jpeg,.jpg,.png" required>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancelar</button>
											<button type="submit" form="changeProfilePhotoForm"
												class="btn btn-primary">Guardar Cambios</button>
										</div>
									</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="nombre" class="form-label">Nombre completo</label> <input
									type="text" class="form-control" id="nombre"
									value="Homero J Simpson" required>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Correo electrónico</label>
								<input type="email" class="form-control" id="email"
									value="homerosimpson@springfield.us" required>
							</div>

							<div class="mb-3">
								<label for="telefono" class="form-label">Teléfono</label> <input
									type="tel" class="form-control" id="telefono"
									value="+54 11 1234-5678">
							</div>

							<div class="mb-3">
								<label for="fechaNacimiento" class="form-label">Fecha de
									nacimiento</label> <input type="date" class="form-control"
									id="fechaNacimiento" value="1956-05-12">
							</div>

							<div class="mb-3">
								<label for="direccion" class="form-label">Dirección</label> <input
									type="text" class="form-control" id="direccion"
									value="Av. Siempreviva 742, Springfield">
							</div>

							<div class="mb-3">
								<label for="carrera" class="form-label">Carrera</label> <input
									type="text" class="form-control" id="carrera"
									value="Ingieniero Nuclear" readonly>
							</div>

							<div class="mb-3">
								<label for="anioIngreso" class="form-label">Año de
									ingreso</label> <input type="number" class="form-control"
									id="anioIngreso" value="2020" readonly>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Guardar
									cambios</button>
							</div>
						</form>
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
</body>
</html>