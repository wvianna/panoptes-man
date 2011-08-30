package br.com.panoptes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.panoptes.dao.SensorDAO;
import br.com.panoptes.modelo.Sensor;

/**
 * Servlet implementation class AdicionaSensorServlet
 */
public class AdicionaSensorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdicionaSensorServlet() {
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
		
		String idPonto = request.getParameter("idPonto");
		int intIdPonto = Integer.parseInt(idPonto);
		
		String identificacao = request.getParameter("identificacao");
		String range = request.getParameter("range");
		String sensibilidade = request.getParameter("sensibilidade");
		String fabricante = request.getParameter("fabricante");
		String modelo = request.getParameter("modelo");
		String tipo = request.getParameter("tipo");
		String descricao = request.getParameter("descricao");
	
		Sensor sensor = new Sensor();
		sensor.setIdPonto(intIdPonto);
		sensor.setIdentificacao(identificacao);
		sensor.setRange(range);
		sensor.setSensibilidade(sensibilidade);
		sensor.setFabricante(fabricante);
		sensor.setModelo(modelo);
		sensor.setTipo(tipo);
		sensor.setDescricao(descricao);
		
		SensorDAO dao = new SensorDAO();
		dao.adiciona(sensor);
		
		RequestDispatcher rd = request.getRequestDispatcher("/sensor-adicionado.jsp");
		rd.forward(request, response);
	}

}
