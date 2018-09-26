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
<h3 class='titulocontenedor'>CAJA - BILLETAJE</h3>
<center>
   <div id="dinfo"> 
      <?php
      if (!$_POST){
         billetaje();
      }else{
         billetaje();
         detalle();
      }
   ?>
   </div>
</center>
</div> 

<?php
function billetaje(){
?>
<table class="tpinfo" style="width: 840px; padding:10px;">
<tr><td><h3>INGRESAR DATOS</h3></td>
    <td>FECHA:</td>
    <td><input type="date" id="acrfecha" class="textom"></td>
    <td><select name="acrpromotor" id="acrpromotor" class="opciong">
        <?php
            $query = pg_query("select idtrabajador as promotor, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador where tipotrabajador='12' or tipotrabajador='3';");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
               $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
               echo "<option value='".$registros[promotor]."'>".$registros[nombre]."</option>";
        }
        ?></select></td>
    <td><button id="bcaremostrar" class="bsistema"><img src="../recursos/socios.png"/><span>MOSTRAR</span></button></td>
</tr>
<tr>
  <td colspan="3" style="text-align:center;">
    <center>
    <table style="width: 250px; font-size:12px; text-align:center;" class="tpinfo">
      <tr>
        <th colspan="3">SOLES</th>
      </tr>
      <tr>
        <td>MONTO</td>
        <td>CANTIDAD</td>
        <td>TOTAL</td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo200">200.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo200" value="0" style="text-align:right;"></td>
        <td><label id="bstotal200" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo100">100.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo100" value="0" style="text-align:right;"></td>
        <td><label id="bstotal100" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo50">50.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo50" value="0" style="text-align:right;"></td>
        <td><label id="bstotal50" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo20">20.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo20" value="0" style="text-align:right;"></td>
        <td><label id="bstotal20" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo10">10.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo10" value="0" style="text-align:right;"></td>
        <td><label id="bstotal10" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo5">5.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo5" value="0" style="text-align:right;"></td>
        <td><label id="bstotal5" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo2">2.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo2" value="0" style="text-align:right;"></td>
        <td><label id="bstotal2" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo1">1.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo1" value="0" style="text-align:right;"></td>
        <td><label id="bstotal1" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo05">0.50</label></td>
        <td><input type="text" class="texto numero" id="bstipo05" value="0" style="text-align:right;"></td>
        <td><label id="bstotal05" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo02">0.20</label></td>
        <td><input type="text" class="texto numero" id="bstipo02" value="0" style="text-align:right;"></td>
        <td><label id="bstotal02" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo01">0.10</label></td>
        <td><input type="text" class="texto numero" id="bstipo01" value="0" style="text-align:right;"></td>
        <td><label id="bstotal01" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right;">TOTAL</td>
        <td><label id="bstotal" class="ltexto">0</label></td>
      </tr>
    </table>
    </center>
  </td>
  <td colspan="2" style="text-align:center;">
    <!-- Tabla para el Billetaje en Dolares -->
    <center>
    <table style="width: 250px; font-size:12px; text-align:center;" class="tpinfo">
      <tr>
        <th colspan="3">DOLARES</th>
      </tr>
      <tr>
        <td>MONTO</td>
        <td>CANTIDAD</td>
        <td>TOTAL</td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo100">100.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo100" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal100" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo50">50.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo50" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal50" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo20">20.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo20" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal20" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo10">10.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo10" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal10" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo5">5.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo5" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal5" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo2">2.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo2" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal2" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo1">1.00</label></td>
        <td><input type="text" class="texto numero" id="bdtipo1" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal1" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo05">0.50</label></td>
        <td><input type="text" class="texto numero" id="bdtipo05" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal05" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo02">0.20</label></td>
        <td><input type="text" class="texto numero" id="bdtipo02" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal02" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">$ <label id="lbdtipo01">0.10</label></td>
        <td><input type="text" class="texto numero" id="bdtipo01" value="0" style="text-align:right;" disabled></td>
        <td><label id="bdtotal01" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right;">TOTAL</td>
        <td><label id="bdtotal" class="ltexto">0</label></td>
      </tr>
    </table> 
    </center>   
  </td>
</tr>
</table>


<?php  
}
?>


