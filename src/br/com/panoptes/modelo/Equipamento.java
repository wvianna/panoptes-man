package br.com.panoptes.modelo;

public class Equipamento {

	private int idEquipamento;
	private int idArea;
	private String tagEquipamento;
	private String descricao;
	private String fabricante;
	private String tipo;
	
	public int getIdEquipamento() {
		return idEquipamento;
	}
	public int getIdArea() {
		return idArea;
	}
	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}
	public String getTagEquipamento() {
		return tagEquipamento;
	}
	public void setTagEquipamento(String tagEquipamento) {
		this.tagEquipamento = tagEquipamento;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getFabricante() {
		return fabricante;
	}
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
}