package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.ControladorAlquiler;
import entidades.Cli_Veh_Alq;
import entidades.Usuario;

/**
 * Servlet implementation class BuscarAlquiler
 */
@WebServlet("/BuscarAlquiler")
public class BuscarAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarAlquiler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		if(request.getSession().getAttribute("user") != null ) {
			
			Usuario user = new Usuario();
			user = (Usuario) request.getSession().getAttribute("user");
			
			if(user.getAdmin().equals("S")) {
		
				ControladorAlquiler ctrl = new ControladorAlquiler();
				Cli_Veh_Alq alq = new Cli_Veh_Alq();
				
				request.getSession().removeAttribute("errorModal");
								
				if (request.getParameter("btnReserva")!= null){	
					request.getSession().removeAttribute("datosDevolucion");
					try {
						alq = ctrl.buscarAlquilerARetirar(Integer.parseInt(request.getParameter("dni")));
						if(alq.getAlquiler() == null){	
							request.getSession().removeAttribute("okModal");
							request.getSession().setAttribute("errorModal", "El cliente no tiene vehículo a retirar");
							request.getSession().removeAttribute("alquiler-reserva");
						}
						else {
							request.getSession().removeAttribute("errorModal");
							request.getSession().setAttribute("alquiler-reserva", alq);
							request.getSession().removeAttribute("datosDevolucion");
							request.getSession().setAttribute("datosAlquier", 1);
						}
					} catch (SQLException e) {
						request.getSession().removeAttribute("okModal");
						request.getSession().setAttribute("errorModal", e.getMessage());
					}
					
				}
				else if(request.getParameter("btnDevolucion")!= null){
					try {
						alq = ctrl.buscarAlquilerADevolver(request.getParameter("nro_patente"));
						if(alq.getAlquiler() == null) {		
							request.getSession().removeAttribute("okModal");
							request.getSession().removeAttribute("datosDevolucion");
							request.getSession().removeAttribute("alquiler-dev");
							request.getSession().setAttribute("errorModal", "El vehículo ya ha sido devuelto o aún no ha sido retirado");
						} else {
							request.getSession().removeAttribute("errorModal");
							request.getSession().setAttribute("alquiler-dev", alq);
							request.getSession().removeAttribute("datosDevolucion");
							request.getSession().setAttribute("datosAlquier", 1);
						}
					} catch (SQLException e) {
						request.getSession().removeAttribute("okModal");
						request.getSession().setAttribute("errorModal", e.getMessage());
					}
				}	
				
				request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);	
		
			}else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}
}
