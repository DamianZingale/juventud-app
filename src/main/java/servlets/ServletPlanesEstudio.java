package servlets;

import daoImp.PlanesEstudioDao;
import models.MateriasPorAño;
import models.PlanEstudio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//import java.sql.SQLException;
import java.util.List;

@WebServlet("/ServletPlanesEstudio")
public class ServletPlanesEstudio extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		//----- METODO PARA CARGAR LA TABLA CON LOS PLANES DE ESTUDIO DE LA BASE DE DATOS --------------------	
		
		if(request.getParameter("Param")!=null || request.getParameter("btnMostrarActivos")!=null) {
		// Crear una instancia del DAO
        PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();

        // Obtener la lista de planes de estudio desde el DAO
        List<PlanEstudio> planes = planEstudioDAO.obtenerPlanesDeEstudioACTIVOS();

        // Pasar la lista de planes al JSP
        request.setAttribute("planes", planes);

        // Redirigir al JSP para mostrar los datos
        request.setAttribute("planes", planes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
        dispatcher.forward(request, response);
        System.out.println("retorna la lista del SERVLET" + planes);
		}
		
		//----- METODO PARA CARGAR LA TABLA CON TODOD LOS PLANES DE ESTUDIO --------------------	
		
		if(request.getParameter("btnMostrarTodos")!=null) {
		// Crear una instancia del DAO
        PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();

        // Obtener la lista de planes de estudio desde el DAO
        List<PlanEstudio> planes = planEstudioDAO.obtenerPlanesDeEstudioTODOS();

        // Pasar la lista de planes al JSP
        request.setAttribute("planes", planes);

        // Redirigir al JSP para mostrar los datos
        request.setAttribute("planes", planes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudio.jsp");
        dispatcher.forward(request, response);
        System.out.println("retorna la lista del SERVLET" + planes);
		}
		
		//----- METODO PARA CARGAR LA TABLA CON TODOD LOS PLANES DE ESTUDIO --------------------	
		
		if(request.getParameter("btnMostrarInactivos")!=null) {
		PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();

		        // Obtener la lista de planes de estudio desde el DAO
		List<PlanEstudio> planes = planEstudioDAO.obtenerPlanesDeEstudioINACTIVOS();

		        // Pasar la lista de planes al JSP
		 request.setAttribute("planes", planes);

		        // Redirigir al JSP para mostrar los datos
		 request.setAttribute("planes", planes);
		 RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioInactivos.jsp");
		 dispatcher.forward(request, response);
		 System.out.println("retorna la lista del SERVLET" + planes);
		}
		
		//---- METODO PARA QUE AL HACER CLICK EN EL BOTON: "AGREGAR NUEVO PLAN" SE REDIRECIONE AL formularioNuevoPlan ---------------		
		
		if (request.getParameter("btnFormularioAgregarPlan")!=null) {
		    response.sendRedirect("formularioNuevoPlan.jsp");
		}
		
	}
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	

//-----------------BOTON: "AGREGAR NUEVO PLAN"-------------		
		
		int filas = 0;
		if (request.getParameter("btnAgregarPlan") != null) {
			
			PlanEstudio plan = new PlanEstudio();
			
			String anios = request.getParameter("txtAnios"); 
			if (anios != null && !anios.isEmpty()) 
			{ int cantidadAnios = Integer.parseInt(anios); 
			plan.setCantidadAnios(cantidadAnios);
			}
			
	        plan.setInstitucion(request.getParameter("txtInstitucion"));
	        plan.setCarrera(request.getParameter("txtCarrera"));
	        plan.setResolucion(request.getParameter("txtResolucion"));
			
		    PlanesEstudioDao planDAO = new PlanesEstudioDao();
		    filas = planDAO.agregarPlan(plan);
		    
		    System.out.println("Agrega: " + filas+ " plan nuevo - SERVLET");
		    System.out.println("Institucion " + request.getParameter("txtInstitucion"));
		    System.out.println("Carrera " + request.getParameter("txtCarrera"));
		    System.out.println("Años " + request.getParameter("txtAnios"));    		 
		    System.out.println("txtResolucion: " + request.getParameter("txtResolucion"));
			
			/// REQUEST DISPACHER
			request.setAttribute("cantidadFilas", filas);
			RequestDispatcher rd = request.getRequestDispatcher("formularioNuevoPlan.jsp");
			rd.forward(request, response);
		}
		
//-----------------BOTON: "EDITAR SELECCIONADO" -------------------------------		
		
		//REDIRECCIONO A LA VISTA DE EDITAR PLAN	
		if (request.getParameter("btnEditarSeleccionado")!=null) {
				String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); //aca guarda el valor en el hidden
					 
				if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) {
				
					// Recuperar el objeto PlanEstudio desde la base de datos usando el idPlanSeleccionado
				int idPlan = Integer.parseInt(idPlanSeleccionado);  
						
				PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();
				
					//try {
						PlanEstudio plan = planEstudioDAO.obtenerPlanPorId(idPlan);
						request.setAttribute("plan", plan);
						 // Redirigir a la p�gina de edici�n
						request.getRequestDispatcher("editarPlan.jsp").forward(request, response);   
					
					//} catch (SQLException e) {
						
						//e.printStackTrace();
						//} 
					}else {
			           // Si no se seleccion� ning�n plan, redirigir a la misma p�gina o mostrar un error
			            response.sendRedirect("planesEstudio.jsp?error=No+se+ha+seleccionado+ningun+plan");
			     }
			}	
			
			if (request.getParameter("btnActualizar") != null) {
				
				PlanEstudio plan = new PlanEstudio();
				
				String idPlanSeleccionado = request.getParameter("idPlanSeleccionado");
				if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) 
				{ int idPlan = Integer.parseInt(idPlanSeleccionado);
				plan.setIdPlan(idPlan);
				}
				
				System.out.println("Id a modificar: " + request.getParameter("idPlanSeleccionado"));
				
				String anios = request.getParameter("txtCamb_CantidadAnios"); 
				if (anios != null && !anios.isEmpty()) 
				{ int cantidadAnios = Integer.parseInt(anios); 
				plan.setCantidadAnios(cantidadAnios);
				}
			
				
		        plan.setInstitucion(request.getParameter("txtCamb_Institucion"));
		        plan.setCarrera(request.getParameter("txtCamb_Carrera"));
		        plan.setResolucion(request.getParameter("txtCamb_Resolucion"));
		        
		        PlanesEstudioDao planDAO = new PlanesEstudioDao();
			    filas = planDAO.actualizarPlan(plan);
			    
			    System.out.println("ACTUALIZA: " + filas+ " plan nuevo - SERVLET");
			    System.out.println("Institucion " + request.getParameter("txtCamb_Institucion"));
			    System.out.println("Carrera " + request.getParameter("txtCamb_Carrera"));
			    System.out.println("Años " + request.getParameter("txtCamb_CantidadAnios"));    
			    
				
				/// REQUEST DISPACHER
				request.setAttribute("cantidadFilas", filas);				
				RequestDispatcher dispatcher = request.getRequestDispatcher("inicioAdmin.jsp");
		        dispatcher.forward(request, response);
			}
			        

