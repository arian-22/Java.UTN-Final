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
 * Servlet implementation class EliminarVehicuo
 */
@WebServlet("/EliminarVehiculo")
public class EliminarVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarVehiculo() {
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
		Vehiculos vehiculo = new Vehiculos();
		
		vehiculo = (Vehiculos)request.getSession().getAttribute("vehiculo-baja");
		
		try {
			ctrl.eliminarVehiculo(vehiculo.getPatente());
			request.getSession().removeAttribute("errorModal");
			request.getSession().setAttribute("okModal", "Se ha eliminado el vehículo correctamente.");

		} catch (SQLException e) {
			request.getSession().setAttribute("errorModal", e.getMessage());
			request.getSession().removeAttribute("okModal");

		}
		
		request.getRequestDispatcher("WEB-INF/abmVehiculos.jsp").forward(request, response);
		
	}

}
