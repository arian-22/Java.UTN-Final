<%@ include file="cabeceraAdmin.jsp"%>


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
			<h3>
				Informes
			</h3>
			<h3 class="text-center">
				�Qu� desea hacer?
			</h3>
			<div class="row">
				<div class="col-md-12">
					 <a href="#" class="btn btn-block btn-lg btn-link" type="Ver veh�culos de EasyCar">- Ver veh�culos de EasyCar</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					 <a href="#" class="btn btn-block btn-lg btn-link" type="Ver veh�culos reservados">- Ver veh�culos reservados</a>
				</div>
			</div> 
			<form action="inicioAdmin" method="post">
				<button type="submit" class="btn btn-primary">Atr�s</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>	