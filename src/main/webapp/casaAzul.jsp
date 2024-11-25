<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Casas en Azul</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css"
	href="./css/casasAzul.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  </head>
  <body>
<div class="container">
    <div class="card">
        <div class="card-header">
            Casas en Azul
        </div>
        <div class="card-body">
            <form method="post" action="CasasServlet">
                <div class="form-group">
                    <label for="casaId">Seleccione una casa:</label>
                    <select name="casaId" id="casaId" class="form-control">
                        <option value="1">Casa 1 - 25 de Mayo 990</option>
                        <option value="2">Casa 2 - Rivadavia -330</option>
                        <option value="3">Casa 3 - Mitre 150</option>
                        <option value="4">Casa 4 - Entre Ríos 100</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Mostrar Integrantes</button>
            </form>

            <c:if test="${not empty integrantes}">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Nombre y Apellido</th>
                        <th>DNI</th>
                        <th>Carrera Cursando</th>
                        <th>Años en Curso</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="persona" items="${integrantes}">
                        <tr>
                            <td>${persona.nombre}</td>
                            <td>${persona.dni}</td>
                            <td>${persona.carrera}</td>
                            <td>${persona.años}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty integrantes}">
                <p class="text-danger">Esta casa está vacía.</p>
            </c:if>
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