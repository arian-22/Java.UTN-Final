<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<%@ include file="cabecera.jsp"%>

<br><br><br>

<%
	if (session.getAttribute("vehiculo") != null) {
		Vehiculos v = new Vehiculos();
		v = (Vehiculos) session.getAttribute("vehiculo");
		String fecha_desde =  session.getAttribute("fecha-desde").toString();
		String fecha_hasta = session.getAttribute("fecha-hasta").toString();
		
		//String fechaD = new SimpleDateFormat("EEEE dd 'de' MMMM 'del' YYYY").format();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date fechaD = format.parse(fecha_desde);
		Date fechaH = format.parse(fecha_hasta);
		
		
		int cantDias = (int) ((fechaH.getTime()-fechaD.getTime())/86400000);
		
		Float precioTotal = v.getPrecio() * cantDias;

		
%>

<div style="width: 50%;  margin: auto 20%" class="panel panel-info">
	<div class="panel-heading">
		<h2 class="panel-title"><b><%=v.getModelo()%> | <%=v.getMarca()%></b></h2>
	</div>

	<div class="panel-body">
		<p>Patente: <%=v.getPatente()%></p>
		<p>Kilometros: <%=v.getKm()%></p>
		<p>Fecha desde: <%= fecha_desde %>
		<p>Fecha hasta: <%= fecha_hasta %>
		<p>Precio por dia: AR$<%= v.getPrecio() %>
		<h3><b>Precio total de alquiler: AR$<%= precioTotal %> </b></h3>
		
	</div>

	<div class="panel-footer">
	<label> Tarjeta de Credito </label> <input type="number" class="form-control"	name="credit-card" />
		<button style="padding: 10px ; margin-top: 10px" type="button" class="btn btn-success" aria-label="Left Align">
			<span class="glyphicon glyphicon-align-left" aria-hidden="true"><i>Confirmar Alquiler</i></span>
		</button>
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