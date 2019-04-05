
<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>
<%@ page import="entidades.*"%>

<script type="text/javascript"> $(document).ready(function() {
	  $(".nav-tabs a").click(function() {
		    $(this).tab('show');
		  });
		});
</script>

<br>
<br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h1 style="text-align: center">Informes</h1>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#stock">Stock de Vehículos</a></li>
				<li><a href="#alquilados">Vehículos Alquilados Actualmente</a></li>
			</ul>

			<div class="tab-content">
				<div id="stock" class="tab-pane fade in active">

					<h2>Stock de Vehiculos</h2>

					<div class="container-fluid">
						<table class="table table-striped">
							<thead>
								<tr class="bg-primary colorFondoBase">
									<th scope="col">Patente</th>
									<th scope="col">Modelo</th>
									<th scope="col">Marca</th>
									<th scope="col">Asientos</th>
									<th scope="col">Año</th>
									<th scope="col">Transmision</th>
									<th scope="col">Estado</th>
									<th scope="col">Baul</th>
									<th scope="col">Tipo</th>
									<th scope="col">Imagen</th>
									<th scope="col">Km</th>
								</tr>
							</thead>
							<tbody>

								<% if(session.getAttribute("vehiculos-stock")!=null){ 
									  ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
									  vehiculos = (ArrayList<Vehiculos>)session.getAttribute("vehiculos-stock");
									  
									  for(int i = 0 ; i < vehiculos.size() ; i++){
										 
										  %>
								<tr>

									<th scope="row"><%=  vehiculos.get(i).getPatente()  %></th>
									<td><%= vehiculos.get(i).getModelo()  %></td>
									<td><%= vehiculos.get(i).getMarca() %></td>
									<td><%= vehiculos.get(i).getCantAsientos() %></td>
									<td><%= vehiculos.get(i).getAnio() %></td>
									<td><%= vehiculos.get(i).getTransmision() %></td>
									<td><%= vehiculos.get(i).getEstado() %></td>
									<td><%= vehiculos.get(i).getBaul() %></td>
									<td><%= vehiculos.get(i).getTipo() %></td>
									<td><%= vehiculos.get(i).getImagen() %></td>
									<td><%= vehiculos.get(i).getKm() %></td>
								</tr>
								<%}  
									
									}%>


							</tbody>
						</table>
					</div>
				</div>

				<div id="alquilados" class="tab-pane fade">
					<h2>Vehículos Alquilados Actualmente</h2>

					<div class="container-fluid">
						<table class="table table-striped">
							<thead>
								<tr class="bg-primary colorFondoBase">
									<th scope="col">Nro. Alquiler</th>
									<th scope="col">Patente</th>
									<th scope="col">Marca</th>
									<th scope="col">Modelo</th>
									<th scope="col">Tipo</th>
									<th scope="col">Cliente</th>
									<th scope="col">Nro. Documento</th>
									<th scope="col">Fecha Desde</th>
									<th scope="col">Fecha Hasta</th>
								</tr>
							</thead>
							<tbody>

								<% if(session.getAttribute("alquileres actuales")!=null){ 
									  ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
									  cva = (ArrayList<Cli_Veh_Alq>)session.getAttribute("alquileres actuales");
									  
									  for(int i = 0 ; i < cva.size() ; i++){
										 										  
										  %>
								<tr>
									<th scope="row"><%=  cva.get(i).getAlquiler().getNro_alquiler()  %></th>
									<td><%= cva.get(i).getVehiculo().getPatente()  %></td>
									<td><%= cva.get(i).getVehiculo().getMarca()  %></td>
									<td><%= cva.get(i).getVehiculo().getModelo()  %></td>
									<td><%= cva.get(i).getVehiculo().getTipo()  %></td>
									<td><%= cva.get(i).getCliente().getApellido()  %>, <%= cva.get(i).getCliente().getNombre() %></td>
									<td><%= cva.get(i).getCliente().getDni()  %></td>
									<td><%= cva.get(i).getAlquiler().getFechaDesde() %></td>
									<td><%= cva.get(i).getAlquiler().getFechaHasta()  %></td>

								</tr>
								<%} 
									
									}%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>

<%@ include file="footer.html"%>
