<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.*"%>
<%@ page import="negocio.*"%>

<!--  
<% 
response.setHeader("Pragma", "no-cache"); 
response.setHeader("Cache-Control", "no-cache"); 
response.setDateHeader("Expires", 0);
%> 
-->


<%@ include file="WEB-INF/cabecera.jsp"%>

<div class="row">
	<div class="col-md-12">
		<div class="carousel slide" id="carousel-193883">
			<ol class="carousel-indicators">
				<li class="active" data-slide-to="0" data-target="#carousel-193883">
				</li>
				<li data-slide-to="1" data-target="#carousel-193883"></li>

				<li data-slide-to="2" data-target="#carousel-193883"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img alt="Carousel Bootstrap First"
						src="https://evolutionrentacar.com/wp-content/uploads/2017/05/Alquiler-de-Vehiculos-en-Medell%C3%ADn.png"
						width="100%" height="100px" />
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img alt="Carousel Bootstrap Second"
						src="http://www.creagroupevents.com/Resources/images/OPGRTURQWF.jpg"
						width="100%" height="100px" />
					<div class="carousel-caption"></div>
				</div>
				<div class="item">
					<img alt="Carousel Bootstrap Third"
						src="https://www.16valvulas.com.ar/wp-content/uploads/2017/11/peugeot-vehiculos-utilitari.jpg"
						width="100%" height="100px" />
					<div class="carousel-caption"></div>
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-193883"
				data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="right carousel-control" href="#carousel-193883"
				data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-4">
		<div class="jumbotron">
			<h2>¡Bienvenidos!</h2>
			<p>Nuestro trabajo es hacer que tengas una experiencia
				satisfactoria, por lo que nuestra flota consta de autos 0KM y damos
				atención personalizada a cada uno de nuestros clientes. ¡Te
				invitamos a registrarte a nuestro sitio y hacer tu reserva online!</p>
			<p>
				<a class="btn btn-warning" href="login.jsp">¡Reserve su coche
					aquí!</a>
			</p>
		</div>
	</div>
	<div class="col-md-8">
		<div class="row">
			<div class="col-md-6">
				<div class="thumbnail">
					<img alt="Bootstrap Thumbnail First" height="250px"
						src="http://www.elfinanciero.com.mx/uploads/2018/02/05/bc29e1f1231517854121_standard_desktop_medium_retina.jpeg" />
					<div class="caption">
						<h3>Autos</h3>
						<p>Te damos la bienvenida a la exhaustiva búsqueda de coches
							de alquiler de EasyCar. Te ayudamos a que tu viaje sea lo más
							barato posible, para que te pongas al volante con una sonrisa.</p>
						<form action="URLs" method="post">
							<button type="submit" class="btn btn-primary"
								style="background: #6900cc" name="btn-stock-autos">Ver</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="thumbnail">
					<img alt="Bootstrap Thumbnail Second" height="250px"
						src="https://k60.kn3.net/taringa/D/F/0/8/4/A/TaringueroAnonim/2E9.jpg" />
					<div class="caption">
						<h3>Camionetas</h3>
						<p>También te ofrecemos una amplia gama de camionetas para que
							puedas disfrutar con toda tu familia!</p>
						<form action="URLs" method="post">
							<button type="submit" class="btn btn-primary"
								style="background: #6900cc" name="btn-stock-camionetas">Ver</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="WEB-INF/footer.html"%>