package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.Messaging.SyncScopeHelper;

import negocio.ControladorAlquiler;
import entidades.Cli_Veh_Alq;

/**
 * Servlet implementation class BuscarAlquiler
 */
@WebServlet("/BuscarAlquiler")
public class BuscarAlquiler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarAlquiler() {
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
		
		doGet(request, response);
		
		ControladorAlquiler ctrl = new ControladorAlquiler();
		
		
		Cli_Veh_Alq alq = new Cli_Veh_Alq();
		
		System.out.println(Integer.parseInt(request.getParameter("num_alquiler")));
		
		alq = ctrl.buscarAlquiler(Integer.parseInt(request.getParameter("num_alquiler")));	
		
		if (request.getParameter("btnReserva")!= null){
			
			if(alq.getAlquiler() == null){	
				request.getSession().setAttribute("msjErrorReserva",1);		
			}else {
				request.getSession().setAttribute("alquiler-reserva", alq);
			}
		}
		else if(request.getParameter("btnDevolucion")!= null){
			
			if(alq.getAlquiler() == null) {		
				request.getSession().setAttribute("msjErrorDev",1);
			} else {
				request.getSession().removeAttribute("msjErrorDev");
				request.getSession().setAttribute("alquiler-dev", alq);
				request.getSession().removeAttribute("datosDevolucion");
				request.getSession().setAttribute("datosAlquier", 1);
			}
		}
		
		request.getRequestDispatcher("WEB-INF/alquiler.jsp").forward(request, response);
		
	}
}
