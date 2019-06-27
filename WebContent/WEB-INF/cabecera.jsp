<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.*"%>
<%@ page import="negocio.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Alquiler de Vehículos</title>

<!-- Bootstrap core CSS -->
<!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">-->


<link href="css/bootstrap.min.css" rel="stylesheet">



<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!-- <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet"> -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!-- <script src="js/ie-emulation-modes-warning.js"></script> -->
<link href="./css/personalizado.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
					<div class="navbar-header">
	
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only"></span><span class="icon-bar"></span><span
								class="icon-bar"></span><span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.jsp" style="font-size: 30px;"><font
							color="orange">EasyCar</font></a>
					</div>

					<ul class="nav navbar-nav navbar-right" style="margin-right: 10px">
						<% if(session.getAttribute("user")==null){ %>
						<li><a href="login.jsp">Iniciar Sesión</a></li>

						<%}else{
										Usuario u = new Usuario();
										u = (Usuario)session.getAttribute("user");
										
										 if(u.getAdmin().equals("S")){ %>
							<form role="form" action="URLs" method="post" style="float: left; padding-top:5px">
								<button type="submit" class="btn btn-primary btn-block colorFondoBase"	name="btn-home-admin"><i class="material-icons">home</i></button>
							</form>

							<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= u.getApellido() %>, <%= u.getNombre() %><strong	class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="Informes">Informes</a></li>
									<li><a href="URLs?routeAdmin=alq">Alquileres</a></li>
									<li><a href="URLs?routeAdmin=abm">ABM Vehiculos</a></li>
									<li class="divider"></li>
									<li><a href="CerrarSesion">Cerrar sesión</a></li>
								</ul>
							</li>
						<%} else { %>
						<form role="form" action="URLs" method="post"  style="float: left; padding-top:5px">
							<button type="submit" class="btn btn-primary btn-block colorFondoBase"	name="btn-home-user"><i class="material-icons">home</i></button>
						</form>
						
						<li class="dropdown"><a href="inicioCliente.jsp" class="dropdown-toggle" data-toggle="dropdown"><%= u.getApellido() %>,	<%= u.getNombre() %><strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="http://localhost:8080/AlquilerDeVehiculos/URLs?btnVerReservas=11">Mis Reservas</a></li>
								<li class="divider"></li>
								<li><a href="CerrarSesion">Cerrar sesión</a></li>
							</ul>
						</li>
						<%} } %>
					</ul>
				</nav>
			</div>
		</div>
	</div>