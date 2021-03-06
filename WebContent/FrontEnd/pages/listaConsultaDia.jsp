<%@page import="DAO.ConsultaDAO"%>
<%@page import="model.Consulta"%>
<%@page import="DAO.PacienteDAO"%>
<%@page import="model.Paciente"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<script type="text/javascript" language="javascript">
	if(getVar("sucesso") == 1){
		alert("Consulta Atendida com Sucesso!")
	}
	if(getVar("sucesso") == 2){
		alert("Atualizacao realizada com Sucesso!")
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
    
<%      
	String perfil = (String) session.getAttribute("perfilUsuario");
	
	
	if(perfil != "2"){
	  response.sendRedirect("login.html?erro=2");
	}
	
	int idMedico = (int) session.getAttribute("idMedico");
	ArrayList<Consulta> consultaDiaList = new ArrayList<>();
    ConsultaDAO consultaDAO = new ConsultaDAO();
    consultaDiaList = consultaDAO.getConsultasDiaList(idMedico);
    
    PacienteDAO pacienteDAO = new PacienteDAO();
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
                        <i class="fa fa-user fa-fw"></i>  <%=session.getAttribute("nomeUsuario")%> <i class="fa fa-caret-down"></i>
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
                            <a href="indexMed.jsp"><i class="glyphicon glyphicon-home"></i>  Home</a>
                        </li>
						
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i> Agenda do Dia</a>
                        </li>
                        <li>
                            <a href="listaConsultaHistorico.jsp"><i class="glyphicon glyphicon-book"> </i>  Hist�rico de Consultas</a>
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
           <div class="container">

				<h2>Agenda do Dia</h2>
					<div class="agenda">
						<div class="table-responsive" style="margin-right: 2%">
							<%if(consultaDiaList.size() == 0) {%><h3>Voc� n�o possui consultas hoje. :(</h3>
							<%}else{ %>
								<table class="table table-condensed table-bordered">
									<thead>
										<tr>
											<th>Hora</th>
											<th>Paciente</th>
											<th>Queixa</th>
											<th>Atender</th>
										</tr>
									</thead>
									
									
									<tbody>
										<!-- Single event in a single day -->
										<% for(int i=0; i < consultaDiaList.size();i++){%>
										<tr>
											<td class="agenda-date" class="active" rowspan="1">
												<div class="dayofmonth"><%= consultaDiaList.get(i).getHorarioConsulta().toString().substring(0, 5) %></div>
											</td>
											<td><%= pacienteDAO.getPaciente(consultaDiaList.get(i).getIdPaciente()).getNome() %></td>
											<td><%=consultaDiaList.get(i).getMotivo() %></td>
											<td><a href="cadastroDadosConsulta.jsp?idMedico=<%=consultaDiaList.get(i).getIdMedico()%>&idConsulta=<%=consultaDiaList.get(i).getIdConsulta()%>"><center><img src="img/atender.png"></center></a></td>
										</tr>
										<%} %>
									</tbody>
							
								</table>
							<%} %>
						</div>
					</div>
				</div>
        </div>
        <!-- /#page-wrapper -->

	<script>
			$(function() {
				$("td[colspan=3]").find("p").hide();
				$("table").click(function(event) {
					event.stopPropagation();
					var $target = $(event.target);
					if ( $target.closest("td").attr("colspan") > 1 ) {
						$target.slideUp();
					} else {
						$target.closest("tr").next().find("p").slideToggle();
					}                    
				});
			});
	</script>
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