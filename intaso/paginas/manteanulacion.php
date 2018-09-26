<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>


<div id="dcontenedor">
<h3 class='titulocontenedor'>MANTENIMIENTO - ANULAR OPERACIONES</h3>
<center>
   <div id="dinfo"> 
   <?php
   if (!$_POST){
      flujo();
   }else{
      flujo();
      anulacion();
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
      <td><input type="date" id="amaopefecha" class="textom"></td>
      <td>MOVIMIENTO</td>
      <td><select id="amaopemovimiento">
        <option value="E">ENTRADAS</option>
        <option value="S">SALIDAS</option>
        </select></td>
      <td><button id="bmaopemostrar" class="bsistema"><img src="../recursos/bflujo.png"/><span>MOSTRAR</span></button></td>
   </tr>
</table>
<?php  
}
?>

<?php
function anulacion(){
$fecha=$_POST['fecha'];
?>
<br>
<center><h2>OPERACIONES DEL <?php echo $fecha;?></h2></center>
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

  <div id="dmodanularope" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:360px;">
      <div class="dmodaltitulo">ANULAR OPERACIÓN          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="320px" style="font-size: 14px;"><label>SE PROCEDERA A ANULAR LA OPERACIÓN N°:</label></td>
          </tr>
          
          <tr class="separar">
            <td style="font-size: 20px; text-align:center;"><label id="lamaoperacion"></label>  <label id="lamaidmov" style="display: none;"></label><label id="lamatipomov" style="display: none;"></label></td>
          </tr>

          <tr class="separar">
            <td style="font-size: 16px; text-align:center;">MONTO DE OPERACIÓN: S/. <label id="lamamonto"></label></td>
          </tr>
        </table>   

        <button id="bmaopeanular" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>ANULAR</span></button>
        <button id="bmaopecancelar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>

<?php  
}
?>
