package servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LogicaImp.LogicaUsuarioImp;
import models.MateriasEstudiante;
import models.Usuario;



@WebServlet("/ServletEstudianteInformeMaterias")
public class ServletEstudianteInformeMaterias extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ServletEstudianteInformeMaterias() {
        super();
       
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        HttpSession sesion = request.getSession(false);

      
        if (sesion != null) {
           
            Object usuario = sesion.getAttribute("usuario");

        
            if (usuario != null) {
             
                Integer id = (Integer) sesion.getAttribute("id_usuario");
                System.out.println("El id de la sesión es: " + id);

              
                LogicaUsuarioImp logic = new LogicaUsuarioImp();

               
                List<MateriasEstudiante> materiasPendientes = logic.MateriasPendientes(id);

               
                request.setAttribute("materiasPendientes", materiasPendientes);

              
                request.getRequestDispatcher("/homeStudent.jsp").forward(request, response);

            } else {
                System.out.println("Usuario no autenticado");
                response.getWriter().write("Usuario no autenticado");
            }
        } else {
            System.out.println("No hay sesión activa");
            response.getWriter().write("No hay sesión activa");
        }
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
