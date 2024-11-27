<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Juventud</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/editarPerfilStudent.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Agregar nuevo Estudiante - Dashboard Estudiantil</a>
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
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="inicioAdmin.jsp">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="agregarStudent.jsp">Agregar Nuevo Estudiante</a></li>
                        <li class="nav-item"><a class="nav-link" href="localidades.jsp">Casas</a></li>
                        <li class="nav-item"><a class="nav-link" href="planesEstudio.jsp">Planes de estudio</a></li>
                        <li class="nav-item"><a class="nav-link" href="estudiantesListado.jsp">Listado de estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

<div class="container py-5">
    <h1 class="text-center mb-5">AGREGAR NUEVO ESTUDIANTE</h1>

    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Información Personal</h5>
                </div>
                <div class="card-body">
                    <form action="ServletAgregarStudent" method="get">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Primer y segundo nombre si corresponde</label>
                            <input type="text" class="form-control" id="nombres" value="Pepe" required>
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido/s</label>
                            <input type="text" class="form-control" id="apellido" value="Argento" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="DNI" class="form-label">DNI</label>
                            <input type="text" class="form-control" id="DNI" pattern="\d{2}\.\d{3}\.\d{3}\.\d{2}" value="23.322.332.32" required>
                        </div>

                        <div class="mb-3">
                            <label for="mail" class="form-label">E-mail</label>
                            <input type="email" class="form-control" id="mail" value="pepargento@padredefamilia.com" required>
                        </div>

                        <div class="mb-3">
                            <label for="username" class="form-label">Nombre de usuario</label>
                            <input type="text" class="form-control" id="username" value="PepeArgen" required>
                        </div>

                        <!-- Dropdown para seleccionar Ciudad -->
                        <div class="mb-3">
                            <label for="ciudad" class="form-label">Selecciona una ciudad</label>
                            <select class="form-control" id="ciudad" onchange="actualizarCasas()" required>
                                <option value="">Seleccione una ciudad</option>
                                <option value="Azul">Azul</option>
                                <option value="Olavarria">Olavarria</option>
                                <option value="Capital">Capital</option>
                                <option value="LaPlata">La Plata</option>
                            </select>
                        </div>

                        <!-- Dropdown dependiente de Casas -->
                        <div class="mb-3">
                            <label for="casa" class="form-label">Selecciona una casa</label>
                            <select class="form-control" id="casa" required>
                                <option value="">Seleccione una casa</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Contraseña</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" placeholder="Introduce tu contraseña" required minlength="8"
                                       pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" title="La contraseña debe tener al menos 8 caracteres, una letra mayúscula, una letra minúscula, un número y un carácter especial.">
                                <span class="input-group-text" id="togglePassword">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </span>
                            </div>
                        </div>

                        <script>
                            // Función para mostrar u ocultar la contraseña
                            const togglePassword = document.getElementById('togglePassword');
                            const passwordField = document.getElementById('password');

                            togglePassword.addEventListener('click', function () {
                                const type = passwordField.type === 'password' ? 'text' : 'password';
                                passwordField.type = type;

                                this.innerHTML = type === 'password' ? '<i class="fa fa-eye"></i>' : '<i class="fa fa-eye-slash"></i>';
                            });

                            // Función para actualizar las casas según la ciudad seleccionada
                            function actualizarCasas() {
                                var ciudad = document.getElementById("ciudad").value;
                                var casaSelect = document.getElementById("casa");

                                // Limpiar las opciones previas
                                casaSelect.innerHTML = "<option value=''>Seleccione una casa</option>";

                                // Opciones para cada ciudad
                                var casas = {
                                    "Azul": ["Casa 1", "Casa 2", "Casa 3", "Casa 4"],
                                    "Olavarria": ["Casa 1", "Casa 2"],
                                    "Capital": ["Casa 1", "Casa 2", "Casa 3"],
                                    "LaPlata": ["Casa 1", "Casa 2", "Casa 3", "Casa 4", "Casa 5"]
                                };

                                
                                if (casas[ciudad]) {
                                    casas[ciudad].forEach(function(casa) {
                                        var option = document.createElement("option");
                                        option.value = casa;
                                        option.textContent = casa;
                                        casaSelect.appendChild(option);
                                    });
                                }
                            }
                        </script>
					<div class="d-flex justify-content-end">
       				 <button type="submit" class="btn btn-success mr-2" name="action" value="add">Agregar Estudiante</button>
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
