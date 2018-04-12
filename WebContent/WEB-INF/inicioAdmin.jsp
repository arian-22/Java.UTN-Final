<%@ include file="cabecera.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3>
				�Bienvenido al sistema de administraci�n de EasyCar!
			</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail First" src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>
								Ver Informes
							</h3>
							<p>
								- Veh�culos de EasyCar.<br>
								- Veh�culos reservados.
							</p>
							<form action="Informes" method="post">
								<button type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail Second" src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>
								Alquileres
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<form action="Alquiler" method="post">
								<button type="submit" class="btn btn-primary">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="Bootstrap Thumbnail Third" src="http://lorempixel.com/output/sports-q-c-600-200-1.jpg" />
						<div class="caption">
							<h3>
								Alta/Baja Veh�culos
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
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

