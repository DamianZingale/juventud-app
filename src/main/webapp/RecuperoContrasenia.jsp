<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/inicioAdmin.css">

    <!-- Font Awesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <title>Recuperación de Contraseña</title>
    <style>
      .login-container {
        max-width: 600px;
        margin: 80px auto;
        padding: 40px;
        background: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      }
      .welcome-bar {
        background: #007bff;
        color: white;
        text-align: center;
        padding: 20px 0;
        font-size: 1.8rem;
      }
      .btn-login {
        background-color: #007bff;
        color: white;
        padding: 12px;
        font-size: 1.2rem;
      }
      @media (max-width: 768px) {
        .login-container {
          padding: 20px;
        }
        .welcome-bar {
          font-size: 1.4rem;
        }
      }
    </style>
  </head>
  <body>
    <form action="RecuperarContrasenia" method="POST">
      <div class="welcome-bar">
        Recupera tu contraseña
      </div>

      <div class="login-container">
        <h3 class="text-center mb-4">Ingresa tu correo electrónico</h3>
        
        <div class="form-group">
          <label for="email">Correo Electrónico</label>
          <input type="email" id="email" name="txtEmail" class="form-control" placeholder="Ingrese su correo electrónico" required>
          <small class="form-text text-danger" id="emailError" style="display: none;">El correo es requerido.</small>
        </div>
        
        <div class="text-center">
          <button type="submit" name="btnRecuperar" class="btn btn-login btn-block">Ver contraseña</button>
        </div>
        <div class="text-center mt-3">
          <a href="index.jsp" class="text-primary"> <h4> Regresar al inicio de sesión</h4></a>
        </div>
      <div>
    <%
        String contrasenia = (String) request.getAttribute("contrasenia");
        if (contrasenia != null) { 
    %>
        <label id="passwordLabel">
            Su contraseña es: <strong id="passwordText"><%= contrasenia %></strong>
            <button onclick="copyToClipboard()" class="btn btn-primary btn-lg ml-2" title="Copiar al portapapeles">Copiar</button>
        </label>
    <%
        } 
    %>
</div>

<script>
    function copyToClipboard() {
        // Seleccionar el texto de la contraseña
        const passwordText = document.getElementById('passwordText').textContent;

        // Crear un área de texto temporal para copiar al portapapeles
        const tempTextArea = document.createElement('textarea');
        tempTextArea.value = passwordText;
        document.body.appendChild(tempTextArea);

        // Seleccionar y copiar el texto
        tempTextArea.select();
        document.execCommand('copy');

        // Eliminar el área de texto temporal
        document.body.removeChild(tempTextArea);

        // Cambiar el texto del label a "Contraseña copiada"
        const label = document.getElementById('passwordLabel');
        label.innerHTML = '<strong>Contraseña copiada al portapapeles</strong>';
    }
</script>

<script>
  // Mostrar el modal automáticamente al cargar la página
  $(document).ready(function () {
    $('#passwordModal').modal('show');
  });
</script>


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

      <script>
        function validateForm() {
          let isValid = true;
          const email = document.getElementById('email');
          const emailError = document.getElementById('emailError');

          emailError.style.display = 'none';

          if (email.value.trim() === '') {
            emailError.style.display = 'block';
            isValid = false;
          }

          return isValid;
        }
      </script>
    </form>
  </body>
</html>
