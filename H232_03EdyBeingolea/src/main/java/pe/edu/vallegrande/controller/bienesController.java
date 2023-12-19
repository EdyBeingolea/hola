package pe.edu.vallegrande.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.edu.vallegrande.model.bienes;
import pe.edu.vallegrande.service.bienesService;


@WebServlet(urlPatterns = {"/listarTodos", "/listarActivos", "/listarInactivos", "/mostrarEditar", "/Agregar",
		"/Editar", "/Eliminar", "/Restaurar",})
public class bienesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	bienesService service = new bienesService();
       
   
    public bienesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getServletPath();
		switch (accion) {
		case "/listarActivos":
			listarActivos(request, response);
			break;
		case "/listarInactivos":
			listarInactivos(request, response);
			break;
		case "/mostrarEditar":
			mostrarEditar(request, response);
			break;
		case "/listarTodos":
			listarTodos(request, response);
			break;
		}
	}

	
	private void mostrarEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_editar =request.getParameter("id_editar");
		bienes editar = service.getByid(id_editar);
		request.getSession().setAttribute("editar", editar);
		RequestDispatcher dispacher = request.getRequestDispatcher("Editar.jsp");
		dispacher.forward(request, response);
		
	}

	private void listarActivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<bienes> Activos = new ArrayList<>();
		Activos = service.getActive();
		request.setAttribute("Activos", Activos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Activo.jsp");
		dispatcher.forward(request, response);
		
	}

	private void listarInactivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<bienes> Inactivos = new ArrayList<>();
		Inactivos = service.getInactive();
		request.setAttribute("Inactivos", Inactivos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Inactivo.jsp");
		dispatcher.forward(request, response);
		
	}

	private void listarTodos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<bienes> listarTodos = new ArrayList<>();
		listarTodos = service.getAll();
		request.setAttribute("listarTodos", listarTodos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Listar.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getServletPath();
		switch (accion) {
		case "/Agregar":
			agregar(request, response);
			break;
		case "/Editar":
			editar(request, response);
			break;
		case "/Eliminar":
			eliminar(request, response);
			break;
		case "/Restaurar":
			restaurar(request, response);
			break;
		}
	}

	private void restaurar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id_restore = request.getParameter("id_restore");
		service.restore(id_restore);
		response.sendRedirect("listarTodos");
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id_delete = request.getParameter("id_delete");
		service.delete(id_delete);
		response.sendRedirect("listarTodos");
	}

	private void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		bienes bien = (bienes) request.getSession().getAttribute("editar");
		int cantidad = Integer.parseInt(request.getParameter("cantidad"));
		String nombre = request.getParameter("nombre");
		double PRECIO = Double.parseDouble(request.getParameter("PRECIO")) ;
		String FECHA_INGRESO = request.getParameter("FECHA_INGRESO");
		String FECHA_DEPRECIAICION = request.getParameter("FECHA_DEPRECIAICION");
		int PROCEDIMIENTOS_ID = Integer.parseInt(request.getParameter("PROCEDIMIENTOS_ID")) ;
		int AREAS_ID = Integer.parseInt(request.getParameter("AREAS_ID"));
		
		bien.setCantidad(cantidad);
		bien.setNombre(nombre);
		bien.setPRECIO(PRECIO);
		bien.setFECHA_INGRESO(FECHA_INGRESO);
		bien.setFECHA_DEPRECIAICION(FECHA_DEPRECIAICION);
	    bien.setPROCEDIMIENTOS_ID(PROCEDIMIENTOS_ID);
		bien.setAREAS_ID(AREAS_ID);
		service.update(bien);
		response.sendRedirect("listarTodos");
		
	}

	private void agregar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("ingresado exitoso");
		int cantidad = Integer.parseInt(request.getParameter("cantidad"));
		String nombre = request.getParameter("nombre");
		double precio = Double.parseDouble(request.getParameter("precio")) ;
		String FECHA_INGRESO = request.getParameter("FECHA_INGRESO");
		String FECHA_DEPRECIAICION = request.getParameter("FECHA_DEPRECIAICION");
		int PROCEDIMIENTOS_ID = Integer.parseInt(request.getParameter("PROCEDIMIENTOS_ID")) ;
		int AREAS_ID = Integer.parseInt(request.getParameter("AREAS_ID"));
		
		
		bienes bien = new bienes();
		bien.setCantidad(cantidad);
		bien.setNombre(nombre);
		bien.setPRECIO(precio);
		bien.setFECHA_INGRESO(FECHA_INGRESO);
		bien.setFECHA_DEPRECIAICION(FECHA_DEPRECIAICION);
	    bien.setPROCEDIMIENTOS_ID(PROCEDIMIENTOS_ID);
		bien.setAREAS_ID(AREAS_ID);
		service.insert(bien);
		response.sendRedirect("listarTodos");
	}

}
