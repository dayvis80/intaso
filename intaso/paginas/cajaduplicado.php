<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>


<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - DUPLICADO DE OPERACIONES</h3>
<center>
   <div id="dinfo"> 
   <?php
   if (!$_POST){
      flujo();
   }else{
      flujo();
      duplicado();
   }
   ?>
   </div>
</center>
</div> 


<?php
function flujo(){
?>
<table class="tpinfo" style="width: 840px; padding:10px;">
   <tr><td><h3>SELECCIONAR INFORMACIÓN</h3></td>
      <td>FECHA:</td>
      <td><input type="date" id="acdopefecha" class="textom"></td>
      <td>MOVIMIENTO</td>
      <td><select id="acdopemovimiento">
        <option value="E">ENTRADAS</option>
        <option value="S">SALIDAS</option>
        </select></td>
      <td><button id="bcdopemostrar" class="bsistema"><img src="../recursos/bflujo.png"/><span>MOSTRAR</span></button></td>
   </tr>
</table>
<?php  
}
?>

<?php
function duplicado(){
$fecha=$_POST['fecha'];
?>
<br>
<center><h2>OPERACIONES DETALLADAS DEL <?php echo $fecha;?></h2></center>
	<table id="tdatos" class="display" width="100%">
	<thead>
      <tr>
        <th>#</th>
        <th>IDMOVIMIENTO</th>
        <th>SOCIO</th>
        <th>DESCRIPCION</th>
        <th>CUENTA</th>
        <th>MONEDA</th>
        <th>MONTO</th>
        <th>FECHAMOV</th>
        <th>TIPOMOV</th>
        <th>OPERACIÓN</th>
        <th>NUMEROMOV</th>
        <th>MOVIMIENTO</th>
        <th>PAGO</th>
        <th>ACCIONES</th>        
      </tr>
		</thead>
		<tbody>
		</tbody>
		<tfoot>
	  <tr>
        <th>#</th>
        <th>IDMOVIMIENTO</th>
        <th>SOCIO</th>
        <th>DESCRIPCION</th>
        <th>CUENTA</th>
        <th>MONEDA</th>
        <th>MONTO</th>
        <th>FECHAMOV</th>
        <th>TIPOMOV</th>
        <th>OPERACIÓN</th>
        <th>NUMEROMOV</th>
        <th>MOVIMIENTO</th>
        <th>PAGO</th>
        <th>ACCIONES</th>     
	  </tr>
	</tfoot>
	</table>

<div id="dticketduplicado" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketduplicado" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>

<?php  
}
?>


 