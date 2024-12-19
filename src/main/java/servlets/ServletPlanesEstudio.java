package servlets;

import daoImp.PlanesEstudioDao;
import models.MateriasPorAño;
import models.Periodo;
import models.PlanEstudio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
//import java.sql.SQLException;
import java.util.List;

@WebServlet("/ServletPlanesEstudio")
public class ServletPlanesEstudio extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		//----- METODO PARA CARGAR LA TABLA CON  LOS PLANES DE ESTUDIO ACTIVOS--------------------	
		
		if(request.getParameter("Param")!=null 
				|| request.getParameter("btnMostrarActivos")!=null 
				|| request.getParameter("btnVolverActivos")!=null 
				 	) {				
		// Crear una instancia del DAO
        PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();

        // Obtener la lista de planes de estudio desde el DAO
        List<PlanEstudio> planes = planEstudioDAO.obtenerPlanesDeEstudioACTIVOS();

        // Pasar la lista de planes al JSP
        request.setAttribute("planes", planes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
        dispatcher.forward(request, response);
        System.out.println("retorna la lista del SERVLET" + planes);
		}
						
		
		//----- METODO PARA CARGAR LA TABLA CON TODOS LOS PLANES DE ESTUDIO --------------------	
		
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
		
		//----- METODO PARA CARGAR LA TABLA CON  LOS PLANES DE ESTUDIO INACTIVOS --------------------	
		
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
			
			List<String> periodos = PlanesEstudioDao.obtenerPeriodos();
			request.setAttribute("listaPeriodos", periodos);
			//System.out.println("Lista de per�odos enviada al JSP: " + periodos + " - SERVLET");
			
			RequestDispatcher rd = request.getRequestDispatcher("formularioNuevoPlan.jsp");
		    rd.forward(request, response);
		}
			

	}		  
		//-------------------
		

		

	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	

//************************************************************************************************************		
//************************************* P L A N E S   I N A C T I V O S **************************************			
//************************************************************************************************************		

		
//----------------------------------------------------------------------------------
//-----------------BOTON: "DAR DE ALTA SELECCIONADO" -------------------------------
//----------------------------------------------------------------------------------
		
		if (request.getParameter("btnDarAltaPlan") != null) {
			String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); 
			
			if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) { 
			
				int Plan = Integer.parseInt(idPlanSeleccionado); 
				PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao(); 
				
				planEstudioDAO.darAltaPlan(Plan);
				 
				// Obtener la lista de planes de estudio desde el DAO
		        List<PlanEstudio> planes = planEstudioDAO.obtenerPlanesDeEstudioACTIVOS();

		        // Pasar la lista de planes al JSP
		        request.setAttribute("planes", planes);
		        request.setAttribute("errorMensaje", "Se dio de alta el plan seleccionado");
		        RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
		        dispatcher.forward(request, response);
				
			} else { response.sendRedirect("planesEstudio.jsp?error=No+se+ha+seleccionado+ning�n+plan");
			}
				
		}	
		
		
//*****************************************************************************************************************		
//********************************* P L A N E S   A C T I V O S ***************************************************
//*****************************************************************************************************************
		
//------------------------------------------------------------------------------------		
//-----------------BOTON: "ELIMINAR PLAN SELECCIONADO" -------------------------------
//------------------------------------------------------------------------------------
		
		if (request.getParameter("btnEliminarSeleccionado") != null) {
			String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); 
			
			if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) { 
			
				int idPlan = Integer.parseInt(idPlanSeleccionado); 
				PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao(); 
				
				planEstudioDAO.eliminarPlan(idPlan); 
			

		        // Obtener la lista de planes de estudio desde el DAO
		        List<PlanEstudio> planes = planEstudioDAO.obtenerPlanesDeEstudioACTIVOS();

		        // Pasar la lista de planes al JSP
		        request.setAttribute("planes", planes);
		        request.setAttribute("errorMensaje", "Se elimino el plan seleccionado");
		        RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
		        dispatcher.forward(request, response);
				
			} else { response.sendRedirect("planesEstudio.jsp?error=No+se+ha+seleccionado+ning�n+plan");
			}
		}
		
	
		
