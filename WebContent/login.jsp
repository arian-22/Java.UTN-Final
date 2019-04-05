<%@ include file="WEB-INF/cabecera.jsp"%>

<div class="row centrado">
	<div class="col-md-6">
		<img src="https://cdn.cienradios.com/wp-content/uploads/sites/3/2019/03/Tesla-auto.jpg" style="width: 100%">
	</div>
	
	<div class="col-md-6" style="padding: 0px 10%">
		<div style="margin-top: 25%;">
			<h1 class="text-center">Iniciar Sesión</h1>
			<form role="form" action="Login" method="post">
				<div class="form-group">
					<div class="input-box">
						<label> Email </label> 
						<input type="email" class="form-control" name="mail" />
					</div> 
					<div class="input-box">
						<label> Contraseña </label> 
						<input type="password" class="form-control" name="pass" />
					</div>
				</div>
				<div class="row baja-botones">
					<div class="col-md-6">
						<button type="submit" class="btn btn-primary btn-block" style="background: #3881a0;">Iniciar sesión</button>
					</div>
					<div class="col-md-6">
						<a href="registrarse.jsp" type="button" class="btn btn-block" style="color: #ffffff; background: #fea500;"> Registrarse </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="WEB-INF/footer.html"%>