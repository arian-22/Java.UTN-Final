package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Alquiler;
import entidades.Cli_Veh_Alq;
import entidades.Usuario;
import entidades.Vehiculos;
import negocio.Controlador;
import negocio.ControladorAlquiler;

/**
 * Servlet implementation class CancelacionCliente
 */
@WebServlet("/CancelacionCliente")
public class CancelacionCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelacionCliente() {
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

		
			
			int nroAlquiler =Integer.parseInt(request.getParameter("alquiler-selected"));			
		
			
			ControladorAlquiler ctrl= new ControladorAlquiler();
			
			Alquiler alq=new Alquiler();
			
			 alq=ctrl.buscarAlquilerACancelar(nroAlquiler);				 	
			
			Date fechaActualDate = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String FechaActual = format.format(fechaActualDate);
					
				alq.setFechaCancelacion(FechaActual);
			
			int dias;
			
			dias=(int) ((alq.getFechaDesde().getTime()-fechaActualDate.getTime())/86400000);
						
			if(dias==1 || dias==0){
				alq.setImporteCancelacion((alq.getPrecioAlquiler()*15)/100);
				
			}else if(dias==2){
				alq.setImporteCancelacion((alq.getPrecioAlquiler()*10)/100);
				
			}else alq.setImporteCancelacion(0);
			
			System.out.println("Nro alquiler: " + alq.getNro_alquiler());
			System.out.println("Importe cancelacion: " + alq.getImporteCancelacion());
			
			request.getSession().setAttribute("alquilerPorCancelar", alq);
			
			//ctrl.actualizarAlquiler(alq);
			
//			Usuario cliente = new Usuario();
//			cliente = (Usuario)request.getSession().getAttribute("user");
//			
//			ControladorAlquiler ctrl2 = new ControladorAlquiler();
//			
//			ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
//		
//			cva = ctrl2.buscarAlquileresDelCliente(cliente.getMail());
//			
//			request.getSession().setAttribute("alquileresCliente", cva);
		
		request.getRequestDispatcher("WEB-INF/confirmacionCancelacionAlquiler.jsp").forward(request, response);
	}

}
