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
<h3 class='titulocontenedor'>CAJA - FLUJO X RECAUDADOR</h3>
<center>
<div id="dinfo"> 
   <?php
   if (!$_POST){
      flujo();
   }else{
      flujo();
      detalle();
   }
   ?>
</div>
</center>
</div> 


<?php
function flujo(){
?>
<table class="tpinfo" style="width: 840px; padding:10px;">
   <tr><td><h3>INGRESAR DATOS</h3></td>
      <td>FECHA:</td>
      <td><input type="date" id="afxrfecha" class="textom"></td>
      <td><button id="bfxrmostrar" class="bsistema"><img src="../recursos/bflujo.png"/><span>RESUMEN</span></button></td>
   </tr>
</table>
<?php  
}
?>


<?php
function detalle(){
$fecha=$_POST['fecha'];
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$tipotrabajador=$_SESSION['tipotrabajador'];
?>
<div id="dfxrdetalle" class="dpagina" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<br>
<center><h2>FLUJO X RECAUDADOR</h2></center>
<br>
   <table class="tpagina" border="1" style="border-collapse: collapse;">
   <caption>DATOS DEL RECAUDADOR</caption>     
   <tr>
      <th>CAJERO:</th><td><?php echo $trabajador;?></td>
      <th>FECHA:</th><td><?php echo $fecha; ?></td>
   </tr>
   <tr>
      <td colspan="2" class="caption">INGRESOS</td>
      <td colspan="2" class="caption">EGRESOS</td>      
   </tr>
   <tr style="vertical-align: top;">
      <td colspan="2">
         <?php
            $tipotrabajador=$_SESSION['tipotrabajador'];
            $query = pg_query("select tm.descripcion,tm.tipomov,tm.moneda,tm.monto from tmovimiento as tm, ttrabajador as tt  where tm.fechamov='". $fecha ."' and tm.usuario=tt.idtrabajador and tt.idtrabajador='".$idtrabajador."' and tt.tipotrabajador='".$tipotrabajador."' and tm.flujomov='E' and tm.anulado='NO';");
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
            <td> S/. '. $registros[monto].'</td>
            </tr>';
            $totali=$totali+$registros[monto];
            }
         ?>
           <tr>
              <td colspan="3">TOTAL</td>
              <td>S/. <?php echo $totali; ?></td>
           </tr>
           </table>
      </td>
      <td colspan="2">
         <?php
         $query = pg_query("select tm.descripcion,tm.tipomov,tm.moneda,tm.monto from tmovimiento as tm, ttrabajador as tt  where tm.fechamov='". $fecha ."' and tm.usuario=tt.idtrabajador and tt.idtrabajador='".$idtrabajador."' and tt.tipotrabajador='".$tipotrabajador."' and tm.flujomov='S' and tm.anulado='NO';");
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
               <td> S/. '. $registros[monto]*(-1).'</td>
               </tr>';
            $totale=$totale+$registros[monto]*(-1);
            }
         ?>
            <tr>
               <td colspan="3">TOTAL</td>
               <td>S/. <?php echo $totale; ?></td>
            </tr>
            </table>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <center>
         <table border="1" style="border-collapse: collapse;">
         <tr>
            <td>TOTAL INGRESOS</td>
            <td>S/. <?php echo $totali;?></td>
         </tr>
         <tr>
            <td>TOTAL EGRESOS</td>
            <td>S/. <?php echo $totale;?></td>
         </tr>
         <tr>
            <td>SALDO: </td>
            <td>S/. <?php echo $totali-$totale;?></td>
         </tr>
         </table>
         </center>
      </td>
   </tr>
   </table>
</div>
<center>
<button id="bfxrimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
</center><br>
<?php  
}
?>


<?php
   pg_free_result($query);
   pg_close($BD_conexion);
?>