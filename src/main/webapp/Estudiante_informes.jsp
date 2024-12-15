<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informes de Estudiantes</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Barra de progreso personalizada */
        .custom-progress-bar {
            height: 20px;
            font-size: 14px;
            line-height: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Informes de Estudiantes</h2>
        
        <!-- Pestañas -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="listado-tab" data-bs-toggle="tab" href="#listado" role="tab" aria-controls="listado" aria-selected="true">Listado Completo</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="ciudad-tab" data-bs-toggle="tab" href="#ciudad" role="tab" aria-controls="ciudad" aria-selected="false">Estudiantes por Ciudad</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="casa-tab" data-bs-toggle="tab" href="#casa" role="tab" aria-controls="casa" aria-selected="false">Estudiantes por Casa</a>
            </li>
        </ul>

        <!-- Contenido de las pestañas -->
        <div class="tab-content mt-3" id="myTabContent">
            <!-- Listado Completo -->
            <div class="tab-pane fade show active" id="listado" role="tabpanel" aria-labelledby="listado-tab">
                <h4>Listado Completo de Estudiantes</h4>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Progreso</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Ejemplo de fila con barras de progreso -->
                            <tr>
                                <td>1</td>
                                <td>Juan</td>
                                <td>Pérez</td>
                                <td>
                                    <div class="progress custom-progress-bar">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 80%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">80% Aprobado</div>
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20% Desaprobado</div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Estudiantes por Ciudad -->
            <div class="tab-pane fade" id="ciudad" role="tabpanel" aria-labelledby="ciudad-tab">
                <h4>Estudiantes por Ciudad</h4>
                <div class="accordion" id="accordionCiudad">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingBuenosAires">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseBuenosAires" aria-expanded="true" aria-controls="collapseBuenosAires">
                                Buenos Aires
                            </button>
                        </h2>
                        <div id="collapseBuenosAires" class="accordion-collapse collapse show" aria-labelledby="headingBuenosAires">
                            <div class="accordion-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Progreso</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>María</td>
                                            <td>González</td>
                                            <td>
                                                <div class="progress custom-progress-bar">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 70%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">70% Aprobado</div>
                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30% Desaprobado</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Estudiantes por Casa -->
            <div class="tab-pane fade" id="casa" role="tabpanel" aria-labelledby="casa-tab">
                <h4>Estudiantes por Casa</h4>
                
                <!-- Selector de Ciudad -->
                <div class="mb-3">
                    <label for="selectCiudad" class="form-label">Seleccionar Ciudad</label>
                    <select class="form-select" id="selectCiudad" onchange="mostrarCasas()">
                        <option value="">Seleccione una ciudad</option>
                        <option value="BuenosAires">Buenos Aires</option>
                        <option value="Cordoba">Córdoba</option>
                        <option value="Rosario">Rosario</option>
                    </select>
                </div>

                <!-- Contenido de Casas -->
                <div id="casasContenido"></div>
            </div>
        </div>
    </div>

    <script>
        // Función para mostrar las casas según la ciudad seleccionada
        function mostrarCasas() {
            const ciudad = document.getElementById('selectCiudad').value;
            const casasContenido = document.getElementById('casasContenido');

            if (ciudad === "") {
                casasContenido.innerHTML = "";  // Si no hay ciudad seleccionada, no mostrar nada
                return;
            }

            let contenido = `<h5>Casas en ${ciudad}</h5>`;
            contenido += `<div class="accordion" id="accordionCasas">`;

            // Aquí simulamos la carga de casas basadas en la ciudad seleccionada
            if (ciudad === "BuenosAires") {
                contenido += `
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingCasa1">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCasa1" aria-expanded="true" aria-controls="collapseCasa1">
                                Casa 1
                            </button>
                        </h2>
                        <div id="collapseCasa1" class="accordion-collapse collapse show" aria-labelledby="headingCasa1">
                            <div class="accordion-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Progreso</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Lucas</td>
                                            <td>Martínez</td>
                                            <td>
                                                <div class="progress custom-progress-bar">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">90% Aprobado</div>
                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 10%;" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">10% Desaprobado</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                `;
            } else if (ciudad === "Cordoba") {
                contenido += `
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingCasa2">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCasa2" aria-expanded="true" aria-controls="collapseCasa2">
                                Casa 2
                            </button>
                        </h2>
                        <div id="collapseCasa2" class="accordion-collapse collapse show" aria-labelledby="headingCasa2">
                            <div class="accordion-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Progreso</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Pedro</td>
                                            <td>Gómez</td>
                                            <td>
                                                <div class="progress custom-progress-bar">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 85%;" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">85% Aprobado</div>
                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 15%;" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">15% Desaprobado</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                `;
            } else if (ciudad === "Rosario") {
                contenido += `
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingCasa3">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCasa3" aria-expanded="true" aria-controls="collapseCasa3">
                                Casa 3
                            </button>
                        </h2>
                        <div id="collapseCasa3" class="accordion-collapse collapse show" aria-labelledby="headingCasa3">
                            <div class="accordion-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Progreso</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Laura</td>
                                            <td>Pérez</td>
                                            <td>
                                                <div class="progress custom-progress-bar">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">75% Aprobado</div>
                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25% Desaprobado</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                `;
            }

            contenido += `</div>`;  // Cerrar el acordeón
            casasContenido.innerHTML = contenido;
        }
    </script>

</body>
</html>
