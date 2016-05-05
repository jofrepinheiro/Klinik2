package model;

public class Medico extends Usuario{
	private int idMedico;
	private int idUsuario;
	private int CRM;
	private String especialidade;
	private String especialidade2;
	
	public String getEspecialidade() {
		return especialidade;
	}
	public void setEspecialidade(String especialidade) {
		this.especialidade = especialidade;
	}
	public String getEspecialidade2() {
		return especialidade2;
	}
	public void setEspecialidade2(String especialidade2) {
		this.especialidade2 = especialidade2;
	}
	public int getIdMedico() {
		return idMedico;
	}
	public void setIdMedico(int idMedico) {
		this.idMedico = idMedico;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getCRM() {
		return CRM;
	}
	public void setCRM(int CRM) {
		this.CRM = CRM;
	}
	
	
}
