<%@ include file="cabecera.jsp"%>

<%
	Controlador ctrl = ((Controlador) session.getAttribute("Ctrl"));
%>


<script type="text/javascript">
	$(document).ready(function() {
		$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
		    localStorage.setItem('activeTab', $(e.target).attr('href'));
		});

		var activeTab = localStorage.getItem('activeTab');

		if (activeTab) {
		   $('a[href="' + activeTab + '"]').tab('show');
		}
	});
</script>

<br>
<br>

<div class="container">
	<h2>Módulo ABM</h2>

	<ul class="nav nav-tabs">
		<li class="active"><a href="#altas" data-toggle="tab">Altas</a></li>
		<li><a href="#bajas" data-toggle="tab">Bajas</a></li>
		<li><a href="#modificaciones" data-toggle="tab">Modificaciones</a></li>
	</ul>

	<div class="tab-content">
		<div id="altas" class="tab-pane fade in active">
			<h3>Ingrese todos los datos del vehículo que desea agregar al
				catálogo</h3>
			<div class="container-fluid">
				<div class="row centrado">
					<div class="col-md-12">
						<h3 class="text-center">Nuevo Registro</h3>

						<form role="form" action="AltaVehiculo" method="post">
							<div class="form-group">
								<label> Patente </label> <input type="text" class="form-control"
									name="nro_patente" />
							</div>
							<div class="form-group">
								<label> Marca </label> <input type="text" class="form-control"
									name="marca" />
							</div>
							<div class="form-group">
								<label> Modelo </label> <input type="text" class="form-control"
									name="modelo" />
							</div>
							<div class="form-group">
								<label> Cantidad Asientos </label> <input type="text"
									class="form-control" name="cant_asientos" />
							</div>
							<div class="form-group">

								<label> Año </label> <input type="text" class="form-control"
									name="anio" />
							</div>
							<div class="form-group">
								<label> Transmisión </label> <input type="text"
									class="form-control" name="transmision" />
							</div>
							<div class="form-group">

								<label> Estado </label> <input type="text" class="form-control"
									name="estado" />
							</div>

							<div class="form-group">

								<label> Baúl </label> <input type="text" class="form-control"
									name="baul" />
							</div>
							<div class="form-group">
								<label> Tipo </label> <input type="text" class="form-control"
									name="tipo" />
							</div>
							<div class="form-group">
								<label> Km </label> <input type="text" class="form-control"
									name="km" />
							</div>
							<div class="form-group">
								<label> Precio por día </label>
								<!-- Esta en la tabla valores -->
								<input type="text" class="form-control" name="precio_base" />
							</div>
							<div class="form-group">

								<label for="exampleInputFile"> Imagen del vehículo </label> <input
									type="file" id="exampleInputFile" />

							</div>

							<button type="submit" class="btn btn-primary btn-block">
								Guardar</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div id="bajas" class="tab-pane fade">
			<h3>Ingrese patente del vehículo a dar de baja</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarVehiculo"
						method="post">

						<div class="form-group">

							<label class="col-sm-2 control-label"> Patente </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="patente" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">

								<button type="submit" name="btnbaja" class="btn btn-default">
									Buscar</button>
							</div>
						</div>
					</form>

					<div class="container-fluid">
						<div class="row">
							<!--  <div class="col-md-12"> -->


							<%
								if (session.getAttribute("vehiculo-baja") != null) {
									Vehiculos v = new Vehiculos();
									v = (Vehiculos) session.getAttribute("vehiculo-baja");
							%>
							<div class="row">
								<div class="col-md-12">
									<div class="alert alert-dismissable alert-info">

										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>
											<strong> Vehículo: <%=v.getPatente()%>
											</strong>
										</h4>

										<strong> Marca: <%=v.getMarca()%>
										</strong> <br> <strong> Modelo: <%=v.getModelo()%>
										</strong> <br> <strong> Estado: <%=v.getEstado()%>
										</strong> <br>
										<form role="form" action="EliminarVehiculo" method="post">
											<div>

												<button type="submit" class="btn btn-danger btn-default">
													Eliminar</button>
												<button type="button" class="btn btn-default "
													data-dismiss="alert" aria-hidden="true">Cancelar</button>

											</div>
										</form>
									</div>

								</div>
							</div>
							<%
								} else {
									if (session.getAttribute("msjErrorBaja") != null) {
							%>
							<div class="alert alert-dismissable alert-danger">

								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<strong> Error! </strong>
								</h4>
								El vehículo no fue encontrado <a href="#" class="alert-link"></a>
							</div>
							<%
								}
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="modificaciones" class="tab-pane fade">
			<h3>Ingrese patente del vehículo a modificar</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarVehiculo"
						method="post">

						<div id="imputBusqueda" class="form-group">

							<label for="inputPassword3" class="col-sm-2 control-label">
								Patente </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="patente" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">

								<button type="submit" name="btnmod" class="btn btn-default">
									Buscar</button>
							</div>
						</div>
					</form>

					<div class="container-fluid">
						<div class="row">					

							<%
								if (session.getAttribute("vehiculo-mod") != null) {
									Vehiculos v = new Vehiculos();
									v = (Vehiculos) session.getAttribute("vehiculo-mod");
							%>
							<form role="form" action="ModificarVehiculo" method="post">
								<div class="form-group">
									<h2>
										<strong>Patente:</strong>
										<%=v.getPatente()%></h2>
									<input type="text" class="form-control" name="nro_patente"
										style="display: none" value="<%=v.getPatente()%>" />
								</div>
								<div class="form-group">
									<label> Marca </label> <input type="text" class="form-control"
										name="marca" value="<%=v.getMarca()%>" />
								</div>
								<div class="form-group">
									<label> Modelo </label> <input type="text" class="form-control"
										name="modelo" value="<%=v.getModelo()%>" />
								</div>
								<div class="form-group">
									<label> Cantidad Asientos </label> <input type="number"
										class="form-control" name="cant_asientos"
										value="<%=v.getCantAsientos()%>" />
								</div>
								<div class="form-group">

									<label> Año </label> <input type="number" class="form-control"
										name="anio" value="<%=v.getAnio()%>" />
								</div>
								<div class="form-group">
									<label> Transmisión </label> <input type="text"
										class="form-control" name="transmision"
										value="<%=v.getTransmision()%>" />
								</div>
								<div class="form-group">

									<label> Estado </label> <input type="text" class="form-control"
										name="estado" value="<%=v.getEstado()%>" />
								</div>

								<div class="form-group">

									<label> Baul </label> <input type="text" class="form-control"
										name="baul" value="<%=v.getBaul()%>" />
								</div>
								<div class="form-group">
									<label> Tipo </label> <input type="text" class="form-control"
										name="tipo" value="<%=v.getTipo()%>" />
								</div>
								<div class="form-group">
									<label> Km </label> <input type="text" class="form-control"
										name="km" value="<%=v.getKm()%>" />
								</div>
								<div class="form-group">
									<label> Precio por día </label>
									<!-- Esta en la tabla valores -->
									<input type="text" class="form-control" name="precio_base"
										value="<%=v.getPrecio()%>" />
								</div>
								<div class="form-group">

									<label for="exampleInputFile"> Imagen del vehículo </label> <input
										type="file" id="exampleInputFile" />
									<button type="submit" class="btn btn-primary btn-block">
										Guardar modificaciones</button>
								</div>
							</form>

							<%
								} else {
									if (session.getAttribute("msjErrorMod") != null) {
							%>
							<div class="alert alert-dismissable alert-danger">

								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<strong> Error! </strong>
								</h4>
								El vehículo no fue encontrado <a href="#" class="alert-link"></a>
							</div>
							<%
								}
								}
							%>

						</div>

					</div>
				</div>

			</div>
		</div>

	</div>

</div>
<a href="javascript:window.history.go(-1);" class="btn btn-link"
	type="button">Atrás</a>
<hr>


<%@ include file="footer.html"%>


