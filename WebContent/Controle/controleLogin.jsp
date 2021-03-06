<%@page import="DAO.MedicoDAO"%>
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
	  session.putValue("loginUsuario", usuario.getNome()); //Grava a session com o Login
	  session.putValue("nomeUsuario", usuario.getNome()); //Grava a session com o Login
	  session.putValue("idUsuario", usuario.getIdUsuario()); //Grava a session com a Senha
	 // session.setAttribute("Nome",objeto);
	  //SeuObjeto = session.getAttribute("Nome");
	  if(tipoUsuario == 0){
		  session.putValue("perfilUsuario", "0");
		  response.sendRedirect("../FrontEnd/pages/indexAdmin.jsp");
	  }
	  if(tipoUsuario == 1){
		  session.putValue("perfilUsuario", "1"); 
		  response.sendRedirect("../FrontEnd/pages/indexSec.jsp");
	  }
	  if(tipoUsuario == 2){
		  MedicoDAO medicoDAO = new MedicoDAO();
		  session.putValue("perfilUsuario", "2"); 
		  int idMedico = medicoDAO.getIdMedico(usuario.getIdUsuario());
		  response.sendRedirect("../FrontEnd/pages/indexMed.jsp");
		  session.putValue("idMedico", idMedico); 
	  }
  }else{
	  response.sendRedirect("../FrontEnd/pages/login.html?erro=1");
  }
}

if (action.equalsIgnoreCase("Logout")){
	  String login;
	  String senha;

	  // dados informados no formulário
	  session.putValue("idUsuario", null); 
	  session.putValue("perfilUsuario", null); 
	  session.putValue("nomeUsuario", null); 
	  session.putValue("loginUsuario", null); 
	  session.putValue("idMedico", null);
	  response.sendRedirect("../FrontEnd/pages/login.html");

}
%>

</body>
</html>