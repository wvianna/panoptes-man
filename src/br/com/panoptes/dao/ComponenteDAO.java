package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Componente;

public class ComponenteDAO {

	private Connection connection;
	
	public ComponenteDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Componente componente){
		String sql = "INSERT INTO componente (idequipamento, tagcomponente, descricao) VALUES (?,?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, componente.getIdEquipamento());
			stmt.setString(2, componente.getTagComponente());
			stmt.setString(3, componente.getDescricao());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
