package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cli_Veh_Alq;
import entidades.Vehiculos;
import negocio.Controlador;

/**
 * Servlet implementation class RetiroVehiculo
 */
@WebServlet("/Alquileres")
public class Alquileres extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Alquileres() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
			Controlador ctrl = new Controlador();
			Cli_Veh_Alq cva = new Cli_Veh_Alq();
		
		if (request.getParameter("btn-reserva")!= null){
			
			cva = (Cli_Veh_Alq)request.getSession().getAttribute("alquiler-reserva");
			System.out.println("estado:" + cva.getVehiculo().getEstado());
			System.out.println("patente:" + cva.getVehiculo().getPatente());
			System.out.println("alquiler:" + cva.getAlquiler().getNro_alquiler());
			cva.getVehiculo().setEstado("En uso");
			ctrl.actualizarVehiculos(cva.getVehiculo());
			}
		else if (request.getParameter("btn-devolucion")!= null){
			
			cva = (Cli_Veh_Alq)request.getSession().getAttribute("alquiler-dev");
			System.out.println("estado:" + cva.getVehiculo().getEstado());
			System.out.println("patente:" + cva.getVehiculo().getPatente());
			System.out.println("alquiler:" + cva.getAlquiler().getNro_alquiler());
			cva.getVehiculo().setEstado("En uso");
			ctrl.actualizarVehiculos(cva.getVehiculo());
			
			}
		else if (request.getParameter("btn-cancelar")!= null){
			
			}
		request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
		
	}

}
