package br.com.panoptes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.panoptes.dao.PlantaDAO;
import br.com.panoptes.modelo.Planta;

/**
 * Servlet implementation class AdicionaPlantaServlet
 */
public class AdicionaPlantaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaPlantaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

//	@Override
//	protected void service(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// TODO Auto-generated method stub
		
//	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String tagPlanta = request.getParameter("tagPlanta");
		String descricao = request.getParameter("descricao");
		
		Planta planta = new Planta();
		planta.setTagPlanta(tagPlanta);
		planta.setDescricao(descricao);
		
		PlantaDAO dao = new PlantaDAO();
		dao.adiciona(planta);
		
		RequestDispatcher rd = request.getRequestDispatcher("/planta-adicionada.jsp");
		rd.forward(request, response);
	}
	
}
