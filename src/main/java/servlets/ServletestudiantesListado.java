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
import models.Casa;
import models.Estudiante;
import models.EstudianteListado;
import models.Plan_Estudios;


@WebServlet("/ServletestudiantesListado")
public class ServletestudiantesListado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private LogicaUsuario log = new LogicaUsuarioImp();
	
    public ServletestudiantesListado() {
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
				List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
				listE = log.listarEstudiantes();
				request.setAttribute("listaEst", listE);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/estudiantesListado.jsp");
				dispatcher.forward(request, response);
				break;
			}
			case "2":
			{
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					Estudiante e = new Estudiante();
					e = log.ObtenerEstudiante(id);
					request.setAttribute("Est", e);	
					RequestDispatcher dispatcher = request.getRequestDispatcher("");
					dispatcher.forward(request, response);
				}
				break;
			}
			case "3":
			{
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					log.BajaEstudiante(id);
					RequestDispatcher dispatcher = request.getRequestDispatcher("ServletestudiantesListado?Action=1");
					dispatcher.forward(request, response);
				}
				break;
			}
			case "4":
			{
				List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
				listE = log.listarEstudiantesInactivos();
				request.setAttribute("listaEst", listE);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/estudiantesListado.jsp");
				dispatcher.forward(request, response);
				break;
			}
			case "5":
			{
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					log.AltaEstudiante(id);
					RequestDispatcher dispatcher = request.getRequestDispatcher("ServletestudiantesListado?Action=1");
					dispatcher.forward(request, response);
				}
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
