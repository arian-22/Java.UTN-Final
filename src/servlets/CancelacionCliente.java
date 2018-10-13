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
			
			Date fechaActualDate= new Date();
			 SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd");
			String FechaActual= format.format(fechaActualDate);
					
				alq.setFechaCancelacion(FechaActual);
			
			int dias;
			
			dias=(int) ((alq.getFechaDesde().getTime()-fechaActualDate.getTime())/86400000);
			
			if(dias==1){
				alq.setImporteCancelacion((alq.getPrecioAlquiler()*15)/100);
				
			}else if(dias==2){
				alq.setImporteCancelacion((alq.getPrecioAlquiler()*10)/100);
				
			}else alq.setImporteCancelacion(0);
			
			ctrl.actualizarAlquiler(alq);
			
		
		
		request.getRequestDispatcher("WEB-INF/cancelacionCliente.jsp").forward(request, response);
	}

}
