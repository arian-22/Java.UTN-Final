<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>

<script type="text/javascript"> $(document).ready(function() {
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

			<h1 style="text-align: center">Vehículos Disponibles</h1>
			<div id="stock" class="tab-pane fade in active">

				<div class="container-fluid">
					<table class="table table-striped">
						<thead>
							<tr class="bg-primary">
								<th scope="col">Patente</th>
								<th scope="col">Marca</th>
								<th scope="col">Modelo</th>
								<th scope="col">Tipo</th>
								<th scope="col">Año</th>
								<th scope="col">Transmisión</th>
								<th scope="col">Baul</th>
								<th scope="col">Asientos</th>
								<th scope="col">Km</th>
								<th scope="col">Precio por día</th>
								<th scope="col">Imagen</th>
								<th scope="col">Acción</th>
							</tr>
						</thead>
						<tbody>

							<% if(session.getAttribute("vehiculos-stock-disponibles")!=null){ 
									  ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
									  vehiculos = (ArrayList<Vehiculos>)session.getAttribute("vehiculos-stock-disponibles");
									  
									  String fecha_desde = session.getAttribute("fecha-desde").toString();
									  String fecha_hasta = session.getAttribute("fecha-hasta").toString();
									  
									  System.out.println("Hola Mundo! " + fecha_desde );
									  
									  for(int i = 0 ; i < vehiculos.size() ; i++){
										 
										  %>
							<tr>

								<th scope="row"><%= vehiculos.get(i).getPatente() %></th>
								<td><%= vehiculos.get(i).getMarca() %></td>
								<td><%= vehiculos.get(i).getModelo()  %></td>
								<td><%= vehiculos.get(i).getTipo()  %></td>
								<td><%= vehiculos.get(i).getAnio()  %></td>
								<td><%= vehiculos.get(i).getTransmision()%></td>
								<td><%= vehiculos.get(i).getBaul()  %></td>
								<td><%= vehiculos.get(i).getCantAsientos()  %></td>
								<td><%= vehiculos.get(i).getKm()  %></td>
								<td><%= vehiculos.get(i).getPrecio()  %></td>
								<td><%= vehiculos.get(i).getImagen()  %></td>
								<td>
									<form role="form"
										action="DetalleAlquiler?vehiculo-selected=<%=  vehiculos.get(i).getPatente() %>&fecha_desde=<%= fecha_desde %>&fecha_hasta=<%=fecha_hasta %>"
										method="post">
										<button type="submit" class="btn btn-outline-dark"
											name="btn<%= i %>">Seleccionar</button>
									</form>
								</td>

							</tr>
							<%}  
									
									}%>


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