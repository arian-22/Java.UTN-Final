<%@ include file="WEB-INF/cabecera.jsp"%>

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

<div class="row centrado" style="margin-left: 30%; margin-right: 30%;">
	<div class="col-md-12 formulario-ABM ">
		<h3 class="text-center">Nuevo Registro</h3>

		<form role="form" action="Registro" method="post">
			<div class="form-group">
				<label> Nombre </label> <input type="text" class="form-control"
					name="nombre" required/>
			</div>
			<div class="form-group">
				<label> Apellido </label> <input type="text" class="form-control"
					name="apellido" required />
			</div>
			<div class="form-group">
				<label> Email address </label> <input type="email"
					class="form-control" name="mail" required/>
			</div>
			<div class="form-group">
				<label> Contraseña </label> <input type="password"
					class="form-control" name="contrasena" required />
			</div>
			<div class="form-group">

				<label> Repetir Contraseña </label> <input type="password"
					class="form-control" name="contrasena2" required />
			</div>
			<div class="form-group">
				<label> Fecha de nacimiento </label> <input type="date"
					class="form-control" name="fechaNacimiento" required/>
			</div>
			<div class="form-group">

				<label> Documento de Identidad </label> <input type="number"  maxlength="12" max="99999999999" 
					class="form-control" name="dni" required />
			</div>

			<div class="form-group">

				<label> Fecha de vencimiento de licencia de conducir </label> <input
					type="date" class="form-control" name="fechaVencimientoLicencia" required/>
			</div>
			<div class="form-group">
				<label> Dirección </label> <input type="text" class="form-control"
					name="direccion" required/>
			</div>
			<div class="form-group">
				<label> Teléfono </label> <input type="number" class="form-control"
					name="telefono" required/>
			</div>

			<button type="submit" class="btn btn-primary btn-block">
				Registrarse!</button>
		</form>
	</div>
</div>



<%@ include file="WEB-INF/footer.html"%>