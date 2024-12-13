package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LogicaImp.LogicaUsuarioImp;



//https://lineadecodigo.com/java/mandar-emails-con-javamail/
@WebServlet("/RecuperarContrasenia")
public class RecuperarContrasenia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RecuperarContrasenia() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mailRegistrado = request.getParameter("txtEmail");
		
		try {
			LogicaUsuarioImp lg = new LogicaUsuarioImp();
			String contrasenia = lg.RecuperoConMail(mailRegistrado);
			if (contrasenia != null) {
	            
	            request.setAttribute("contrasenia", contrasenia);
	          
	            RequestDispatcher dispatcher = request.getRequestDispatcher("RecuperoContrasenia.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            
	            request.setAttribute("contrasenia", "El correo ingresado no está registrado.");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("RecuperoContrasenia.jsp");
	            dispatcher.forward(request, response);
	        }
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
	}

}
