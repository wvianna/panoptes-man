package br.com.panoptes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.panoptes.jdbc.ConnectionFactory;
import br.com.panoptes.modelo.Sensor;

public class SensorDAO {

	Connection connection;
	
	public SensorDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void adiciona(Sensor sensor){
		String sql = "INSERT INTO sensor (idponto, identificacao, range, sensibilidade, fabricante, modelo, tipo, descricao) VALUES (?,?,?,?,?,?,?,?)";
		
		try{
			PreparedStatement stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, sensor.getIdPonto());
			stmt.setString(2, sensor.getIdentificacao());
			stmt.setString(3, sensor.getRange());
			stmt.setString(4, sensor.getSensibilidade());
			stmt.setString(5, sensor.getFabricante());
			stmt.setString(6, sensor.getModelo());
			stmt.setString(7, sensor.getTipo());
			stmt.setString(8, sensor.getDescricao());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}
