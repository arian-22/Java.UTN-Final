package servlets;

import java.io.IOException;
import java.util.ArrayList;

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
				ArrayList<Cli_Veh_Alq> alquileres = new ArrayList<Cli_Veh_Alq>();
				
				alquileres = ctrl.buscarAlquileresARetirar(Integer.parseInt(request.getParameter("dni")));	
				alq = ctrl.buscarAlquilerADevolver(request.getParameter("nro_patente"));
				
				if (request.getParameter("btnReserva")!= null){	
					if(alq.getAlquiler() == null){	
						request.getSession().removeAttribute("okModal");
						request.getSession().setAttribute("errorModal", "El Alquiler no fue encontrado.");
					}else {
						if(alq.getVehiculo().getEstado().equals("En uso")) {
							request.getSession().removeAttribute("okModal");
							request.getSession().setAttribute("errorModal", "El vehículo ya ha sido retirado");
						}
						else {
							request.getSession().removeAttribute("errorModal");
							request.getSession().setAttribute("alquiler-reserva", alq);
						}
					}
				}
				else if(request.getParameter("btnDevolucion")!= null){
					if(alq.getAlquiler() == null) {		
						request.getSession().removeAttribute("okModal");
						request.getSession().setAttribute("errorModal", "El Alquiler no fue encontrado.");
					} else {
						if(alq.getVehiculo().getEstado().equals("Disponible")) {
							request.getSession().removeAttribute("okModal");
							request.getSession().setAttribute("errorModal", "El vehículo ya ha sido devuelto o aún no ha sido retirado.");
						}
						else {
							request.getSession().removeAttribute("errorModal");
							request.getSession().setAttribute("alquiler-dev", alq);
							request.getSession().removeAttribute("datosDevolucion");
							request.getSession().setAttribute("datosAlquier", 1);
						}
						
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
