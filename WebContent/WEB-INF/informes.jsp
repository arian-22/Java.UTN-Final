<%@ include file="cabeceraAdmin.jsp"%>


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

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h1>
				Informes
			</h1>
			<ul class="nav nav-tabs">
	    		<li class="active"><a href="#stock">Stock de Vehículos</a> </li>
	    		<li><a href="#alquilados">Vehículos alquilados actualmente</a></li>
			</ul>
			
			 <div class="tab-content">
	     <div id="stock" class="tab-pane fade in active">
	         <h3>Ingrese todos los datos del vehículo que desea agregar al catálogo</h3>
	         <div class="container-fluid">
				<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">First</th>
					      <th scope="col">Last</th>
					      <th scope="col">Handle</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>Larry</td>
					      <td>the Bird</td>
					      <td>@twitter</td>
					    </tr>
					  </tbody>
					</table>
				</div> 
	     </div>
	     
	     <div id="alquilados" class="tab-pane fade">
	         <h3>Ingrese patente  del vehículo a dar de baja</h3>
	         	 <div class="container-fluid">
				<table class="table table-striped">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">First</th>
					      <th scope="col">Last</th>
					      <th scope="col">Handle</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>Larry</td>
					      <td>the Bird</td>
					      <td>@twitter</td>
					    </tr>
					  </tbody>
					</table>
				</div> 
</div>
	     
	 </div>
			
						
			<div class="modal fade" id="modal-container-865240" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								×
							</button>
							<h4 class="modal-title" id="myModalLabel">
								Vehículos de EasyCar
							</h4>
						</div>
					<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>
							#
						</th>
						<th>
							Patente
						</th>
						<th>
							Modelo
						</th>
						<th>
							Marca
						</th>
						<th>
							Asientos
						</th>
						<th>
							Año
						</th>
						<th>
							Transmisión
						</th>
						<th>
							Estado
						</th>
						<th>
							Baúl
						</th>
						<th>
							Tipo
						</th>
						<th>
							Km
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
					</tr>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr>
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr>
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							Pending
						</td>
					</tr>
					<tr>
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							Call in to confirm
						</td>
					</tr>
				</tbody>
			</table>
			
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-default" data-dismiss="modal">
								Cerrar
							</button> 
						
						</div>
					</div>
					
				</div>
				
			</div>
			<a href="javascript:window.history.go(-1);" class="btn btn-link" type="button">Atrás</a>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>	