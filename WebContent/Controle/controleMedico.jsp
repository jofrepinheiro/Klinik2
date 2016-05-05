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
  String telefone;
  String email;

  // dados informados no formulário
  login = request.getParameter("login");
  senha = request.getParameter("senha");
  nome = request.getParameter("nome");
  telefone = request.getParameter("telefone");
  email = request.getParameter("email");
  dataNascimento = request.getParameter("dataNascimento");
 
//}
%>
</body>
</html>