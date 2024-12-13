package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LogicaImp.LogicaUsuarioImp;
import models.Administrador;
import models.Estudiante;


@WebServlet("/Inicio")
public class Inicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Inicio() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    if (request.getParameter("btnIngresar") != null) {
	        String user = request.getParameter("txtUsuario");
	        String password = request.getParameter("txtContrasenia");

	        if (user == null || user.trim().isEmpty() || password == null || password.trim().isEmpty()) {
	            response.sendRedirect("login.jsp?error=Campos vacíos");
	            return;
	        }

	        LogicaUsuarioImp logicaUsuario = new LogicaUsuarioImp();

	        try {
	            // Comprobar inicio y obtener el objeto usuario
	            Object usuario = logicaUsuario.ComprobarInicio(user, password);

	            if (usuario != null) {
	                HttpSession sesion = request.getSession(true);
	                sesion.setMaxInactiveInterval(3600); // Una hora de sesión
	                sesion.setAttribute("usuario", usuario);

	                if (usuario instanceof Administrador) {
	                    RequestDispatcher dispatcher = request.getRequestDispatcher("/inicioAdmin.jsp");
	                    dispatcher.forward(request, response);
	                } else if (usuario instanceof Estudiante) {
	                    RequestDispatcher dispatcher = request.getRequestDispatcher("/homeStudent.jsp");
	                    dispatcher.forward(request, response);
	                }
	            } else {
	                response.sendRedirect("login.jsp?error=Usuario o contraseña incorrectos");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("login.jsp?error=Error en el inicio de sesión");
	        }
	    }
	}



}
