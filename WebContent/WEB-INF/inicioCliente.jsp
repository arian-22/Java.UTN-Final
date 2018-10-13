<%@ include file="cabecera.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<div class="row">
				<div class="col-md-6">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail First"
							src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>Realizar nueva reserva</h3>
							<p>
							Ingrese aquí para realizar una nueva reserva.
							</p>
							<form action="URLs" method="post">
								<button name="btnNuevaReserva" type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail Second"
							src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>Ver mis reservas</h3>
							<p>Ingrese aquí para ver su historial de reservas.</p>
							<form action="URLs" method="post">
								<button name="btnVerReservas" type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>