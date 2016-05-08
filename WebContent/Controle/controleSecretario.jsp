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

System.out.println("Acao: " + action);

if (action.equalsIgnoreCase("Cadastrar")){
	
  // usuario e senha corretos
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
  
  UsuarioDAO usuarioDAO = new UsuarioDAO();
  boolean cpfValido = usuarioDAO.validarCpf(cpf);
  if(!cpfValido){
	  response.sendRedirect("../FrontEnd/pages/cadastroSec.html?erro=1");
  }
  
  endereco.setBairro(bairro);
  endereco.setComplemento(complemento);
  endereco.setCEP(cep);
  endereco.setLogradouro(logradouro);
  endereco.setNumero(Integer.parseInt(numero));
  
  enderecoDAO.cadastrarEndereco(endereco);
  secretarioDAO.cadastrarSecretario(secretario);
}
//}
%>
</body>
</html>