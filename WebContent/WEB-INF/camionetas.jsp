<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>
<%@ page import="entidades.*"%>

<br>
<br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>Nuestras camionetas</h3>

			<div class="tab-content">
				<div id="autos" class="tab-pane fade in active">
					<div class="container-fluid">
						<table class="table table-striped">
							<thead>
								<tr class="bg-primary">
									<th scope="col">Marca</th>
									<th scope="col">Modelo</th>
									<th scope="col">Asientos</th>
									<th scope="col">Transmisión</th>
									<th scope="col">Baúl</th>
									<th scope="col">Km</th>
									<th scope="col">Imagen</th>
								</tr>
							</thead>
							<tbody>

								<% if(session.getAttribute("vehiculos-stock")!=null){ 
									  ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
									  vehiculos = (ArrayList<Vehiculos>)session.getAttribute("vehiculos-stock");
									  
									  for(int i = 0 ; i < vehiculos.size() ; i++){										 
										  %>
								<tr>

									<th scope="row"><%=  vehiculos.get(i).getMarca()  %></th>
									<td><%= vehiculos.get(i).getModelo()  %></td>
									<td><%= vehiculos.get(i).getCantAsientos() %></td>
									<td><%= vehiculos.get(i).getTransmision()  %></td>
									<td><%= vehiculos.get(i).getBaul()  %></td>
									<td><%= vehiculos.get(i).getKm()  %></td>
									<td><%= vehiculos.get(i).getImagen()  %></td>
								</tr>
								<%	
									  } 
									
									}%>


							</tbody>
						</table>
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






