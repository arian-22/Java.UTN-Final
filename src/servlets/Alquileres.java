package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cli_Veh_Alq;
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
			cva.getVehiculo().setEstado("En uso");
			ctrl.actualizarVehiculos(cva.getVehiculo());
			
			}
		else if (request.getParameter("btn-devolucion")!= null){
			
			cva = (Cli_Veh_Alq)request.getSession().getAttribute("alquiler-dev");
			
			cva.getVehiculo().setEstado("Disponible");
			ctrl.actualizarVehiculos(cva.getVehiculo());	
			
			System.out.println(cva.getAlquiler().getPrecioAlquiler());
			
			Date fechaActual = new Date();
			System.out.println(fechaActual);
			
			float TotalAPagar=0;
			int dias=0;
			
			int alq=cva.getAlquiler().getFechaHasta().compareTo(fechaActual);
			
			System.out.println(alq);
			if (cva.getAlquiler().getFechaHasta().compareTo(fechaActual)<0){
				//si la fechaHasta es anterior a la actual el compare da < 0
				dias=(int) ((fechaActual.getTime()-cva.getAlquiler().getFechaHasta().getTime())/86400000);
				System.out.println(dias);
				System.out.println(cva.getAlquiler().getPrecioAlquiler());
				System.out.println(cva.getVehiculo().getPrecio());
				System.out.println(dias*((cva.getVehiculo().getPrecio()*25)/100));
			TotalAPagar = cva.getAlquiler().getPrecioAlquiler()+ dias*cva.getVehiculo().getPrecio() +dias*((cva.getVehiculo().getPrecio()*25)/100);
			
			System.out.println(TotalAPagar);
			}
			else if(cva.getAlquiler().getFechaHasta().compareTo(fechaActual)>0){
				//si la fechaHasta es posterior a la actual el compare da > 0
				dias=(int) ((cva.getAlquiler().getFechaHasta().getTime()-fechaActual.getTime())/86400000);
				System.out.println("Dias"+dias);
			 TotalAPagar = cva.getAlquiler().getPrecioAlquiler()+dias*cva.getVehiculo().getPrecio() +dias*(cva.getVehiculo().getPrecio()*50)/100;
			 System.out.println("PrecioAlq"+cva.getAlquiler().getPrecioAlquiler());
			 System.out.println(TotalAPagar);
			}
			
			}
		request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
		
	}

}
