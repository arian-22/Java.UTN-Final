package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alquiler;
import entidades.Cli_Veh_Alq;
import entidades.Usuario;
import negocio.ControladorAlquiler;

/**
 * Servlet implementation class ConfirmaCancelacionAlquiler
 */
@WebServlet("/ConfirmaCancelacionAlquiler")
public class ConfirmaCancelacionAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmaCancelacionAlquiler() {
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
		
		ControladorAlquiler ctrl= new ControladorAlquiler();
		Usuario cliente = new Usuario();
		ControladorAlquiler ctrl2 = new ControladorAlquiler();
		ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
		
		Alquiler alq = (Alquiler) request.getSession().getAttribute("alquilerPorCancelar");
		
		cliente = (Usuario)request.getSession().getAttribute("user");
		ctrl.actualizarAlquiler(alq);
		cva = ctrl2.buscarAlquileresDelCliente(cliente.getMail());
		
		request.getSession().setAttribute("alquileresCliente", cva);
	
		request.getRequestDispatcher("WEB-INF/cancelacionCliente.jsp").forward(request, response);
		
		
	}

}
