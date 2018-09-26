<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>AHORROS - EXTRACTO</h3>

   <table id="tdatos" class="display" width="100%">
   <thead>
   <tr>
      <th>#</th>
      <th>N</th>
      <th>IDSOCIO</th>
      <th>SOCIO</th>
      <th>N° CUENTA</th>
      <th>AHORRO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>
      <th>F APERTURA</th>
      <th>F VENCIMIENTO</th>
      <th>SALDO</th>
      <th>ACCIONES</th>
   </tr>
   </thead>
   <tbody>
   </tbody>
   <tfoot>
   <tr>
      <th>#</th>
      <th>N</th>
      <th>IDSOCIO</th>
      <th>SOCIO</th>
      <th>N° CUENTA</th>
      <th>AHORRO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>
      <th>F APERTURA</th>
      <th>F VENCIMIENTO</th>
      <th>SALDO</th>
      <th>ACCIONES</th>
   </tr>
   </tfoot>
   </table>
</div>


  <div id="dmodextractoahorro" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:800px;">
      <div class="dmodaltitulo">EXTRACTO AHORRO
      </div>

      <div id="dextractoahorro" class="dmodalcontenido" style="height: 520px; overflow: auto;">
      </div>

    </div>  
  </div>
