<%@ include file="cabecera.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>¡Bienvenido al sistema de administración de EasyCar!</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail First"
							src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>Ver Informes</h3>
							<p>
								- Vehículos de EasyCar.<br> - Vehículos reservados.
							</p>
							<form action="Informes" method="post">
								<button type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail Second"
							src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>Gestión de Alquileres</h3>
							<p>Ingrese aquí para registrar el Retiro de un vehículo o la Devolución de un vehículo.</p>
							<form action="Alquiler" method="post">
								<button type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail Third"
							src="http://lorempixel.com/output/sports-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>Alta/Baja Vehículos</h3>
							<p>Ingrese aquí para registar un nuevo vehículo, eliminar un
								vehículo existente o modificar datos de los vehículos.</p>
							<form action="ABMVehiculos" method="post">
								<button type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>

