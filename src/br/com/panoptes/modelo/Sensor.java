package br.com.panoptes.modelo;

public class Sensor {

	private int idSensor;
	private int idPonto;
	private String identificacao;
	private String range;
	private String sensibilidade;
	private String fabricante;
	private String modelo;
	private String tipo;
	private String descricao;
	
	
	public int getIdSensor() {
		return idSensor;
	}
	public int getIdPonto() {
		return idPonto;
	}
	public void setIdPonto(int idPonto) {
		this.idPonto = idPonto;
	}
	public String getIdentificacao() {
		return identificacao;
	}
	public void setIdentificacao(String identificacao) {
		this.identificacao = identificacao;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public String getSensibilidade() {
		return sensibilidade;
	}
	public void setSensibilidade(String sensibilidade) {
		this.sensibilidade = sensibilidade;
	}
	public String getFabricante() {
		return fabricante;
	}
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
}
