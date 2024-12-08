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
import models.Estudiante;
import models.EstudianteListado;


@WebServlet("/ServletCasas")
public class ServletCasas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	LogicaCasas log = new LogicaCasasImp();
       
    public ServletCasas() {
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
				List<Ciudad> listC = new ArrayList<Ciudad>();
				listC = log.ObtenerCiudades();
				request.setAttribute("listaCiu", listC);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/localidades.jsp");
				dispatcher.forward(request, response);
				break;
			}
			case "2":
			{
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					List<Casa> listC = new ArrayList<Casa>();
					listC = log.ObtenerCasasXCiudad(id);
					request.setAttribute("IdCiudad", id);
					request.setAttribute("listCasa", listC);	
					RequestDispatcher dispatcher = request.getRequestDispatcher("/Casa.jsp");
					dispatcher.forward(request, response);
				}
				break;
			}
			case "3":
			{
				if(request.getParameter("txtNombre")!=null)
				{
					String name = request.getParameter("txtNombre").toString();
					try {
						if(!log.existeCiudad(name))
						{
							log.ejecutarSPAgregarCiudad(name);
							String id = "2";
							request.setAttribute("PopUp", id);
							RequestDispatcher dispatcher = request.getRequestDispatcher("AgregarCiudad.jsp");
							dispatcher.forward(request, response);
						}
						else
						{
							String id = "1";
							request.setAttribute("PopUp", id);
							RequestDispatcher dispatcher = request.getRequestDispatcher("AgregarCiudad.jsp");
							dispatcher.forward(request, response);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				break;
			}
			case "4":
			{
				Casa C = new Casa();
				Ciudad Ciu = new Ciudad();
				C.setNombre_casa(request.getParameter("txtNombre").toString());
				C.setDireccion(request.getParameter("txtDireccion").toString());
				C.setCapacidad(Integer.parseInt(request.getParameter("txtCapacidad")));
				Ciu.setId_ciudad(Integer.parseInt(request.getParameter("IdCiudad")));
				Ciu.setNombre_ciudad(request.getParameter("txtCiudad").toString());
				try {
					if(!log.existeCasa(C))
					{
						log.ejecutarSPAgregarCasa(C);
						String id = "2";
						request.setAttribute("PopUp", id);
						RequestDispatcher dispatcher = request.getRequestDispatcher("AgregarCasa.jsp");
						dispatcher.forward(request, response);
					}
					else
					{
						String id = "1";
						request.setAttribute("PopUp", id);
						RequestDispatcher dispatcher = request.getRequestDispatcher("AgregarCasa.jsp");
						dispatcher.forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			default:
				break;
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("btnMostrarCasa") != null)
		{
			if(request.getParameter("casaId") != null)
			{
				String id = request.getParameter("casaId").toString();
				List<EstudianteListado> listE = new ArrayList<EstudianteListado>();
				listE = log.obtenerTodosXcasa(id);
				request.setAttribute("listaEst", listE);
				String idCiudad = request.getParameter("btnMostrarCasa").toString();
				List<Casa> listC = new ArrayList<Casa>();
				listC = log.ObtenerCasasXCiudad(idCiudad);
				request.setAttribute("listCasa", listC);
				request.setAttribute("IdCiudad", idCiudad);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Casa.jsp");
				dispatcher.forward(request, response);
			}
		}
		else
		{
			if(request.getParameter("btnAgregarCasa") != null)
			{
				String id = request.getParameter("btnAgregarCasa").toString();
				Ciudad c = log.obtenerCiudad(id);
				request.setAttribute("Ciudad", c);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarCasa.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}
