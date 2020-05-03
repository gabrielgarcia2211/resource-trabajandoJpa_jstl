package mensajeJSTL.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mensajeJPA.dao.MensajeDao;
import mensajeJPA.dao.UsuarioDao;
import mensajeJPA.entities.Mensaje;
import mensajeJPA.entities.Usuario;

/**
 * Servlet implementation class mensajeControl
 */
@WebServlet("/mensajeControl")
public class mensajeControl extends HttpServlet {
	
	public String control;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mensajeControl() {
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
		
		
		String validar = request.getParameter("validar");
		
		MensajeDao uDao = new MensajeDao();
		UsuarioDao mDao = new UsuarioDao();
		
		Mensaje men = new Mensaje();
		Usuario user = new Usuario();
		
		
		if(validar.equalsIgnoreCase("1")) {
			
			String nombre = request.getParameter("username");
			String correo = request.getParameter("email");
			String sitio = request.getParameter("website");
			String mensaje = request.getParameter("message");
			String usuario = request.getParameter("usuario");
			
			user.setUser(usuario);
			Usuario aux = mDao.find(user.getUser());
			
			
			men.setName(nombre);
			men.setEmail(correo);
			men.setMessage(mensaje);
			men.setUsuarioBean(aux);
			men.setWebsite(sitio);
			
			uDao.insert(men);
			
			response.sendRedirect("/mensajeJSTL/index.jsp");  
		}
		
		if(validar.equalsIgnoreCase("2")) {
			
			String nombre = request.getParameter("transporte");
			Mensaje pers = uDao.find(nombre);
			
			request.setAttribute("nombre", pers.getName());
			request.setAttribute("correo", pers.getEmail());
			request.setAttribute("sitio", pers.getWebsite());
			request.setAttribute("mensaje", pers.getMessage());
			
			request.getRequestDispatcher("/buscar.jsp").forward(request, response);
			
			
		}
		if(validar.equalsIgnoreCase("3")) {
			
			String nombre = request.getParameter("transporte");
			control = nombre;
			Mensaje pers = uDao.find(nombre);
			
			request.setAttribute("nombre", pers.getName());
			request.setAttribute("correo", pers.getEmail());
			request.setAttribute("sitio", pers.getWebsite());
			request.setAttribute("mensaje", pers.getMessage());
			
			request.getRequestDispatcher("/actualizar.jsp").forward(request, response);
			
			
		}
		
		if(validar.equalsIgnoreCase("4")) {
			
			
			String nombre = request.getParameter("username");
			String correo = request.getParameter("email");
			String sitio = request.getParameter("website");
			String mensaje = request.getParameter("message");
			
			Mensaje pers = uDao.find(control);
			
			String comp = pers.getUsuarioBean().getUser().toString();
			String comp2 = pers.getUsuarioBean().getClave().toString();
			
			System.out.println(comp + "  " + comp2);

			
			user.setUser(comp);
			user.setClave(comp2);
			
			System.out.println(user.getUser());
			
			
			men.setName(nombre);
			men.setEmail(correo);
			men.setMessage(mensaje);
			men.setWebsite(sitio);
			men.setUsuarioBean(user);
			
			uDao.update(men);
			
			
			response.sendRedirect("/mensajeJSTL/index.jsp");  
			
			
		}
		
		if(validar.equalsIgnoreCase("5")) {
			
			String nombre = request.getParameter("transporte");
			Mensaje pers = uDao.find(nombre);
			
			uDao.delete(pers);
			response.sendRedirect("/mensajeJSTL/index.jsp");  
			
			
			
		}	
		
		
		
		
		
		
	}

}
