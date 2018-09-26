<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>PRESTAMOS - EXTRACTO</h3>

   <table id="tdatos" class="display" width="100%">
	 <thead>
      <tr>
        <th>#</th>
        <th>SOCIO</th>
        <th>CUENTA</th>
        <th>PRESTAMO</th>
        <th>MONTO</th>
        <th>CUOTAS</th>
        <th>V. CUOTA</th>
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
        <th>CUENTA</th>
        <th>PRESTAMO</th>
        <th>MONTO</th>
        <th>CUOTAS</th>
        <th>V. CUOTA</th>
        <th>PLAZO</th>
        <th>TEM</th>
        <th>FEC. PAGO</th>
        <th>F. PRESTAMO</th>
        <th>ACCIONES</th>
	 </tr>
	 </tfoot>
	 </table>
</div>


  <div id="dmodextractoprestamo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:800px;">
      <div class="dmodaltitulo">EXTRACTO PRESTAMO
      </div>

      <div id="dextractoprestamo" class="dmodalcontenido" style="height: 520px; overflow: auto;">
      </div>

    </div>  
  </div>
