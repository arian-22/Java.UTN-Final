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
			
			if(usuario != null){
				System.out.println("Usuario: " + usuario.getNombre() + " " + usuario.getApellido());
			}else{
				System.out.println("El usuario esta vacio");
			}
						
			request.getSession().setAttribute("user", usuario);
			
			
			if(usuario.getAdmin().equals("S")){
				request.getRequestDispatcher("WEB-INF/inicioAdmin.jsp").forward(request, response);	
				System.out.println("es admin " + usuario.getAdmin());
			}else{
				request.getRequestDispatcher("index.jsp").forward(request, response);
				System.out.println(" no es admin " + usuario.getAdmin());
			}
			
		}else{
			System.out.println("Usuario inexistente");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	}

}
