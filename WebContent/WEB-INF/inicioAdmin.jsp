<%@ include file="cabecera.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top: 3%; text-align: center;">
			<h1 style="padding-bottom: 15px;">¡Bienvenido al Sistema de Administración de EasyCar!</h1>
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail sectionAction">
						<div class="imgContainer">
							<img class="img" src="https://concepto.de/wp-content/uploads/2014/03/informe.jpg" />
						</div>
						<div class="caption">
							<h3>Ver Informes</h3>
							<p>
								- Vehículos de EasyCar.<br> - Vehículos reservados.
							</p>
							<form action="Informes" method="post">
								<button type="submit" class="btn btn-primary colorFondoBase">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail sectionAction">
						<div class="imgContainer">
							<img class="img" src="https://www.masqrenting.es/wp-content/uploads/2018/07/gestion-flota-vehiculos-empresa-negocio-software.jpg" />
						</div>
						<div class="caption">
							<h3>Gestión de Alquileres</h3>
							<p>Ingrese aquí para registrar el Retiro de un vehículo o la Devolución de un vehículo.</p>
							<form action="URLs" method="post">
								<button name="btnAlquilerAdmin" type="submit" class="btn btn-primary colorFondoBase">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail sectionAction">
						<div class="imgContainer">
							<img class="img" src="https://www.seoclerk.com/pics/630059-1AtKBf1537138257.jpg" />
						</div>
						<div class="caption">
							<h3>Módulo ABM de Vehículos</h3>
							<p>Ingrese aquí para registar un nuevo vehículo, eliminar un
								vehículo existente o modificar datos de los vehículos.</p>
							<form action="ABMVehiculos" method="post">
								<button type="submit" class="btn btn-primary colorFondoBase">Ingresar</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>

