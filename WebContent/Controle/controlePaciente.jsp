<%@page import="model.Paciente"%>
<%@page import="DAO.PacienteDAO"%>
<%@page import="model.Endereco"%>
<%@page import="DAO.EnderecoDAO"%>
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
  String nome;
  String cpf;
  String sexo;
  String dataNascimento;
  String telefone;
  String email;

  String bairro;
  String logradouro;
  String numero;
  String complemento;
  String cep;

  // dados informados no formulário
  nome = request.getParameter("nome");
  cpf = request.getParameter("cpf");
  sexo = request.getParameter("sexo");
  dataNascimento = request.getParameter("dataNascimento");  
  telefone = request.getParameter("telefone");
  email = request.getParameter("email");
  
  bairro = request.getParameter("bairro");
  logradouro = request.getParameter("logradouro");
  numero = request.getParameter("numero");
  complemento = request.getParameter("complemento");
  cep = request.getParameter("cep");
  
  System.out.println(nome + cpf + sexo + dataNascimento);
  
  Endereco endereco = new Endereco();
  Paciente paciente = new Paciente();

  EnderecoDAO enderecoDAO = new EnderecoDAO();
  PacienteDAO pacienteDAO = new PacienteDAO();
  
  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
  java.sql.Date data = new java.sql.Date(format.parse(dataNascimento).getTime());
  
  
  paciente.setNome(nome);
  paciente.setCpf(cpf);
  paciente.setSexo(cpf.charAt(0));
  paciente.setDataNasc(data);
  paciente.setTelefone(telefone);
  paciente.setEmail(email);
  
  endereco.setBairro(bairro);
  endereco.setComplemento(complemento);
  endereco.setCEP(cep);
  endereco.setLogradouro(logradouro);
  endereco.setNumero(Integer.parseInt(numero));
  
  enderecoDAO.cadastrarEndereco(endereco);
  pacienteDAO.cadastrarPaciente(paciente);
}
//}
%>
</body>
</html>