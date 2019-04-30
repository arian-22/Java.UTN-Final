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
          <img class="first-slide" src="https://loremflickr.com/1840/600/cars?random=1" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <!-- <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p> -->
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="https://loremflickr.com/1840/600/cars?random=2" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <!-- <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p> -->
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="https://loremflickr.com/1840/600/cars?random=3" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <!-- <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p> -->
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
          <img class="img-circle" src="https://loremflickr.com/140/140/cars?random=7" alt="Generic placeholder image" width="140" height="140">
          <h2>Autos</h2>
          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
  
          	<form action="URLs" method="post">
				<button type="submit" class="btn btn-primary"
					style="background: #6900cc" name="btn-stock-autos">Ver Catálogo &raquo;
				</button>
			</form> 
		  
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://loremflickr.com/140/140/cars?random=8" alt="Generic placeholder image" width="140" height="140">
          <h2>Camionetas</h2>
          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
          <p>
       		<form action="URLs" method="post">
				<button type="submit" class="btn btn-primary"
					style="background: #6900cc" name="btn-stock-camionetas">Ver Catálogo &raquo;
				</button>
			</form>
		 </p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://loremflickr.com/140/140/cars?random=9" alt="Generic placeholder image" width="140" height="140">
          <h2>Alquilar</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-success" href="login.jsp">Iniciar Sesión &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
	
	
	<!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="https://loremflickr.com/500/500/cars?random=4" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7 col-md-push-5">
          <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5 col-md-pull-7">
          <img class="featurette-image img-responsive center-block" src="https://loremflickr.com/500/500/cars?random=5" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" src="https://loremflickr.com/500/500/cars?random=6" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->

	























<!-- <div class="row">
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
</div> -->

<!-- <div class="row">
	<div class="col-md-4">
		<div class="jumbotron">
			<h2>¡Bienvenidos!</h2>
			<p>Nuestro trabajo es hacer que tengas una experiencia
				satisfactoria, por lo que nuestra flota consta de autos 0KM y damos
				atención personalizada a cada uno de nuestros clientes. ¡Te
				invitamos a registrarte a nuestro sitio y hacer tu reserva online!</p>
			<p>
				<a class="btn btn-warning" href="login.jsp">¡Reserve su coche aquí!</a>
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
</div> -->


<%@ include file="WEB-INF/footer.html"%>