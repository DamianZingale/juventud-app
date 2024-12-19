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

import Logica.LogicaUsuario;
import LogicaImp.LogicaUsuarioImp;

@WebServlet("/CambioPassword")
public class CambioPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LogicaUsuario log = new LogicaUsuarioImp();
	
    public CambioPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("btnCambiar") != null)
		{
			String user = request.getParameter("btnCambiar").toString();
			if(request.getParameter("currentPassword") != null)
			{
				String password = request.getParameter("currentPassword").toString();
				try {
					if(log.existePassword(user, password))
					{
						String NewPassword = request.getParameter("newPassword").toString();
						log.ejecutarSPCambiarPassword(NewPassword, user);
						Object usuario = log.ComprobarInicio(user, NewPassword);
	
			            if (usuario != null) {
			                HttpSession sesion = request.getSession(true);
			                sesion.setMaxInactiveInterval(3600);
			                sesion.setAttribute("usuario", usuario);
			                
			                String idPop = "2";
			                request.setAttribute("PopUp", idPop);
			                RequestDispatcher dispatcher = request.getRequestDispatcher("/configuracionStudent.jsp");
							dispatcher.forward(request, response);
			            }
					}
					else
					{
						String idPop = "1";
						request.setAttribute("PopUp", idPop);
						RequestDispatcher dispatcher = request.getRequestDispatcher("/configuracionStudent.jsp");
						dispatcher.forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
