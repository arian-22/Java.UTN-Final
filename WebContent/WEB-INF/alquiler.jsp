<%@ include file="cabecera.jsp"%>

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
			<h2> Gestión de Alquileres </h2>
			
			<ul class="nav nav-tabs">
	    		<li class="active"><a href="#stock">Retirar vehiculo</a> </li>
	    		<li><a href="#alquilados">Devolucion</a></li>
	    		<li><a href="#alquilados">Cancelacion</a></li>
			</ul>
		</div>
	</div>

		<div id="bajas" class="tab-pane fade">
	         <h3>Ingrese el número del alquiler del vehículo a retirar</h3>
	         	<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" action="BuscarAlquiler" method="post">
				
				<div class="form-group">
					 
					<label class="col-sm-2 control-label">
						N° de Alquiler
					</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="num_alquiler"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 
						<button type="submit" name="btnbuscar" class="btn btn-default">
							Buscar
						</button>
					</div>
				</div>
			</form>
		
		<div class="container-fluid">
		<div class="row">
		<!--  <div class="col-md-12"> -->
			
		
			<% if(session.getAttribute("buscarAlquiler")!=null){ 
				  Alquiler a = new Alquiler();
				  a = (Alquiler)session.getAttribute("buscarAlquiler");
				  
			%>
					<div class="row">
						<div class="col-md-12">
							<div class="alert alert-dismissable alert-info">
								 
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
									×
								</button>
								<h4><strong> Nro de Alquiler: <%= a.getNro_alquiler() %> </strong></h4> 
								  
								<strong> Fecha Desde: <%= a.getFechaDesde() %> </strong>
								<br>
								<strong> Fecha Hasta: <%= a.getFechaHasta() %> </strong>
								<br>
								<form role="form" action="Retiro de vehiculo" method="post">
								<div>
								
									<button type="submit"  class="btn btn-danger btn-default">
										Registrar
									</button> 
									<button type="button" class="btn btn-default " data-dismiss="alert" aria-hidden="true">
										Cancelar
									</button>
								
								</div>	
								</form>	
							</div> 
						
						</div>
					</div>
				<%}else {
					if(session.getAttribute("msjErrorBaja")!=null){ 
				%>	
				<div class="alert alert-dismissable alert-danger">
				 
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
						×
					</button>
					<h4>
						<strong> Error! </strong>
					</h4> El Alquiler no fue encontrado <a href="#" class="alert-link"></a>
				</div>
				<% }
				} %>
			</div>
		</div>

	
		</div>
	</div>
</div>


		<a href="javascript:window.history.go(-1);" class="btn btn-link" type="button">Atrás</a>
		<hr>
	</div>

<%@ include file="footer.html"%>	