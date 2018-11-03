<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<%@ include file="cabecera.jsp"%>

<br><br><br>

<%
if (session.getAttribute("alquilerPorCancelar") != null) {
	Alquiler alq = (Alquiler)session.getAttribute("alquilerPorCancelar");
%>

<div style="width: 50%;  margin: auto 20%" class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title"><b>¿Está seguro?</b></h1>
	</div>

	<div class="panel-body">
		<div class="col-md-6">
			<h1>Usted desea cancelar el alquiler Nro°: <%= alq.getNro_alquiler() %></h1>
			<h2>Se le cobrarán cargos por un total de: </h2>
			<br>
			<h3>$ <%= alq.getImporteCancelacion() %></b></h3>	
		</div>
		<div class="col-md-6" style="text-align: center ; padding: 10em">
			<img alt="Gracias" src="http://contactoradio.com/home/wp-content/uploads/2017/11/ventaau.jpg" height="120px" width="auto">
		</div>
		
	</div>

	<div class="panel-footer">	
		<div class="row" style="text-align: center">
			<div class="col-md-6">
				<form action="ConfirmaCancelacionAlquiler" method="post">
					<button style="padding: 10px ; margin-top: 10px" type="submit" class="btn btn-danger" aria-label="Center Align">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Confirmar
					</button>
				</form>
			</div>
			<div class="col-md-6">
				<form action="URLs" method="post">
					<button name="btnVerReservas" style="padding: 10px ; margin-top: 10px" type="submit" class="btn btn-primary" aria-label="Center Align">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Salir
					</button>
				</form>
			</div>
		</div>
	</div>

</div>
<%
} else {
%>
<div class="alert alert-dismissable alert-danger">

	<button type="button" class="close" data-dismiss="alert"
		aria-hidden="true">x</button>
	<h4>
		<strong> Error! </strong>
	</h4>
	Error interno. Vuelva a intentarlo mas tarde. <a href="#"
		class="alert-link"></a>
</div>
<%
	}
%>




<%@ include file="footer.html"%>