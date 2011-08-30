package br.com.panoptes.modelo;

public class Area {

	private int idArea;
	private int idPlanta;
	private String tagArea;
	private String descricao;
	
	public int getIdArea() {
		return idArea;
	}
	public int getIdPlanta() {
		return idPlanta;
	}
	public void setIdPlanta(int idPlanta) {
		this.idPlanta = idPlanta;
	}
	public String getTagArea() {
		return tagArea;
	}
	public void setTagArea(String tagArea) {
		this.tagArea = tagArea;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
}