//------------------------------------------------------------------------------------		
//---------------------------BOTON: "VER DETALLE DEL PLAN"----------------------------	
//------------------------------------------------------------------------------------		
		
		//REDIRECCIONO A LA VISTA DE DETALLE DE PLAN	
		if (request.getParameter("btnVerDetallePlan")!=null) {
				String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); //aca guarda el valor en el hidden
					 
				if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) {
				
					// Recuperar el objeto PlanEstudio desde la base de datos usando el idPlanSeleccionado
				int idPlan = Integer.parseInt(idPlanSeleccionado);  
						
				//PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();
				
					try {
						// Obtener el PlanEstudio y las materias asociadas al plan
						PlanEstudio plan = PlanesEstudioDao.obtenerPlanPorId(idPlan);
						List<MateriasPorAño> materias = PlanesEstudioDao.obtenerMateriasXPlan(idPlan);
						List<String> periodos = PlanesEstudioDao.obtenerPeriodos(); // M�todo en tu DAO para obtener per�odos
													
						
						// Establecer los objetos Plan y Materias como atributos para la JSP
	                    request.setAttribute("plan", plan);
	                    request.setAttribute("materiasPorA�o", materias);
	                    request.setAttribute("listaPeriodos", periodos);
	                    
	                    // Redirigir a la JSP donde se muestran los detalles del plan
	                    request.getRequestDispatcher("detallePlan.jsp").forward(request, response);
					
					} catch (SQLException e) {					
						e.printStackTrace();
						 response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener el plan de estudio.");} 
					}else {
			           // Si no se seleccion� ning�n plan, redirigir a la misma p�gina o mostrar un error
						response.sendRedirect("inicoAdmin.jsp");
			     }
		
		}				
		
		
