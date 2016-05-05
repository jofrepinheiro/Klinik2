package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Administrador;
import model.Medico;
import model.Secretario;
import model.Usuario;
import conexao.Conexao;

public class MedicoDAO {
	
	public ArrayList<Medico> getMedicoList() throws SQLException{
		ArrayList<Medico> medicoList = new ArrayList<>();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = new Usuario();
		Connection con = new Conexao().getConnection();		
		
		String sql = "SELECT * FROM MEDICO";
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			Medico medico = new Medico();
			medico.setIdMedico(rs.getInt(1));
			medico.setCRM(rs.getInt(2));
			medico.setIdUsuario(rs.getInt(3));
			medico.setEspecialidade(rs.getString(4));
			medico.setEspecialidade2(rs.getString(5));
			usuario = usuarioDAO.getUsuario(medico);
			medico.setNome(usuario.getNome());
			medico.setCpf(usuario.getCpf());
			medico.setLogin(usuario.getLogin());
			medico.setSenha(usuario.getSenha());
			medico.setDataNascimento(usuario.getDataNascimento());
			medico.setEmail(usuario.getEmail());
			medico.setTelefone(usuario.getTelefone());
			medico.setAtivo(usuario.getAtivo());	
			if(medico.getAtivo() != 0){
				medicoList.add(medico);
			}
		}
		
		statement.close();
		con.close();
		
		return medicoList;	
	}
	
	public Medico getMedico(int idMedico) throws SQLException{
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		Usuario usuario = new Usuario();
		Connection con = new Conexao().getConnection();
		Medico medico = new Medico();
		
		String sql = "SELECT idMedico, idUsuario, CRM, especialidade, especialidade2 FROM Medico WHERE idMedico=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idMedico);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			medico.setIdMedico(rs.getInt(1));
			medico.setIdUsuario(rs.getInt(2));
			medico.setCRM(rs.getInt(3));
			medico.setEspecialidade(rs.getString(4));
			medico.setEspecialidade2(rs.getString(5));
		}
		
		usuario = usuarioDAO.getUsuario(medico);
		medico.setNome(usuario.getNome());
		medico.setCpf(usuario.getCpf());
		medico.setLogin(usuario.getLogin());
		medico.setSenha(usuario.getSenha());
		medico.setDataNascimento(usuario.getDataNascimento());
		medico.setEmail(usuario.getEmail());
		medico.setAtivo(usuario.getAtivo());	
		statement.close();
		con.close();
		
		return medico;
	}
	
	public void cadastrarMedico(Medico medico) throws SQLException{
		Connection con = new Conexao().getConnection();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		int endereco = enderecoDAO.getIdEndereco();
		medico.setIdEndereco(endereco);
		usuarioDAO.cadastrarUsuario(medico);
		int idUsuario = usuarioDAO.getIdUsuario();
		
		
		String sql = "INSERT INTO MEDICO (idUsuario, CRM, especialidade2, especialidade2) VALUES (?, ?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idUsuario);
		statement.setInt(2, medico.getCRM());
		statement.setString(3, medico.getEspecialidade());
		statement.setString(4, medico.getEspecialidade2());

		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public void deletarMedico(Medico medico) throws SQLException{
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		usuarioDAO.inativarUsuario(medico.getIdUsuario());
	}
	
	public void alterarMedico(Medico medico) throws SQLException{
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		usuarioDAO.alterarUsuario(medico);;		
	}
}
