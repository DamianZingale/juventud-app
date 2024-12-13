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

    <title>Inicio de Sesión</title>
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
  <form action="Inicio" method="POST">
    <div class="welcome-bar">
      Bienvenido al programa para estudiantes
    </div>

    <div class="login-container">
      <h3 class="text-center mb-4">Iniciar Sesión</h3>
      <form id="loginForm" action="Inicio" method="post" onsubmit="return validateForm()">
  <div class="form-group">
    <label for="username">Usuario</label>
    <input type="text" id="username" name="txtUsuario" class="form-control" placeholder="Ingrese su usuario" required>
    <small class="form-text text-danger" id="usernameError" style="display: none;">El usuario es requerido.</small>
  </div>
  <div class="form-group">
    <label for="password">Contraseña</label>
    <input type="password" id="password" name="txtContrasenia" class="form-control" placeholder="Ingrese su contraseña" required>
    <small class="form-text text-danger" id="passwordError" style="display: none;">La contraseña es requerida.</small>
  </div>
  <div class="text-center">
    <button type="submit" name="btnIngresar" class="btn btn-login btn-block">Ingresar</button>
  </div>
  <div class="text-center mt-3">
    <a href="RecuperoContrasenia.jsp" class="text-primary">¿Olvidaste tu contraseña?</a>
  </div>
  
</form>
    <footer class="footer text-center">
      <div class="container">
        <div class="row justify-content-around">
          <div class="col-md-4">
            <h5>Información de contacto</h5>
            <address>
              <p>Email: <a href="mailto:example@example.com">example@example.com</a></p>
              <p>Teléfono: <a href="tel:+1234567890">+54 (2281) 567-890</a></p>
            </address>
          </div>
          <div class="col-md-4">
            <h5>Síguenos en nuestras redes sociales</h5>
            <nav class="social-icons" aria-label="Social media links">
              <ul class="list-inline">
                <li class="list-inline-item"><a href="https://facebook.com" target="_blank" aria-label="Facebook"><i class="fab fa-facebook"></i></a></li>
                <li class="list-inline-item"><a href="https://instagram.com" target="_blank" aria-label="Instagram"><i class="fab fa-instagram"></i></a></li>
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
        const username = document.getElementById('username');
        const password = document.getElementById('password');
        const usernameError = document.getElementById('usernameError');
        const passwordError = document.getElementById('passwordError');

        usernameError.style.display = 'none';
        passwordError.style.display = 'none';

        if (username.value.trim() === '') {
          usernameError.style.display = 'block';
          isValid = false;
        }
        if (password.value.trim() === '') {
          passwordError.style.display = 'block';
          isValid = false;
        }

        return isValid;
      }
    </script>
  </body>
</html>
