<%@page import="DAO.UsuarioDAO"%>
<%@page import="model.Secretario"%>
<%@page import="DAO.SecretarioDAO"%>
<%@page import="model.Endereco"%>
<%@page import="model.Medico"%>
<%@page import="DAO.EnderecoDAO"%>
<%@page import="DAO.MedicoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String action = request.getParameter("action"); 
int idUsuario = Integer.parseInt(request.getParameter("idUsuario")); 

	String login;
	String senha;
	String dataNascimento;
	String nome;
	String cpf;
	String telefone;
	String email;
	String turno;
	String bairro;
	String logradouro;
	String numero;
	String complemento;
	String cep;
if (action.equalsIgnoreCase("Cadastrar")){ 

  // dados informados no formulário
  login = request.getParameter("login");
  senha = request.getParameter("senha");
  nome = request.getParameter("nome");
  telefone = request.getParameter("telefone");
  cpf = request.getParameter("cpf");
  email = request.getParameter("email");
  dataNascimento = request.getParameter("dataNascimento");
  turno = request.getParameter("turno");
  
  bairro = request.getParameter("bairro");
  logradouro = request.getParameter("logradouro");
  numero = request.getParameter("numero");
  complemento = request.getParameter("complemento");
  cep = request.getParameter("cep");
    
  UsuarioDAO usuarioDAO = new UsuarioDAO();
  boolean cpfValido = usuarioDAO.validarCpf(cpf);
  if(cpfValido == false){
	  response.sendRedirect("../FrontEnd/pages/cadastroSec.jsp?erro=1");
  }else{
	  Endereco endereco = new Endereco();
	  Secretario secretario = new Secretario();
	  EnderecoDAO enderecoDAO = new EnderecoDAO();
	  SecretarioDAO secretarioDAO = new SecretarioDAO();
	  
	  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	  java.sql.Date data = new java.sql.Date(format.parse(dataNascimento).getTime());

	  secretario.setLogin(login);
	  secretario.setSenha(senha);
	  secretario.setDataNascimento(data);
	  secretario.setNome(nome);
	  secretario.setAtivo(1);
	  secretario.setEmail(email);
	  secretario.setTelefone(telefone);
	  secretario.setCpf(cpf);
	  secretario.setTurno(Integer.parseInt(turno));
	  
	  endereco.setBairro(bairro);
	  endereco.setComplemento(complemento);
	  endereco.setCEP(cep);
	  endereco.setLogradouro(logradouro);
	  endereco.setNumero(Integer.parseInt(numero));
	  
	  enderecoDAO.cadastrarEndereco(endereco);
	  secretarioDAO.cadastrarSecretario(secretario);
	  response.sendRedirect("../FrontEnd/pages/listaSec.jsp?sucesso=1");
  }
}else{
  if(action.equalsIgnoreCase("Alterar")){
	  login = request.getParameter("login");
	  senha = request.getParameter("senha");
	  nome = request.getParameter("nome");
	  telefone = request.getParameter("telefone");
	  cpf = request.getParameter("cpf");
	  email = request.getParameter("email");
	  dataNascimento = request.getParameter("dataNascimento");
	  turno = request.getParameter("turno");
	  
	  bairro = request.getParameter("bairro");
	  logradouro = request.getParameter("logradouro");
	  numero = request.getParameter("numero");
	  complemento = request.getParameter("complemento");
	  cep = request.getParameter("cep");
	    
	  UsuarioDAO usuarioDAO = new UsuarioDAO();	  
		  Endereco endereco = new Endereco();
		  Secretario secretario = new Secretario();
		  EnderecoDAO enderecoDAO = new EnderecoDAO();
		  SecretarioDAO secretarioDAO = new SecretarioDAO();
		  
		  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		  java.sql.Date data = new java.sql.Date(format.parse(dataNascimento).getTime());

		  secretario.setIdUsuario(idUsuario);
		  secretario.setLogin(login);
		  secretario.setSenha(senha);
		  secretario.setDataNascimento(data);
		  secretario.setNome(nome);
		  secretario.setAtivo(1);
		  secretario.setEmail(email);
		  secretario.setTelefone(telefone);
		  secretario.setCpf(cpf);
		  secretario.setTurno(Integer.parseInt(turno));
		  
		  endereco.setBairro(bairro);
		  endereco.setComplemento(complemento);
		  endereco.setCEP(cep);
		  endereco.setLogradouro(logradouro);
		  endereco.setNumero(Integer.parseInt(numero));
		  
		  //enderecoDAO.cadastrarEndereco(endereco);
		  secretarioDAO.alterarSecretario(secretario);
		  response.sendRedirect("../FrontEnd/pages/listaSec.jsp?sucesso=2");
  }else{
	  UsuarioDAO usuarioDAO = new UsuarioDAO();
	  usuarioDAO.inativarUsuario(idUsuario);
	  response.sendRedirect("../FrontEnd/pages/listaSec.jsp?sucesso=3");
  }
}
//}
%>
</body>
</html>