<?php
function detalle(){
$fecha=$_POST['fecha'];
$idpromotor=$_POST['idpromotor'];
$promotor=$_POST['promotor'];
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
?>
<div id="dcuotas" class="dpagina" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<br>
<center><h2>RECAUDAR INGRESOS</h2></center>
<br>
   <table class="tpagina" border="1" style="border-collapse: collapse;">
   <caption>DATOS DE LA RECAUDACIÓN</caption>     
   <tr>
      <th>CAJERO:</th><td><?php echo $trabajador;?></td>
      <th>FECHA:</th><td><label id="lcarefecha"><?php echo $fecha;?></label></td>      
   </tr>
   <tr>
      <th>PROMOTOR:</th><td><label id="lcarepromotor"><?php echo $promotor;?></label><label id="lcareidpromotor"><?php echo $idpromotor;?></label></td>
      <td colspan="2"></td>
   </tr>
   <tr>
      <td colspan="2" class="caption">INGRESOS</td>
      <td colspan="2" class="caption">EGRESOS</td>      
   </tr>
   <tr style="vertical-align: top;">
      <td colspan="2">
      <?php
         $query = pg_query("select tm.descripcion,tm.tipomov,tm.moneda,tm.monto from tmovimiento as tm, ttrabajador as tt where tm.usuario=tt.idtrabajador and (tt.tipotrabajador='12' or tt.tipotrabajador='3') and tm.idcaja='0' and tm.fechamov='". $fecha ."' and tm.usuario='". $idpromotor ."' and tm.flujomov='E' and tm.anulado='NO';");
         $tregistros = pg_numrows($query);
         $totali=0;
      ?>
         <table class="tpagina" border="1" style="border-collapse: collapse;">
         <tr style="padding: 5px;">
            <th>DESCRIPCION</th>
            <th>TIPO</th>
            <th>MONEDA</th>
            <th>TOTAL</th>
         </tr>
      <?php
         for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         echo '<tr>
            <td>'. $registros[descripcion].'</td>
            <td>'. $registros[tipomov].'</td>
            <td>'. $registros[moneda].'</td>
            <td style="text-align:right;">S/.'. $registros[monto].'</td>
            </tr>';
         $totali=$totali+$registros[monto];
         }
      ?>
         <tr>
            <td colspan="3" style="text-align:right;">TOTAL</td>
            <td style="text-align:right;">S/. <?php echo $totali;?></td>
         </tr>
         </table>
      </td>
      <td colspan="2">
      <?php
         $query = pg_query("select tm.descripcion,tm.tipomov,tm.moneda,tm.monto from tmovimiento as tm, ttrabajador as tt where tm.usuario=tt.idtrabajador and (tt.tipotrabajador='12' or tt.tipotrabajador='3' ) and tm.idcaja='0' and tm.fechamov='". $fecha ."' and tm.usuario='". $idpromotor ."' and tm.flujomov='S' and tm.anulado='NO';");
         $tregistros = pg_numrows($query);
         $totale=0;
      ?>
         <table class="tpagina" border="1" style="border-collapse: collapse;">
         <tr style="padding: 5px;">
            <th>DESCRIPCION</th>
            <th>TIPO</th>
            <th>MONEDA</th>
            <th>TOTAL</th>
         </tr>
         <?php
            for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo '<tr>
                <td>'. $registros[descripcion].'</td>
                <td>'. $registros[tipomov].'</td>
                <td>'. $registros[moneda].'</td>
                <td style="text-align:right;">S/. '. $registros[monto]*(-1).'</td>
                </tr>';
            $totale=$totale+$registros[monto]*(-1);
            }
         ?>
         <tr>
            <td colspan="3">TOTAL</td>
            <td>S/. <?php echo $totale;?></td>
         </tr>
         </table>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <center>
         <table border="1" style="border-collapse: collapse;">
         <tr>
            <td>TOTAL INGRESOS:</td>
            <td>S/. <?php echo $totali; ?></td>
         </tr>
         <tr>
            <td>TOTAL EGRESOS:</td>
            <td>S/. <?php echo $totale; ?></td>
         </tr>
         <tr>
            <td>SALDO:</td>
            <td>S/. <label id="lcaretotal"><?php echo $totali-$totale;?></label></td>
         </tr>
         </table>
         </center>
      </td>
   </tr>
  </table>
</div>
<button id="bcarerecaudar" class="bsistema"><img src="../recursos/soci.png"/><span>RECAUDAR</span></button>
<button id="bcrimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
<?php  
}
?>


<?php
  pg_free_result($query);
  pg_close($BD_conexion);
?>