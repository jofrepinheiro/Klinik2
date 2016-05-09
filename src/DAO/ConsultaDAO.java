package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conexao.Conexao;
import model.Consulta;
import model.Medico;

public class ConsultaDAO {
	
	public ArrayList<Consulta> getConsultasList() throws SQLException{
		ArrayList<Consulta> consultasList = new ArrayList<>();
		Connection con = new Conexao().getConnection();		
		
		String sql = "SELECT * FROM CONSULTA WHERE atendida != 1";
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			Consulta consulta = new Consulta();
			consulta.setIdConsulta(rs.getInt(1));
			consulta.setDataConsulta(rs.getDate(2));
			consulta.setHorarioConsulta(rs.getTime(3));
			consulta.setMotivo(rs.getString(4));
			consulta.setIdMedico(rs.getInt(5));
			consulta.setIdPaciente(rs.getInt(6));
			consulta.setIdPagamento(rs.getInt(7));
			consultasList.add(consulta);
		}
		
		statement.close();
		con.close();
		return consultasList;
	}
	
	public Consulta getConsulta(int idConsulta) throws SQLException{
		Connection con = new Conexao().getConnection();		
		
		String sql = "SELECT * FROM CONSULTA WHERE idConsulta=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idConsulta);
		ResultSet rs = statement.executeQuery();
		Consulta consulta = new Consulta();

		while (rs.next()){
			consulta.setIdConsulta(rs.getInt(1));
			consulta.setDataConsulta(rs.getDate(2));
			consulta.setHorarioConsulta(rs.getTime(3));
			consulta.setMotivo(rs.getString(4));
			consulta.setIdMedico(rs.getInt(5));
			consulta.setIdPaciente(rs.getInt(6));
			consulta.setIdPagamento(rs.getInt(7));
		}
		statement.close();
		con.close();
		return consulta;
	}
	
	public void cadastrarConsulta(Consulta consulta) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "INSERT INTO CONSULTA (dataConsulta, horarioConsulta, motivo, idMedico, idPaciente, atendida) "
				+ "VALUES (?,?,?,?,?,?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setDate(1,consulta.getDataConsulta());
		statement.setTime(2, consulta.getHorarioConsulta());
		statement.setString(3, consulta.getMotivo());
		statement.setInt(4, consulta.getIdMedico());
		statement.setInt(5, consulta.getIdPaciente());
		statement.setInt(6, consulta.getAtendida());
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public void alterarConsulta(Consulta consulta) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "UPDATE CONSULTA SET "
				+ " dataConsulta = ? ,"
				+ " horarioConsulta = ? ,"
				+ " motivo = ? "
				+ "WHERE idConsulta = ?";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setDate(1,consulta.getDataConsulta());
		statement.setTime(2, consulta.getHorarioConsulta());
		statement.setString(3, consulta.getMotivo());
		statement.setInt(4, consulta.getIdConsulta());
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public ArrayList<Consulta> getConsultasDiaList(int idMedico) throws SQLException{
		ArrayList<Consulta> consultasList = new ArrayList<>();
		Connection con = new Conexao().getConnection();		
		
		String sql = "select * from consulta where dataconsulta = CURRENT_DATE and atendida != 1 and idMedico=? order by horarioconsulta";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idMedico);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			Consulta consulta = new Consulta();
			consulta.setIdConsulta(rs.getInt(1));
			consulta.setDataConsulta(rs.getDate(2));
			consulta.setHorarioConsulta(rs.getTime(3));
			consulta.setMotivo(rs.getString(4));
			consulta.setIdMedico(rs.getInt(5));
			consulta.setIdPaciente(rs.getInt(6));
			consulta.setIdPagamento(rs.getInt(7));
			consulta.setAtendida(rs.getInt(8));
			consultasList.add(consulta);
		}
		
		statement.close();
		con.close();
		return consultasList;
	}
	
	public ArrayList<Consulta> getConsultasHistoricoList() throws SQLException{
		ArrayList<Consulta> consultasList = new ArrayList<>();
		Connection con = new Conexao().getConnection();		
		
		String sql = "select * from consulta where atendida = 1 order by dataconsulta";
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			Consulta consulta = new Consulta();
			consulta.setIdConsulta(rs.getInt(1));
			consulta.setDataConsulta(rs.getDate(2));
			consulta.setHorarioConsulta(rs.getTime(3));
			consulta.setMotivo(rs.getString(4));
			consulta.setIdMedico(rs.getInt(5));
			consulta.setIdPaciente(rs.getInt(6));
			consulta.setIdPagamento(rs.getInt(7));
			consultasList.add(consulta);
		}
		
		statement.close();
		con.close();
		return consultasList;
	}	
	
	public void atualizarPagamento(int idpagamento, int idconsulta) throws SQLException{
		Connection con = new Conexao().getConnection();
		
		String sql = "UPDATE Consulta SET idpagamento = ? where idconsulta=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, idpagamento);
		statement.setInt(2, idconsulta);
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
	public ArrayList<Consulta> getConsultaNaoPaga() throws SQLException{
		ArrayList<Consulta> consultasList = new ArrayList<>();
		Connection con = new Conexao().getConnection();		
		
		String sql = "SELECT * FROM CONSULTA WHERE idpagamento is null";
		PreparedStatement statement = con.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()){
			Consulta consulta = new Consulta();
			consulta.setIdConsulta(rs.getInt(1));
			consulta.setDataConsulta(rs.getDate(2));
			consulta.setHorarioConsulta(rs.getTime(3));
			consulta.setMotivo(rs.getString(4));
			consulta.setIdMedico(rs.getInt(5));
			consulta.setIdPaciente(rs.getInt(6));
			consulta.setIdPagamento(rs.getInt(7));
			consultasList.add(consulta);
		}
		
		statement.close();
		con.close();
		return consultasList;
	}
	
	public void setAtendida(int idConsulta) throws SQLException{
		Connection con = new Conexao().getConnection();
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		String sql = "UPDATE CONSULTA SET "
				+ " atendida = 1 "
				+ "WHERE idConsulta = ?";
		
		PreparedStatement statement = con.prepareStatement(sql);
		
		statement.setInt(1,idConsulta);
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
}
