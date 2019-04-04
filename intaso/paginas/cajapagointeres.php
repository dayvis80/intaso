<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
      include('../phps/dataahorro.php');
      $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
   }
?>


<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - PAGO INTERES</h3>
<center>
<div id="dinfo"> 
  <?php
  if (!$_POST){
    interes();
  }else{
    interes();
    previo();
  }
  ?>
</div>
</center>
</div>


<?php
function interes(){
?>
   <table class="tpinfo" id="tasocio" style="width: 840px;">
   <tr><td>
   <div id="dcuotas" class='dpagina' style="display: block;">
      <table class="tpagina">
      <caption>INFORMACIÓN DE PAGO DE INTERES</caption>     
      <tr>
         <th width="5%">#</th>
         <th width="45%">PRODUCTO</th>
         <th width="10%">PLAZO</th>
         <th width="10%">MONEDA</th>
         <th width="10%">CANTIDAD</th>
         <th width="20%">ULTIMO PAGO</th>          
      </tr>
         <?php
            $query = pg_query("select descripcion, plazo, moneda, count(*) as total, min(fpinteres) as fecha from tahorro where sucursal='1' group by descripcion,plazo,moneda order by descripcion");
            $tregistros = pg_numrows($query);
           for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);      
              echo '<tr><td align="center">'.$i.'</td>';
              echo '<td align="center">'.$registros[descripcion].'</td>';
              echo '<td align="center">'.$registros[plazo].'</td>';
              echo '<td>'.$registros[moneda].'</td>';
              echo '<td align="center">'.$registros[total].'</td>';
              echo '<td style="align:center;">'.$registros[fecha].'</td></tr>';
           }
              pg_free_result($query);
         ?>
      </table>
   </div>
   </td></tr>
   </table>

   <table class="tpinfo" id="tasocio" style="width: 840px;">
   <tr><td colspan="2"><h2>PAGO DE INTERES MENSUAL<h2></td>
      <td></td>
      <td></td>
      <td rowspan="2"><button id="bcpimostrar" class="bsistema"><img src="../recursos/bmostrar.png"/><span>MOSTRAR</span></button></td>
   </tr>
   <tr><td>PRODUCTO:</td>
       <td><select name="acpidescripcion" id="acpidescripcion" class="opcionm">
          <?php
            $query = pg_query("select distinct descripcion from tahorro where sucursal='1' order by descripcion");
            $tregistros = pg_numrows($query);
           for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);      
              //$valores=$registros[idtipoahorro].'&'.$registros[descripcion].'&'.$registros[plazo].'&'.$registros[tem].'&'.$registros[moneda].'&'.$registros[montomin].'&'.$registros[montomax];
              //echo "<option value='".$valores."'>".$registros[descripcion]." ".$registros[plazo]."</option>";
              echo "<option value='$registros[descripcion]'>".$registros[descripcion]."</option>";
           }
            pg_free_result($query);
        ?>
       </select></td>
       <td>PERIODO:</td>
       <td><select id="acpipagomes" class="">
          <option value=''></option>
          <option value='1'>ENERO</option><option value='2'>FEBRERO</option><option value='3'>MARZO</option>
          <option value='4'>ABRIL</option><option value='5'>MAYO</option><option value='6'>JUNIO</option>
          <option value='7'>JULIO</option><option value='8'>AGOSTO</option><option value='9'>SEPTIEMBRE</option>
          <option value='10'>OCTUBRE</option><option value='11'>NOVIEMBRE</option><option value='12'>DICIEMBRE</option>
       </select></td>
      </tr>
   </table>
<?php  
}
?>

<?php
function previo(){
$descripcion=$_POST['descripcion'];
$mespago=$_POST['mespago'];
$factual = date("d-m-Y");
//$mod_date = strtotime($fapertura."+".$plazo."months");
//$fvencimiento=date("d-m-Y",$mod_date);
  // --->1 Buscamos la ultima cuenta de Ahorro y sumamos uno para la siguiente cuenta

//  if($registros[num]==null){
//    $ncuenta=30000001;
//  }else{
//    $ncuenta=$registros[num]+30000001;
//  }
?>
   <div id="dpagointeres" class='dpagina' style="display: none;">
   <img src="../recursos/logoian.png"/>
   <hr>
   <br>
   <center><h2>INFORMACIÓN DE CUENTAS A PAGAR</h2></center>
   <br>
   <table class="tpagina">
      <caption>DATOS DE LAS CUENTAS</caption>     
      <tr>
         <th width="3%">ID</th>
         <th width="50%">SOCIO</th>
         <th width="11%">CUENTA</th>
         <th width="5%">TEM</th>
         <th width="12%">F. PAGO</th>
         <th width="10%">INTERES</th>
         <th width="9%">REDONDEO</th>
      </tr>
         <?php
           $query = pg_query("select ta.idahorro, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio,ta.cuenta,ta.plazo,ta.tem,ta.fapertura,ta.fvencimiento,ta.fpinteres from tahorro as ta, tsocio as ts where ta.idsocio=ts.idsocio and ta.descripcion like '". $descripcion ."' and ta.sucursal='1' order by ta.fapertura;");
           $tregistros = pg_numrows($query);
           for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo '<tr><td align="center">'.$i.'</td>';
              echo '<td align="center">'.$registros[socio].'</td>';
              echo '<td align="center">'.$registros[cuenta].'</td>';
              echo '<td>'.$registros[tem].'%</td>';
              echo '<td>'.$registros[fpinteres].'</td>';
              //echo '<td align="center">'.$registros[total].'</td>';
              list($pinteres,$udia)=cinteres($registros[fpinteres],$mespago,$registros[cuenta],$registros[tem]);
              echo '<td style="align:center;">S/. '. $pinteres .'</td>';
              echo '<td style="align:center;">S/. '. number_format($pinteres,2,"."," ") .'</td></tr>';
           }
              pg_free_result($query);
         ?>
   </table>
   <br>
   <center><button id="bcpipagar" class="bsistema"><img src="../recursos/bpagar.png"/><span>PAGAR</span></button></center>
   </div>

<?php  
}
?>

<?php
pg_close($BD_conn);
?>