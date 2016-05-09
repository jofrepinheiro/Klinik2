<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DAO.MedicoDAO"%>
<%@page import="DAO.EnderecoDAO"%>
<%@page import="model.Endereco"%>
<%@page import="model.Medico"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<script type="text/javascript" language="javascript">
	if(getVar("erro") == 1){
		alert("CPF ja existe!")
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
	
		function valida_form(){
			senha = document.forms["formLogin"]["senha"].value;
			login = document.forms["formLogin"]["login"].value;
			if(login=="" || senha==""){
				alert("Por favor, preencha login e senha");
				return false;
			}else{
				document.formLogin.submit();
			}
		}
</script>

<%	  
		int idUsuario = 0;
		String action = request.getParameter("action"); 
		String usuario = request.getParameter("idUsuario");
		String data = "";

		if(action == null){
			action = "Cadastrar";
		}
		
		if(usuario != null){
			idUsuario = Integer.parseInt(usuario);
		}
		
		Medico medico = new Medico();
		Endereco endereco = new Endereco();
		medico.setNome("");
		medico.setCpf("");
		medico.setEmail("");
		medico.setLogin("");
		medico.setSenha("");
		medico.setTelefone("");
		medico.setAtivo(1);
		endereco.setBairro("");
		endereco.setCEP("");
		endereco.setComplemento("");
		endereco.setLogradouro("");
		endereco.setNumero(0);
		
		if(action.equalsIgnoreCase("Alterar")){
			EnderecoDAO enderecoDAO = new EnderecoDAO();
			MedicoDAO administradorDAO = new MedicoDAO();
			medico = administradorDAO.getMedicoUsuario(idUsuario);
			System.out.println("Nome do Adm" + medico.getDataNascimento());
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			data = format.format(medico.getDataNascimento());
			endereco = enderecoDAO.getEndereco(medico.getIdEndereco());
		}
		
		String perfil = (String) session.getAttribute("perfilUsuario");
		if(perfil != "0"){
			  response.sendRedirect("login.html?erro=2");
		}

%>
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
				alert("Por favor, preencha todos os campos obrigatórios");
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
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Informações </a>
                        </li>
							 <li class="divider"></li>
                        <li><a href=../../Controle/controleLogin.jsp?action=Logout><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                    <a href="listaMedico.jsp">Médico</a>
                                </li>
								<li>
                                    <a href="listaSec.jsp">Secretário</a>
                                </li>	
							</ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"> </i> Cadastro<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="cadastroAdmin.jsp">Administrador</a>
                                </li>
                                <li>
                                    <a href="cadastroMedico.jsp">Médico</a>
                                </li>
								<li>
                                    <a href="cadastroSec.jsp">Secretário</a>
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
							Cadastrar Médico
                        </div>
                        <div class="panel-body">
                            <form method="post" role="form" name="formCadastro" id="formCadastro" onsubmit="return valida_form(this)" action="../../Controle/controleMedico.jsp?action=<%=action%>&idUsuario=<%=idUsuario%>">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
                                            <label>Login</label>
                                            <input id="login" name="login" class="form-control" placeholder="" value="<%=medico.getLogin()%>">
                                        </div>
										
										<div class="form-group">
                                            <label>Senha</label>
                                            <input id="senha" name="senha" type="password" class="form-control" placeholder="" value="<%=medico.getSenha()%>">
                                        </div>
										
										<div class="form-group">
                                            <label>Data de Nascimento</label>
                                            <input id="dataNascimento" name="dataNascimento" class="form-control" placeholder="DD/MM/AAAA" value="<%=data%>">
                                        </div>
										
										<div class="form-group">
                                            <label>Nome</label>
                                            <input id="nome" name="nome" class="form-control" placeholder="" value="<%=medico.getNome()%>">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>CPF</label>
                                            <input id="cpf" name="cpf" class="form-control" placeholder="" value="<%=medico.getCpf()%>">
                                        </div>
										
										<div class="form-group">
                                            <label>Telefone</label>
                                            <input id="telefone" name="telefone" class="form-control" placeholder="(XX)XXXX-XXXX" value="<%=medico.getLogin()%>">
                                        </div>
										
										<div class="form-group">
                                            <label>Email</label>
                                            <input id="email" name="email" class="form-control" placeholder="" value="<%=medico.getLogin()%>">
                                        </div>
										
										<div class="form-group">
											<label>CRM</label>
											<input id="crm" name="crm" class="form-control">
										</div>
										
										<div class="form-group">
											<label>Especialidade Principal</label>
											<select class="form-control" id="sel1" name="especialidade" id="especialidade">
												<option value="ESTETICA">Estética</option>
												<option value="INFECTO">Infectologia</option>
												<option value="ONCO">Oncologia</option>
												<option value="ORTO">Ortopedia</option>
												<option value="OTORRINO">Otorrinolaringologia</option>
												<option value="PARASITO">Parasitologia</option>
												<option value="PEDIATRIA">Pediatria</option>
											</select>
										</div>
										
										<div class="form-group">
											<label>Especialidade Secundária</label>
											<select class="form-control" id="sel1" name="especialidade2" id="especialidade2">
												<option value="0">--</option>
												<option value="ESTETICA">Estética</option>
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
										<input id="cep" class="form-control" placeholder="" name="cep" value="<%=endereco.getCEP()%>">
                                    </div>
									
									<div class="form-group">
										<label>Logradouro</label>
										<input id="logradouro" class="form-control" name="logradouro" value="<%=endereco.getLogradouro()%>">
									</div>
									
									<div class="form-group">
										<label>Número</label>
										<input id="numero" class="form-control" placeholder="" name="numero" value="<%=endereco.getNumero()%>">
									</div>
									
									<div class="form-group">
										<label>Bairro</label>
										<input id="bairro" class="form-control" placeholder="" name="bairro" value="<%=endereco.getBairro()%>">
									</div>									
									
									<div class="form-group">
										<label>Complemento</label>
										<input id="complemento" class="form-control" placeholder="" name="complemento" value="<%=endereco.getComplemento()%>">
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