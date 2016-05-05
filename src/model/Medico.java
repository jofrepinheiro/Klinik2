package model;

public class Medico extends Usuario{
	private int idMedico;
	private int idUsuario;
	private int CRM;
	
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
