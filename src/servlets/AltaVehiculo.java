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
import utils.ApplicationExceptions;

/**
 * Servlet implementation class AltaVehiculo
 */
@WebServlet("/AltaVehiculo")
public class AltaVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaVehiculo() {
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
		Controlador controlador = new Controlador();
		Vehiculos vehiculos = new Vehiculos();
		
		vehiculos.setPatente(request.getParameter("nro_patente"));
		vehiculos.setMarca(request.getParameter("marca"));
		vehiculos.setModelo(request.getParameter("modelo"));
		vehiculos.setCantAsientos(Integer.parseInt(request.getParameter("cant_asientos")));
		vehiculos.setTransmision(request.getParameter("transmision"));
		if(Boolean.parseBoolean(request.getParameter("baul"))){
			vehiculos.setBaul("No");
		} else {
			vehiculos.setBaul("Si");
		}
		vehiculos.setTipo(request.getParameter("tipo"));
		vehiculos.setEstado("Disponible");
		vehiculos.setAnio(Integer.parseInt(request.getParameter("anio")));
		vehiculos.setKm(Float.parseFloat(request.getParameter("km")));
		vehiculos.setPrecio(Float.parseFloat(request.getParameter("precio_base")));
				
		try {
			controlador.registrarVehiculos(vehiculos);
			request.getSession().removeAttribute("errorModal");
			request.getSession().setAttribute("okModal", "Se ha registrado el nuevo vehículo correctamente.");

		} catch (SQLException e) {
			request.getSession().setAttribute("errorModal", e.getMessage());
			request.getSession().removeAttribute("okModal");

		}
		
		request.getRequestDispatcher("WEB-INF/abmVehiculos.jsp").forward(request, response);	
	}

}
