<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>PAGO DE CUOTAS</h3>

  <table id="tdatos" class="display" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>ID</th>
      <th>SOCIO</th>
      <th>PRESTAMO</th>
      <th>MONTO</th>
      <th>F PRESTAMO</th>
      <th>PLAZO</th>
      <th>ESTADO</th>
      <th>CUENTA</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>ID</th>
      <th>SOCIO</th>
      <th>PRESTAMO</th>
      <th>MONTO</th>
      <th>F PRESTAMO</th>
      <th>PLAZO</th>
      <th>ESTADO</th>
      <th>CUENTA</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>

</div>

  <div id="dmodpagocuota" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:620px;">
      <div class="dmodaltitulo">PAGO DE CUOTA DE PRESTAMO          
      </div>
      <div id="dcontenidopagocuota" class="dmodalcontenido" style="height: 500px; overflow: auto;">
 
      </div>
    </div>  
  </div>


  <div id="dticketcuota" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketcuota" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
  </div>