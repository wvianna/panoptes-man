package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Equipamento;

public class EquipamentoDAO {

	private Connection connection;
	
	public EquipamentoDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Equipamento equipamento){
		String sql = "INSERT INTO equipamento (idarea, tagequipamento, descricao, fabricante, tipo) VALUES (?,?,?,?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, equipamento.getIdArea());
			stmt.setString(2, equipamento.getTagEquipamento());
			stmt.setString(3, equipamento.getDescricao());
			stmt.setString(4, equipamento.getFabricante());
			stmt.setString(5, equipamento.getTipo());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
