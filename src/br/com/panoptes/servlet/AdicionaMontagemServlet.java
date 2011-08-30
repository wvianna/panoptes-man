package br.com.panoptes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.panoptes.dao.MontagemDAO;
import br.com.panoptes.modelo.Montagem;

/**
 * Servlet implementation class AdicionaMontagemServlet
 */
public class AdicionaMontagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaMontagemServlet() {
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
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String idArea = request.getParameter("idArea");
		int intIdArea = Integer.parseInt(idArea);
		
		String idMontagensEquipamentos = request.getParameter("idMontagensEquipamentos");
		int intIdMontagensEquipamentos = Integer.parseInt(idMontagensEquipamentos);
		
		String obs = request.getParameter("obs");
		String ativo = request.getParameter("ativo");
		Boolean booleanAtivo = Boolean.parseBoolean(ativo);
		
		Montagem montagem = new Montagem();
		montagem.setIdArea(intIdArea);
		montagem.setIdMontagensEquipamentos(intIdMontagensEquipamentos);
		montagem.setObs(obs);
		montagem.setAtivo(booleanAtivo);
		
		MontagemDAO dao = new MontagemDAO();
		dao.adiciona(montagem);
		
		RequestDispatcher rd = request.getRequestDispatcher("/montagem-adicionada.jsp");
		rd.forward(request, response);
	}

}
