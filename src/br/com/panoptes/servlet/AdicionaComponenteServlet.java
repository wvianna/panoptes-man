package br.com.panoptes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.panoptes.dao.ComponenteDAO;
import br.com.panoptes.modelo.Componente;

/**
 * Servlet implementation class AdicionaComponenteServlet
 */
public class AdicionaComponenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaComponenteServlet() {
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
		
		String idEquipamento = request.getParameter("idEquipamento");
		int intIdEquipamento = 0;
		try{ 
			intIdEquipamento = Integer.parseInt(idEquipamento); 
			} catch(NumberFormatException e){ 
			System.out.println("Dados invalidos. Impossivel converter letras para números.");
		}
		
		String tagComponente = request.getParameter("tagComponente");
		String descricao = request.getParameter("descricao");
		
		Componente componente = new Componente();
		componente.setIdEquipamento(intIdEquipamento);
		componente.setTagComponente(tagComponente);
		componente.setDescricao(descricao);
		
		ComponenteDAO dao = new ComponenteDAO();
		dao.adiciona(componente);
		
		RequestDispatcher rd = request.getRequestDispatcher("/componente-adicionado.jsp");
		rd.forward(request, response);
	}
}
