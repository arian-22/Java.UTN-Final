<%@ include file="cabecera.jsp"%>

<br>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>Reserva</h3>
			</div>
			<div class="row">
			
			
				<div class="col-md-12">
				
					<div class="row">
				      
				      <div class="col-md-4" style="text-align: right;">
				      	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKkBMJgRi95N0w6X65ZukHCPVx6u7TGEE3vgU12TVmnpQEgM5OsA">
				      </div>
				      
				      <div class="col-md-8" style="text-align: left;">
				        <h3>Seleccione la fecha a buscar</h3>
				        <br>
				        
				        <div>
							<form class="form-horizontal" role="form" action="VehiculosDisponibles" method="post">
								<div class="form-group">
									<label for="inputFecha" class="col-sm-2 control-label">Fecha de alquiler </label>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputFecha" data-date-format= "dd-MM-yyyy" name="fecha_desde" />
									</div>
								</div>
											
								<div class="form-group">
									<label for="inputFechaD" class="col-sm-2 control-label">Fecha de devolución </label>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputFechaD" data-date-format= "dd-MM-yyyy"	name="fecha_hasta" />
									</div>
								</div>
		
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Buscar Vehículos Disponibles</button>
								</div>
								
								</form>
							<% if (session.getAttribute("msjErrorFecha") != null) {
									
									String msj = (String)session.getAttribute("msjErrorFecha");
									%>
									<div class="alert alert-dismissable alert-danger col-sm-offset-1 col-sm-10"	style="padding-bottom: 5px; padding-top:5px; margin-top:19px; width: 387px">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
										<h4><strong> Error </strong></h4>
										<p><%= msj %></p>
									</div>
									<% } %> 
						</div>
					</div>
				</div>
					
				</div>	
				
							
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>