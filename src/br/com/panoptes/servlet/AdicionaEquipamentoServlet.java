package br.com.panoptes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.panoptes.dao.EquipamentoDAO;
import br.com.panoptes.modelo.Equipamento;

/**
 * Servlet implementation class AdicionaEquipamentoServlet
 */
public class AdicionaEquipamentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaEquipamentoServlet() {
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
		
		String tagEquipamento = request.getParameter("tagEquipamento");
		String descricao = request.getParameter("descricao");
		String fabricante = request.getParameter("fabricante");
		String tipo = request.getParameter("tipo");
		
		Equipamento equipamento = new Equipamento();
		equipamento.setIdArea(intIdArea);
		equipamento.setTagEquipamento(tagEquipamento);
		equipamento.setDescricao(descricao);
		equipamento.setFabricante(fabricante);
		equipamento.setTipo(tipo);
		
		EquipamentoDAO dao = new EquipamentoDAO();
		dao.adiciona(equipamento);
		
		RequestDispatcher rd = request.getRequestDispatcher("equipamento-adicionado.jsp");
		rd.forward(request, response);
	}
}
