<%@page import="java.util.ArrayList"%>
<%@ include file="cabecera.jsp"%>
<%@ page import="entidades.*"%>

<br>
<br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h2>Nuestras Camionetas</h2>
			<hr>			
			
			<div class="row">
			
			<%
			 if(session.getAttribute("vehiculos-stock")!=null){ 
			  ArrayList<Vehiculos> vehiculos = new ArrayList<Vehiculos>();
			  vehiculos = (ArrayList<Vehiculos>)session.getAttribute("vehiculos-stock");
			  
				  for(int i = 0 ; i < vehiculos.size() ; i++){
		 	 %>	
	  
			    <div class="col-sm-6 col-md-4 col-lg-3 ">
			  
					<div class="card card-price">
					  <div class="card-img">
					      <img src="https://loremflickr.com/600/400/cars?random=<%= i %>" class="img-responsive">
					      <div class="card-caption">
					        <span class="h2"><%=vehiculos.get(i).getModelo()%></span>
					        <p><%=vehiculos.get(i).getMarca()%></p>
					      </div>
					  </div>
					  <div class="card-body">
					    <div class="price">$<%=vehiculos.get(i).getPrecio()%> <small>por día</small></div>
					    <div class="lead">Patente <b><%=vehiculos.get(i).getPatente()%></b></div>
					    <ul class="details">
					      <li>Transmisión: <%=vehiculos.get(i).getTransmision()%></li>
					      <li>Año: <%=vehiculos.get(i).getAnio()%></li>
					      <li>Cantidad Asientos: <%=vehiculos.get(i).getCantAsientos()%></li>
					      <li>Baúl: <%=vehiculos.get(i).getBaul()%></li>
					      <li><b>Kilometraje:</b> <%=vehiculos.get(i).getKm()%></li>
					    </ul>
					    
					    <%-- <div>
					    	<form role="form"
								action="DetalleAlquiler?vehiculo-selected=<%=vehiculos.get(i).getPatente()%>&fecha_desde=<%=fecha_desde%>&fecha_hasta=<%=fecha_hasta%>"
								method="post">
								<button type="submit" style="border: 1px solid; background: transparent;" class="btn btn-outline-dark btn-lg btn-block buy-now"
									name="btn<%=i%>">Reservar</button>
							</form>
					    </div>
					     --%>
					    
					  </div>
					</div>
			    </div>
			    
		    <%
					}

				}
			%>
			    
			    
			</div>
					
			
		</div>
	</div>	
</div>
<hr>

<%@ include file="footer.html"%>






