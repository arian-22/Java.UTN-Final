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
 * Servlet implementation class Registro
 */
@WebServlet("/Registro")
public class RegistroUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Controlador controlador;
	private Usuario usuario;

    /**
     * Default constructor. 
     */
    public RegistroUsuario() {
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
		
		controlador = new Controlador();
		usuario = new Usuario();
		
		usuario.setNombre(request.getParameter("nombre"));
		usuario.setApellido(request.getParameter("apellido"));
		usuario.setMail(request.getParameter("mail"));
		usuario.setPassword(request.getParameter("contrasena"));
		usuario.setFechaNacimiento(request.getParameter("fechaNacimiento"));	
		usuario.setFechaVencimientoLicencia(request.getParameter("fechaVencimientoLicencia"));		
		usuario.setDni(Integer.parseInt(request.getParameter("dni")));		
		usuario.setDireccion(request.getParameter("direccion"));
		usuario.setTelefono(request.getParameter("telefono"));
		usuario.setAdmin("N");
		
		try {
			controlador.registrarUsuario(usuario);
			request.getSession().removeAttribute("errorModal");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (SQLException e) {
			request.getSession().setAttribute("errorModal", e.getMessage());
			request.getRequestDispatcher("registrarse.jsp").forward(request, response);
		}
		
	}

}
