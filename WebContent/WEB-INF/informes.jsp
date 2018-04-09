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
			<h3>
				Informes
			</h3>
			<h3 class="text-center">
				¿Qué desea hacer?
			</h3>
			<a id="modal-865240" href="#modal-container-865240" role="button" class="btn btn-lg btn-block" data-toggle="modal">- Ver vehículos de EasyCar</a>
			
			<a href="#" class="btn btn-lg btn-block" type="button">- Ver vehículos reservados</a>
			
			<form class="form-horizontal AVAST_PAM_loginform" role="form">
				<div class="form-group">
					 
					<label for="inputDate" class="col-sm-2 control-label">
						Fecha
					</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="inputDate" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 
						<button type="submit" class="btn btn-default">
							Buscar
						</button>
					</div>
				</div>
			</form>
			
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