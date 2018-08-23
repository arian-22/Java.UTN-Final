<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>

<br><br><br>

<%
	if (session.getAttribute("vehiculo") != null) {
		Vehiculos v = new Vehiculos();
		v = (Vehiculos) session.getAttribute("vehiculo");
%>

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title"><%=v.getModelo()%>
			|
			<%=v.getMarca()%></h3>
	</div>

	<div class="panel-body">
		<p>
			Patente:
			<%=v.getPatente()%>
		</p>
	</div>

	<div class="panel-footer">
		<button type="button" class="btn btn-default" aria-label="Left Align">
			<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>
		</button>
	</div>
</div>
<%
} else {
%>
<div class="alert alert-dismissable alert-danger">

	<button type="button" class="close" data-dismiss="alert"
		aria-hidden="true">×</button>
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