//------------------------------------------------------------------------------------		
//----------------------------BOTON: "AGREGAR NUEVO PLAN"-----------------------------	
//------------------------------------------------------------------------------------
		
		if (request.getParameter("btnAgregarPlan") != null) {
		    try {
		        PlanesEstudioDao planEstudioDAO = new PlanesEstudioDao();
		        PlanEstudio planes = new PlanEstudio();

		        // Validar y asignar par�metros del formulario
		        String anios = request.getParameter("txtAnios");
		        if (anios != null && !anios.isEmpty()) {
		            try {
		                int cantidadAnios = Integer.parseInt(anios);
		                planes.setCantidadAnios(cantidadAnios);
		            } catch (NumberFormatException e) {
		                request.setAttribute("error", "El campo 'Años' debe ser un numero valido.");
		                request.getRequestDispatcher("agregarPlan.jsp").forward(request, response);
		                return;
		            }
		        }

		        // Asignar el resto de par�metros
		        planes.setInstitucion(request.getParameter("txtInstitucion"));
		        planes.setCarrera(request.getParameter("txtCarrera"));
		        planes.setResolucion(request.getParameter("txtResolucion"));

		        // Agregar el plan y verificar el resultado
		        int filas = planEstudioDAO.agregarPlan(planes);
		        if (filas > 0) {
		            PlanEstudio ultimoPlan = planEstudioDAO.obtenerUltimoPlan();
		            if (ultimoPlan != null) {
		                List<MateriasPorAño> materias = PlanesEstudioDao.obtenerMateriasXPlan(ultimoPlan.getIdPlan());
		                List<Periodo> periodos = PlanesEstudioDao.obtenerIDPeriodos();
		                List<Integer> años = PlanesEstudioDao.obtenerAños(ultimoPlan.getIdPlan());

		                // Pasar datos a la vista
		                request.setAttribute("ultimoPlan", ultimoPlan);
		                request.setAttribute("materiasPorAño", materias);
		                request.setAttribute("listaPeriodos", periodos);
		                request.setAttribute("listaAnios", años);
		                
		                int cantidadAnios = ultimoPlan.getCantidadAnios();
			            System.out.println("Cantidad de años del plan: " + cantidadAnios + " - SERVLET");
			            // Crear el HTML para el select de años
			            StringBuilder opcionesAños = new StringBuilder();
			            for (int i = 1; i <= cantidadAnios; i++) {
			                opcionesAños.append("<option value=\"").append(i).append("\">").append(i).append("</option>");
			            
			            }
			            request.setAttribute("opcionesAños", opcionesAños.toString());

		                // Redirigir a la p�gina de agregar materias
			            System.out.println("Se agrego un nuevo plan");
			            request.getRequestDispatcher("agregarMaterias.jsp").forward(request, response);
		            }
		        } else {
		            request.setAttribute("errorMensaje", "No se pudo agregar el plan. Intente nuevamente.");
		            request.getRequestDispatcher("inicioAdmin.jsp").forward(request, response);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        request.setAttribute("error", "Ocurrio un error inesperado: " + e.getMessage());
		        request.getRequestDispatcher("formularioNuevoPlan.jsp").forward(request, response);
		    }
		}

	
		
//------------------------------------------------ Boton "agregar materia" .... 1 por 1
		if (request.getParameter("btnAgregarMateria1") != null) {
		    try {
		        String idPlanParam = request.getParameter("idPlanSeleccionado");
		        
		        
		        if (idPlanParam == null || idPlanParam.isEmpty()) {
		            request.setAttribute("errorMensaje", "ID de plan no proporcionado.");
		            request.getRequestDispatcher("inicioAdmin.jsp").forward(request, response);
		            return;
		        }

		        int idPlanSeleccionado = Integer.parseInt(idPlanParam);
		        PlanEstudio plan = PlanesEstudioDao.obtenerPlanPorId(idPlanSeleccionado);

		        if (plan != null) {
		            int cantidadAnios = plan.getCantidadAnios();
		            System.out.println("Cantidad de años del plan: " + cantidadAnios);

		            StringBuilder opcionesAños = new StringBuilder();
		            for (int i = 1; i <= cantidadAnios; i++) {
		                opcionesAños.append("<option value=\"").append(i).append("\">").append(i).append("</option>");
		            }

		            // Obtener los par�metros para agregar la materia
		            String nombreMateria = request.getParameter("txtMateria");
		            int añoMateria = Integer.parseInt(request.getParameter("nuevoAño"));
		            int periodoMateria = Integer.parseInt(request.getParameter("nuevoPeriodo"));
		            
		            System.out.println("Materia a agregar al plan:");
		            System.out.println("Año al que pertenece: " + añoMateria);
	                System.out.println("Nombre de la Materia: " + nombreMateria);
	                System.out.println("Periodo al que pertenese: " + periodoMateria);

		            // Crear y configurar el objeto MateriaPorA�o
		            int id_añoPlan = PlanesEstudioDao.obtenerIdAñoPlan(idPlanSeleccionado, añoMateria);
		            MateriasPorAño materia = new MateriasPorAño();
		            materia.setMateria(nombreMateria);
		            materia.setIDPeriodo(periodoMateria);
		            materia.setIdAñoPlan(id_añoPlan);

		            // Agregar la materia al plan
		            PlanesEstudioDao Planes = new PlanesEstudioDao();
		            int filasAfectadas = Planes.agregarMateria(materia);
		            
		            if (filasAfectadas > 0) {
		                request.setAttribute("mensajeExito", "Materia agregada exitosamente.");
		                
		                System.out.println("*****Materia agregada con exito al plan.******");

		            } else {
		                request.setAttribute("mensajeError", "No se pudo agregar la materia.");
		            }

		            // Recargar las materias del plan
		            List<MateriasPorAño> materiasPorAño = PlanesEstudioDao.obtenerMateriasXPlanID(idPlanSeleccionado);
		            request.setAttribute("materiasPorAño", materiasPorAño);
		            request.setAttribute("opcionesAños", opcionesAños.toString());
		            
		         // Obtener el �ltimo plan
		            PlanesEstudioDao PD = new PlanesEstudioDao();
		            PlanEstudio ultimoPlan = PD.obtenerUltimoPlan();
		            request.setAttribute("ultimoPlan", ultimoPlan);

		            request.getRequestDispatcher("agregarMaterias.jsp").forward(request, response);
		        } else {
		            request.setAttribute("errorMensaje", "No se encontro el plan con el ID proporcionado.");
		            request.getRequestDispatcher("planesEstudioActivos.jsp").forward(request, response);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        request.setAttribute("errorMensaje", "Error inesperado al agregar la materia.");
		        request.getRequestDispatcher("error.jsp").forward(request, response);
		    }
		}
		
		
//------------------------------------------------------------------------------------
//------------------------BOTON: "EDITAR SELECCIONADO" -------------------------------		
//------------------------------------------------------------------------------------		


//-------------------------redirecciono a la vista de editar plan 	
		
		if (request.getParameter("btnEditarSeleccionado")!=null) {
			String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); //aca guarda el valor en el hidden
								 
				if (idPlanSeleccionado != null && !idPlanSeleccionado.isEmpty()) {
				
				// Recuperar el objeto PlanEstudio desde la base de datos usando el idPlanSeleccionado
				int idPlan = Integer.parseInt(idPlanSeleccionado);
				
					try {
						PlanEstudio plan = PlanesEstudioDao.obtenerPlanPorId(idPlan);
						List<MateriasPorAño> materias = PlanesEstudioDao.obtenerMateriasXPlanID(idPlan);
						List<Periodo> periodos = PlanesEstudioDao.obtenerIDPeriodos(); // M�todo en tu DAO para obtener per�odos
		                List<Integer> A  = PlanesEstudioDao.obtenerAños(idPlan);
		                
		                plan.setIdPlan(idPlan);
		                
		                // Pasar los datos como atributos a la JSP
						request.setAttribute("plan", plan);
		                request.setAttribute("materiasPorA�o", materias);
		                request.setAttribute("listaPeriodos", periodos);
		                request.setAttribute("listaAnios", A);
						 // Redirigir a la p�gina de edici�n

						request.getRequestDispatcher("editarPlan.jsp").forward(request, response);   
					
					} catch (SQLException e) {
						
						e.printStackTrace();} 
					}else {
			           // Si no se seleccion� ning�n plan, redirigir a la misma p�gina o mostrar un error
			            response.sendRedirect("planesEstudio.jsp?error=No+se+ha+seleccionado+ning�n+plan");
			     }
			}	
//------------------------------------------------	BOTON: "actualiza el plan" 	
			
			if (request.getParameter("btnActualizar") != null) {
				
				int filas = 0;
				
				String idPlanSeleccionado = request.getParameter("idPlanSeleccionado"); //aca guarda el valor en el hidden
				
				PlanEstudio plan = new PlanEstudio();

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
			    System.out.println("A�os " + request.getParameter("txtCamb_CantidadAnios"));    
			    
		        // Obtener la lista de planes de estudio desde el DAO
		        List<PlanEstudio> planes = planDAO.obtenerPlanesDeEstudioACTIVOS();

		        // Pasar la lista de planes al JSP
		        request.setAttribute("planes", planes);
							    
			    /// REQUEST DISPACHER
				request.setAttribute("cantidadFilas", filas);
				request.setAttribute("errorMensaje", "Se actualizo correctamente el plan seleccionado");
	              
				RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
		        dispatcher.forward(request, response);
			}
			
//------------------------------------------------	redirecciono a la vista de editar materia		
			
			if (request.getParameter("btnEditarMateria") != null) {

			    String idMateriaSeleccionada = request.getParameter("idMateriaSeleccionada"); // Valor del hidden   
			    System.out.println("idMateriaSeleccionada: " + idMateriaSeleccionada + " - SERVLET");

			    if (idMateriaSeleccionada != null && !idMateriaSeleccionada.isEmpty()) {

			        try {
			            // Validar que el idMateriaSeleccionada sea un n�mero v�lido
			            int idMateria = -1;
			            try {
			                idMateria = Integer.parseInt(idMateriaSeleccionada);
			            } catch (NumberFormatException e) {
			                response.sendRedirect("planesEstudio.jsp?error=ID+de+materia+inv�lido");
			                return;
			            }

			            // Llamar al m�todo para obtener la cantidad de a�os del plan
			            List<Integer> cantidadAnios = PlanesEstudioDao.obtenerAñosPorMateria(idMateria);
			            System.out.println("Cantidad de a�os del plan: " + cantidadAnios + " - SERVLET");
			            // Crear el HTML para el select de a�os
			            StringBuilder opcionesAños = new StringBuilder();
			            for (Integer año : cantidadAnios) {
			                opcionesAños.append("<option value=\"").append(año).append("\">").append(año).append("</option>");
			            }
			            request.setAttribute("opcionesA�os", opcionesAños.toString()); 
			            
			            // Obtener otros datos necesarios
			            MateriasPorAño materia = PlanesEstudioDao.obtenerUnaMateria(idMateria);
			            List<Periodo> periodos = PlanesEstudioDao.obtenerIDPeriodos();

			            // Pasar los datos como atributos al JSP
			            request.setAttribute("materia", materia);
			            request.setAttribute("periodos", periodos);
			            request.setAttribute("opcionesA�os", opcionesAños.toString()); 

			            System.out.println("Materia: " + materia + " - SERVLET");
			            System.out.println("Periodos: " + periodos + " - SERVLET");

			            // Redirigir a la p�gina de edici�n
			            request.getRequestDispatcher("editarMateria.jsp").forward(request, response);

			        } catch (SQLException e) {
			            e.printStackTrace();
			            response.sendRedirect("planesEstudio.jsp?error=Error+al+procesar+los+datos");
			        }
			    } else {
			        // Si faltan par�metros
			        response.sendRedirect("planesEstudio.jsp?error=Faltan+par�metros+obligatorios");
			    }
			}


//------------------------------------------------	BOTON: "editar materia seleccionada"	
			
			if (request.getParameter("btnActualizarMateria") != null) {
				
			    try {			    	
			    	// Obtener par�metros del formulario
			        int idMateria = Integer.parseInt(request.getParameter("idMateria"));
			        
			        int anio = Integer.parseInt(request.getParameter("nuevoAño"));
			        String nombre = request.getParameter("nuevoNombre");
			        int periodo = Integer.parseInt(request.getParameter("periodo"));
			        
			        int idAnioPlan =  PlanesEstudioDao.obtenerIdAnioPlanPorMateria(idMateria);		        
			        System.out.println("idMateria: " + idMateria + " tiene en materiaplan.id_añoPlan: " + idAnioPlan);
			        
			        System.out.println("año nuevo: " + anio);
			        System.out.println("nombre nuevo: " + nombre);
			        System.out.println("periodo nuevo: " + periodo);
			        
			        int id_plan = PlanesEstudioDao.obtenerIdPlanPorId(idAnioPlan);
			        System.out.println("idA�oPlan: " + idAnioPlan + " tiene en a�oplan.id_plan: " + idAnioPlan);
			      
			        
			        int id_añoPlan = PlanesEstudioDao.obtenerIdAñoPlan (id_plan, anio);
			        System.out.println("obtengo a�oplan.id que pertenece al a�o seleccionado  " + id_añoPlan);
			       
			        			        
			        // Crear un objeto MateriaPorA�o
			        MateriasPorAño materias = new MateriasPorAño();
			        materias.setIdMateria(idMateria);
			        materias.setIdAñoPlan(id_añoPlan);
			        materias.setMateria(nombre);
			        materias.setIDPeriodo(periodo);
			        
			     // Actualizar la materia en la base de datos
			        PlanesEstudioDao planDAO = new PlanesEstudioDao();
			        boolean filasAfectadas = planDAO.actualizarMateriaYPlan(materias);// Aseg�rate de capturar filasAfectadas
			        
			        // Establecer el n�mero de filas afectadas como atributo para la vista
			        request.setAttribute("cantidadFilas", filasAfectadas);
			        
			        // Obtener la lista de planes de estudio desde el DAO
			        List<PlanEstudio> planes = planDAO.obtenerPlanesDeEstudioACTIVOS();

			        // Pasar la lista de planes al JSP
			        request.setAttribute("planes", planes);
			        
			        // Redirigir al JSP de activos
			        request.setAttribute("errorMensaje", "Se actualizo correctamente la materia seleccionada");

			        RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
			        dispatcher.forward(request, response);
			        System.out.println("Se actualizo correctamente la materia seleccionada - SERVLET");
			    
			    } catch (NumberFormatException e) {
			        // Manejo de errores si los par�metros no son n�meros v�lidos
			        request.setAttribute("error", "Por favor, ingresa datos v�lidos.");
			        RequestDispatcher dispatcher = request.getRequestDispatcher("inicioAdmin.jsp");
			        dispatcher.forward(request, response);
			        System.out.println("Error al actualizar la materia seleccionada a - SERVLET");
			    } catch (Exception e) {
			        // Manejo de errores generales
			        request.setAttribute("error", "Ocurri� un error inesperado.");
			        RequestDispatcher dispatcher = request.getRequestDispatcher("inicioAdmin.jsp");
			        dispatcher.forward(request, response);
			        System.out.println("Error al actualizar la materia seleccionada b - SERVLET");
			    }
			}

//------------------------------------------------	BOTON: "eliminar materia seleccionada"	
			
			if (request.getParameter("btnEliminarMateria") != null) {
			    String idMateriaSeleccionada = request.getParameter("idMateriaSeleccionada");
			    
			    if (idMateriaSeleccionada != null && !idMateriaSeleccionada.isEmpty()) {
			        int idMateria = Integer.parseInt(idMateriaSeleccionada);
			        
			        System.out.println("se quiere eliminar este ID:" + idMateria + " SERVLET");
			       
			        // Llama al DAO para eliminar la materia
			        PlanesEstudioDao planDAO = new PlanesEstudioDao();
			        try {
			            boolean eliminado = planDAO.eliminarMateria(idMateria);
			            
			            // Obtener la lista de planes de estudio desde el DAO
				        List<PlanEstudio> planes = planDAO.obtenerPlanesDeEstudioACTIVOS();

				        // Pasar la lista de planes al JSP
				        request.setAttribute("planes", planes);
			            
				        if (eliminado) {	
				        	request.setAttribute("errorMensaje", "Se elimino correctamente la materia seleccionada");
			            	RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
					        dispatcher.forward(request, response);
					        
			                System.out.println("Se elimino correctamente la materia seleccionada - SERVLET");
	
			                
			            } else {
			            	request.setAttribute("errorMensaje", "No se pudo eliminar la materia seleccionada");
			            	
			            	RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
					        dispatcher.forward(request, response);
					        
					        System.out.println("No se pudo eliminar la materia seleccionada - SERVLET");
			           
			            }
			        } catch (SQLException e) {
			            e.printStackTrace(); // Muestra la traza de la excepci�n en la consola
			            request.setAttribute("error", "Ocurrio un error al intentar eliminar la materia.");
			        }   
			    }
			}
//------------------------------------------------ redirecciono a la vista agregar nueva materia
			if (request.getParameter("btnAgregarNuevaMateria") != null) {
			    try {
			    	  // Verificar si el par�metro 'idPlan' no es null o vac�o
			        String idPlanParam = request.getParameter("idPlan");
			        if (idPlanParam == null || idPlanParam.isEmpty()) {
			            System.out.println("Error: ID de plan no proporcionado.");
			            response.sendRedirect("error.jsp?mensaje=ID de plan no proporcionado.");
			            return; // Detener la ejecuci�n si el par�metro es inv�lido
			        }   	
			    	
			    	// Obt�n el ID del plan desde el par�metro
			        int idPlanSeleccionado = Integer.parseInt(idPlanParam);
			        System.out.println("ID Plan recibido: " + idPlanSeleccionado);

			        // Obt�n el plan correspondiente
			        PlanEstudio plan = PlanesEstudioDao.obtenerPlanPorId(idPlanSeleccionado);

			        if (plan != null) {
			            int cantidadAnios = plan.getCantidadAnios();
			            System.out.println("Cantidad de años del plan: " + cantidadAnios + " - SERVLET");
			         // Crear el HTML para el select de a�os
			            StringBuilder opcionesAños = new StringBuilder();
			            for (int i = 1; i <= cantidadAnios; i++) {
			                opcionesAños.append("<option value=\"").append(i).append("\">").append(i).append("</option>");
			            
			            }

			            request.setAttribute("plan", plan);
			            request.setAttribute("opcionesA�os", opcionesAños.toString());
			           			            
			            RequestDispatcher dispatcher = request.getRequestDispatcher("agregarNuevaMateria.jsp");
			            dispatcher.forward(request, response);
			        } else {
			            System.out.println("No se encontr� un plan con el ID proporcionado.");

			            request.setAttribute("errorMensaje", "No se encontr� un plan con el ID proporcionado.");
			            RequestDispatcher dispatcher = request.getRequestDispatcher("planesEstudioActivos.jsp");
				        dispatcher.forward(request, response);
			        }
			    } catch (NumberFormatException e) {
			        System.out.println("Error: ID de plan inv�lido.");
			        response.sendRedirect("error.jsp?mensaje=ID de plan inv�lido.");
			    } catch (Exception e) {
			        e.printStackTrace();
			        response.sendRedirect("error.jsp?mensaje=Error inesperado.");
			    }
			}
			
//------------------------------------------------BOTON: "agregar materia "	

			if (request.getParameter("btnAgregarMateria") != null) {
			    try {
			        // Obtener par�metros del formulario
			        int idPlan = Integer.parseInt(request.getParameter("idPlan"));
			        int año = Integer.parseInt(request.getParameter("nuevoA�o"));
			        String nombre = request.getParameter("nuevoNombre");
			        int periodo = Integer.parseInt(request.getParameter("nuevoPeriodo"));

			        // Imprimir valores en consola para depuraci�n
			        System.out.println("Plan_Estudio.id_plan: " + idPlan);
			        System.out.println("A�o al que pertenece la nueva materia: " + año);
			        System.out.println("Nombre de la nueva materia: " + nombre);
			        System.out.println("Periodo de la nueva materia: " + periodo);

			        // Obtener el ID del a�o plan
			        int id_añoPlan = PlanesEstudioDao.obtenerIdAñoPlan(idPlan, año);
			        System.out.println("Obtengo a�oplan.id= " + id_añoPlan + " que pertenece al a�o seleccionado");

			        // Crear un objeto MateriaPorA�o
			        MateriasPorAño materia = new MateriasPorAño();
			        materia.setMateria(nombre);
			        materia.setIDPeriodo(periodo);
			        materia.setIdAñoPlan(id_añoPlan);

			        // Insertar la materia en la base de datos
			        PlanesEstudioDao planDAO = new PlanesEstudioDao();
			        int filasAfectadas = planDAO.agregarMateria(materia);

			        // Establecer atributos para la vista
			        request.setAttribute("cantidadFilas", filasAfectadas);
			        if (filasAfectadas > 0) {
			            System.out.println("MATERIA AGREGADA CON �XITO");
			        } else {
			            System.out.println("NO SE PUDO AGREGAR LA MATERIA");
			        }

							PlanEstudio plan = PlanesEstudioDao.obtenerPlanPorId(idPlan);
							List<MateriasPorAño> materias = PlanesEstudioDao.obtenerMateriasXPlanID(idPlan);
							List<Periodo> periodos = PlanesEstudioDao.obtenerIDPeriodos(); // M�todo en tu DAO para obtener per�odos
			                List<Integer> A  = PlanesEstudioDao.obtenerAños(idPlan);
			                
			                plan.setIdPlan(idPlan);
			                
			                // Pasar los datos como atributos a la JSP
							request.setAttribute("plan", plan);
			                request.setAttribute("materiasPorA�o", materias);
			                request.setAttribute("listaPeriodos", periodos);
			                request.setAttribute("listaAnios", A);
			        // Redirigir a la vista
			        request.setAttribute("errorMensaje", "Se agrego la materia correctamente");
			        RequestDispatcher dispatcher = request.getRequestDispatcher("editarPlan.jsp");
			        dispatcher.forward(request, response);
			    } catch (Exception e) {
			        e.printStackTrace();
			        request.setAttribute("errorMensaje", "Ocurrio un error al agregar la materia: " + e.getMessage());
			        RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			        dispatcher.forward(request, response);
			    }
			}
				

	}
}
	


