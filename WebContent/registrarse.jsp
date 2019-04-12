<%@ include file="WEB-INF/cabecera.jsp"%>

<div class="row centrado">
	<div class="col-md-12 formulario-ABM ">
		<h3 class="text-center">Nuevo Registro</h3>

		<form role="form" action="Registro" method="post">
			<div class="form-group">
				<label> Nombre </label> <input type="text" class="form-control"
					name="nombre" required/>
			</div>
			<div class="form-group">
				<label> Apellido </label> <input type="text" class="form-control"
					name="apellido" required />
			</div>
			<div class="form-group">
				<label> Email address </label> <input type="email"
					class="form-control" name="mail" required/>
			</div>
			<div class="form-group">
				<label> Contraseña </label> <input type="password"
					class="form-control" name="contrasena" required />
			</div>
			<div class="form-group">

				<label> Repetir Contraseña </label> <input type="password"
					class="form-control" name="contrasena2" required />
			</div>
			<div class="form-group">
				<label> Fecha de nacimiento </label> <input type="date"
					class="form-control" name="fechaNacimiento" required/>
			</div>
			<div class="form-group">

				<label> Documento de Identidad </label> <input type="number"  maxlength="12" max="99999999999" 
					class="form-control" name="dni" required />
			</div>

			<div class="form-group">

				<label> Fecha de vencimiento de licencia de conducir </label> <input
					type="date" class="form-control" name="fechaVencimientoLicencia" required/>
			</div>
			<div class="form-group">
				<label> Dirección </label> <input type="text" class="form-control"
					name="direccion" required/>
			</div>
			<div class="form-group">
				<label> Teléfono </label> <input type="number" class="form-control"
					name="telefono" required/>
			</div>

			<button type="submit" class="btn btn-primary btn-block">
				Registrarse!</button>
		</form>
	</div>
</div>



<%@ include file="WEB-INF/footer.html"%>