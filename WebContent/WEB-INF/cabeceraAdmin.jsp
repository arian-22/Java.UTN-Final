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
	</head>
	
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
						<div class="navbar-header">
							 
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
							</button> <a class="navbar-brand" href="index.jsp" style="font-size: 30px;">EasyCar</a>
						</div>
						
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							
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
										Usuario u = (Usuario)session.getAttribute("user");
									%>
									<li class="dropdown">
										 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrador<strong class="caret"></strong></a>
										<ul class="dropdown-menu">
											<li>
												<a href="#">Action</a>
											</li>
											<li>
												<a href="#">Another action</a>
											</li>
											<li>
												<a href="#">Something else here</a>
											</li>
											<li class="divider">
											</li>
											<li>
												<a href="CerrarSesion">Cerrar sesión</a>
											</li>
										</ul>
									</li>
								<%} %>
							</ul>
						</div>
						
					</nav>
				</div>
			</div>