package servlets;

import daoImp.EstudianteDao;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Casa;
import models.Estudiante;


@WebServlet("/ServletAgregarStudent")
public class ServletAgregarStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ServletAgregarStudent() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnAgregarEstudiante") != null) {		   
			
// Obtengo los parametros del formulario
		    String nombre = request.getParameter("txtNombres");
		    String apellido = request.getParameter("txtApellido");
		    String dni = request.getParameter("txtDNI");
		    String email = request.getParameter("txtEmail");
		    String username = request.getParameter("txtUserName");
		    int casaSeleccionada = Integer.parseInt(request.getParameter("dropdownCasa"));
			String contrasenia = request.getParameter("txtPassword");
			boolean estado = true;
			
// Valido todos los campos
		    boolean valido = true;
		    StringBuilder errores = new StringBuilder();

		    if (nombre == null || nombre.trim().isEmpty()) {
		        errores.append("El nombre es obligatorio.<br>");
		        valido = false;
		    }

		    if (apellido == null || apellido.trim().isEmpty()) {
		        errores.append("El apellido es obligatorio.<br>");
		        valido = false;
		    }
		    
		    if (dni == null || dni.trim().isEmpty() || !dni.matches("^\\d{8}$")) {
		        errores.append("El DNI debe tener exactamente 8 d�gitos.<br>");
		        valido = false;
		    }

		    if (email == null || !email.matches("[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}")) {
		        errores.append("El email no es v�lido.<br>");
		        valido = false;
		    }
		    if (username == null || username.trim().isEmpty()) {
		        errores.append("El nombre dr usuario es obligatorio.<br>");
		        valido = false;
		    }
		   
		    if (contrasenia == null || contrasenia.trim().isEmpty()) {
		        errores.append("La contrase�a es obligatoria.<br>");
		        valido = false;
		    }
		    
		    if (!valido) {
		        request.setAttribute("errorMessage", errores.toString());		        
		        return;
		    }
		    
		    Casa casa = new Casa(casaSeleccionada);
// creo el objeto Estudiante		    
		    Estudiante e = new Estudiante();

// setteo los valores al objeto Estudiante 	    
		    e.setDNI(dni);
		    e.setNombre(nombre);
		    e.setApellido(apellido);
		    e.setEmail(email);		   
			e.setUserName(username);
			e.setCasa(casa);
			e.setPassword(contrasenia);
			e.setEstado(estado);

// creo un nuevo objeto de la clase estudiantedao		    
			EstudianteDao estudianteDao = new EstudianteDao();
		       
		    	// Agrego el estudiante a la base de datos
			try {
			    if (estudianteDao.existeDni(e.getDNI())) {
			        System.out.println("El DNI ya existe.");
			    } else {
			        estudianteDao.ejecutarSPAltaEstudiante(e);
			        System.out.println("Usuario agregado exitosamente");
			    }
			} catch (SQLException ex) {
			    System.err.println("Error al verificar el DNI: " + ex.getMessage());
			}		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
