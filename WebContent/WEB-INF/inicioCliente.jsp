<%@ include file="cabecera.jsp"%>

<div class="container-fluid" style="margin-top: 5%;">
	<div class="row">
		<div class="col-md-12">
		
			<div class="row"  style="text-align: center;">
				
				<div class="col-md-6">
					<div class="thumbnail">
						<img style="height: 400px;" alt="Bootstrap Thumbnail First" src="https://www.auto.cl/sites/default/files/styles/foto_detalle_noticia/public/field/image/auto_nuevo_carretera.jpg?itok=NBUM1oX4"/>
						<div class="caption">
							<h3>Realizar nueva reserva</h3>
							<p>Ingrese aquí para realizar una nueva reserva.</p>
							<form action="URLs" method="post">
								<button name="btnNuevaReserva" type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				
				
				<div class="col-md-6">
					<div class="thumbnail">
						<img style="height: 400px;" alt="Bootstrap Thumbnail Second" src="https://www.infobae.com/new-resizer/Z-axEAc0v4_wfIBfAF9_bQuctw8=/750x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2018/02/08092756/Autos-cristiano-ronaldo-1920.jpg"/>
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