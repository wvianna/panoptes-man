package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Ponto;

public class PontoDAO {

	Connection connection;
	
	public PontoDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Ponto ponto){
		String sql = "INSERT INTO ponto (idsensor, idcomponente, tagponto, posicao, tipomedicao, descricao, al, sd) VALUES (?,?,?,?,?,?,?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, ponto.getIdSensor());
			stmt.setInt(2, ponto.getIdComponente());
			stmt.setString(3, ponto.getTagPonto());
			stmt.setString(4, ponto.getPosicao());
			stmt.setString(5, ponto.getTipoMedicao());
			stmt.setString(6, ponto.getDescricao());
			stmt.setInt(7, ponto.getAl());
			stmt.setInt(8, ponto.getSd());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
