package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import conexao.Conexao;
import model.Pagamento;

public class PagamentoDAO {
	public void efetuarPagamento(Pagamento pagamento) throws SQLException{
		Connection con = new Conexao().getConnection();
		String sql = "INSERT INTO Pagamento (valor, tipopagamento)"
				+ "VALUES (?,?)";
		
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setInt(1, pagamento.getTipoPagamento());
		statement.setDouble(2, pagamento.getValorPagamento());
		statement.executeUpdate();
		
		statement.close();
		con.close();
	}
	
}
