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
 * Servlet implementation class BuscarVehiculo
 */
@WebServlet("/BuscarVehiculo")
public class BuscarVehiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarVehiculo() {
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
		Vehiculos v = new Vehiculos();
		
		v = ctrl.recuperarVehiculo(request.getParameter("patente"));
		
		request.getSession().setAttribute("precioPersistido", v.getPrecio());
		
		if (request.getParameter("btnbaja")!= null){ 
			request.getSession().setAttribute("msjErrorBaja", 1);
			request.getSession().setAttribute("vehiculo-baja", v);
		
		} else if(request.getParameter("btnmod")!= null){
			request.getSession().setAttribute("msjErrorMod", 1);
			request.getSession().setAttribute("vehiculo-mod", v);
		}
			
		request.getRequestDispatcher("WEB-INF/abmVehiculos.jsp").forward(request, response);	
	}

}
