<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login - Alquiler de Vehículos</title>
		
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
						</button> <a class="navbar-brand" href="index.html">EasyCar</a>
					</div>
					
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active">
								<a href="#">Link</a>
							</li>
							<li>
								<a href="#">Link</a>
							</li>
							<li class="dropdown">
								 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
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
										<a href="#">Separated link</a>
									</li>
									<li class="divider">
									</li>
									<li>
										<a href="#">One more separated link</a>
									</li>
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" />
							</div> 
							<button type="submit" class="btn btn-default">
								Submit
							</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="#">Login</a>
							</li>
							<li class="dropdown">
								 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
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
										<a href="#">Separated link</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					
				</nav>
			</div>
		</div>
		<div class="row centrado">
			<div class="col-md-12">
				<h1 class="text-center">
					Login
				</h1>
				<form role="form">
					<div class="form-group">
						 
						<label for="exampleInputEmail1">
							Email address
						</label>
						<input type="email" class="form-control" id="exampleInputEmail1" />
					</div>
					<div class="form-group">
						 
						<label for="exampleInputPassword1">
							Password
						</label>
						<input type="password" class="form-control" id="exampleInputPassword1" />

				</form>
				<div class="row baja-botones">
					<div class="col-md-6">
						 
						<button type=submit class="btn btn-primary btn-block">
							Iniciar sesión
						</button>
					</div>
					<div class="col-md-6">
						 
						<a href="registrarse.jsp" type="button" class="btn btn-block btn-warning">
							Registrarse
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	
	</body>
</html>