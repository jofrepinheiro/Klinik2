<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.MedicoDAO"%>
<%@page import="DAO.EnderecoDAO"%>
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


if (action.equalsIgnoreCase("Cadastrar")){
	
  // usuario e senha corretos
  String login;
  String senha;
  String dataNascimento;
  String nome;
  String cpf;
  String telefone;
  String crm;
  String email;
  String especialidade;
  String especialidade2;
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
  crm = request.getParameter("crm");
  email = request.getParameter("email");
  dataNascimento = request.getParameter("dataNascimento");
  especialidade = request.getParameter("especialidade");
  especialidade2 = request.getParameter("especialidade2");
  
  
  bairro = request.getParameter("bairro");
  logradouro = request.getParameter("logradouro");
  numero = request.getParameter("numero");
  complemento = request.getParameter("complemento");
  cep = request.getParameter("cep");
  
  Endereco endereco = new Endereco();
  Medico medico = new Medico();
  EnderecoDAO enderecoDAO = new EnderecoDAO();
  MedicoDAO medicoDAO = new MedicoDAO();
  
  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
  java.sql.Date data = new java.sql.Date(format.parse(dataNascimento).getTime());
  
  medico.setLogin(login);
  medico.setSenha(senha);
  medico.setDataNascimento(data);
  medico.setNome(nome);
  medico.setAtivo(1);
  medico.setEmail(email);
  medico.setTelefone(telefone);
  medico.setCpf(cpf);
  medico.setCRM(Integer.parseInt(crm));
  medico.setEspecialidade(especialidade);
  medico.setEspecialidade2(especialidade2);
  
  endereco.setBairro(bairro);
  endereco.setComplemento(complemento);
  endereco.setCEP(cep);
  endereco.setLogradouro(logradouro);
  endereco.setNumero(Integer.parseInt(numero));
  
  
  enderecoDAO.cadastrarEndereco(endereco);
  medicoDAO.cadastrarMedico(medico);
}
//}
%>


</body>
</html>