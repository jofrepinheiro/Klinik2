package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Medico;
import model.Paciente;
import model.Usuario;
import conexao.Conexao;

public class PacienteDAO {
	public ArrayList<Paciente> getPacienteList() throws SQLException{
		ArrayList<Paciente> pacienteList = new ArrayList<>();
		
		Connection con = new Conexao().getConnection();		
		
		String sql = "SELECT idpaciente, nome, telefone, cpf, email, sexo, datanasc, idendereco FROM PACIENTE";
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			Paciente paciente = new Paciente();
			paciente.setIdPaciente(rs.getInt(1));
			paciente.setNome(rs.getString(2));
			paciente.setTelefone(rs.getString(3));
			paciente.setCpf(rs.getString(4));
			paciente.setEmail(rs.getString(5));
			paciente.setSexo(rs.getString(6).charAt(0));
			paciente.setDataNasc(rs.getDate(7));
			paciente.setIdEndereco(rs.getInt(8));
			pacienteList.add(paciente);
		}
		
		statement.close();
		con.close();
		
		return pacienteList;	
	}
	
	public void cadastrarPaciente(Paciente paciente) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "INSERT INTO Paciente (nome, telefone, cpf, email, sexo, dataNasc, idEndereco) "
				+ "VALUES (?,?,?,?,?,?,?)";
		
		
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		int endereco = enderecoDAO.getIdEndereco();
		
		paciente.setIdEndereco(endereco);
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, paciente.getNome());
		statement.setString(2, paciente.getTelefone());
		statement.setString(3, paciente.getCpf());
		statement.setString(4, paciente.getEmail());
		statement.setInt(5, paciente.getSexo());
		statement.setDate(6, paciente.getDataNasc());
		statement.setInt(7, paciente.getIdEndereco());
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public void alterarPaciente(Paciente paciente) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "UPDATE PACIENTE SET "
				+ " nome = ?"
				+ " telefone = ?"
				+ " cpf = ?"
				+ " email = ?"
				+ " sexo = ?"
				+ " datanasc = ?"
				+ " idEndereco = ?"
				+ " where idUsuario=?";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, paciente.getNome());
		statement.setString(2, paciente.getTelefone());
		statement.setString(3, paciente.getCpf());
		statement.setString(4, paciente.getEmail());
		statement.setString(5, Character.toString(paciente.getSexo()));
		statement.setDate(6, paciente.getDataNasc());
		statement.setInt(7, paciente.getIdEndereco());
		statement.setInt(8, paciente.getIdPaciente());
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public Paciente getPaciente(int idPaciente) throws SQLException{
		
		Connection con = new Conexao().getConnection();		
		
		String sql = "SELECT idpaciente, nome, telefone, cpf, email, sexo, datanasc, idendereco FROM PACIENTE WHERE idpaciente=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idPaciente);
		ResultSet rs = statement.executeQuery();
		
		Paciente paciente = new Paciente();
		while (rs.next()){
			paciente.setIdPaciente(rs.getInt(1));
			paciente.setNome(rs.getString(2));
			paciente.setTelefone(rs.getString(3));
			paciente.setCpf(rs.getString(4));
			paciente.setEmail(rs.getString(5));
			paciente.setSexo(rs.getString(6).charAt(0));
			paciente.setDataNasc(rs.getDate(7));
			paciente.setIdEndereco(rs.getInt(8));	
		}
		
		statement.close();
		con.close();
		
		return paciente;
	}
}
