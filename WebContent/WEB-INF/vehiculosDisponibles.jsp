<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>

<%
	String titleModal = "";
	String typeBtn = "";
	String textModal = "";
%>

<script type="text/javascript">
	$(document).ready(function() {
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

<!-- Fin modal errores -->

<div class="container-fluid seleccionDeVehiculo">
	<div class="row">
		<div class="col-md-12">

			<h1 style="text-align: center">Vehículos Disponibles</h1>
			<hr>
			
			<div class="row">
			
			<%
				if (session.getAttribute("vehiculos-stock-disponibles") != null) {
					ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
					vehiculos = (ArrayList<Vehiculos>) session.getAttribute("vehiculos-stock-disponibles");
	
					String fecha_desde = session.getAttribute("fecha-desde").toString();
					String fecha_hasta = session.getAttribute("fecha-hasta").toString();
	
					for (int i = 0; i < vehiculos.size(); i++) {
			%>
	  
			    <div class="col-sm-6 col-md-4 col-lg-3 ">
			  
					<div class="card card-price">
					  <div class="card-img">
					      <img src="https://loremflickr.com/600/400/cars?random=<%= i %>" class="img-responsive">
					      <div class="card-caption">
					        <span class="h2"><%=vehiculos.get(i).getModelo()%></span>
					        <p><%=vehiculos.get(i).getMarca()%></p>
					      </div>
					  </div>
					  <div class="card-body">
					    <div class="price">$<%=vehiculos.get(i).getPrecio()%> <small>por día</small></div>
					    <div class="lead">Patente <b><%=vehiculos.get(i).getPatente()%></b></div>
					    <ul class="details">
					      <li>Transmisión: <%=vehiculos.get(i).getTransmision()%></li>
					      <li>Año: <%=vehiculos.get(i).getAnio()%></li>
					      <li>Cantidad Asientos: <%=vehiculos.get(i).getCantAsientos()%></li>
					      <li>Baúl: <%=vehiculos.get(i).getBaul()%></li>
					      <li><b>Kilometraje:</b> <%=vehiculos.get(i).getKm()%></li>
					    </ul>
					    
					    <div>
					    	<form role="form"
								action="DetalleAlquiler?vehiculo-selected=<%=vehiculos.get(i).getPatente()%>&fecha_desde=<%=fecha_desde%>&fecha_hasta=<%=fecha_hasta%>"
								method="post">
								<button type="submit" style="border: 1px solid; background: transparent;" class="btn btn-outline-dark btn-lg btn-block buy-now"
									name="btn<%=i%>">Reservar</button>
							</form>
					    </div>
					    
					    
					  </div>
					</div>
			    </div>
			    
		    <%
					}

				}
			%>
			    
			    
			</div>


			<hr>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>