package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cli_Veh_Alq;
import negocio.Controlador;
import negocio.ControladorAlquiler;

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
			
			ControladorAlquiler ctrlAlq = new ControladorAlquiler();
		
		if (request.getParameter("btn-reserva")!= null){
			
			cva = (Cli_Veh_Alq)request.getSession().getAttribute("alquiler-reserva");
			cva.getVehiculo().setEstado("En uso");
			try {
				ctrl.actualizarVehiculos(cva.getVehiculo(), false);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}
		else if (request.getParameter("btn-devolucion")!= null){
			
			float totalAPagar = 0;		
			int dias = 0;
			
			cva = (Cli_Veh_Alq)request.getSession().getAttribute("alquiler-dev");
			cva.getVehiculo().setEstado("Disponible");
			try {
				ctrl.actualizarVehiculos(cva.getVehiculo(), false);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			
			Date fechaInicioCalculo = new Date();		
			if( cva.getAlquiler().getFechaDesde().compareTo(fechaInicioCalculo) > 0) {
				fechaInicioCalculo = cva.getAlquiler().getFechaDesde();
			}
			
			if (cva.getAlquiler().getFechaHasta().compareTo(fechaInicioCalculo) < 0){
				//si la fechaHasta es anterior a la actual el compare da < 0
				dias=(int) ((fechaInicioCalculo.getTime()-cva.getAlquiler().getFechaHasta().getTime())/86400000);
				
				totalAPagar = cva.getAlquiler().getPrecioAlquiler()+ dias*cva.getVehiculo().getPrecio() + dias * ((cva.getVehiculo().getPrecio()*25)/100);				
			}			
			else if(cva.getAlquiler().getFechaHasta().compareTo(fechaInicioCalculo) > 0){
				//si la fechaHasta es posterior a la actual el compare da > 0
				dias = (int) ((cva.getAlquiler().getFechaHasta().getTime()-fechaInicioCalculo.getTime())/86400000);
				
				totalAPagar = cva.getAlquiler().getPrecioAlquiler()+dias*cva.getVehiculo().getPrecio() +dias*(cva.getVehiculo().getPrecio()*50)/100;
			}
			else if(cva.getAlquiler().getFechaHasta().compareTo(fechaInicioCalculo) == 0){
				//si es devuelto el mismo día que termina el alquiler, el compare da 0
				dias=(int) ((cva.getAlquiler().getFechaHasta().getTime()-fechaInicioCalculo.getTime())/86400000);
				
				totalAPagar = cva.getAlquiler().getPrecioAlquiler();
			}
			
			Date fechaActualDate = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String FechaActual = format.format(fechaActualDate);
			
			cva.getAlquiler().setFechaFinalizacion(FechaActual);
			cva.getAlquiler().setPrecioFinalAlquiler(totalAPagar);
			
			ctrlAlq.actualizarAlquiler(cva.getAlquiler());
			
			request.getSession().setAttribute("total-pagar", totalAPagar);
			request.getSession().setAttribute("dias", dias);
			request.getSession().setAttribute("precioAlquiler", cva.getAlquiler().getPrecioAlquiler());
			request.getSession().setAttribute("datosDevolucion", 1);
			
			}
		request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
		
	}

}
