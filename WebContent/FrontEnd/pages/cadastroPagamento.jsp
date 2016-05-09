<%@page import="DAO.ConsultaDAO"%>
<%@page import="model.Consulta"%>
<%@page import="DAO.PagamentoDAO"%>
<%@page import="model.Pagamento"%>
<%@page import="DAO.PacienteDAO" %>
<%@page import="model.Paciente" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<%	  
		String perfil = (String) session.getAttribute("perfilUsuario");
		if(perfil != "1"){
			  response.sendRedirect("login.html?erro=2");
		}
		
		ArrayList<Consulta> consultaList = new ArrayList<>();
	    ConsultaDAO consultaDAO = new ConsultaDAO();
	    consultaList = consultaDAO.getConsultaNaoPaga();
	    
		PacienteDAO pacienteDAO = new PacienteDAO();

%>

	<script type="text/javascript" language="javascript">
			function valida_form(){
				valor = document.forms["formCadastro"]["valor"].value;
				
				if(valor == ""){
					alert("Por favor, preencha todos os campos obrigatários");
					return false
				}else{
					document.formCadastro.submit();
				}
			}
	</script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Klinik - Clínica Médica</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 10px">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="indexSec.jsp">Klinik</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <%=session.getAttribute("nomeUsuario")%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Informações </a>
                        </li>
							 <li class="divider"></li>
                        <li><a href="../../Controle/controleLogin.jsp?action=Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="indexSec.jsp"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                        </li>
						
						<li>
                            <a href="#"><i class="fa fa-table fa-fw"> </i> Gerenciamento<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="listaPaciente.jsp">Paciente</a>
                                </li>
                                <li>
                                    <a href="listaConsulta.jsp">Consulta</a>
                                </li>
							</ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"> </i> Cadastro<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="cadastroPaciente.jsp">Paciente</a>
                                </li>
                                <li>
                                    <a href="cadastroConsulta.jsp">Consulta</a>
                                </li>
							</ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-usd"> </i> Efetuar Pagamento</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"> </h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							Pagamento
                        </div>
                        <div class="panel-body">
                            <form method="post" role="form" name="formCadastro" id="formCadastro" onsubmit="return valida_form(this)" action="../../Controle/controlePagamento.jsp">
								<input type="hidden" name="action" value="Cadastrar">
								<div class="row">
									<div class = "form-group">
										<div class="col-lg-6">	
										<label>Consulta</label>
											<select name="idConsulta" id="idConsulta" class="form-control">
												<% for(int i=0; i < consultaList.size();i++){ System.out.println(i);%>
													<option value="<%=consultaList.get(i).getIdConsulta()%>"><%=consultaList.get(i).getDataConsulta()%>, <%=consultaList.get(i).getHorarioConsulta()%>, <%= pacienteDAO.getPaciente(consultaList.get(i).getIdPaciente()).getNome() %> </option>
												<%} %>							
											</select>
										</div>
									<div class="col-lg-6">	
										<div class = "form-group">
										<label>Valor</label>
											<input type="text" class="form-control" name="valor">
										</div>
										
										<div class = "form-group">
										<label>Tipo</label>
											<select name="tipoPagamento" id="tipoPagamento" class="form-control">
												<option value="1">Dinheiro</option>
												<option value="2">Cartão de Crédito</option>
												<option value="3">Cartão de Débito</option>												
											</select>
										</div>
										
									</div>
                                </div>
                            </div>
                            	<button type="button"  class="btn btn-default" onclick="valida_form(this);">Enviar</button>
								<button type="reset"  class="btn btn-default">Limpar Campos</button>
							
							</form>
                            <!-- /.row (nested) -->
                        </div>
						
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
					
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
