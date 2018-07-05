<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.*"%>
<%@ page import = "negocio.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Alquiler de Vehículos</title>
		
		<!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
	
	    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	    <script src="js/ie-emulation-modes-warning.js"></script>
	    
	    <link href="css/personalizado.css" rel="stylesheet">
	    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      			rel="stylesheet">
	    <script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
	    
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
							 
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								 <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
							</button> <a class="navbar-brand" href="index.jsp" style="font-size: 30px;"><font color="orange">EasyCar</font></a>
						</div>   
						
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="dropdown">
									 <a class="dropdown-toggle" data-toggle="dropdown">Vehículos<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										
										<li>
											<a href="#">Autos</a>
										</li>
										<li>
											<a href="#">Camionetas</a>
										</li>
										
									</ul>
								</li>
								<li>
									<a href="#">Promociones</a>
								</li>
							
								<li>
									<a href="#">Nosotros</a>
								</li>
							</ul>
							<!-- <form class="navbar-form navbar-left" role="search">
								<div class="form-group">
									<input type="text" class="form-control" />
								</div> 
								<button type="submit" class="btn btn-default">
									Submit
								</button>
							</form>
							-->
							<ul class="nav navbar-nav navbar-right">
								<% if(session.getAttribute("user")==null){ %>
									<li>
										<a href="login.jsp">Login</a>
									</li>
								
									<%}else{
										Usuario u = new Usuario();
										u = (Usuario)session.getAttribute("user");
										
										 if(u.getAdmin().equals("S")){ %>
												<i class="material-icons">
												<a href="inicioAdmin.jsp">home</a>
												</i>
												
												<li class="dropdown">
													
											 		<a href="inicioAdmin.jsp" class="dropdown-toggle" data-toggle="dropdown"><%= u.getApellido() %>, <%= u.getNombre() %><strong class="caret"></strong></a>
												
												<ul class="dropdown-menu">
													<li>
													<a href="#">Perfil</a>
													</li>
													<li>
													<a href="#">Configuración</a>
													</li>
													<li>
													<a href="#">Ayuda</a>
													</li>
													<li class="divider">
													</li>
													<li>
													<a href="CerrarSesion">Cerrar sesión</a>
													</li>
												</ul>
												</li>
											<%} else { %>
											<li class="dropdown">
										 		<a href="inicioCliente.jsp" class="dropdown-toggle" data-toggle="dropdown"><%= u.getApellido() %>, <%= u.getNombre() %><strong class="caret"></strong></a>
												<ul class="dropdown-menu">
											<li>
												<a href="#">Perfil</a>
											</li>
											<li>
												<a href="#">Mis Reservas</a>
											</li>
											<li>
												<a href="#">Configuración</a>
											</li>
											<li>
												<a href="#">Ayuda</a>
											</li>
											<li class="divider">
											</li>
											<li>
												<a href="CerrarSesion">Cerrar sesión</a>
											</li>
											</ul>
											</li>
										<%} } %>
							</ul>
						</div>
						
					</nav>
				</div>
			</div>
			
			