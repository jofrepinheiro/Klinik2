<%@page import="DAO.MedicoDAO"%>
<%@page import="DAO.SecretarioDAO"%>
<%@page import="model.Medico"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<script type="text/javascript" language="javascript">
	if(getVar("sucesso") == 1){
		alert("Cadastro realizado com Sucesso!")
	}
	
	function urlDecode(string, overwrite){
		if(!string || !string.length){
			return {};
		}
		var obj = {};
		var pairs = string.split('&');
		var pair, name, value;
		var lsRegExp = /\+/g;
		for(var i = 0, len = pairs.length; i < len; i++){
			pair = pairs[i].split('=');
			name = unescape(pair[0]);
			value = unescape(pair[1]).replace(lsRegExp, " ");
			//value = decodeURIComponent(pair[1]).replace(lsRegExp, " ");
			if(overwrite !== true){
				if(typeof obj[name] == "undefined"){
					obj[name] = value;
				}else if(typeof obj[name] == "string"){
					obj[name] = [obj[name]];
					obj[name].push(value);
				}else{
					obj[name].push(value);
				}
			}else{
				obj[name] = value;
			}
		}
		return obj;
	}


	function getVar(param){
		var wl = window.location.href;
		var params = urlDecode(wl.substring(wl.indexOf("?")+1));
		return(params[param]);
	}
</script>
<%	  
		String perfil = (String) session.getAttribute("perfilUsuario");
		if(perfil != "0"){
			  response.sendRedirect("login.html?erro=2");
		}

%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Klinik - Clinica Medica</title>

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
%>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
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
                        <i class="fa fa-user fa-fw"></i> <%=session.getAttribute("nomeUsuario")%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Informa��es </a>
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
                            <a href="indexAdmin.jsp"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                        </li>
						
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> Gerenciamento<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href="listaAdmin.jsp">Administrador</a>
                                </li>
                                <li>
                                    <a href="listaMedico.jsp">M�dico</a>
                                </li>
								<li>
                                    <a href="listaSec.jsp">Secret�rio</a>
                                </li>	
							</ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"> </i> Cadastro<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="cadastroMedico.jsp">Administrador</a>
                                </li>
                                <li>
                                    <a href="cadastroMedico.jsp">M�dico</a>
                                </li>
								<li>
                                    <a href="cadastroSec.jsp">Secret�rio</a>
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

	</div>
	<div>
        <div id="page-wrapper"  style="padding-top: 5%">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Lista de M�dicos
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                        	<th>Nome</th>
                                        	<th>CPF</th>
                                        	<th>Login</th>
											<th>Nascimento</th>                                            
											<th>Telefone</th>
                                            <th>Email</th>
                                            <th>Especialidades</th>
                                            <th>Alterar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for(int i=0; i < medicoList.size();i++){%>
										<tr class="odd gradeX">
											<td><%=medicoList.get(i).getNome()%></td>
											<td><%=medicoList.get(i).getCpf()%></td>
											<td><%=medicoList.get(i).getLogin()%></td>
											<td><%=medicoList.get(i).getDataNascimento()%></td>
											<td><%=medicoList.get(i).getTelefone()%></td>
											<td><%=medicoList.get(i).getEmail()%></td>
											<td><%=medicoList.get(i).getEspecialidade()%> <%if(!medicoList.get(i).getEspecialidade2().equalsIgnoreCase("0")){%>, <%=medicoList.get(i).getEspecialidade2()%><%} %></td>	
											<td><a href="cadastroMedico.jsp?action=alterar"><img src="img/alterarSmall.png"></a> </td>										
                                        </tr>
                                    <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
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

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>