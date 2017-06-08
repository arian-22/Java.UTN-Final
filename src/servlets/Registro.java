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
		System.out.println("NOMBRE " + usuario.getNombre());
		
		usuario.setApellido(request.getParameter("apellido"));
		System.out.println("APELLIDO " + usuario.getApellido());
		
		usuario.setMail(request.getParameter("mail"));
		System.out.println("MAIL " + usuario.getMail());
		
		usuario.setPassword(request.getParameter("contrasena"));
		System.out.println("CONTRASEÑA 1 " + usuario.getPassword());
		//usuario.setPassword(request.getParameter("contraseña2"));
		System.out.println("CONTRASEÑA 2 " + request.getParameter("contrasena2"));
		
		usuario.setFechaNacimiento(request.getParameter("fechaNacimiento"));
		System.out.println("NACIMIENTO " + usuario.getFechaNacimientoString());
		
		usuario.setFechaVencimientoLicencia(request.getParameter("fechaVencimientoLicencia"));
		System.out.println("VENCIMIENTO " + usuario.getFechaVencimientoLicenciaString());
		
		
		usuario.setDni(Integer.parseInt(request.getParameter("dni")));
		System.out.println("DNI " + usuario.getDni());
		
		usuario.setDireccion(request.getParameter("direccion"));
		System.out.println("DIRECCION " + usuario.getDireccion());
		
		usuario.setTelefono(request.getParameter("telefono"));
		System.out.println("TELEFONO " + usuario.getTelefono());
		
		controlador.registrarUsuario(usuario);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
