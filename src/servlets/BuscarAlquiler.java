package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.Controlador;
import negocio.ControladorAlquiler;
import entidades.Cli_Veh_Alq;
import entidades.Vehiculos;

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
		
		ControladorAlquiler ctrl = new ControladorAlquiler();
		
		Controlador ctrlVehiculo = new Controlador();
		
		Cli_Veh_Alq alq = new Cli_Veh_Alq();
		
		Vehiculos vehiculo= new Vehiculos();
		
		alq = ctrl.buscarAlquiler(Integer.parseInt(request.getParameter("num_alquiler")));
		
		vehiculo = ctrlVehiculo.recuperarVehiculo(alq.getVehiculo().getPatente()); 
		
		System.out.println("PrecioBase"+vehiculo.getPrecio());
		
		if (request.getParameter("btnReserva")!= null){
			request.getSession().setAttribute("msjErrorReserva",1);
			request.getSession().setAttribute("alquiler-reserva", alq);
		}
		else if(request.getParameter("btnDevolucion")!= null){
			request.getSession().setAttribute("msjErrorDev",1);
			request.getSession().setAttribute("alquiler-dev", alq);
			}
			
		request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
		
	}
}
