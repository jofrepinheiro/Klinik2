package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conexao;
import model.DadosConsulta;

public class DadosConsultaDAO {

	public void cadastrarDadosConsulta(DadosConsulta dadosConsulta) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "INSERT INTO DADOSCONSULTA(dataregistro, horarioregistro, descricao, idconsulta) VALUES(?,?,?,?) ";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setDate(1, dadosConsulta.getDataRegistro());
		statement.setTime(2, dadosConsulta.getHorarioRegistro());		
		statement.setString(3, dadosConsulta.getDescricao());
		statement.setInt(4, dadosConsulta.getIdConsulta());
		
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	
	public DadosConsulta getDadosConsulta(int idConsulta) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "SELECT * FROM DADOSCONSULTA WHERE idconsulta = ?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idConsulta);
		ResultSet rs = statement.executeQuery();
		
		DadosConsulta dadosConsulta = new DadosConsulta();
		
		while(rs.next()){
			dadosConsulta.setIdDadosConsulta(rs.getInt(1));
			dadosConsulta.setDataRegistro(rs.getDate(2));
			dadosConsulta.setHorarioRegistro(rs.getTime(3));
			dadosConsulta.setDescricao(rs.getString(4));
			dadosConsulta.setIdConsulta(rs.getInt(5));			
		}
		
		statement.close();
		con.close();
		
		return dadosConsulta;
	}
}
