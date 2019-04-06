<%@ include file="cabecera.jsp"%>

<%
	Controlador ctrl = ((Controlador) session.getAttribute("Ctrl"));
	String titleModal = "";
	String typeBtn = "";
	String textModal = "";
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

<!-- Modal para errores  -->
<% if(session.getAttribute("errorModal") != null){ 
	titleModal = "Error";
	typeBtn = "btn-danger";
	textModal = (String) session.getAttribute("errorModal");
	session.removeAttribute("errorModal");
%>
<script>
$(document).ready(function(){
	$('#myModal').modal({
	  keyboard: false
	})
});
</script>


<%} else if(session.getAttribute("okModal") != null){
	titleModal = "Gracias";
	typeBtn = "btn-success";
	textModal = (String) session.getAttribute("okModal");
	session.removeAttribute("okModal");
%>
<script>
$(document).ready(function(){
	$('#myModal').modal({
	  keyboard: false
	})
});
</script>

<%}%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><%=titleModal%></h4>
      </div>
      <div class="modal-body">
        <p><%=textModal%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn <%=typeBtn%>" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="container">
	<h2>Módulo ABM</h2>

	<ul class="nav nav-tabs">
		<li class="active"><a href="#altas" data-toggle="tab">Altas</a></li>
		<li><a href="#bajas" data-toggle="tab">Bajas</a></li>
		<li><a href="#modificaciones" data-toggle="tab">Modificaciones</a></li>
	</ul>

	<div class="tab-content">
		<div id="altas" class="tab-pane fade in active">
			<h3>Ingrese todos los datos del vehículo que desea agregar al catálogo</h3>
			<div class="container-fluid">
				<div class="row" style="padding: 2% 20%;">
					<div class="col-md-12 formulario-ABM">
						<h2 class="text-center">Nuevo Vehiculo</h2>
						<hr>
						<form role="form" action="AltaVehiculo" method="post">		
											
							<div class="form-group">
								<label> Patente </label> 
								<div class="row">
								  <div class="col-xs-2">
								    <input type="text" maxlength="2" minlength="2" class="form-control" pattern="[a-zA-Z]{2,2}" title="Deben ser 2 letras." name="nro_patenteA" required>
								  </div>
								  <div class="col-xs-2">
								    <input type="text" maxlength="3" minlength="3" 	class="form-control" pattern="[0-9]{3,3}" title="Deben ser 3 numeros." name="nro_patenteB" required>
								  </div>
								  <div class="col-xs-2">
								    <input type="text" maxlength="2" minlength="2" class="form-control" pattern="[a-zA-Z]{2,2}" title="Deben ser 2 letras." name="nro_patenteC" required>
								  </div>
								</div>								
							</div>
							
							<div class="form-group">
								<label> Marca </label> 
								<select class="form-control" name="marca" required>
									<option>BMW</option>
									<option>Peugeot</option>
									<option>Jeep</option>
									<option>Kia</option>
									<option>Chevrolet</option>
								  	<option>Fiat</option>
								  	<option>Ford</option>
								  	<option>Renault</option>
								  	<option>Volkswagen</option>
								</select>
							</div>
							
							<div class="form-group">
								<label> Modelo </label> 								
								<input type="text" class="form-control" name="modelo" required />
							</div>
							
							<div class="form-group">
								<label> Cantidad Asientos </label>
								<br>
								<label class="radio-inline">
								  <input type="radio" name="cant_asientos" value="1" required> 1
								</label>
								<label class="radio-inline">
								  <input type="radio" name="cant_asientos" value="2"> 2
								</label>
								<label class="radio-inline">
								  <input type="radio" name="cant_asientos" value="3"> 3
								</label>
								<label class="radio-inline">
								  <input type="radio" name="cant_asientos" value="4"> 4
								</label>
								<label class="radio-inline">
								  <input type="radio" name="cant_asientos" value="5"> 5
								</label>
							</div>
							
							<div class="form-group">
								<label> Año </label> 
								<input type="number" min="1990" max="2040" class="form-control" name="anio" required/>
							</div>
							
							<div class="form-group">
								<label> Transmisión </label> 
								<select class="form-control" name="transmision" required>
									<option>Automática</option>
									<option>Manual</option>
								</select>
							</div>
							
							<div class="form-group">
								<label> Baúl </label> 
								<div class="checkbox">
							        <label>
							          <input type="checkbox" name="baul"> Sí posee 
							        </label>
							    </div>
							</div>
							
							<div class="form-group">
								<label> Tipo </label> 
								<select class="form-control" name="tipo" required>
									<option value="A">Auto</option>
									<option value="C">Camioneta</option>
								</select>
							</div>
							
							<div class="form-group">
								<label>Kilometraje</label> 
								<div class="input-group">
							      	<input type="number" class="form-control" name="km" placeholder="Kilometros" required>
							      	<div class="input-group-addon">Km.</div>
						      	</div>
							</div>
							
							<div class="form-group">
								<label> Precio por día </label>
								<div class="input-group">
									<div class="input-group-addon">$</div>
							      	<input type="number" class="form-control" name="precio_base" placeholder="Precio" required>
						      	</div>								
							</div>
							
							<div class="form-group">
								<label for="exampleInputFile"> Imagen del vehículo </label> 
								<input type="file" id="exampleInputFile" />
							</div>
							
							<hr>
							
							<div style="padding: 3% 25%">					
								<button type="submit" class="btn btn-primary btn-block colorFondoBase">Guardar</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>

		<div id="bajas" class="tab-pane fade">
			<h3>Ingrese patente del vehículo a dar de baja</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarVehiculo" method="post">
						<div class="form-group" style=" padding-left: 15px; display: flex;">
							<label class="control-label" style="padding-right: 10px; float: left;"> Patente </label>
							<input type="text" class="form-control" name="patente" required="" style="width: 200px; float: left;">
							<button type="submit" name="btnbaja" class="btn btn-default" style="margin-left: 15px;">Buscar</button>
						</div>
					</form>
					<hr>

					<div class="container-fluid">
						<div class="row">

							<%
								if (session.getAttribute("vehiculo-baja") != null) {
									Vehiculos v = new Vehiculos();
									v = (Vehiculos) session.getAttribute("vehiculo-baja");
							%>
							<div class="row" style="padding: 0% 20%; text-align: center;">
							
								<div class="col-md-12 formulario-ABM">
									<form role="form" action="EliminarVehiculo" method="post">
										
										<div class="form-group" style="text-align: center;">
											<h2><strong>Vehículo</strong></h2>
											<span class="label label-info" style="font-size: 20px;"><%=v.getPatente()%></span>
										</div>
										
										<hr>
										
										<div style="font-size: 18px;">
											<p><strong> Marca </strong></p>
											<p><%=v.getMarca()%>  </p>
											<br> 
											<p><strong> Modelo </strong></p> 
											<p><%=v.getModelo()%> </p> 
											<br> 
											<p><strong> Estado: </strong></p>
											<p><%=v.getEstado()%> </p>
											<br>
										</div>
										
										<hr>
										
										<div  style="padding: 3% 25%">
											<button type="submit" class="btn btn-danger btn-default"> Eliminar</button>
											<button type="button" class="btn btn-default" data-dismiss="alert" aria-hidden="true">Cancelar</button>
										</div>										
									</form>
								</div>
							
							</div>
							
							<% } %>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="modificaciones" class="tab-pane fade">
			<h3>Ingrese patente del vehículo a modificar</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarVehiculo" method="post">
						<div class="form-group" style=" padding-left: 15px; display: flex;">
							<label class="control-label" style="padding-right: 10px; float: left;"> Patente </label>
							<input type="text" class="form-control" name="patente" required="" style="width: 200px; float: left;">
							<button type="submit" name="btnmod" class="btn btn-default" style="margin-left: 15px;">Buscar</button>
						</div>
					</form>
					<hr>

					<div class="container-fluid">
						<div class="row" style="padding: 0% 20%;">
							<%
								if (session.getAttribute("vehiculo-mod") != null) {
									Vehiculos v = new Vehiculos();
									v = (Vehiculos) session.getAttribute("vehiculo-mod");
							%>
							
						  <div class="col-md-12 formulario-ABM">
							<form role="form" action="ModificarVehiculo" method="post">
								
								<div class="form-group" style="text-align: center;">
									<h2><strong>Vehículo</strong></h2>
									<span class="label label-info" style="font-size: 20px;"><%=v.getPatente()%></span>
									<input style="display: none;" name="nro_patente" value="<%=v.getPatente()%>">
								</div>
								
								<hr>
								
								<div class="form-group">
									<label> Marca </label> 
									<select class="form-control" name="marca" required>
									  	<option value="<%=v.getMarca()%>" selected disabled hidden ><%=v.getMarca()%></option>
										<option>BMW</option>
										<option>Peugeot</option>
										<option>Jeep</option>
										<option>Kia</option>
										<option>Chevrolet</option>
									  	<option>Fiat</option>
									  	<option>Ford</option>
									  	<option>Renault</option>
									  	<option>Volkswagen</option>
									</select>
								</div>
								
								<div class="form-group">
									<label> Modelo </label> 								
									<input type="text" class="form-control" value="<%=v.getModelo()%>" name="modelo" required />
								</div>
																
								<div class="form-group">
									<label> Cantidad Asientos </label>
									<br>
									<label class="radio-inline">
									  <input type="radio" name="cant_asientos" value="1" <% if(v.getCantAsientos() == 1){%> <%= "checked" %> <%} %> required> 1
									</label>
									<label class="radio-inline">
									  <input type="radio" name="cant_asientos" value="2" <% if(v.getCantAsientos() == 2){%> <%= "checked" %> <%} %> > 2
									</label>
									<label class="radio-inline">
									  <input type="radio" name="cant_asientos" value="3" <% if(v.getCantAsientos() == 3){%> <%= "checked" %> <%} %> > 3
									</label>
									<label class="radio-inline">
									  <input type="radio" name="cant_asientos" value="4" <% if(v.getCantAsientos() == 4){%> <%= "checked" %> <%} %> > 4
									</label>
									<label class="radio-inline">
									  <input type="radio" name="cant_asientos" value="5" <% if(v.getCantAsientos() == 5){%> <%= "checked" %> <%} %> > 5
									</label>
								</div>
								
								<div class="form-group">
									<label> Año </label> 
									<input type="number" min="1990" max="2040" class="form-control" name="anio"  value="<%=v.getAnio()%>" required/>
								</div>

								<div class="form-group">
									<label> Transmisión </label> 
									<select class="form-control" name="transmision" required>
										<option value="<%=v.getTransmision()%>" selected hidden><%=v.getTransmision()%></option>
										<option>Automática</option>
										<option>Manual</option>
									</select>
								</div>
								
								<div class="form-group">
									<label> Estado </label> 
									<select class="form-control" name="estado" required>
										<option value="<%=v.getEstado()%>" selected hidden><%=v.getEstado()%></option>
										<option>Disponible</option>
										<option>En uso</option>
										<option>En reparación</option>
									</select>
								</div>
							
							
								<div class="form-group">
									<label> Baúl </label> 
									<div class="checkbox">
								        <label>
								          <input type="checkbox" name="baul" <% if( v.getBaul().equals("Si") ){%> <%= "checked" %> <%}%> > Sí posee 
								        </label>
								    </div>
								</div>
								
								<div class="form-group">
									<label> Tipo </label> 
									<select class="form-control" name="tipo" required>
										<option value="<%=v.getTipo()%>" selected  hidden><% if( v.getTipo().equals("A") ){%> <%= "Auto" %> <%} else { %><%= "Camioneta" %> <%}%></option>									
										<option value="A">Auto</option>
										<option value="C">Camioneta</option>
									</select>
								</div>
								
								<div class="form-group">
									<label>Kilometraje</label> 
									<div class="input-group">
								      	<input type="number" class="form-control" name="km" value="<%=v.getKm()%>" placeholder="Kilometros" required>
								      	<div class="input-group-addon">Km.</div>
							      	</div>
								</div>
								
								<div class="form-group">
									<label> Precio por día </label>
									<div class="input-group">
										<div class="input-group-addon">$</div>
								      	<input type="number" class="form-control" name="precio_base" value="<%=v.getPrecio()%>" placeholder="Precio" required>
							      	</div>								
								</div>
				
	
								<div class="form-group">
									<label> Imagen del vehículo </label> 
									<input type="file"/>
								</div>
							
								<hr>
								
								<div style="padding: 3% 25%">					
									<button type="submit" class="btn btn-primary btn-block colorFondoBase">Guardar modificaciones</button>
								</div>
								
							</form>
						  </div>

							<% } %>
						</div>

					</div>
				</div>

			</div>
		</div>

	</div>

</div>

<%@ include file="footer.html"%>


