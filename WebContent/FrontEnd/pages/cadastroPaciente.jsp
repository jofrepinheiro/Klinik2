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

%>

	<script type="text/javascript" language="javascript">
			function valida_form(){
				nome = document.forms["formCadastro"]["nome"].value;
				cpf = document.forms["formCadastro"]["cpf"].value;
				dataNascimento = document.forms["formCadastro"]["dataNascimento"].value;
				telefone = document.forms["formCadastro"]["telefone"].value;
				email = document.forms["formCadastro"]["email"].value;
				
				logradouro = document.forms["formCadastro"]["logradouro"].value;
				bairro = document.forms["formCadastro"]["bairro"].value;
				complemento = document.forms["formCadastro"]["complemento"].value;
				numero = document.forms["formCadastro"]["numero"].value;
	
				if(nome == "" || cpf =="" || dataNascimento=="" || telefone=="" || email=="" ||  logradouro=="" || bairro=="" || numero==""){
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
                        <i class="fa fa-user fa-fw"></i> <%=session.getAttribute("nomeUsuario")%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Informaï¿½ï¿½es </a>
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
							Cadastro de Paciente
                        </div>
                        <div class="panel-body">
                            <form method="post" role="form" name="formCadastro" id="formCadastro" onsubmit="return valida_form(this)" action="../../Controle/controlePaciente.jsp">
								<input type="hidden" name="action" value="Cadastrar">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
                                            <label>Nome</label>
                                            <input name="nome" id="nome" class="form-control" placeholder="Ex: Eduardo Stark">
                                        </div>
										
										<div class="form-group">
                                            <label>CPF</label>
                                            <input name="cpf" id="cpf" class="form-control" placeholder="XXX.XXX.XXX-XX">
                                        </div>
										
										<div class = "form-group">
										<label>Sexo</label>
											<select name="sexo" id="sexo" class="form-control">
												<option value="F">Feminino</option>
												<option value="M">Masculino</option>												
											</select>
										</div>
										
										<div class="form-group">
                                            <label>Data de Nascimento</label>
                                            <input name="dataNascimento" id="dataNascimento" class="form-control" placeholder="DD/MM/AAAA">
                                        </div>
										
										<div class="form-group">
                                            <label>Telefone</label>
                                            <input name="telefone" id="telefone" class="form-control" placeholder="(XX) X XXXX XXXX">
                                        </div>
										
										
										<div class="form-group">
                                            <label>Email</label>
                                            <input name="email" id="email" class="form-control" placeholder="john@doe.com">
                                        </div>

                                </div>
                                <!-- /.col-lg-6 (nested) -->
								
								<div class="col-lg-6">
									<div class="form-group">
										<label>CEP</label>
										<input name="cep" id="cep" class="form-control" placeholder="Ex: rot-g1">
                                    </div>
									
									<div class="form-group">
										<label>Logradouro</label>
										<input name="logradouro" id="logradouro" class="form-control">
									</div>
									
									<div class="form-group">
										<label>Nï¿½mero</label>
										<input name="numero" id="numero" class="form-control" placeholder="">
									</div>
									
									<div class="form-group">
										<label>Bairro</label>
										<input name="bairro" id="bairro" class="form-control" placeholder="Ex: rot-g1">
									</div>									
									
									<div class="form-group">
										<label>Complemento</label>
										<input name="complemento" id="complemento" class="form-control" placeholder="Ex: rot-g1">
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
