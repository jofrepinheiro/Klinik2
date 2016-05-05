package view;

import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;

import DAO.AdministradorDAO;
import DAO.EnderecoDAO;
import DAO.MedicoDAO;
import DAO.SecretarioDAO;
import model.Administrador;
import model.Endereco;
import model.Medico;
import model.Secretario;
import model.Usuario;

public class Principal {

	public static void main(String[] args) throws SQLException {
//		AdministradorDAO admDao = new AdministradorDAO();
//		Administrador adm = new Administrador();
//		MedicoDAO medicoDAO = new MedicoDAO();
//		Medico medico = new Medico();
//		SecretarioDAO secretarioDAO = new SecretarioDAO();
//		Secretario secretario = new Secretario();
//		adm.setAtivo(1);
//		adm.setDataNascimento(null);
//     	adm.setLogin("Railan Xisto");
//		adm.setSenha("blablaeu");
//		adm.setNome("Eu");
//		adm.setAtivo(1);
//		adm.setIdEndereco(1);
//		admDao.cadastrarAdministrador(adm);
//		System.out.println("teste");
		
		Endereco endereco = new Endereco();
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		
		endereco.setBairro("Centro");
		endereco.setCEP("494000000");
		endereco.setCidade("Lagarto");
		endereco.setLogradouro("Rua B");
		endereco.setNumero(217);
		endereco.setComplemento("Casa");
		endereco.setEstado("SE");
		enderecoDAO.cadastrarEndereco(endereco);
		//System.out.println("Inserido");
		//adm = admDao.getAdministrador(18);
		//System.out.println("ID="+adm.getIdAdministrador()+"Nome="+adm.getNome());
		//System.out.println("Deletado");
		
	}

}
