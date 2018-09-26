<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>AHORROS - CONTRATO</h3>

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