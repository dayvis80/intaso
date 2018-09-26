<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>DUPLICADO CERTIFICADO</h3>

	<table id="tdatos" class="display" width="100%">
	<thead>
      <tr>
      <th>#</th>
      <th>ID</th>
      <th>N° SOCIO</th>
      <th>DOC.</th>
      <th>NUMERO</th>
      <th>SOCIO</th>
      <th>AFILIACION</th>
      <th>F REGISTRO</th>
      <th>AFILIADO</th>      
      <th>TRABAJADOR</th>
      <th>ACCIONES</th>
      </tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
	  <tr>
      <th>#</th>
      <th>ID</th>
      <th>N° SOCIO</th>
      <th>DOC.</th>
      <th>NUMERO</th>
      <th>SOCIO</th>
      <th>AFILIACION</th>
      <th>F REGISTRO</th>
      <th>AFILIADO</th>
      <th>TRABAJADOR</th>
      <th>ACCIONES</th>
	  </tr>
	</tfoot>
	</table>
</div>