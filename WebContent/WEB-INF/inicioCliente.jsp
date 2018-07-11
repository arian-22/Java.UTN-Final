<%@ include file="cabecera.jsp"%>

<br><br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Reserva 
				</h3>
			</div>
			<div class="row">
				<div class="col-md-6">
					<form class="form-horizontal AVAST_PAM_loginform" role="form" action="VehiculosDisponibles" method="post">
						<div class="form-group">
							 
							<label for="inputFecha" class="col-sm-2 control-label">
								Fecha de alquiler
							</label>
							<div class="col-sm-4">
								<input type="date" class="form-control" id="inputFecha" name="fecha_desde"/>
							</div>
							
						</div>
						<div class="form-group">
							 
							<label for="inputFechaD" class="col-sm-2 control-label">
								Fecha de devolución
							</label>
							<div class="col-sm-4">
								<input type="date" class="form-control" id="inputFechaD" name="fecha_hasta" />
							</div>
							
						</div>
						
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-warning">Buscar Vehículos Disponibles</button>
							</div>
						
					</form>
				</div>
				<div class="col-md-6">
				</div>
			</div>
			<a href="index.jsp" class="btn btn-link" type="button">Atrás</a>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>