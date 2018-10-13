<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
		$('.nav-tabs a').on('shown.bs.tab', function(event) {
			var x = $(event.target).text(); // active tab
			var y = $(event.relatedTarget).text(); // previous tab
			console.log(x);
			console.log('y');

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

			<h1 style="text-align: center">Mis Reservas</h1>
			<div id="stock" class="tab-pane fade in active">

				<div class="container-fluid">
					<table class="table table-striped">
						<thead>
							<tr class="bg-primary">
								<th scope="col">Número de Alquiler</th>
								<th scope="col">Fecha de Comienzo</th>
								<th scope="col">Fecha de Fin</th>
								<th scope="col">Precio</th>
								<th scope="col">Modelo</th>
								<th scope="col">Marca</th>
								<th scope="col">Km</th>
								<th scope="col">Cancelar</th>
							</tr>
						</thead>
						<tbody>

							<%
								if (session.getAttribute("alquileresCliente") != null) {
									ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
									cva = (ArrayList<Cli_Veh_Alq>) session.getAttribute("alquileresCliente");																	

									for (int i = 0; i < cva.size(); i++) {
							%>
							<tr>

								<th scope="row"><%=cva.get(i).getAlquiler().getNro_alquiler()%></th>
								<td><%=cva.get(i).getAlquiler().getFechaDesde()%></td>
								<td><%=cva.get(i).getAlquiler().getFechaHasta()%></td>
								<td><%=cva.get(i).getAlquiler().getPrecioAlquiler()%></td>
								<td><%=cva.get(i).getVehiculo().getMarca()%></td>
								<td><%=cva.get(i).getVehiculo().getModelo()%></td>
								<td><%=cva.get(i).getVehiculo().getKm()%></td>
								<td>
									<form role="form"
										action="CancelacionCliente?alquiler-selected=<%=cva.get(i).getAlquiler().getNro_alquiler()%>"
										method="post">
										<button type="submit" class="btn btn-outline-dark"
											name="btn<%=i%>">Seleccionar</button>
									</form>
								</td>
							</tr>
							<%
								}

								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<a href="javascript:window.history.go(-1);" class="btn btn-link"
				type="button">Atrás</a>
			<hr>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>