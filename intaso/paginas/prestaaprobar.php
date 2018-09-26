<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>PRESTAMOS - APROBACION</h3>

	<table id="tdatos" class="display" width="100%">
	<thead>
      <tr>
        <th>#</th>
        <th>SOCIO</th>
        <th>N° PREST.</th>
        <th>PRESTAMO</th>
        <th>MONTO</th>
        <th>CUOTAS</th>
        <th>V CUOTA</th>
        <th>PLAZO</th>
        <th>TEM</th>
        <th>FEC. PAGO</th>
        <th>F. PRESTAMO</th>
        <th>ACCIONES</th>
      </tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
	  <tr>
        <th>#</th>
        <th>SOCIO</th>
        <th>N° PREST.</th>
        <th>PRESTAMO</th>
        <th>MONTO</th>
        <th>CUOTAS</th>
        <th>V CUOTA</th>
        <th>PLAZO</th>
        <th>TEM</th>
        <th>FEC. PAGO</th>
        <th>F. PRESTAMO</th>
        <th>ACCIONES</th>
	  </tr>
	</tfoot>
	</table>
</div>


  <div id="dmoddetalleprestamo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:780px;">
      <div class="dmodaltitulo">APROBAR PRESTAMO
      </div>

      <div id="dcontenidoprestamo" class="dmodalcontenido" style="height: 500px; overflow: auto;">
      </div>

    </div>  
  </div>


  <div id="dticketdesem" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketdesem" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>