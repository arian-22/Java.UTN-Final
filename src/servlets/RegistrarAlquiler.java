package servlets;

import java.io.IOException;
import java.sql.SQLException;

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
		
		String tarjetaCredito = request.getParameter("credit-card");
		
		String fecha_desde = (String) request.getSession().getAttribute("fecha-desde");
		String fecha_hasta = (String) request.getSession().getAttribute("fecha-hasta");
			
		Usuario usuario = (Usuario) request.getSession().getAttribute("user");
		String mailUsuario = usuario.getMail();
	
		float precioAlquiler = (float) request.getSession().getAttribute("precioTotal");
		int nroAlquiler;
		try {
			request.getSession().removeAttribute("errorModal"); 
			nroAlquiler = ctrl.registrarAlquiler(patenteVehiculo, fecha_desde, fecha_hasta, mailUsuario, precioAlquiler, tarjetaCredito);
			request.getSession().setAttribute("nro-alquiler", nroAlquiler);
			request.getRequestDispatcher("WEB-INF/confirmacionAlquiler.jsp").forward(request, response);
		} catch (SQLException e) {
			request.getSession().setAttribute("errorModal", e.getMessage());
			request.getRequestDispatcher("WEB-INF/detalleConfirmacionAlquiler.jsp").forward(request, response);
		}
	
		
	}

}
