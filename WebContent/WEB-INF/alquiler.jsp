<%@ include file="cabecera.jsp"%>

<script type="text/javascript"> $(document).ready(function() {
	  $(".nav-tabs a").click(function() {
		    $(this).tab('show');
		  });
		  $('.nav-tabs a').on('shown.bs.tab', function(event) {
		    var x = $(event.target).text(); // active tab
		    var y = $(event.relatedTarget).text(); // previous tab
		    console.log(x);
		    console.log('y');

		    $(".act span").text(x);
		    $(".prev span").text(y);
		  });
		});
</script>

<br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h1 style="text-align: center">
				Alquileres
			</h1>
			<ul class="nav nav-tabs">
	    		<li class="active"><a href="#stock">Retirar vehiculo</a> </li>
	    		<li><a href="#alquilados">Devolucion</a></li>
	    		<li><a href="#alquilados">Cancelacion</a></li>
			</ul>
		</div>
	</div>




		<a href="javascript:window.history.go(-1);" class="btn btn-link" type="button">Atrás</a>
		<hr>
	</div>

<%@ include file="footer.html"%>	