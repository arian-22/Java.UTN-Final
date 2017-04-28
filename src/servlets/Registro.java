package servlets;

import java.io.IOException;
import java.text.ParseException;
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
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Controlador controlador;
	private Usuario usuario;

    /**
     * Default constructor. 
     */
    public Registro() {
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
		usuario.setPassword(request.getParameter("contraseña1"));
		//usuario.setPassword(request.getParameter("contraseña2"));
		
		try {
			usuario.setFechaNacimiento(request.getParameter("fechaNacimiento"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		try {
			usuario.setFechaVencimientoLicencia((request.getParameter("fechaVencimientoLicencia")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		usuario.setDni(Integer.parseInt(request.getParameter("dni")));
		usuario.setDireccion(request.getParameter("direccion"));
		usuario.setTelefono(request.getParameter("telefono"));
		
		controlador.registrarUsuario(usuario);
		
		request.getRequestDispatcher("index.html").forward(request, response);
	}

}
