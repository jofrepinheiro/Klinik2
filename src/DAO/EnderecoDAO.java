package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conexao;
import model.Administrador;
import model.Endereco;
import model.Medico;

public class EnderecoDAO {
	public void cadastrarEndereco(Endereco endereco) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "INSERT INTO ENDERECO (logradouro, bairro, numero, cep, complemento) VALUES (?,?,?,?,?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, endereco.getLogradouro());
		statement.setString(2, endereco.getBairro());
		statement.setInt(3, endereco.getNumero());
		statement.setString(4, endereco.getCEP());
		statement.setString(5, endereco.getComplemento());

		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public int getIdEndereco() throws SQLException{
		int idEndereco = -1;
		Connection con = new Conexao().getConnection();
		String sql = "SELECT MAX(IDENDERECO) FROM ENDERECO";
		
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while (rs.next()){
			idEndereco = rs.getInt(1);
		}
 		statement.close();
		con.close();
		
		return idEndereco;
	}
	
	public Endereco getEndereco(int idEndereco) throws SQLException{
		Connection con = new Conexao().getConnection();
		Endereco endereco = new Endereco();
		String sql = "SELECT * FROM ENDERECO WHERE idEndereco = ?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idEndereco);
		ResultSet rs = statement.executeQuery();
		
			while (rs.next()){
				endereco.setIdEndereco(rs.getInt(1));
				endereco.setLogradouro(rs.getString(2));
				endereco.setBairro(rs.getString(3));
				endereco.setNumero(rs.getInt(4));
				endereco.setCEP(rs.getString(5));
				endereco.setComplemento(rs.getString(6));
				
			}
			statement.close();
			con.close();
		return endereco;
	}
}
