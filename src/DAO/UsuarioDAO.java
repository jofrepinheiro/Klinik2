package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Administrador;
import model.Medico;
import model.Secretario;
import model.Usuario;
import conexao.Conexao;

public class UsuarioDAO {
	public boolean validarCpf(String cpf) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT NOME FROM USUARIO WHERE CPF=?";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, cpf);
		ResultSet rs = statement.executeQuery();
		String nome = null;
		while (rs.next()){
			nome = rs.getString("nome");
		}
		
		statement.close();
		con.close();
		if (nome != null){
			return false;
		}else{
			return true;
		}
	}
	
	public int getTipoUsuario(int idUsuario) throws SQLException{
		Connection con = new Conexao().getConnection();
		Secretario secretario;
		Medico medico;
		Administrador administrador;
		SecretarioDAO secretarioDAO = new SecretarioDAO();
		MedicoDAO medicoDAO = new MedicoDAO();
		AdministradorDAO administradorDAO = new AdministradorDAO();
		//medico.setIdMedico(-1);
		//secretario.setIdSecretario(-1);
		//administrador.setIdAdministrador(-1);
		medico = medicoDAO.getMedicoUsuario(idUsuario);
		secretario = secretarioDAO.getSecretarioUsuario(idUsuario);
		administrador = administradorDAO.getAdministradorUsuario(idUsuario);
		if (medico != null){
			return 0;
		}else{
			if(secretario != null){
				return 1;
			}else{
				if(administrador != null){
					return 2;
				}else{
					return -1;
				}
			}
			}	
		}
		
	public Usuario loginUsuario(String login, String senha) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT * FROM USUARIO WHERE login=? and senha=? and ativo=1";
		Usuario usuario = new Usuario();
		usuario.setAtivo(2);
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, login);
		statement.setString(2, senha);
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			usuario.setAtivo(rs.getInt("ativo"));
			usuario.setNome(rs.getString("nome"));
			usuario.setDataNascimento(rs.getDate("dataNasc"));
			usuario.setIdUsuario(rs.getInt("idUsuario"));
			usuario.setLogin(rs.getString("login"));
			usuario.setTelefone(rs.getString("telefone"));
			usuario.setEmail(rs.getString("email"));
		}
		statement.close();
		con.close();
		if(usuario.getAtivo()==2){
			return null;
		}else{
			return usuario;
		}
	}
	
	
	public int getIdUsuario() throws SQLException{
		int idUsuario = -1;
		Connection con = new Conexao().getConnection();
		String sql = "SELECT MAX(IDUSUARIO) FROM USUARIO";
		
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			idUsuario = rs.getInt(1);
		}
		statement.close();
		con.close();
		
		return idUsuario;
	}
	
	public Usuario getUsuario(Usuario usuario) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "SELECT login, senha, datanasc, nome, telefone, email, idendereco, ativo, cpf FROM USUARIO "
				+ "WHERE IDUSUARIO=?";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, usuario.getIdUsuario());;
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			usuario.setLogin(rs.getString(1));
			usuario.setSenha(rs.getString(2));
			usuario.setDataNascimento(rs.getDate(3));
			usuario.setNome(rs.getString(4));
			usuario.setTelefone(rs.getString(5));
			usuario.setEmail(rs.getString(6));
			usuario.setIdEndereco(rs.getInt(7));
			usuario.setAtivo(rs.getInt(8));
			usuario.setCpf(rs.getString(9));
		}
		statement.close();
		con.close();
		
		return usuario;
	}
	
	public void cadastrarUsuario(Usuario usuario) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "INSERT INTO USUARIO (login, senha, nome, dataNasc, telefone, email, idEndereco, ativo, cpf) "
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, usuario.getLogin());
		statement.setString(2, usuario.getSenha());
		statement.setString(3, usuario.getNome());
		statement.setDate(4, usuario.getDataNascimento());
		statement.setString(5, usuario.getTelefone());
		statement.setString(6, usuario.getEmail());
		statement.setInt(7, usuario.getIdEndereco());
		statement.setInt(8, usuario.getAtivo());
		statement.setString(9, usuario.getCpf());
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public void inativarUsuario(int idUsuario) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "UPDATE USUARIO SET ATIVO=0 where idUsuario=?;";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idUsuario);
		statement.executeUpdate();	
		statement.close();
		con.close();
	}
	
	public void alterarUsuario(Usuario usuario) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "UPDATE USUARIO SET "
				+ " login = ?"
				+ " senha = ?"
				+ " dataNasc = ?"
				+ " nome = ?"
				+ " telefone = ?"
				+ " email = ?"
				+ " idEndereco = ?"
				+ " cpf = ?"
				+ " where idUsuario=?";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, usuario.getLogin());
		statement.setString(2,  usuario.getSenha());
		statement.setDate(3, usuario.getDataNascimento());
		statement.setString(4,  usuario.getNome());
		statement.setString(5,  usuario.getTelefone());
		statement.setString(6,  usuario.getEmail());
		statement.setInt(7, usuario.getIdEndereco());
		statement.setString(8, usuario.getCpf());
		statement.setInt(9, usuario.getIdUsuario());

		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	
	
	
}