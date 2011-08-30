package br.com.panoptes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.panoptes.dao.PontoDAO;
import br.com.panoptes.modelo.Ponto;

/**
 * Servlet implementation class AdicionaPontoServlet
 */
public class AdicionaPontoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaPontoServlet() {
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
		
		String idSensor = request.getParameter("idSensor");
		int intIdSensor = Integer.parseInt(idSensor);
		
		String idComponente = request.getParameter("idComponente");
		int intIdComponente = Integer.parseInt(idComponente);
		
		String tagPonto = request.getParameter("tagPonto");
		String posicao = request.getParameter("posicao");
		String tipoMedicao = request.getParameter("tipoMedicao");
		String descricao = request.getParameter("descricao");
		String al = request.getParameter("al");
		int intAl = Integer.parseInt(al);
		
		String sd = request.getParameter("sd");
		int intSd = Integer.parseInt(sd);
		
		Ponto ponto = new Ponto();
		ponto.setIdSensor(intIdSensor);
		ponto.setIdComponente(intIdComponente);
		ponto.setTagPonto(tagPonto);
		ponto.setPosicao(posicao);
		ponto.setTipoMedicao(tipoMedicao);
		ponto.setDescricao(descricao);
		ponto.setAl(intAl);
		ponto.setSd(intSd);
		
		PontoDAO dao = new PontoDAO();
		dao.adiciona(ponto);
		
		RequestDispatcher rd = request.getRequestDispatcher("/ponto-adicionado.jsp");
		rd.forward(request, response);
	}

}
