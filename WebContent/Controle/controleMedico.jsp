<%@page import="model.Endereco"%>
<%@page import="model.Medico"%>
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

//if (action == "Cadastrar"){
	
  // usuario e senha corretos
  String login;
  String senha;
  String dataNascimento;
  String nome;
  String cpf;
  String telefone;
  String email;
  String bairro;
  String logradouro;
  int numero;
  String estado;
  String cidade;
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
  
  bairro = request.getParameter("bairro");
  logradouro = request.getParameter("logradouro");
  numero = request.getParameter("numero");
  cidade = request.getParameter("cidade");
  estado = request.getParameter("estado");
  complemento = request.getParameter("complemento");
  cep = request.getParameter("cep");
  
  Endereco endereco = new Endereco();
  Medico medico = new Medico();
  
  endereco.setBairro(bairro);
  endereco.setComplemento(complemento);
  endereco.setCEP(cep);
  endereco.setCidade(cidade);
  endereco.setLogradouro(logradouro);
  endereco.setNumero(numero);
  
  
 
//}
%>
</body>
</html>