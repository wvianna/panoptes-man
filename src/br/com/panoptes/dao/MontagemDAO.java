package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Montagem;

public class MontagemDAO {

	Connection connection;

	public MontagemDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}

	public void adiciona(Montagem montagem){
		String sql = "INSERT INTO montagem (idarea, idmontagensequipamentos, obs, ativo) VALUES (?,?,?,?)";

		try{

			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setInt(1, montagem.getIdArea());
			stmt.setInt(2, montagem.getIdMontagensEquipamentos());
			stmt.setString(3, montagem.getObs());
			stmt.setBoolean(4, montagem.isAtivo());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
