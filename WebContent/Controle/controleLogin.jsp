<%@page import="java.io.PrintWriter"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
	function chamar_alert(){
		alert("Preencha os campos");
	}
</script>
<title></title>
</head>

<body>
<% 

String action = request.getParameter("action"); 


if (action.equalsIgnoreCase("Logar")){
  String login;
  String senha;

  // dados informados no formulário
  login = request.getParameter("login");
  senha = request.getParameter("senha");
  
  Usuario usuario = new Usuario();
  UsuarioDAO usuarioDAO = new UsuarioDAO();
  usuario = usuarioDAO.loginUsuario(login, senha);
  if(usuario != null){
	  int tipoUsuario = usuarioDAO.getTipoUsuario(usuario.getIdUsuario());
	  if(tipoUsuario == 0){
		  response.sendRedirect("../FrontEnd/pages/indexMed.html");
	  }
	  if(tipoUsuario == 1){
		  response.sendRedirect("../FrontEnd/pages/indexSec.html");
	  }
	  if(tipoUsuario == 2){
		  response.sendRedirect("../FrontEnd/pages/indexAdmin.html");
	  }
  }else{
	  response.sendRedirect("../FrontEnd/pages/login.html?erro=1");
	 // request.setAttribute("erro","ok"); 

	  //RequestDispatcher dispatcher = request.getRequestDispatcher("controleMedico.jsp"); 
	 //  dispatcher.forward(request,response); 

  }
  
}
%>

</body>
</html>