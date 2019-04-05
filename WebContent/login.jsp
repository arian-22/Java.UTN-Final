<%@ include file="WEB-INF/cabecera.jsp"%>

<div class="row">
	<div class="col-md-12" style="background-image: url('https://cdn.cienradios.com/wp-content/uploads/sites/3/2019/03/Tesla-auto.jpg')">
		<div class="col-md-9" style="width:50%; height:100%; margin-top:5%; margin-bottom:23%; margin-left:25%">
			<h1 class="text-center">Iniciar Sesión</h1>
			<form role="form" action="Login" method="post">
				<div class="form-group">
					<div class="input-box">
						<label style="color: #FFFFFF; font-size: 14px"> Email </label> 
						<input type="email" class="form-control" name="mail" />
					</div> 
					<div class="input-box" style="padding-top: 5px">
						<label style="color: #FFFFFF; font-size: 14px"> Contraseña </label> 
						<input type="password" class="form-control" name="pass" />
					</div>
				</div>
				<div class="row baja-botones">
					<div class="col-md-6">
						<button type="submit" class="btn btn-primary btn-block" style="background: #3881a0; text-align: center">Iniciar sesión</button>
					</div>
					<div class="col-md-6">
						<a href="registrarse.jsp" type="button" class="btn btn-block" style="color: #ffffff; background: #fea500; text-align: center"> Registrarse </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="WEB-INF/footer.html"%>