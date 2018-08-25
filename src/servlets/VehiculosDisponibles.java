package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
		
		String fecha_desde = request.getParameter("fecha_desde");
		System.out.println("Fecha desde: " + fecha_desde);
		String fecha_hasta = request.getParameter("fecha_hasta");
		System.out.println("Fecha hasta: " + fecha_hasta);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			Date fechaDesde = formatter.parse(fecha_desde);
			System.out.println("Fecha desde: " + fechaDesde);
			Date fechaHasta = formatter.parse(fecha_hasta);
			System.out.println("Fecha hasta: " + fechaHasta);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		ControladorAlquiler ctrl = new ControladorAlquiler();
		ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
		vehiculos = ctrl.getStockVehiculosDisponiblesParaAlquilar(fecha_desde, fecha_hasta);
		request.getSession().setAttribute("vehiculos-stock-disponibles", vehiculos);
		
		request.getRequestDispatcher("WEB-INF/vehiculosDisponibles.jsp").forward(request, response);
	}

}
