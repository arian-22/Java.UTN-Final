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


<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="./img/imagenes/carrusel1.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>El alquiler de autos más práctico y barato para tus vacaciones está en EasyCar</h1>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="./img/imagenes/carrusel2.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>¡Sentí la libertad que te da conocer una ciudad al estar detrás del volante!</h1>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="./img/imagenes/carrusel3.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1> ¿Qué estás esperando? ¡Hacé ya mismo tus reserva y salí a la autopista!</h1>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


	<div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="./img/imagenes/subheader1.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Autos</h2>
          <p>Descubrí todos los modelos que tenemos para vos. Monovolúmen, coupé, ejecutivo, deportivo, descapotable. Podés elegir lo que más se adapte a vos!</p>
  
          	<form action="URLs" method="post">
				<button type="submit" class="btn btn-primary"
					style="background: #6900cc" name="btn-stock-autos">Ver Catálogo &raquo;
				</button>
			</form> 
		  
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="./img/imagenes/subheader2.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Camionetas</h2>
          <p>Para cada ocasión, hay un vehículo para vos. SUVs, furgoneta, pickup, utilitario.<br>El terreno que quieras atravesar, no va a ser un límite para vos.</p>
          <p>
       		<form action="URLs" method="post">
				<button type="submit" class="btn btn-primary"
					style="background: #6900cc" name="btn-stock-camionetas">Ver Catálogo &raquo;
				</button>
			</form>
		 </p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="./img/imagenes/subheader3.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Alquilar</h2>
          <p>Simplemente inicia sesión, o registrate si aún no sos cliente. Elegí la fecha de tu alquiler, seleccioná el vehículo que más te guste, confirmá lo solicitado, y retirá tu vehículo. Así de simple.</p>
          <p><a class="btn btn-success" href="login.jsp">Iniciar Sesión &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
	
	
	<!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">Beneficios de alquilar un auto. <span class="text-muted">Aprovechalo.</span></h2>
          <p class="lead">Sentí la libertad que te da conocer una ciudad al estar detrás del volante. Con tu auto podés tomar las riendas de tu tiempo y armar tu propio itinerario para recorrer y conocer todo lo que quieras. Podés elegir alquiler de autos pequeños, para pocas personas, o grandes, si vas con amigos o con tu familia. ¡Disfrutá tu destino a tu ritmo y aprovechá para conocer mucho más en tu viaje! No te vas a arrepentir de alquilar un auto.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="https://loremflickr.com/500/500/cars?random=4" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">¿Qué tener en cuenta para alquilar un auto? <span class="text-muted">Podés estar tranquilo.</span></h2>
          <p class="lead">Antes de alquilar un auto, tené en cuenta el número de pasajeros que serán en el viaje. Esto te va a ayudar a decidir el tamaño del auto. Además, prestá atención a los seguros que están incluidos en el contrato de alquiler, así como los beneficios de kilometraje ilimitado, tipo de caja y modalidad de entrega del vehículo.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src="https://loremflickr.com/500/500/cars?random=5" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">¿Qué necesitás para retirar tu auto? <span class="text-muted">No olvides nada.</span></h2>
          <p class="lead">Para retirar tu auto deberás contar con una licencia de conducir en buen estado y vigente, y presentar tu DNI. Tené en cuenta que el nombre de la persona debe ser el mismo tanto en la licencia de conducir como en el DNI/Pasaporte. Además, necesitarás tener una tarjeta de crédito a nombre del conductor principal o adicional con saldo suficiente para el bloqueo de seguridad que realiza la agencia de alquiler de autos.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="https://loremflickr.com/500/500/cars?random=6" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->

	

















<%@ include file="WEB-INF/footer.html"%>