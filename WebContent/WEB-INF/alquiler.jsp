<%@ include file="cabecera.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
		$('.nav-tabs a').on('shown.bs.tab', function(event) {
			var x = $(event.target).text(); // active tab
			var y = $(event.relatedTarget).text(); // previous tab

			$(".act span").text(x);
			$(".prev span").text(y);
		});
	});
</script>

<br>
<br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h2>Gestión de Alquileres</h2>

			<ul class="nav nav-tabs">
				<li class="active"><a href="#retiro">Retirar vehiculo</a></li>
				<li><a href="#devolucion">Devolucion</a></li>
			</ul>
		</div>
	</div>

	<div class="tab-content">
		<div id="retiro" class="tab-pane fade in active">
			<h1>Retiro de vehículos</h1>
			<h3>Ingrese el número del alquiler del vehículo a retirar</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarAlquiler"
						method="post">

						<div class="form-group">

							<label class="col-sm-2 control-label"> N° de Alquiler </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="num_alquiler" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">

								<button type="submit" name="btnReserva" class="btn btn-default">
									Buscar</button>
							</div>
						</div>
					</form>

					<div class="container-fluid">
						<div class="row">
							<!--  <div class="col-md-12"> -->


							<%
								if (session.getAttribute("alquiler-reserva") != null) {
									Cli_Veh_Alq a = new Cli_Veh_Alq();
									a = (Cli_Veh_Alq) session.getAttribute("alquiler-reserva");
							%>
							<div class="row">
								<div class="col-md-12">
									<div class="alert alert-dismissable alert-info">

										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>
											<strong> Nro de Alquiler: <%=a.getAlquiler().getNro_alquiler()%>
											</strong>
										</h4>

										<strong> Patente: <%=a.getVehiculo().getPatente()%>
										</strong> <br> <strong> Fecha Desde: <%=a.getAlquiler().getFechaDesde()%>
										</strong> <br> <strong> Fecha Hasta: <%=a.getAlquiler().getFechaHasta()%>
										</strong> <br> <strong> Cliente: <%=a.getCliente().getNombre() + ' ' + a.getCliente().getApellido()%>
										</strong> <br>

										<form role="form" action="Alquileres" method="post">
											<div>

												<button type="submit" name="btn-reserva"
													class="btn btn-danger btn-default">Registrar
													Retiro</button>
												<button type="button" class="btn btn-default "
													data-dismiss="alert" aria-hidden="true">Cancelar</button>

											</div>
										</form>
									</div>

								</div>
							</div>
							<%
								} else {
									if (session.getAttribute("msjErrorReserva") != null) {
							%>
							<div class="alert alert-dismissable alert-danger">

								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<strong> Error! </strong>
								</h4>
								El Alquiler no fue encontrado <a href="#" class="alert-link"></a>
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


		<div id="devolucion" class="tab-pane fade">
			<h1>Devolución</h1>
			<h3>Ingrese el número del alquiler a registrar devolución</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarAlquiler"
						method="post">

						<div class="form-group">

							<label class="col-sm-2 control-label"> N° de Alquiler </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="num_alquiler" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">

								<button type="submit" name="btnDevolucion"
									class="btn btn-default">Buscar</button>
							</div>
						</div>
					</form>

					<div class="container-fluid">
						<div class="row">
							<!--  <div class="col-md-12"> -->


							<%
								if (session.getAttribute("alquiler-dev") != null) {
									Cli_Veh_Alq a = new Cli_Veh_Alq();
									a = (Cli_Veh_Alq) session.getAttribute("alquiler-dev");
							%>
							<div class="row">
								<div class="col-md-12">
									<div class="alert alert-dismissable alert-info">

										<button type="button" class="close" data-dismiss="alert"
											aria-hidden="true">×</button>
										<h4>
											<strong> Nro de Alquiler: <%=a.getAlquiler().getNro_alquiler()%>
											</strong>
										</h4>

										<strong> Patente: <%=a.getVehiculo().getPatente()%>
										</strong> <br> <strong> Fecha Desde: <%=a.getAlquiler().getFechaDesde()%>
										</strong> <br> <strong> Fecha Hasta: <%=a.getAlquiler().getFechaHasta()%>
										</strong> <br> <strong> Cliente: <%=a.getCliente().getNombre() + ' ' + a.getCliente().getApellido()%>
										</strong> <br>
										<form role="form" action="Alquileres" method="post">
											<div>

												<button type="submit" name="btn-devolucion"
													class="btn btn-danger btn-default">Registrar</button>
												<button type="button" class="btn btn-default "
													data-dismiss="alert" aria-hidden="true">Cancelar</button>

											</div>
										</form>
									</div>

								</div>
							</div>
							<%
								} else {
									if (session.getAttribute("msjErrorDev") != null) {
							%>
							<div class="alert alert-dismissable alert-danger">

								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">×</button>
								<h4>
									<strong> Error! </strong>
								</h4>
								El Alquiler no fue encontrado <a href="#" class="alert-link"></a>
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



<%@ include file="footer.html"%>