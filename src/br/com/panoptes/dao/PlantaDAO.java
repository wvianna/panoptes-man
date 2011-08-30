package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Planta;

public class PlantaDAO {

	private Connection connection;

	public PlantaDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Planta planta){
		String sql = "INSERT INTO planta (tagplanta, descricao) VALUES (?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, planta.getTagPlanta());
			stmt.setString(2, planta.getDescricao());
			
			stmt.execute();
			stmt.close();
		}
		catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
