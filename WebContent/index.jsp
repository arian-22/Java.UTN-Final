<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "entidades.*"%>
<%@ page import = "negocio.*"%>

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
							<li data-slide-to="1" data-target="#carousel-193883">
							</li>
							<li data-slide-to="2" data-target="#carousel-193883">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="Carousel Bootstrap First" src="http://www.autosparalquilar.com/imagenes/carousel-1.jpg" width="1000" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="Carousel Bootstrap Second" src="http://alcalaoliver.com/wp-content/uploads/2015/01/seguro_de_autos.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="Carousel Bootstrap Third" src="https://ceca-blogs-sp.s3.amazonaws.com/blogs/cotizar-un-seguro-de-auto203689.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-193883" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-193883" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="jumbotron">
						<h2>
							¡Bienvenidos!
						</h2>
						<p>
							Nuestro trabajo es hacer que tengas una experiencia satisfactoria, por lo que nuestra flota consta de autos 0KM y damos atención personalizada a cada uno de nuestros clientes. ¡Te invitamos a registrarte a nuestro sitio y hacer tu reserva online!
						</p>
						<p>
							<a class="btn btn-primary btn-large" href="#">Learn more</a>
						</p>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row">
						<div class="col-md-6">
							<div class="thumbnail">
								<img alt="Bootstrap Thumbnail First" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjHp1q20Gb_7rWsDtZoMBCMx2afInP-smD6KIkM5we-aqA9IsI" />
								<div class="caption">
									<h3>
										Autos
									</h3>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
									<p>
										<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="thumbnail">
								<img alt="Bootstrap Thumbnail Second" src="http://alnasrrentacar.com/wp-content/uploads/2016/08/hyundai.jpg" />
								<div class="caption">
									<h3>
										Camionetas
									</h3>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
									<p>
										<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>


<%@ include file="WEB-INF/footer.html"%>
	