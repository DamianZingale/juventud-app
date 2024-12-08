package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Logica.LogicaCasas;
import LogicaImp.LogicaCasasImp;
import models.Casa;
import models.Ciudad;

@WebServlet("/ServletInformes")
public class ServletInformes extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	LogicaCasas log = new LogicaCasasImp();
	
    public ServletInformes() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Action")!=null)
		{
			String opcion = request.getParameter("Action").toString();
			
			switch (opcion) {
			case "1":
			{
				List<Casa> listC = new ArrayList<Casa>();
				listC = log.ObtenerCasas();
				request.setAttribute("listaCasas", listC);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/DisponibilidadCasas.jsp");
				dispatcher.forward(request, response);
				break;
			}
			default:
				break;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
