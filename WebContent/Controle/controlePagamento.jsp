<%@page import="model.Pagamento"%>
<%@page import="DAO.PagamentoDAO"%>
<%@page import="model.Consulta"%>
<%@page import="DAO.ConsultaDAO"%>
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
  String valor;
  String tipoPagamento;
  String idConsulta;
  
  // dados informados no formulário
  valor = request.getParameter("valor");
  tipoPagamento = request.getParameter("tipoPagamento");
  idConsulta = request.getParameter("idConsulta");
  
  Pagamento pagamento = new Pagamento();
  PagamentoDAO pagamentoDAO = new PagamentoDAO();  
  
  pagamento.setValorPagamento(Float.parseFloat(valor));
  pagamento.setTipoPagamento(Integer.parseInt(tipoPagamento));
  
  ConsultaDAO consultaDAO = new ConsultaDAO();
  pagamentoDAO.efetuarPagamento(pagamento);
  int idpagamento = pagamentoDAO.getIdPagamento();
  consultaDAO.atualizarPagamento(idpagamento, Integer.parseInt(idConsulta));
  
  response.sendRedirect("../FrontEnd/pages/cadastroPagamento.jsp?sucesso=2");
}
//}
%>
</body>
</html>