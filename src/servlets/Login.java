package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import negocio.Controlador;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Controlador controlador;
	private Usuario usuario;
	
    public Login() {
        //super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		controlador = new Controlador();
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
				
		boolean existe = false;
		try {
			System.out.println("entro1");
			existe = controlador.auntenticarUsuario(mail, pass);
			System.out.println(existe);
			System.out.println("entro4");
			if (existe){
				usuario = new Usuario();
				System.out.println("entro6");
				try {
					usuario = controlador.recuperarUsuario(mail);

					request.getSession().setAttribute("user", usuario);	
					request.getSession().setAttribute("msjErrorFecha", null);	
					
					System.out.println("entro7");
					if(usuario.getAdmin().equals("S")){
						request.getRequestDispatcher("WEB-INF/inicioAdmin.jsp").forward(request, response);	
					}else{
						request.getRequestDispatcher("WEB-INF/inicioCliente.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("entro5");
				}
		
			}else{			
				System.out.println("entro9");
				request.getSession().setAttribute("errorModal", "El usuario no existe");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			System.out.println("entro2");
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("entro3");
			request.getSession().setAttribute("errorModal", e1.getMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
		
	}

}
