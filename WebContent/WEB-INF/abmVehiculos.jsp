<%@ include file="cabecera.jsp"%>

<%
Controlador ctrl = ((Controlador)session.getAttribute("Ctrl"));
%>


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

<br><br>

<div class="container">
	<h2>Módulo ABM </h2>
	
	<ul class="nav nav-tabs">
	    <li class="active"><a href="#altas">Altas</a></li>
	    <li><a href="#bajas">Bajas</a></li>
	    <li><a href="#modificaciones">Modificaciones</a></li>
	</ul>
	
	 <div class="tab-content">
	     <div id="altas" class="tab-pane fade in active">
	         <h3>Ingrese todos los datos del vehículo que desea agregar al catálogo</h3><div class="container-fluid">
				<div class="row centrado">
				<div class="col-md-12">
					<h3 class="text-center">
						Nuevo Registro
					</h3>
					
					<form role="form" action="AltaVehiculo" method="post">
						<div class="form-group">
							<label>
								Patente
							</label>
							<input type="text" class="form-control" name="nro_patente"/>
						</div>
						<div class="form-group">
							<label>
								Marca
							</label>
							<input type="text" class="form-control" name="marca" />
						</div>
						<div class="form-group">
							<label>
								Modelo
							</label>
							<input type="text" class="form-control" name="modelo"/>
						</div>
						<div class="form-group">
							<label>
								Cantidad Asientos
							</label>
							<input type="text" class="form-control" name="cant_asientos"/>
						</div>
						<div class="form-group">
							 
							<label>
								Año
							</label>
							<input type="text" class="form-control" name="anio"/>
						</div>
						<div class="form-group">
							<label>
								Transmisión
							</label>
							<input type="text" class="form-control" name="transmision" />
						</div>
						<div class="form-group">
							 
							<label>
								Estado
							</label>
							<input type="text" class="form-control" name="estado" />
						</div>

						<div class="form-group">
							 
							<label>
								Baul
							</label>
							<input type="text" class="form-control" name="baul"/>
						</div>
						<div class="form-group">
							<label>
								Tipo
							</label>
							<input type="text" class="form-control" name="tipo"/>
						</div>
						<div class="form-group">
							<label>
								Km
							</label>
							<input type="text" class="form-control" name="km"/>
						</div>
						<div class="form-group">
							<label>
								Precio por día
							</label><!-- Esta en la tabla valores -->
							<input type="text" class="form-control" name="precio_base"/>
						</div>
					<div class="form-group">
					 
					<label for="exampleInputFile">
						Imagen del vehículo
					</label>
					<input type="file" id="exampleInputFile" />
					
				</div>

						<button type="submit" class="btn btn-primary btn-block">
							Guardar
						</button>
					</form>
				</div>
			</div>
</div>
	        
	     </div>
	     
	     <div id="bajas" class="tab-pane fade">
	         <h3>Ingrese patente  del vehículo a dar de baja</h3>
	         	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" role="form" action="BuscarVehiculo" method="post">
				
				<div class="form-group">
					 
					<label class="col-sm-2 control-label">
						Patente
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="patente"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 
						<button type="submit" class="btn btn-default">
							Buscar
						</button>
					</div>
				</div>
			</form>
	<div class="container-fluid">
	
	<div class="row">
		<!--  <div class="col-md-12"> -->
			
			
			<% if(session.getAttribute("vehiculo-baja")!=null){ 
				  Vehiculos v = new Vehiculos();
				  v = (Vehiculos)session.getAttribute("vehiculo-baja");
				  
			%>
					<div class="row">
						<div class="col-md-12">
							<div class="alert alert-dismissable alert-info">
								 
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
									×
								</button>
								<h4><strong> Vehículo: <%= v.getPatente() %> </strong></h4> 
								
								<strong> Marca: <%= v.getMarca() %> </strong>
								<br>  
								<strong> Modelo: <%= v.getModelo() %> </strong>
								<br>
								<strong> Estado: <%= v.getEstado() %> </strong>
								<br>	
								<form role="form" action="EliminarVehiculo" method="post">
								<div>
								
									<button type="submit"  class="btn btn-danger btn-default">
										Eliminar
									</button> 
									<button type="button" class="btn btn-default " data-dismiss="alert" aria-hidden="true">
										Cancelar
									</button>
								
								</div>	
								</form>	
							</div> 
						
						</div>
					</div>
				<%}else {
					if(session.getAttribute("bandera")!=null){ 
				%>	
				<div class="alert alert-dismissable alert-danger">
				 
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
						×
					</button>
					<h4>
						<strong> Error! </strong>
					</h4> El vehículo no fue encontrado <a href="#" class="alert-link"></a>
				</div>
				<% }
				} %>
					
		<!--  </div> -->
	</div>
</div>

		
			
	
	
	
		</div>
	</div>
</div>
	     <div id="modificaciones" class="tab-pane fade">
	         <h3>Ingrese patente del vehículo a modificar</h3>
	        <div class="row">
		<div class="col-md-12">
			<form class="form-horizontal" role="form">
				
				<div class="form-group">
					 
					<label for="inputPassword3" class="col-sm-2 control-label">
						Patente
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 
						<button type="submit" class="btn btn-default">
							Buscar
						</button>
					</div>
				</div>
			</form>
		</div>
		</div>
	         
	   </div>
	     
	 </div>
	 <a href="javascript:window.history.go(-1);" class="btn btn-link" type="button">Atrás</a>
	<hr>
</div>


<%@ include file="footer.html"%>


