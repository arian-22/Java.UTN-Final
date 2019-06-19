<%@ include file="cabecera.jsp"%>


<%
	Controlador ctrl = ((Controlador) session.getAttribute("Ctrl"));
	String titleModal = "";
	String typeBtn = "";
	String textModal = "";
%>



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
        <button type="button" class="btn <%=typeBtn%>" data-dismiss="modal">Cerrar</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<br>
<br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>Reserva</h3>
			</div>
			<div class="row">
			
			
				<div class="col-md-12">
				
					<div class="row">
				      
				      <div class="col-md-4" style="text-align: right;">
				      	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKkBMJgRi95N0w6X65ZukHCPVx6u7TGEE3vgU12TVmnpQEgM5OsA">
				      </div>
				      
				      <div class="col-md-8" style="text-align: left;">
				        <h3>Seleccione la fecha a buscar</h3>
				        <br>
				        
				        <div>
							<form class="form-horizontal" role="form" action="VehiculosDisponibles" method="post">
								<div class="form-group">
									<label for="inputFecha" class="col-sm-2 control-label">Fecha de inicio </label>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputFecha" data-date-format= "dd-MM-yyyy" name="fecha_desde" />
									</div>
								</div>
											
								<div class="form-group">
									<label for="inputFechaD" class="col-sm-2 control-label">Fecha de fin </label>
									<div class="col-sm-4">
										<input type="date" class="form-control" id="inputFechaD" data-date-format= "dd-MM-yyyy"	name="fecha_hasta" />
									</div>
								</div>
		
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Buscar Vehículos Disponibles</button>
								</div>
								
								</form>

						</div>
					</div>
				</div>
					
				</div>	
				
							
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>