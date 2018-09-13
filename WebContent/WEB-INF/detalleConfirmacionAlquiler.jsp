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
				
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date fechaD = format.parse(fecha_desde);
		Date fechaH = format.parse(fecha_hasta);
		System.out.println("Acaaaa1: " + fecha_desde);
		System.out.println("Acaaaa2: " + fechaD);
		
		SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/YYYY");

		fecha_desde = format2.format(fechaD);
		fecha_hasta = format2.format(fechaH);
		
		System.out.println("Acaaaa3: " + fecha_desde);
	
		int cantDias = (int) ((fechaH.getTime()-fechaD.getTime())/86400000);
		
		System.out.println("CAntidad de dias: " + cantDias);
		
		Float precioTotal = v.getPrecio() * cantDias;

		
%>

<div style="width: 50%;  margin: auto 20%" class="panel panel-info">
	<div class="panel-heading">
		<h1 class="panel-title"><b><%=v.getModelo()%> | <%=v.getMarca()%></b></h1>
	</div>

	<div class="panel-body">
		<p>Patente: <%=v.getPatente()%></p>
		<p>Kilometros: <%=v.getKm()%></p>
		<p>Fecha desde: <%= fecha_desde %>
		<p>Fecha hasta: <%= fecha_hasta %>
		<p>Precio por dia: AR$<%= v.getPrecio() %>
		<h3><b>Precio total de alquiler: <span class="label label-default">AR$<%= precioTotal %></span></b></h3>
		
	</div>

	<div class="panel-footer">
	<label> Tarjeta de Credito </label> <input type="number" class="form-control"	name="credit-card" />
	
	<div class="row">
		<div class="col-md-6">
			<button style="padding: 10px ; margin-top: 10px" type="button" class="btn btn-success" aria-label="Left Align">
				<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>Confirmar Alquiler
			</button>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button style="padding: 10px ; margin-top: 10px" type="button" class="btn btn-danger" aria-label="Left Align">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Cancelar
			</button>
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