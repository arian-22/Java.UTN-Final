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
		System.out.println("PATENTE " + vehiculos.getPatente());
		
		vehiculos.setMarca(request.getParameter("marca"));
		System.out.println("MARCA " + vehiculos.getMarca());
		
		vehiculos.setModelo(request.getParameter("modelo"));
		System.out.println("MODELO " + vehiculos.getModelo());
		
		vehiculos.setCantAsientos(Integer.parseInt(request.getParameter("cant_asientos")));
		System.out.println("CANTASIENTOS " + vehiculos.getPatente());
		
		vehiculos.setTransmision(request.getParameter("transmision"));
		System.out.println("TRANSMISION " + vehiculos.getTransmision());
		
		vehiculos.setBaul(request.getParameter("baul"));
		System.out.println("BAUL " + vehiculos.getBaul());
		
		vehiculos.setTipo(request.getParameter("tipo"));
		System.out.println("TIPO " + vehiculos.getTipo());
		
		vehiculos.setEstado(request.getParameter("estado"));
		System.out.println("ESTADO " + vehiculos.getEstado());
		
		vehiculos.setAnio(Integer.parseInt(request.getParameter("anio")));
		System.out.println("ANIO " + vehiculos.getAnio());
		
		vehiculos.setKm(Integer.parseInt(request.getParameter("km")));
		System.out.println("KM " + vehiculos.getKm());
		
		vehiculos.setPrecio(Integer.parseInt(request.getParameter("precio_base")));
		System.out.println("PRECIO " + vehiculos.getPrecio());
		
				
		controlador.registrarVehiculos(vehiculos);
		request.getRequestDispatcher("WEB-INF/abmVehiculos.jsp").forward(request, response);	
	}

}
