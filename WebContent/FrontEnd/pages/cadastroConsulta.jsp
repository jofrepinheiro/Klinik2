<%@page import="DAO.MedicoDAO"%>
<%@page import="DAO.PacienteDAO"%>
<%@page import="model.Medico"%>
<%@page import="model.Paciente"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

	<script type="text/javascript" language="javascript">
			function valida_form(){
				data = document.forms["formCadastro"]["data"].value;
				hora = document.forms["formCadastro"]["hora"].value;
				
	
				if(data == "" || hora == ""){
					alert("Por favor, preencha todos os campos obrigatï¿½rios");
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
    
<% 
	ArrayList<Medico> medicoList = new ArrayList<>();
    MedicoDAO medicoDAO = new MedicoDAO();
    medicoList = medicoDAO.getMedicoList();
    
    ArrayList<Paciente> pacienteList = new ArrayList<>();
    PacienteDAO pacienteDAO = new PacienteDAO();
    pacienteList = pacienteDAO.getPacienteList();
    System.out.println(pacienteList.size());
%>
    

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
                <a class="navbar-brand" href="index.html">Klinik</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  Olá, Secretário <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Informações </a>
                        </li>
							 <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="indexSec.html"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                        </li>
						
						<li>
                            <a href="#"><i class="fa fa-table fa-fw"> </i> Gerenciamento<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="listaPaciente.html">Paciente</a>
                                </li>
                                <li>
                                    <a href="listaConsulta.html">Consulta</a>
                                </li>
							</ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"> </i> Cadastro<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="cadastroPaciente.html">Paciente</a>
                                </li>
                                <li>
                                    <a href="#">Consulta</a>
                                </li>
							</ul>
                            <!-- /.nav-second-level -->
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
							Cadastro de Consulta
                        </div>
                        <div class="panel-body">
                            <form method="post" role="form" name="formCadastro"  onsubmit="return valida_form(this)" action="../../Controle/controleConsulta.jsp">
								<input type="hidden" name="action" value="Cadastrar">
								<div class="row">
									<div class="col-lg-12">
										<div class = "form-group">
										<label>Paciente</label>
											<select class="form-control" name="paciente" id="uf">
												<% for(int i=0; i < pacienteList.size(); i++){%>
												<option value="<%=pacienteList.get(i).getIdPaciente()%>"><%=pacienteList.get(i).getCpf()%> - <%=pacienteList.get(i).getNome()%></option>
												<%} %> 
											</select>
											
										</div>
										
										<div class = "form-group">
										<label>Médico</label>
											<select class="form-control" name="medico" id="uf">
												<% for(int i=0; i < medicoList.size();i++){%>
												<option value="<%=medicoList.get(i).getIdMedico()%>"><%=medicoList.get(i).getCpf()%> - <%=medicoList.get(i).getNome()%> - <%=medicoList.get(i).getEspecialidade()%></option>
												<%} %>										
											</select>
										</div>
										
										<div class="form-group">
                                            <label>Data</label>
                                            <input class="form-control" name="data" placeholder="DD/MM/AAAA">
                                        </div>
										
										<div class="form-group">
                                            <label>Hora</label>
                                            <input class="form-control" name="hora" placeholder="">
                                        </div>
										
										<div class="form-group">
                                            <label>Queixa</label>
                                            <textarea type="textarea" rows="5" class="form-control" name="motivo" placeholder=""></textarea>	
                                        </div>
										
									</div>
								</div>
									<button type="button" onclick="valida_form(this);" class="btn btn-default">Agendar</button>
									<button type="reset"  class="btn btn-default">Limpar Campos</button>
                            </div>
								
							
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
