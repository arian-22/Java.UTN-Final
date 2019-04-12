package servlets;

import java.io.IOException;
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
		existe = controlador.auntenticarUsuario(mail, pass);
		
		if (existe){
			usuario = new Usuario();
			usuario = controlador.recuperarUsuario(mail);
	
			request.getSession().setAttribute("user", usuario);	
			request.getSession().setAttribute("msjErrorFecha", null);	
			
			if(usuario.getAdmin().equals("S")){
				request.getRequestDispatcher("WEB-INF/inicioAdmin.jsp").forward(request, response);	
			}else{
				request.getRequestDispatcher("WEB-INF/inicioCliente.jsp").forward(request, response);
			}
		}else{			
			request.getSession().setAttribute("errorModal", "El usuario no existe");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
