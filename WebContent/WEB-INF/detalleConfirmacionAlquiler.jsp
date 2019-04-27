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

		SimpleDateFormat format2 = new SimpleDateFormat("dd MMM YYYY");

		fecha_desde = format2.format(fechaD);
		fecha_hasta = format2.format(fechaH);

		int cantDias = (int) ((fechaH.getTime()-fechaD.getTime())/86400000);

		float precioTotal = v.getPrecio() * cantDias;
		
		session.setAttribute("precioTotal", precioTotal);
		
%>
<div style="height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -100;
    overflow: -webkit-paged-x;
    background-image: url(https://www.ford.mx/content/ford/mx/es_mx/home/autos/mustang/_jcr_content/par/billboard/imageComponent/image.imgs.full.high.jpg);">
	
	<div style="margin: 6% 30%; box-shadow: 0px 0px 20px 4px;" class="panel panel-info">
		<div class="panel-heading" style="text-align: center;">
			<h1 class="panel-title" style="font-size: 26px; font-weight: bold;">Datos del Alquiler</h1>
		</div>
	
		<div class="panel-body" style="text-align: center; font-size: 18px;">
		
			<div class="row">
				<div class="col-md-6">
					<h3><b><%=v.getModelo()%> | <%=v.getMarca()%></b></h3>
					<hr>
					
					<p><b>Patente</b> 
					<p><%=v.getPatente()%></p>
					
					<p><b>Kilometros</b></p>
					<p><%=v.getKm()%></p>
					
					<p><b>Transmisión</b></p>
					<p><%=v.getTransmision()%></p>
				</div>
				
				<div class="col-md-6">
					<h3><b>Resumen</b></h3>
					<hr>
					
					<p><b>Desde</b></p>
					<p><%= fecha_desde %></p>
				
					<p><b>Hasta</b></p>
					<p><%= fecha_hasta %></p>
				
					<p><b>Precio por dia</b></p>
					<p>AR$ <%= v.getPrecio() %></p>
				</div>
			</div>
			<hr>
			<div>
				<h3><b>Precio total de alquiler</b></h3>
				<p><span class="label label-default colorFondoBase" style="font-size: 28px;">AR$ <%= precioTotal %></span></p>
			</div>
		</div>
	
		<div class="panel-footer">
		
			<form action="RegistrarAlquiler" role="form" method="post">
				<div style="text-align: -webkit-center;">
					<label> Tarjeta de Credito </label> 
					<input style="width: 300px;" type="text" maxlength="20" minlength="18" title="Ingrese un número válido de Tarjeta de Crédito" pattern="[0-9]{18,20}" class="form-control" name="credit-card" required/>
				</div>
				
				<hr>
				<div class="row">	
					<div class="col-md-6" style="text-align: left;">
						<a href="javascript:window.history.go(-1);" class="btn btn-danger" style="padding: 10px ; margin-top: 10px"type="button">
							<span class="glyphicon glyphicon-circle-arrow-left" aria-hidden="true" style="padding-right: 10px;"></span>Volver
						</a>						
					</div>
					<div class="col-md-6" style="text-align: right;">
						<button type="submit" style="padding: 10px ; margin-top: 10px" type="button" class="btn btn-success" aria-label="Right Align">
							Confirmar Alquiler
							<span class="glyphicon glyphicon-menu-right" aria-hidden="true" style="padding-left: 10px;"></span>
						</button>
					</div>
				</div>
			</form>
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
</div>



<%@ include file="footer.html"%>