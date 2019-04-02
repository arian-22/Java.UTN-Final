package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cli_Veh_Alq;
import entidades.Usuario;
import entidades.Vehiculos;
import negocio.Controlador;
import negocio.ControladorAlquiler;

/**
 * Servlet implementation class URLs
 */
@WebServlet("/URLs")
public class URLs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public URLs() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doGet(request, response);
		if (request.getParameter("btn-home-admin") != null) {
			request.getRequestDispatcher("WEB-INF/inicioAdmin.jsp").forward(request, response);

		} else if (request.getParameter("btn-stock-autos") != null) {

			Controlador ctrl = new Controlador();
			ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
			vehiculos = ctrl.getVehiculosPorTipo("A");
			request.getSession().setAttribute("vehiculos-stock", vehiculos);
			request.getRequestDispatcher("WEB-INF/autos.jsp").forward(request, response);

		} else if (request.getParameter("btn-stock-camionetas") != null) {

			Controlador ctrl = new Controlador();
			ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
			vehiculos = ctrl.getVehiculosPorTipo("C");
			request.getSession().setAttribute("vehiculos-stock", vehiculos);
			request.getRequestDispatcher("WEB-INF/camionetas.jsp").forward(request, response);

		} else if (request.getParameter("btnNuevaReserva") != null) {

			request.getRequestDispatcher("WEB-INF/nuevaReserva.jsp").forward(request, response);
			
		} else if (request.getParameter("btnCerrar") != null) {

			Usuario cliente = new Usuario();
			cliente = (Usuario) request.getSession().getAttribute("user");

			ControladorAlquiler ctrl = new ControladorAlquiler();

			ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();

			cva = ctrl.buscarAlquileresDelCliente(cliente.getMail());

			request.getSession().setAttribute("alquileresCliente", cva);

			request.getRequestDispatcher("WEB-INF/cancelacionCliente.jsp").forward(request, response);

		} else if (request.getParameter("btnVerReservas") != null) {

			Usuario cliente = new Usuario();
			cliente = (Usuario) request.getSession().getAttribute("user");

			ControladorAlquiler ctrl = new ControladorAlquiler();

			ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();

			cva = ctrl.buscarAlquileresDelCliente(cliente.getMail());

			request.getSession().setAttribute("alquileresCliente", cva);

			request.getRequestDispatcher("WEB-INF/cancelacionCliente.jsp").forward(request, response);
		}

		else if (request.getParameter("btnAlquilerAdmin") != null) {

			request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
		}
	}

}
