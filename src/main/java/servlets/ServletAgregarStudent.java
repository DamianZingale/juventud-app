package servlets;

import dao.EstudianteDao;
import daoImp.EstudianteDaoImp;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Logica.LogicaCasas;
import Logica.LogicaUsuario;
import LogicaImp.LogicaCasasImp;
import LogicaImp.LogicaUsuarioImp;
import models.Casa;
import models.Estudiante;
import models.PlanEstudio;


@WebServlet("/ServletAgregarStudent")
public class ServletAgregarStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private LogicaUsuario log = new LogicaUsuarioImp();
	private LogicaCasas logC = new LogicaCasasImp();
	
    public ServletAgregarStudent() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnAgregarEstudiante") != null) {		   
			
// Obtengo los parametros del formulario
		    String nombre = request.getParameter("txtNombres");
		    String apellido = request.getParameter("txtApellido");
		    String fechaN = request.getParameter("txtFecha");
		    String dni = request.getParameter("txtDNI");
		    String email = request.getParameter("txtEmail");
		    String telefono = request.getParameter("txtTelefono");
		    String domicilio = request.getParameter("txtDomicilio");
		    String casaSeleccionada = (request.getParameter("casa").toString());
		    String planSeleccionado = (request.getParameter("plan").toString());
			boolean estado = true;
		    
		    Casa casa = new Casa();
		    PlanEstudio plan = new PlanEstudio();
		    casa.setId_casa(Integer.parseInt(casaSeleccionada));		
		    plan.setIdPlan(Integer.parseInt(planSeleccionado));
// creo el objeto Estudiante		    
		    Estudiante e = new Estudiante();
   
		    e.setDNI(dni);
		    e.setNombre(nombre);
		    e.setApellido(apellido);
		    e.setFecha_nac(fechaN);
		    e.setTelefono(telefono);
		    e.setDomicilio(domicilio);
		    e.setEmail(email);		   
			e.setUserName(dni + ".juv");
			e.setCasa(casa);
			e.setPlan_estudio(plan);
			e.setPassword(dni);
			e.setEstado(estado);

// creo un nuevo objeto de la clase estudiantedao		    
			EstudianteDao estudianteDao = new EstudianteDaoImp();
		       
		    	// Agrego el estudiante a la base de datos
			try {
			    if (estudianteDao.existeDni(e.getDNI())) {
			        System.out.println("El DNI ya existe.");
			        RequestDispatcher dispatcher = request.getRequestDispatcher("agregarStudent.jsp");
					dispatcher.forward(request, response);
			    } else {
			        estudianteDao.ejecutarSPAltaEstudiante(e);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("agregarStudent.jsp");
					dispatcher.forward(request, response);
			        System.out.println("Usuario agregado exitosamente");
			    }
			} catch (SQLException ex) {
			    System.err.println("Error al verificar el DNI: " + ex.getMessage());
			}		
		}
		else
		{
			if(request.getParameter("Action") != null)
			{
				List<Casa> listC = new ArrayList<Casa>();
			 	List<PlanEstudio> listP = new ArrayList<PlanEstudio>();
			 	listC = logC.ObtenerCasas();
			 	listP = log.ObtenerPlanesEstudio();
			 	request.setAttribute("listCasa", listC);	
			 	request.setAttribute("listPlan", listP);	
				RequestDispatcher dispatcher = request.getRequestDispatcher("agregarStudent.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
