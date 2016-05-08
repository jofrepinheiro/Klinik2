<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

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
                        <i class="fa fa-user fa-fw"></i>  Ol�, Secret�rio <i class="fa fa-caret-down"></i>
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
                                    <a href="cadastroConsulta.html">Consulta</a>
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
	
        <div id="page-wrapper"  style="padding-top: 5%">
            <div class="container">

				<h2>Consultas</h2>
					<div class="agenda">
						<div class="table-responsive" style="margin-right: 2%">
							<table class="table table-condensed table-bordered">
								<thead>
									<tr>
										<th>Data</th>
										<th>Hora</th>
										<th>Paciente</th>
										<th>M�dico</th>
										<th>Queixa</th>
									</tr>
								</thead>
								<tbody>
									<!-- Single event in a single day -->
									<tr>
										<td class="agenda-date" class="active" rowspan="1">
											<div class="dayofmonth">14</div>
											<div class="dayofweek">Sexta-Feira</div>
											<div class="shortdate text-muted">Abril, 2016</div>
										</td>
										<td>
											14:00h
										</td>
										<td>
											<div>
												Jo�o da Silva
											</div>
										</td>
										<td>
											<div>
												Dr. Railan Cheetos
											</div>
										</td>
										<td>
											<div>
												Dor de Barriga
											</div>
										</td>										
									</tr>
									
									<tr>
										<td class="agenda-date" class="active" rowspan="3">
											<div class="dayofmonth">18</div>
											<div class="dayofweek">Segunda-Feira</div>
											<div class="shortdate text-muted">Abril, 2016</div>
										</td>
										<td>
											07:00h
										</td>
										<td>
											<div>
												Jos� Xisto
											</div>
										</td>
										<td>
											<div>
												Dr. Jo�o Paulo
											</div>
										</td>
										<td>
											<div>
												Dor de ouvido 
											</div>
										</td>
									</tr>
									<tr>
										<td>
											07:30h
										</td>
										<td>
											<div>
												Maria Juanita
											</div>
										</td>
										<td>
											<div>
												Dr. Jo�o Paulo
											</div>
										</td>
										<td>
											<div>
												Dor de garganta 
											</div>
										</td>
									</tr>
									<tr>
										<td>
											09:30h
										</td>
										<td>
											<div>
												Jo�o das Neves
											</div>
										</td>
										<td>
											<div>
												Dr. Railan Cheetos
											</div>
										</td>
										<td>
											<div>
												Dores agudas no abd�men 
											</div>
										</td>
									</tr>
									
									
								</tbody>

							</table>
						</div>
					</div>
				</div>

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
