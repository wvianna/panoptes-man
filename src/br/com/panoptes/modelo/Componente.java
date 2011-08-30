package br.com.panoptes.modelo;

public class Componente {

	private int idComponente;
	private int idEquipamento;
	private String tagComponente;
	private String descricao;
	
	public int getIdComponente() {
		return idComponente;
	}
	public int getIdEquipamento() {
		return idEquipamento;
	}
	public void setIdEquipamento(int idEquipamento) {
		this.idEquipamento = idEquipamento;
	}
	public String getTagComponente() {
		return tagComponente;
	}
	public void setTagComponente(String tagComponente) {
		this.tagComponente = tagComponente;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
}
