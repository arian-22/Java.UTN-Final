package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alquiler;
import negocio.ControladorAlquiler;

/**
 * Servlet implementation class Alquiler
 */
@WebServlet("/Alquiler")
public class AlquilerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlquilerAdmin() {
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
		Alquiler alquiler = new Alquiler();
		
		//alquiler =(Alquiler)request.getSession().getAttribute("buscarAlquiler");
		//ctrl.buscarAlquiler(alquiler.getNro_alquiler());
				
		request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
	}

}
