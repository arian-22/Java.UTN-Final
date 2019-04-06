<%@ include file="cabecera.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="margin-top: 3%; text-align: center;">
			<h1 style="padding-bottom: 15px;">�Bienvenido al Sistema de Administraci�n de EasyCar!</h1>
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail sectionAction">
						<div class="imgContainer">
							<img class="img" src="https://concepto.de/wp-content/uploads/2014/03/informe.jpg" />
						</div>
						<div class="caption">
							<h3>Ver Informes</h3>
							<p>
								- Veh�culos de EasyCar.<br> - Veh�culos reservados.
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
							<h3>Gesti�n de Alquileres</h3>
							<p>Ingrese aqu� para registrar el Retiro de un veh�culo o la Devoluci�n de un veh�culo.</p>
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
							<h3>M�dulo ABM de Veh�culos</h3>
							<p>Ingrese aqu� para registar un nuevo veh�culo, eliminar un
								veh�culo existente o modificar datos de los veh�culos.</p>
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

