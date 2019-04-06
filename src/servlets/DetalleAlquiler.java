package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Vehiculos;
import negocio.Controlador;

/**
 * Servlet implementation class DetalleAlquiler
 */
@WebServlet("/DetalleAlquiler")
public class DetalleAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetalleAlquiler() {
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
		
		String patente = request.getParameter("vehiculo-selected");
		String fecha_desde = request.getParameter("fecha_desde");
		String fecha_hasta = request.getParameter("fecha_hasta");
		Controlador ctrl = new Controlador();
		Vehiculos v = new Vehiculos();
		
		try {
			v = ctrl.recuperarVehiculo(patente);

			request.getSession().setAttribute("fecha-desde", fecha_desde);
			request.getSession().setAttribute("fecha-hasta", fecha_hasta);
			request.getSession().setAttribute("vehiculo", v);
			
			request.getRequestDispatcher("WEB-INF/detalleConfirmacionAlquiler.jsp").forward(request, response);			
			
		} catch (SQLException e) {
			request.getSession().setAttribute("errorModal", e.getMessage());
			
			request.getRequestDispatcher("WEB-INF/vehiculosDisponibles.jsp").forward(request, response);			
		}
		
	}

}
