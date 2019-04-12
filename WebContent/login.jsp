<%@ include file="WEB-INF/cabecera.jsp"%>
<%@page import="java.util.ArrayList"%>

<%
	String titleModal = "";
	String typeBtn = "";
	String textModal = "";
%>
<!-- Modal para errores  -->
<% if(session.getAttribute("errorModal") != null){ 
	titleModal = "Error";
	typeBtn = "btn-danger";
	textModal = (String) session.getAttribute("errorModal");
	session.removeAttribute("errorModal");
%>
<script>
$(document).ready(function(){
	$('#myModal').modal({
	  keyboard: false
	})
});
</script>

<%}%>
<div class="row">
	<div class="col-md-12" style="height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -100;
    overflow: -webkit-paged-x;
    background-size: cover;
    background-image: url('https://cdn.cienradios.com/wp-content/uploads/sites/3/2019/03/Tesla-auto.jpg')">
    
		<div class="col-md-9" style="width:50%; height:100%; margin-top:5%; margin-bottom:23%; margin-left:25%; padding-left: 150px; padding-right: 150px;">
			<h1 class="text-center">Iniciar Sesión</h1>
			<form role="form" action="Login" method="post">
				<div class="form-group">
					<div class="input-box">
						<label style="color: #FFFFFF; font-size: 14px"> Email </label> 
						<input type="email" class="form-control" name="mail" />
					</div> 
					<div class="input-box" style="padding-top: 5px">
						<label style="color: #FFFFFF; font-size: 14px"> Contraseña </label> 
						<input type="password" class="form-control" name="pass" />
					</div>
				</div>
				<div class="row baja-botones">
					<div class="col-md-6">
						<button type="submit" class="btn btn-primary btn-block" style="background: #3881a0; text-align: center">Iniciar sesión</button>
					</div>
					<div class="col-md-6">
						<a href="registrarse.jsp" type="button" class="btn btn-block" style="color: #ffffff; background: #fea500; text-align: center"> Registrarse </a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="WEB-INF/footer.html"%>