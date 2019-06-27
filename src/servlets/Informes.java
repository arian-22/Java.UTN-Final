package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Cli_Veh_Alq;
import entidades.Usuario;
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		if(request.getSession().getAttribute("user") != null ) {
			
			Usuario user = new Usuario();
			user = (Usuario) request.getSession().getAttribute("user");
			
			if(user.getAdmin().equals("S")) { 

			
				ControladorInforme ci = new ControladorInforme();
				
				ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
				try {
					vehiculos = ci.getStockVehiculos();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				request.getSession().setAttribute("vehiculos-stock", vehiculos);
				
				ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
				try {
					cva = ci.getVehiculosAlquiladosActualmente();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("alquileres actuales", cva);
				
				ArrayList<Cli_Veh_Alq> alqDevolver = new ArrayList<Cli_Veh_Alq>();
				try {
					alqDevolver = ci.getVehiculosADevolverHoy();
					if (alqDevolver.size() != 0) {
						request.getSession().setAttribute("bandera", 0);
						request.getSession().setAttribute("vehiculos a devolver", alqDevolver);
						request.getRequestDispatcher("WEB-INF/informes.jsp").forward(request, response);
					} else {
						request.getSession().removeAttribute("vehiculos a devolver");
						request.getSession().setAttribute("bandera", 1);
						request.getRequestDispatcher("WEB-INF/informes.jsp").forward(request, response);
					}
					
				} catch (SQLException e) {
					request.getSession().setAttribute("errorModal", e.getMessage());
				}
				
			
			}else {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
