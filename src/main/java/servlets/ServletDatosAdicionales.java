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

import Logica.LogicaUsuario;
import LogicaImp.LogicaUsuarioImp;
import models.Historia_Clinica;
import models.Referente;

@WebServlet("/ServletDatosAdicionales")
public class ServletDatosAdicionales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private LogicaUsuario log = new LogicaUsuarioImp();
	
    public ServletDatosAdicionales() {
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
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					Historia_Clinica c = new Historia_Clinica();
					c = log.ObtenerHistoriaClinica(id);
					request.setAttribute("Hist", c);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/DatosAdicionalesStudent.jsp");
					dispatcher.forward(request, response);
				}
				break;
			}
			case "2":
			{
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					Historia_Clinica c = new Historia_Clinica();
					List<Referente> listR = new ArrayList<Referente>();
					if(request.getParameter("txtEnfermedades").toString() != "")
					{
						c.setEnfermedades_preexistentes(request.getParameter("txtEnfermedades").toString());
					}
					else
					{
						c.setEnfermedades_preexistentes("N/A");
					}
					if(request.getParameter("txtMedicaciones").toString() != "")
					{
						c.setMedicaciones(request.getParameter("txtMedicaciones").toString());
					}
					else
					{
						c.setMedicaciones("N/A");
					}
					if(request.getParameter("txtOperaciones").toString() != "")
					{
						c.setOperaciones(request.getParameter("txtOperaciones").toString());
					}
					else
					{
						c.setOperaciones("N/A");
					}
					if(request.getParameter("txtAlergias").toString() != "")
					{
						c.setAlergias(request.getParameter("txtAlergias").toString());
					}
					else
					{
						c.setAlergias("N/A");
					}
					try {
						if(log.existeHistoriaClinica(id))
						{
							log.ejecutarSPActualizarHistoriaClinica(c, id);
						}
						else
						{
							log.ejecutarSPAgregarHistoriaClinica(c, id);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					listR = log.obtenerReferentes(id);
					request.setAttribute("listaRef", listR);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarReferente.jsp");
					dispatcher.forward(request, response);
				}
				break;
			}
			case "3":
			{
				if(request.getParameter("Id")!=null)
				{
					String id = request.getParameter("Id").toString();
					Referente r = new Referente();
					r.setNombre(request.getParameter("txtNombre").toString());
					r.setApellido(request.getParameter("txtApellido").toString());
					r.setDNI(request.getParameter("txtDNI").toString());
					r.setTelefono(request.getParameter("txtTelefono").toString());
					r.setDomicilio(request.getParameter("txtDomicilio").toString());
					r.setRol(request.getParameter("txtRol").toString());
					log.ejecutarSPAgregarReferente(r, id);
					List<Referente> listR = new ArrayList<Referente>();
					listR = log.obtenerReferentes(id);
					request.setAttribute("listaRef", listR);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarReferente.jsp");
					dispatcher.forward(request, response);
				}
				break;
			}
			case "4":
			{
				String IdU = request.getParameter("IdU").toString();
				String IdR = request.getParameter("IdR").toString();
				log.ejecutarSPEliminarReferente(IdU, IdR);
				List<Referente> listR = new ArrayList<Referente>();
				listR = log.obtenerReferentes(IdU);
				request.setAttribute("listaRef", listR);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarReferente.jsp");
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
