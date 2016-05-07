<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>

	<script type="text/javascript" language="javascript">
		function valida_form(){
			nome = document.forms["formCadastro"]["nome"].value;
			senha = document.forms["formCadastro"]["senha"].value;
			login = document.forms["formCadastro"]["login"].value;
			dataNascimento = document.forms["formCadastro"]["dataNascimento"].value;
			cpf = document.forms["formCadastro"]["cpf"].value;
			crm = document.forms["formCadastro"]["crm"].value;
			telefone = document.forms["formCadastro"]["telefone"].value;
			logradouro = document.forms["formCadastro"]["logradouro"].value;
			bairro = document.forms["formCadastro"]["bairro"].value;
			complemento = document.forms["formCadastro"]["complemento"].value;
			numero = document.forms["formCadastro"]["numero"].value;

			if(nome == "" || senha == "" || cpf =="" || crm=="" || telefone=="" || dataNascimento=="" || logradouro=="" || bairro=="" || numero==""){
				alert("Por favor, preencha todos os campos obrigat�rios");
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

    <title>Klinik - Cl�nica M�dica</title>

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
                        <i class="fa fa-user fa-fw"></i><%=session.getAttribute("nomeUsuario")%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Informa��es </a>
                        </li>
							 <li class="divider"></li>
                        <li><a href="controleLogin.jsp?action=Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="indexAdmin.html"><i class="fa fa-dashboard fa-fw"></i> Home</a>
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
                                    <a href="cadastroAdmin.html">Administrador</a>
                                </li>
                                <li>
                                    <a href="#">M�dico</a>
                                </li>
								<li>
                                    <a href="cadastroSec.html">Secret�rio</a>
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
							Cadastrar M�dico
                        </div>
                        <div class="panel-body">
                            <form method="post" role="form" name="formCadastro" id="formCadastro" onsubmit="return valida_form(this)" action="../../Controle/controleMedico.jsp">
								<input type="hidden" name="action" value="Cadastrar">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
                                            <label>Login</label>
                                            <input id="login" name="login" class="form-control" placeholder="">
                                        </div>
										
										<div class="form-group">
                                            <label>Senha</label>
                                            <input id="senha" name="senha" type="password" class="form-control" placeholder="">
                                        </div>
										
										<div class="form-group">
                                            <label>Data de Nascimento</label>
                                            <input id="dataNascimento" name="dataNascimento" class="form-control" placeholder="DD/MM/AAAA">
                                        </div>
										
										<div class="form-group">
                                            <label>Nome</label>
                                            <input id="nome" name="nome" class="form-control" placeholder="">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>CPF</label>
                                            <input id="cpf" name="cpf" class="form-control" placeholder="">
                                        </div>
										
										<div class="form-group">
                                            <label>Telefone</label>
                                            <input id="telefone" name="telefone" class="form-control" placeholder="(XX)XXXX-XXXX">
                                        </div>
										
										<div class="form-group">
                                            <label>Email</label>
                                            <input id="email" name="email" class="form-control" placeholder="john@doe.com">
                                        </div>
										
										<div class="form-group">
											<label>CRM</label>
											<input id="crm" name="crm" class="form-control">
										</div>
										
										<div class="form-group">
											<label>Especialidade Principal</label>
											<select class="form-control" id="sel1" name="especialidade" id="especialidade">
												<option value="NULL">--</option>
												<option value="ESTETICA">Est�tica</option>
												<option value="INFECTO">Infectologia</option>
												<option value="ONCO">Oncologia</option>
												<option value="ORTO">Ortopedia</option>
												<option value="OTORRINO">Otorrinolaringologia</option>
												<option value="PARASITO">Parasitologia</option>
												<option value="PEDIATRA">Pediatria</option>
											</select>
										</div>
										
										<div class="form-group">
											<label>Especialidade Secund�ria</label>
											<select class="form-control" id="sel1" name="especialidade2" id="especialidade2">
												<option value="NULL">--</option>
												<option value="ESTETICA">Est�tica</option>
												<option value="INFECTO">Infectologia</option>
												<option value="ONCO">Oncologia</option>
												<option value="ORTO">Ortopedia</option>
												<option value="OTORRINO">Otorrinolaringologia</option>
												<option value="PARASITO">Parasitologia</option>
												<option value="PEDIATRA">Pediatria</option>
											</select>
										</div>
										
                                </div>
                                <!-- /.col-lg-6 (nested) -->
								
								<div class="col-lg-6">
									<div class="form-group">
										<label>CEP</label>
										<input id="cep" class="form-control" placeholder="" name="cep">
                                    </div>
									
									<div class="form-group">
										<label>Logradouro</label>
										<input id="logradouro" class="form-control" name="logradouro">
									</div>
									
									<div class="form-group">
										<label>N�mero</label>
										<input id="numero" class="form-control" placeholder="" name="numero">
									</div>
									
									<div class="form-group">
										<label>Bairro</label>
										<input id="bairro" class="form-control" placeholder="" name="bairro">
									</div>									
									
									<div class="form-group">
										<label>Complemento</label>
										<input id="complemento" class="form-control" placeholder="" name="complemento">
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