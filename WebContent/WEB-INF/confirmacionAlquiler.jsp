<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<%@ include file="cabecera.jsp"%>

<br><br><br>

<%
if (session.getAttribute("nro-alquiler") != null) {
	int nroAlquiler = (Integer)session.getAttribute("nro-alquiler");
%>

<div style="width: 50%;  margin: auto 20%" class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title"><b>Felicidades!</b></h1>
	</div>

	<div class="panel-body">
		<div class="col-md-6">
			<h1>Su alquiler fue registrado correctamente.</h1>
			<h2>Gracias por confiar en nosotros!</h2>
			<br>
			<h3>Su n�mero de alquiler para retirar su veh�culo es: <b><%= nroAlquiler %></b></h3>	
		</div>
		<div class="col-md-6" style="text-align: center ; padding: 10em">
			<img alt="Gracias" src="https://image.freepik.com/iconos-gratis/emoticon-cuadrada-cara-sonriente-con-los-ojos-cerrados_318-58502.png" height="120px" width="auto">
		</div>
		
	</div>

	<div class="panel-footer">	
	<div class="row" style="text-align: center">
			<button style="padding: 10px ; margin-top: 10px" type="button" class="btn btn-primary" aria-label="Center Align">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Cerrar
			</button>
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