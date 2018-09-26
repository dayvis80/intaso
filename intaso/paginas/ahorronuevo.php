<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
      $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
   }
?>


<div id="dcontenedor">
<h3 class='titulocontenedor'>AHORROS - NUEVA CUENTA</h3>
<center>
<div id="dinfo"> 
  <?php
  if (!$_POST){
    ahorro();
  }else{
    ahorro();
    previo();
  }
  ?>
</div>
</center>
</div>


<?php
function ahorro(){
?>
   <table class="tpinfo" id="tasocio" style="width: 840px;">
   <tr><td colspan="2"><h2>INFORMACIÓN DEL SOCIO<h2></td>
      <td>DNI SOCIO:</td>
      <td><input type="text" name="aandni" id="aandni" class="texto pequeno"></td>
      <td><button id="banbuscarsocio" class="bsistema"><img src="../recursos/socio.png"/><span>BUSCAR</span></button></td>
   </tr>
   <tr><td colspan="2">NOMBRE</td>
      <td colspan="2">DIRECCIÓN</td>
      <td>TIPO</td>
      </tr>
   <tr class="separar"><td colspan="2"><input type="text" name="aansocio" id="aansocio" class="textog"></td>
      <td colspan="2"><input type="text" name="aandireccion" id="aandireccion" class="textog"></td>
      <td><input type="text" name="aantipo" id="aantipo" class="textop">
      <input type="text" name="aanidsocio" id="aanidsocio" class="textop" style="display: none;"></td>
   </tr>
   </table>

   <table class="tpinfo" id="taahorro" style="width: 840px;">
   <tr class="separar">
      <td colspan="2"><h2>INFORMACIÓN CUENTA DE AHORRO</h2></td>
      <td>SELECCIONAR AHORRO</td>
       <td><select name="aantipoahorro" id="aantipoahorro" class="opcionm">
          <?php
            $query = pg_query("select idtipoahorro, descripcion, plazo, tem, moneda, montomin, montomax from ttipoahorro;");
            $tregistros = pg_numrows($query);
           for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);      
              $valores=$registros[idtipoahorro].'&'.$registros[descripcion].'&'.$registros[plazo].'&'.$registros[tem].'&'.$registros[moneda].'&'.$registros[montomin].'&'.$registros[montomax];
              echo "<option value='".$valores."'>".$registros[descripcion]." ".$registros[plazo]."</option>";
           }
        ?>
       </select></td>
       <td><button id="bangenerar" class="bsistema"><img src="../recursos/ahorro.png"/><span>GENERAR</span></button></td>
   </tr>

   <tr>
      <td>TEM %</td>
      <td>PLAZO EN MESES</td>
      <td>MONEDA</td>
      <td>MONTO APERTURA</td>
   </tr>
   <tr><td><input type="text" name="aantem" id="aantem" class="textop"></td>
       <td><input type="text" name="aanplazo" id="aanplazo" class="textop"></td>
       <td><select id="aanmoneda">
          <option value="SOL">S/.</option>
          <option value="DOL">$</option>
          <option value="EUR">€</option>
       </select></td>
       <td><input type="text" name="aanmonto" id="aanmonto" class="textop"></td>
   </tr>
   <tr>
   </tr>
   </table>
<?php  
}
?>

<?php
function previo(){
$idsocio=$_POST['idsocio'];
$dni=$_POST['dni'];
$socio=$_POST['socio'];
$direccion=$_POST['direccion'];
$tahorro=$_POST['tahorro'];
$tem=$_POST['tem'];
$plazo=$_POST['plazo'];
$moneda=$_POST['moneda'];
$monto=$_POST['monto'];
$fapertura = date("d-m-Y");
$mod_date = strtotime($fapertura."+".$plazo."months");
$fvencimiento=date("d-m-Y",$mod_date);
  // --->1 Buscamos la ultima cuenta de Ahorro y sumamos uno para la siguiente cuenta
  $query = pg_query("select max(idahorro) as num from tahorro;");
  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

  if($registros[num]==null){
    $ncuenta=30000001;
  }else{
    $ncuenta=$registros[num]+30000001;
  }
?>
   <div id="dcuotas" class='dpagina' style="display: block;">
   <img src="../recursos/logoian.png"/>
   <hr>
   <br>
   <center><h2>DATOS DE LA CUENTA DE AHORRO</h2></center>
   <br>
   <table class="tpagina">
      <caption>DATOS DEL SOCIO</caption>     
      <tr>
         <th width="15%">CODIGO:</th>
         <th width="15%">DNI:</th>
         <th width="35%">NOMBRES:</th>
         <th width="35%">DIRECCIÓN:</th>          
      </tr>
      <tr class="separar">
         <td><?php echo ($idsocio+100000)?></td>
         <td><?php echo $dni?></td>
         <td><?php echo $socio?></td>
         <td><?php echo $direccion?></td>   
      </tr>
      <tr>
        <td colspan="4" class='caption'>DATOS DE LA CUENTA DE AHORRO:</th>
     </tr>
     <tr>
        <th>N° CUENTA:</th>
        <th>TIPO AHORRO:</th>
        <th>TEM:</th>
        <th>PLAZO:</th>
     </tr>
     <tr>
        <td><label id="lanncuenta"><?php echo $ncuenta?></label></td>
        <td><?php echo $tahorro?></td>
        <td><?php echo $tem?> %</td>
        <td><?php echo $plazo?> Meses</td>
     </tr>
     <tr>
        <th>MONTO APERTURA:</th>
        <th>FECHA APERTURA:</th>
        <th>FECHA DE VENCIMIENTO:</th>
        <th>INTERES ESTIMADO:</th>
     </tr>
     <tr>
        <td> S/. <?php echo $monto?></td>
        <td><?php echo $fapertura?></td>
        <td><?php echo $fvencimiento?></td>
        <td> VARIABLE </td>
     </tr>
   </table>
   <br>
   <center><button id="banguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button></center>
   </div>

  <div id="dticketahorro" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketahorro" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>

<?php  
}
?>


<?php
  pg_free_result($query);
  pg_close($BD_conexion);
?>