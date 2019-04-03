package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cli_Veh_Alq;
import entidades.Vehiculos;
import negocio.ControladorInforme;

/**
 * Servlet implementation class Informes
 */
@WebServlet("/Informes")
public class Informes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Informes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		ControladorInforme ci = new ControladorInforme();
		
		ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
		vehiculos = ci.getStockVehiculos();
		request.getSession().setAttribute("vehiculos-stock", vehiculos);
		
		ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
		cva = ci.getVehiculosAlquiladosActualmente();
		request.getSession().setAttribute("alquileres actuales", cva);
				
		request.getRequestDispatcher("WEB-INF/informes.jsp").forward(request, response);
	}

}
