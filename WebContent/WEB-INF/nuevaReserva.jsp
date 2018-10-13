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
				<div class="col-md-6">
					<form class="form-horizontal AVAST_PAM_loginform" role="form"
						action="VehiculosDisponibles" method="post">
						
						<div class="form-group">

							<label for="inputFecha" class="col-sm-2 control-label">
								Fecha de alquiler </label>
							<div class="col-sm-4">
								<input type="date" class="form-control" id="inputFecha" data-date-format= "dd-MM-yyyy"
									name="fecha_desde" />
							</div>

						</div>
						
										
						<div class="form-group">

							<label for="inputFechaD" class="col-sm-2 control-label">
								Fecha de devoluci�n </label>
							<div class="col-sm-4">
								<input type="date" class="form-control" id="inputFechaD" data-date-format= "dd-MM-yyyy"
									name="fecha_hasta" />
							</div>

						</div>

						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-warning">Buscar Veh�culos Disponibles</button>
						</div>
						
						</form>
					<% if (session.getAttribute("msjErrorFecha") != null) {
							
							String msj = (String)session.getAttribute("msjErrorFecha");
							%>
							<div class="alert alert-dismissable alert-danger col-sm-offset-1 col-sm-10"
							style="padding-bottom: 5px; padding-top:5px; margin-top:19px; width: 387px">

								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">�</button>
								<h4>
									<strong> Error! </strong>
								</h4>
								  <%= msj %>  <a href="#" class="alert-link"></a>
							</div>
							
							<% } %> 
				</div>				
			</div>
		</div>
	</div>
	
		<a href="javascript:window.history.go(-1);" class="btn btn-link"
		type="button">Atr�s</a>
		<hr>
</div>

<%@ include file="footer.html"%>