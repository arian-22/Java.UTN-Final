<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
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
								<th scope="col">Fecha de Cancelación</th>
								<th scope="col">Precio</th>
								<th scope="col">Modelo</th>
								<th scope="col">Marca</th>
								<th scope="col">Km</th>
								<th scope="col">Acción</th>
							</tr>
						</thead>
						<tbody>

							<%
								Date hoy = new Date();
								java.sql.Date hoy2 = new java.sql.Date(hoy.getTime()) ;
								if (session.getAttribute("alquileresCliente") != null) {
									ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
									cva = (ArrayList<Cli_Veh_Alq>) session.getAttribute("alquileresCliente");																	

									for (int i = 0; i < cva.size(); i++) {
							%>
							<tr>

								<th scope="row"><%=cva.get(i).getAlquiler().getNro_alquiler()%></th>
								<td><%=cva.get(i).getAlquiler().getFechaDesde()%></td>
								<td><%=cva.get(i).getAlquiler().getFechaHasta()%></td>
								<td>
								<% if (cva.get(i).getAlquiler().getFechaCancelacion() == null){
								%>
									<p>  -  </p>
								<%}else {
								%>
									<%=cva.get(i).getAlquiler().getFechaCancelacion() %>
								<%	
									} 
								%>
								</td>
								<td><%=cva.get(i).getAlquiler().getPrecioAlquiler()%></td>
								<td><%=cva.get(i).getVehiculo().getMarca()%></td>
								<td><%=cva.get(i).getVehiculo().getModelo()%></td>
								<td><%=cva.get(i).getVehiculo().getKm()%></td>
								<td>
									
											
										
										
								<%
								if( cva.get(i).getAlquiler().getFechaDesde().after(hoy) ) {
									out.println("dfdsfsdfsd");
									out.println(cva.get(i).getAlquiler().getFechaCancelacion());
									out.println(cva.get(i).getAlquiler().getFechaFinalizacion());
									
									if( cva.get(i).getAlquiler().getFechaCancelacion() == null &&  cva.get(i).getAlquiler().getFechaFinalizacion() == null){
										%>
										<form role="form"
										action="CancelacionCliente?alquiler-selected=<%=cva.get(i).getAlquiler().getNro_alquiler()%>"
										method="post">
											<button type="submit" class="btn btn-danger" name="btn<%=i%>">Cancelar</button>
										</form>
										<%
										
									}else{
										%>
										<button class="btn btn-danger disabled"
											
											name="btn<%=i%>">Cancelar</button>
								<%	}
								} else {
									%>
									<button class="btn btn-danger disabled"
										
										name="btn<%=i%>">Cancelar</button>
									<%	
								}
								%>			
							
									
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
			<hr>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>