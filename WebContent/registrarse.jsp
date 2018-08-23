<%@ include file="WEB-INF/cabecera.jsp"%>

<div class="row centrado">
	<div class="col-md-12">
		<h3 class="text-center">Nuevo Registro</h3>

		<form role="form" action="Registro" method="post">
			<div class="form-group">
				<label> Nombre </label> <input type="text" class="form-control"
					name="nombre" />
			</div>
			<div class="form-group">
				<label> Apellido </label> <input type="text" class="form-control"
					name="apellido" />
			</div>
			<div class="form-group">
				<label> Email address </label> <input type="email"
					class="form-control" name="mail" />
			</div>
			<div class="form-group">
				<label> Contraseña </label> <input type="password"
					class="form-control" name="contrasena" />
			</div>
			<div class="form-group">

				<label> Repetir Contraseña </label> <input type="password"
					class="form-control" name="contrasena2" />
			</div>
			<div class="form-group">
				<label> Fecha de nacimiento </label> <input type="date"
					class="form-control" name="fechaNacimiento" />
			</div>
			<div class="form-group">

				<label> Documento de Identidad </label> <input type="number"
					class="form-control" name="dni" />
			</div>

			<div class="form-group">

				<label> Fecha de vencimiento de licencia de conducir </label> <input
					type="date" class="form-control" name="fechaVencimientoLicencia" />
			</div>
			<div class="form-group">
				<label> Dirección </label> <input type="text" class="form-control"
					name="direccion" />
			</div>
			<div class="form-group">
				<label> Teléfono </label> <input type="tel" class="form-control"
					name="telefono" />
			</div>

			<button type="submit" class="btn btn-primary btn-block">
				Registrarse!</button>
		</form>
	</div>
</div>



<%@ include file="WEB-INF/footer.html"%>