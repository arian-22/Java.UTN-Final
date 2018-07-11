<%@ include file="WEB-INF/cabecera.jsp"%>

		<div class="row centrado">
			<div class="col-md-12">
				<h1 class="text-center">
					Login
				</h1>
				<form role="form" action="Login" method="post">
					<div class="form-group">
						<label>
							Email
						</label>
						<input type="email" class="form-control" name="mail" />
						 
						<label>
							Contraseña
						</label>
						<input type="password" class="form-control" name="pass" />
					</div>
					<div class="row baja-botones">
						<div class="col-md-6">
							<button type="submit" class="btn btn-primary btn-block" style="background:#6900cc">
								Iniciar sesión
							</button>
						</div>
						<div class="col-md-6">
							<a href="registrarse.jsp" type="button" class="btn btn-block btn-warning">
								Registrarse
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	
	
<%@ include file="WEB-INF/footer.html"%>