package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Vehiculos;
import negocio.Controlador;

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
		vehiculos.setBaul(request.getParameter("baul"));
		vehiculos.setTipo(request.getParameter("tipo"));
		vehiculos.setEstado(request.getParameter("estado"));
		vehiculos.setAnio(Integer.parseInt(request.getParameter("anio")));
		vehiculos.setKm(Integer.parseInt(request.getParameter("km")));
		vehiculos.setPrecio(Integer.parseInt(request.getParameter("precio_base")));
				
		controlador.registrarVehiculos(vehiculos);
		request.getRequestDispatcher("WEB-INF/abmVehiculos.jsp").forward(request, response);	
	}

}
