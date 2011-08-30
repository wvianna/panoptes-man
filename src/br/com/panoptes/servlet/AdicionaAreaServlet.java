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

import br.com.panoptes.dao.AreaDAO;
import br.com.panoptes.modelo.Area;

/**
 * Servlet implementation class AdicionaAreaServlet
 */
public class AdicionaAreaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaAreaServlet() {
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

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String idPlanta = request.getParameter("idPlanta");
		int intIdPlanta = Integer.parseInt(idPlanta);
		
		String tagArea = request.getParameter("tagArea");
		String descricao = request.getParameter("descricao");
		
		Area area = new Area();
		area.setIdPlanta(intIdPlanta);
		area.setTagArea(tagArea);
		area.setDescricao(descricao);
		
		AreaDAO dao = new AreaDAO();
		dao.adiciona(area);
		
		RequestDispatcher rd = request.getRequestDispatcher("/area-adicionada.jsp");
		rd.forward(request, response);
}
}
