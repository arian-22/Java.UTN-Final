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
 * Servlet implementation class ModificarVehiculo
 */
@WebServlet("/ModificarVehiculo")
public class ModificarVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarVehiculo() {
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
		
		boolean seModificoPrecio;
		Controlador controlador = new Controlador();
		Vehiculos vehiculos = new Vehiculos();
				
		vehiculos.setPatente(request.getParameter("nro_patente"));
		vehiculos.setMarca(request.getParameter("marca"));
		vehiculos.setModelo(request.getParameter("modelo"));
		vehiculos.setCantAsientos(Integer.parseInt(request.getParameter("cant_asientos")));
		vehiculos.setTransmision(request.getParameter("transmision"));
		vehiculos.setBaul(request.getParameter("baul"));
		vehiculos.setTipo(request.getParameter("tipo"));
		vehiculos.setEstado(request.getParameter("estado"));
		vehiculos.setAnio(Integer.parseInt(request.getParameter("anio")));
		vehiculos.setKm(Float.parseFloat(request.getParameter("km")));
		
		if( Float.parseFloat(request.getParameter("precio_base")) != (Float) request.getSession().getAttribute("precioPersistido")){
			seModificoPrecio = true;
			vehiculos.setPrecio(Float.parseFloat(request.getParameter("precio_base")));
		}
		else {
			seModificoPrecio = false;
		}
		
		try {
			controlador.actualizarVehiculos(vehiculos, seModificoPrecio);
			
			request.getSession().removeAttribute("errorModal");
			request.getSession().setAttribute("okModal", "Se ha modificaco el vehículo correctamente.");
			 
		 } catch (SQLException e) {
			request.getSession().setAttribute("errorModal", e.getMessage());
			request.getSession().removeAttribute("okModal");
		 }
		
		request.getSession().removeAttribute("vehiculo-baja");
		request.getSession().removeAttribute("msjErrorBaja");
		request.getSession().removeAttribute("vehiculo-mod");


		request.getRequestDispatcher("WEB-INF/abmVehiculos.jsp").forward(request, response);	
	}

}
