<%@ include file="cabecera.jsp"%>

<script type="text/javascript">
	function limpiaModal(){
		$('#myModal').modal('hide');
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
	}
</script>
<%
	Cli_Veh_Alq a = new Cli_Veh_Alq();
	Cli_Veh_Alq a2 = new Cli_Veh_Alq();
	String titleModal = "";
	String typeBtn = "";
	String textModal = "";
%>

<script type="text/javascript">
$(document).ready(function() {
	$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
	    localStorage.setItem('activeTab', $(e.target).attr('href'));
	});

	var activeTab = localStorage.getItem('activeTab');

	if (activeTab) {
	   $('a[href="' + activeTab + '"]').tab('show');
	}
});
</script>

<br>
<br>
<!-- Modal para errores  -->
<% if(session.getAttribute("errorModal") != null){ 
	titleModal = "Error";
	typeBtn = "btn-danger";
	textModal = (String) session.getAttribute("errorModal");
	session.removeAttribute("errorModal");
%>
<script>
$(document).ready(function(){
	$('#myModal').modal({
	  keyboard: false
	})
});
</script>


<%} else if(session.getAttribute("okModal") != null){
	titleModal = "Gracias";
	typeBtn = "btn-success";
	textModal = (String) session.getAttribute("okModal");
	session.removeAttribute("okModal");
%>
<script>
$(document).ready(function(){
	$('#myModal').modal({
	  keyboard: false
	})
});
</script>

<%}%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title"><%=titleModal%></h4>
      </div>
      <div class="modal-body">
        <p><%=textModal%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn <%=typeBtn%>" onClick="limpiaModal()">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h2>Gesti�n de Alquileres</h2>

			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#retiro">Retirar veh�culo</a></li>
				<li><a data-toggle="tab" href="#devolucion">Devoluci�n</a></li>
			</ul>
		</div>
	</div>

	<div class="tab-content">
		<div id="retiro" class="tab-pane fade in active">
			<h1>Retiro de veh�culos</h1>
			<h3>Ingrese el n�mero de documento del Cliente</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarAlquiler" method="post">
						<div class="form-group" style=" padding-left: 15px; display: flex;">
							<label class="control-label" style="padding-right: 10px; float: left;"> N� de Documento </label>
							<input type="text" class="form-control" name="dni" required style="width: 200px; float: left;">
							<button type="submit" name="btnReserva" class="btn btn-default" style="margin-left: 15px;">Buscar</button>
						</div>
					</form>
					<hr>


					<!-- Modal para confirmar el retiro del vehiculo -->
					
					
					<% if (session.getAttribute("alquiler-reserva") != null) {
			
						a2 = (Cli_Veh_Alq) session.getAttribute("alquiler-reserva");
						
						
						titleModal = "Confirmar Retiro";
						
						//typeBtn = "btn-danger";
						//textModal = (String) session.getAttribute("errorModal");
						session.removeAttribute("errorModal");
					%>
					<script>
					$(document).ready(function(){
						$('#modalConfirmacionReserva').modal({
						  keyboard: false
						})
					});
					</script>
					
	
					<div class="modal fade" id="modalConfirmacionReserva" tabindex="-1" role="dialog">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title"><%=titleModal%></h4>
					      </div>
					      <div class="modal-body">
					      
					      
					        <h4><strong> Nro de Alquiler: <%=a2.getAlquiler().getNro_alquiler()%></strong></h4>

							<strong> Patente: <%=a2.getVehiculo().getPatente()%>
							</strong> <br> <strong> Fecha Desde: <%=a2.getAlquiler().getFechaDesde()%>
							</strong> <br> <strong> Fecha Hasta: <%=a2.getAlquiler().getFechaHasta()%>
							</strong> <br> <strong> Cliente: <%=a2.getCliente().getNombre() + ' ' + a2.getCliente().getApellido()%>
							</strong> 
							
							<br>
					        
					        
					      </div>
					      <div class="modal-footer">
					        <form role="form" action="Alquileres" method="post">
								<div>
									<button type="submit" name="btn-reserva" class="btn btn-success btn-default">Registrar Retiro</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
								</div>
							</form>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
					
					<%} %>


				</div>
			</div>
		</div>

		<div id="devolucion" class="tab-pane fade">
			<h1>Devoluci�n</h1>
			<h3>Ingrese la patente del veh�culo a registrar devoluci�n</h3>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="BuscarAlquiler" method="post">
						<div class="form-group" style=" padding-left: 15px; display: flex;">
							<label class="control-label" style="padding-right: 10px; float: left;"> Patente </label>
							<input type="text" class="form-control" name="nro_patente" required style="width: 200px; float: left;">
							<button type="submit" name="btnDevolucion" class="btn btn-default" style="margin-left: 15px;">Buscar</button>
						</div>
					</form>
					<hr>




					<!-- Modal para confirmar devolucion del vehiculo -->
					
					
					<%
					if (session.getAttribute("alquiler-dev") != null) {
						a = (Cli_Veh_Alq) session.getAttribute("alquiler-dev");
						 Float totalApagar = (Float) session.getAttribute("total-pagar");
						 Integer dias = (Integer) session.getAttribute("dias");
						 Float precioAlquiler = (Float) session.getAttribute("precioAlquiler");
						
						
						titleModal = "Confirmar Devoluci�n";
						session.removeAttribute("errorModal");
						
						if (session.getAttribute("datosAlquier") != null) {
					%>
					<script>
					$(document).ready(function(){
						$('#modalConfirmacionDevolucion').modal({
						  keyboard: false
						})
					});
					</script>
					
	
					<div class="modal fade" id="modalConfirmacionDevolucion" tabindex="-1" role="dialog">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h4 class="modal-title"><%=titleModal%></h4>
					      </div>
					      <div class="modal-body">
					      
					      
					        <h4>
								<strong> Nro de Alquiler: <%=a.getAlquiler().getNro_alquiler()%></strong>
							</h4>

							<strong> Patente: <%=a.getVehiculo().getPatente()%></strong> 
							<br> 
							<strong> Fecha Desde: <%=a.getAlquiler().getFechaDesde()%></strong>
							<br> 
							<strong> Fecha Hasta: <%=a.getAlquiler().getFechaHasta()%></strong> 
							<br> 
							<strong> Cliente: <%=a.getCliente().getNombre() + ' ' + a.getCliente().getApellido()%></strong>
							
							<br>
					        
					        
					      </div>
					      <div class="modal-footer">
					        <form role="form" action="Alquileres" method="post">
								<div>
									<button type="submit" name="btn-devolucion" class="btn btn-success btn-default">Registrar Devoluci�n</button>
									<button type="button" class="btn btn-danger" data-dismiss="modal" aria-hidden="true">Cancelar</button>
								</div>
							</form>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
					
					<%} %>
					
					
					
					
					
					<div class="container-fluid">
						<div class="row">						

								<%
															
								if (session.getAttribute("datosDevolucion") != null) {
								%>
		<div style="margin: 6% 30%; box-shadow: 0px 0px 20px 4px;" class="panel panel-info">
			<div class="panel-heading" style="text-align: center;">
				<h1 class="panel-title" style="font-size: 26px; font-weight: bold;">Datos de la Devoluci�n</h1>
			</div>
		
			<div class="panel-body" style="text-align: center; font-size: 18px;">
			
				<div class="row">
					<div class="col-md-6">
					<h4><strong> Nro de Alquiler: <%=a.getAlquiler().getNro_alquiler()%></strong></h4>
						<hr>
						
						<p><b>Patente</b> 
						<p><%=a.getVehiculo().getPatente()%></p>
						
						<p><b>Cliente</b></p>
						<p><%=a.getCliente().getNombre() + ' ' + a.getCliente().getApellido()%></p>					
						
					</div>
					
					<div class="col-md-6">					
						<p><b>Fecha Desde</b></p>
						<p><%= a.getAlquiler().getFechaDesde() %></p>
					
						<p><b>Fecha Hasta</b></p>
						<p><%= a.getAlquiler().getFechaHasta() %></p>
					
						<p><b>Precio del Alquiler:</b></p>
						<p>AR$<%= precioAlquiler%></p>
						
					</div>
					<p><b>D�as de diferencia con la fecha de entrega: </b><%= dias%></p>
				</div>
				<hr>
				<div>
					 <p><span class="label label-default colorFondoBase" style="font-size: 28px;">TOTAL A PAGAR: AR$  <%= totalApagar%> </span></p>
				</div>
			</div>
	
		</div>					
							<%} 
								
								}
							%>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.html"%>