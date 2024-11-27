package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Logica.LogicaUsuario;
import LogicaImp.LogicaUsuarioImp;
import models.Estudiante;


@WebServlet("/ServletestudiantesListado")
public class ServletestudiantesListado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private LogicaUsuario log = new LogicaUsuarioImp();
	
    public ServletestudiantesListado() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Estudiante> listE = new ArrayList<Estudiante>();
		listE = log.listarEstudiantes();
		request.setAttribute("listaEst", listE);	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/estudiantesListado.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
