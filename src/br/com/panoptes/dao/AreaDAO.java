package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Area;

public class AreaDAO {

	private Connection connection;
	
	public AreaDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Area area){
		String sql = "INSERT INTO area (idplanta, tagarea, descricao) VALUES (?,?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, area.getIdPlanta());
			stmt.setString(2, area.getTagArea());
			stmt.setString(3, area.getDescricao());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}