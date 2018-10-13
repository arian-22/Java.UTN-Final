package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import entidades.Vehiculos;
import negocio.ControladorAlquiler;

/**
 * Servlet implementation class RegistrarAlquiler
 */
@WebServlet("/RegistrarAlquiler")
public class RegistrarAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarAlquiler() {
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
		
		ControladorAlquiler ctrl = new ControladorAlquiler();
		
		Vehiculos vehiculo = new Vehiculos();
		vehiculo = (Vehiculos) request.getSession().getAttribute("vehiculo");
		String patenteVehiculo = vehiculo.getPatente();
		
		int tarjetaCredito = Integer.parseInt(request.getParameter("credit-card"));
		
		try {
			String fecha_desde = (String) request.getSession().getAttribute("fecha-desde");
			String fecha_hasta = (String) request.getSession().getAttribute("fecha-hasta");
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date fechaDesde;
			
			fechaDesde = format.parse(fecha_desde);
			
			Date fechaHasta = format.parse(fecha_hasta);
			System.out.println("Fecha: " + fechaDesde);
	
			
			Usuario usuario = (Usuario) request.getSession().getAttribute("user");
			String mailUsuario = usuario.getMail();
	
			float precioAlquiler = (float) request.getSession().getAttribute("precioTotal");
			
			int nroAlquiler = ctrl.registrarAlquiler(patenteVehiculo, fecha_desde, fecha_hasta, mailUsuario, precioAlquiler, tarjetaCredito);
			
			System.out.println("Nro alqyuler: " + nroAlquiler);
			request.getSession().setAttribute("nro-alquiler", nroAlquiler);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("WEB-INF/confirmacionAlquiler.jsp").forward(request, response);

	}

}