//-----------------BOTON: "ELIMINAR SELECCIONADO" -------------------------------	
			if (request.getParameter("btnEliminarSeleccionado") != null) {
				String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); 
				
				if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) { 
				
					int idPlan = Integer.parseInt(idPlanSeleccionado); 
					PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao(); 
					
					planEstudioDAO.eliminarPlan(idPlan); 
					
					response.sendRedirect("inicioAdmin.jsp"); 
					
				} else { response.sendRedirect("planesEstudio.jsp?error=No+se+ha+seleccionado+ning�n+plan");
				}
					
			}	        
			
//-----------------BOTON: "DAR DE ALTA SELECCIONADO" -------------------------------	
			if (request.getParameter("btnDarAltaPlan") != null) {
				String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); 
				
				if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) { 
				
					int Plan = Integer.parseInt(idPlanSeleccionado); 
					PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao(); 
					
					planEstudioDAO.darAltaPlan(Plan); 
					
					response.sendRedirect("inicioAdmin.jsp"); 
					
				} else { response.sendRedirect("planesEstudio.jsp?error=No+se+ha+seleccionado+ning�n+plan");
				}
					
			}	
//-----------------BOTON: "VER DETALLE DEL PLAN"-------------	
			
			//REDIRECCIONO A LA VISTA DE DETALLE DE PLAN	
			if (request.getParameter("btnVerDetallePlan")!=null) {
					String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); //aca guarda el valor en el hidden
						 
					if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) {
					
						// Recuperar el objeto PlanEstudio desde la base de datos usando el idPlanSeleccionado
					int idPlan = Integer.parseInt(idPlanSeleccionado);  
							
					PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();
					
						//try {
							// Obtener el PlanEstudio y las materias asociadas al plan
							PlanEstudio plan = planEstudioDAO.obtenerPlanPorId(idPlan);
							List<MateriasPorAño> materias = planEstudioDAO.obtenerMateriasXPlan(idPlan);
							
							
							// Establecer los objetos Plan y Materias como atributos para la JSP
		                    request.setAttribute("plan", plan);
		                    request.setAttribute("materiasPorA�o", materias);

		                    // Redirigir a la JSP donde se muestran los detalles del plan
		                    request.getRequestDispatcher("detallePlan.jsp").forward(request, response);
						
						//} catch (SQLException e) {					
							//e.printStackTrace();
							 //response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener el plan de estudio.");} 
						}else {
				           // Si no se seleccion� ning�n plan, redirigir a la misma p�gina o mostrar un error
							response.sendRedirect("inicoAdmin.jsp?error=No+se+ha+seleccionado+ning�n+plan");
				     }
			
			}		
		}
}

