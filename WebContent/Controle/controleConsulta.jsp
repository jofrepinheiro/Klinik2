<%@page import="java.sql.Time"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="DAO.ConsultaDAO"%>

<%@page import="model.Consulta"%>

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
	int idConsulta = Integer.parseInt(request.getParameter("idConsulta")); 

	String paciente;
	String medico;
	String dataConsulta;
	String horaConsulta;
	String motivo;

if (action.equalsIgnoreCase("Cadastrar")){
  paciente = request.getParameter("paciente");
  medico = request.getParameter("medico");
  dataConsulta = request.getParameter("data");
  horaConsulta = request.getParameter("hora");
  motivo = request.getParameter("motivo");
  
  Consulta consulta = new Consulta();
  ConsultaDAO consultaDAO = new ConsultaDAO();
  
  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
  java.sql.Date data = new java.sql.Date(format.parse(dataConsulta).getTime());

  format = new SimpleDateFormat("HH:mm");
  java.sql.Time hora = new java.sql.Time(format.parse(horaConsulta).getTime());
  
  
  consulta.setIdPaciente(Integer.parseInt(paciente));
  consulta.setIdMedico(Integer.parseInt(medico));
  consulta.setDataConsulta(data);
  consulta.setHorarioConsulta(hora);
  consulta.setMotivo(motivo);
  //consulta.setIdPagamento(); 
  consulta.setAtendida(0);
  
  consultaDAO.cadastrarConsulta(consulta);
  response.sendRedirect("../FrontEnd/pages/indexSec.jsp?sucesso=1");
}else{
	if(action.equalsIgnoreCase("Alterar")){
	// dados informados no formulário
	  paciente = request.getParameter("paciente");
	  medico = request.getParameter("medico");
	  dataConsulta = request.getParameter("data");
	  horaConsulta = request.getParameter("hora");
	  motivo = request.getParameter("motivo");
	  
	  
	  Consulta consulta = new Consulta();
	  ConsultaDAO consultaDAO = new ConsultaDAO();
	  
	  SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	  java.sql.Date data = new java.sql.Date(format.parse(dataConsulta).getTime());

	  format = new SimpleDateFormat("HH:mm");
	  java.sql.Time hora = new java.sql.Time(format.parse(horaConsulta).getTime());
	  
	  consulta.setIdConsulta(idConsulta);
	  consulta.setIdPaciente(Integer.parseInt(paciente));
	  consulta.setIdMedico(Integer.parseInt(medico));
	  consulta.setDataConsulta(data);
	  consulta.setHorarioConsulta(hora);
	  consulta.setMotivo(motivo);
	  //consulta.setIdPagamento(); 
	  consulta.setAtendida(1);
	  
	  consultaDAO.alterarConsulta(consulta);
	  response.sendRedirect("../FrontEnd/pages/listaConsulta.jsp?sucesso=2");
	}else{
		  ConsultaDAO consultaDAO = new ConsultaDAO();
		  consultaDAO.deletarConsulta(idConsulta);
		  response.sendRedirect("../FrontEnd/pages/listaConsulta.jsp?sucesso=3");
	}
}
%>
</body>
</html>