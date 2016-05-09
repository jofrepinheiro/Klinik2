<%@page import="model.DadosConsulta"%>
<%@page import="DAO.DadosConsultaDAO"%>
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
		String dataRegistro;
		String horarioRegistro;
		String descricao;
		String idConsulta;
		
		dataRegistro = request.getParameter("dataRegistro");
		horarioRegistro = request.getParameter("horarioRegistro");
		descricao = request.getParameter("descricao");
		idConsulta = request.getParameter("idConsulta");
		
		DadosConsulta dadosConsulta = new DadosConsulta();
		DadosConsultaDAO dadosConsultaDAO = new DadosConsultaDAO();
		
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		java.sql.Date data = new java.sql.Date(format.parse(dataRegistro).getTime());
		  
		format = new SimpleDateFormat("HH:mm");
		java.sql.Time horario = new java.sql.Time(format.parse(horarioRegistro).getTime());
		
		dadosConsulta.setDataRegistro(data);
		dadosConsulta.setHorarioRegistro(horario);
		dadosConsulta.setDescricao(descricao);
		dadosConsulta.setIdConsulta(Integer.parseInt(idConsulta));
		
		dadosConsultaDAO.cadastrarDadosConsulta(dadosConsulta);
	%>
</body>
</html>