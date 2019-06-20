<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="cabecera.jsp"%>

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

<!-- Modal para errores  -->
<% 
String titleModal = "";
String typeBtn = "";
String textModal = "";
if(session.getAttribute("errorModal") != null){ 
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
<%
}
%>
<!-- Modal -->
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
<!-- Fin Modal -->

<br>
<br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">

			<h1 style="text-align: center">Mis Reservas</h1>
			<div id="stock" class="tab-pane fade in active">

				<div class="container-fluid">
					<table class="table table-hover">
						<thead>
							<tr class="bg-primary colorFondoBase">
								<th scope="col">Número de Alquiler</th>
								<th scope="col">Fecha de Comienzo</th>
								<th scope="col">Fecha de Fin</th>
								<th scope="col">Fecha de Cancelación</th>
								<th scope="col">Precio</th>
								<th scope="col">Marca</th>
								<th scope="col">Modelo</th>
								<th scope="col">Kilometraje</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<%
								Date hoy = new Date();
								java.sql.Date hoy2 = new java.sql.Date(hoy.getTime()) ;
								if (session.getAttribute("alquileresCliente") != null) {
									ArrayList<Cli_Veh_Alq> cva = new ArrayList<Cli_Veh_Alq>();
									cva = (ArrayList<Cli_Veh_Alq>) session.getAttribute("alquileresCliente");																	

									for (int i = 0; i < cva.size(); i++) {
										
										String colorEstado = "";
										boolean esCancelable = false;
										
										String estado = "Cancelado";
										String classEstado = "warning";
										
										if(cva.get(i).getAlquiler().getFechaCancelacion() == null){
											estado = "Finalizado";
											classEstado = "success";
										}
										
										if( (cva.get(i).getAlquiler().getFechaDesde().after(hoy) ) && (cva.get(i).getAlquiler().getFechaCancelacion() == null &&  cva.get(i).getAlquiler().getFechaFinalizacion() == null) ){
											colorEstado = "#3881a061";
											esCancelable = true;
											
										}
										
									%>
									<tr style="background-color:<%= colorEstado%>;">
		
										<th scope="row"><%=cva.get(i).getAlquiler().getNro_alquiler()%></th>
										
										<td>
											<%
											DateFormat fmt1 = new SimpleDateFormat("dd MMMM yyyy");
											String text1 = fmt1.format(cva.get(i).getAlquiler().getFechaDesde());
											%>
											
											<%=text1%>
										</td>
										
										<td>
											<%
											DateFormat fmt2 = new SimpleDateFormat("dd MMMM yyyy");
											String text2 = fmt1.format(cva.get(i).getAlquiler().getFechaHasta());
											%>
											<%=text2%>
										</td>
										
										<td>
										<% if (cva.get(i).getAlquiler().getFechaCancelacion() == null){
										%>
											<p>  -  </p>
										<%}else {
										    //SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy");  
											Date date = new SimpleDateFormat("yyyy-mm-dd").parse(cva.get(i).getAlquiler().getFechaCancelacion());
											
											DateFormat fmt = new SimpleDateFormat("dd MMMM yyyy");
											String text = fmt.format(date);

										 %><%=text%>
										<%										
											} 
										%>
										</td>
										<td>$ <%=cva.get(i).getAlquiler().getPrecioAlquiler()%></td>
										<td><%=cva.get(i).getVehiculo().getMarca()%></td>
										<td><%=cva.get(i).getVehiculo().getModelo()%></td>
										<td><%=cva.get(i).getVehiculo().getKm()%> Kms.</td>
										<td style="text-align: center;">
												
										<% if(esCancelable){ %>
											<form role="form" action="CancelacionCliente?alquiler-selected=<%=cva.get(i).getAlquiler().getNro_alquiler()%>" method="post">
												<button type="submit" class="btn btn-danger" name="btn<%=i%>">Cancelar</button>
											</form>
										<% } else { %>
											<span class="label label-<%=classEstado%>"><%=estado%></span>
										<%} %>
													
										</td>
									</tr>
									<%
								}
							}
							%>
						</tbody>
					</table>
				</div>
			</div>			
			<hr>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>