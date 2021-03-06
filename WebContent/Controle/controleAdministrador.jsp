<%@page import="DAO.UsuarioDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.AdministradorDAO"%>
<%@page import="DAO.EnderecoDAO"%>
<%@page import="model.Administrador"%>
<%@page import="model.Endereco"%>
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
  
  bairro = request.getParameter("bairro");
  logradouro = request.getParameter("logradouro");
  numero = request.getParameter("numero");
  complemento = request.getParameter("complemento");
  cep = request.getParameter("cep");
  
  UsuarioDAO usuarioDAO = new UsuarioDAO();
  boolean cpfValido = usuarioDAO.validarCpf(cpf);
  if(cpfValido == false){
	  response.sendRedirect("../FrontEnd/pages/cadastroAdmin.jsp?erro=1");
  }else{
	  
	  Endereco endereco = new Endereco();
	  Administrador administrador  = new Administrador();
	  EnderecoDAO enderecoDAO = new EnderecoDAO();
	  AdministradorDAO administradorDAO = new AdministradorDAO();  
	  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	  java.sql.Date data = new java.sql.Date(format.parse(dataNascimento).getTime());
	  
	  administrador.setLogin(login);
	  administrador.setSenha(senha);
	  administrador.setDataNascimento(data);
	  administrador.setNome(nome);
	  administrador.setAtivo(1);
	  administrador.setEmail(email);
	  administrador.setTelefone(telefone);
	  administrador.setCpf(cpf);
	  
	  endereco.setBairro(bairro);
	  endereco.setComplemento(complemento);
	  endereco.setCEP(cep);
	  endereco.setLogradouro(logradouro);
	  endereco.setNumero(Integer.parseInt(numero));
	
	  enderecoDAO.cadastrarEndereco(endereco);
	  administradorDAO.cadastrarAdministrador(administrador);
	  response.sendRedirect("../FrontEnd/pages/listaAdmin.jsp?sucesso=1");
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
	  
	  UsuarioDAO usuarioDAO = new UsuarioDAO();
	  
		  bairro = request.getParameter("bairro");
		  logradouro = request.getParameter("logradouro");
		  numero = request.getParameter("numero");
		  complemento = request.getParameter("complemento");
		  cep = request.getParameter("cep");
		  
		  Endereco endereco = new Endereco();
		  Administrador administrador  = new Administrador();
		  EnderecoDAO enderecoDAO = new EnderecoDAO();
		  AdministradorDAO administradorDAO = new AdministradorDAO();  
		  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		  java.sql.Date data = new java.sql.Date(format.parse(dataNascimento).getTime());
		  
		  administrador.setIdUsuario(idUsuario);
		  administrador.setLogin(login);
		  administrador.setSenha(senha);
		  administrador.setDataNascimento(data);
		  administrador.setNome(nome);
		  administrador.setAtivo(1);
		  administrador.setEmail(email);
		  administrador.setTelefone(telefone);
		  administrador.setCpf(cpf);
		  endereco.setBairro(bairro);
		  endereco.setComplemento(complemento);
		  endereco.setCEP(cep);
		  endereco.setLogradouro(logradouro);
		  endereco.setNumero(Integer.parseInt(numero));
		
		  //enderecoDAO.cadastrarEndereco(endereco);
		  administrador.setIdAdministrador(idUsuario);
		  administradorDAO.alterarAdministrador(administrador);
		  response.sendRedirect("../FrontEnd/pages/listaAdmin.jsp?sucesso=2");
	 }else{
		 UsuarioDAO usuarioDAO = new UsuarioDAO();
		 usuarioDAO.inativarUsuario(idUsuario);
		 response.sendRedirect("../FrontEnd/pages/listaAdmin.jsp?sucesso=3");
	 }
}
 %>
</body>
</html>