package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entidades.Vehiculos;
import negocio.ControladorAlquiler;

/**
 * Servlet implementation class VehiculosDisponibles
 */
@WebServlet("/VehiculosDisponibles")
public class VehiculosDisponibles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	/**
     * Permite convertir un String en fecha (Date).
     * @param fecha Cadena de fecha dd/MM/yyyy
     * @return Objeto Date
     */
	public static Date ParseFecha(String fecha)
    {
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaDate = null;
        try {
            fechaDate = formato.parse(fecha);
        } 
        catch (ParseException ex) 
        {
            System.out.println(ex);
        }
        return fechaDate;
    } 
	
	
    public VehiculosDisponibles() {
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
		
		Date fechaActual = new Date();
		
		String fecha_desde = request.getParameter("fecha_desde");
		
		String fecha_hasta = request.getParameter("fecha_hasta");
		
		Date fecha_desdeFormat = ParseFecha(fecha_desde);
				
		Date fecha_hastaFormat = ParseFecha(fecha_hasta);
		
		
		if ((fecha_desdeFormat != null) && (fecha_desdeFormat.compareTo(fechaActual) > 0)){
			
			if ((fecha_hastaFormat !=null) && (fecha_hastaFormat.compareTo(fecha_desdeFormat) > 0)){
			
				request.getSession().setAttribute("fecha-desde", fecha_desde);
				request.getSession().setAttribute("fecha-hasta", fecha_hasta);
				
				ControladorAlquiler ctrl = new ControladorAlquiler();
				ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
				vehiculos = ctrl.getStockVehiculosDisponiblesParaAlquilar(fecha_desde, fecha_hasta);
				request.getSession().setAttribute("vehiculos-stock-disponibles", vehiculos);
				request.getRequestDispatcher("WEB-INF/vehiculosDisponibles.jsp").forward(request, response);
				
			}else {
				request.getSession().setAttribute("msjErrorFecha", "La fecha hasta debe ser mayor a la fecha desde");
				request.getRequestDispatcher("WEB-INF/nuevaReserva.jsp").forward(request, response);
				}
			
		}else {
			request.getSession().setAttribute("msjErrorFecha", "La fecha desde debe ser mayor a la fecha del día hoy ");
			request.getRequestDispatcher("WEB-INF/nuevaReserva.jsp").forward(request, response);
			}
		
		}

}
