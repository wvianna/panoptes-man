package br.com.panoptes.modelo;

public class Montagem {

	private int idMontagem;
	private int idArea;
	private int idMontagensEquipamentos;
	private String obs;
	private boolean ativo;
	
	
	public int getIdMontagem() {
		return idMontagem;
	}
	public int getIdArea() {
		return idArea;
	}
	public void setIdArea(int idArea) {
		this.idArea = idArea;
	}
	public int getIdMontagensEquipamentos() {
		return idMontagensEquipamentos;
	}
	public void setIdMontagensEquipamentos(int idMontagensEquipamentos) {
		this.idMontagensEquipamentos = idMontagensEquipamentos;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
}
