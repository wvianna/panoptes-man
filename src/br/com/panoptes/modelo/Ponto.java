package br.com.panoptes.modelo;

public class Ponto {

	private int idPonto;
	private int idSensor;
	private int idComponente;
	private String tagPonto;
	private String posicao;
	private String tipoMedicao;
	private String descricao;
	private int al;
	private int sd;
	
	
	public int getIdPonto() {
		return idPonto;
	}
	public int getIdSensor() {
		return idSensor;
	}
	public void setIdSensor(int idSensor) {
		this.idSensor = idSensor;
	}
	public int getIdComponente() {
		return idComponente;
	}
	public void setIdComponente(int idComponente) {
		this.idComponente = idComponente;
	}
	public String getTagPonto() {
		return tagPonto;
	}
	public void setTagPonto(String tagPonto) {
		this.tagPonto = tagPonto;
	}
	public String getPosicao() {
		return posicao;
	}
	public void setPosicao(String posicao) {
		this.posicao = posicao;
	}
	public String getTipoMedicao() {
		return tipoMedicao;
	}
	public void setTipoMedicao(String tipoMedicao) {
		this.tipoMedicao = tipoMedicao;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getAl() {
		return al;
	}
	public void setAl(int al) {
		this.al = al;
	}
	public int getSd() {
		return sd;
	}
	public void setSd(int sd) {
		this.sd = sd;
	}
	
	
}
