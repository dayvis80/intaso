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
<h3 class='titulocontenedor'>CAJA - FLUJO DETALLADO</h3>
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
      <td><input type="date" id="afxdfecha" class="textom"></td>
      <td><button id="bfxdmostrar" class="bsistema"><img src="../recursos/bflujo.png"/><span>DETALLES</span></button></td>
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
$sucursal=$_SESSION['sucursal'];
?>
<div id="dfxddetalle" class="dpagina" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<br>
<center><h2>OPERACIONES DETALLADAS <?php echo $fecha;?></h2></center>
<br>
   <?php
   // OBTENEMOS LA OPERACIONES DETALLADAS EN INGRESOS
   $query = pg_query("select tm.numeromov, tm.horamov, tm.cuenta, tm.socio as idsocio, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tm.descripcion, tm.moneda, tm.monto, tm.pago, tm.tipomov, tt.usuario, tm.anulado from tmovimiento as tm, tsocio as ts, ttrabajador as tt where tm.socio=ts.idsocio and tm.usuario=tt.idtrabajador and tm.fechamov='".$fecha."' and flujomov='E' and tm.sucursal='". $sucursal ."' order by tm.numeromov;");
   $tregistros = pg_numrows($query);
   $totali=0;
   ?>
   <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
   <caption>OPERACIONES EN INGRESOS</caption>
   <tr>
      <th>N°</th>
      <th>OPERACIÓN</th>
      <th>HORA</th>
      <th>SOCIO</th>
      <th>DESCRIPCION</th>
      <th>CUENTA</th>
      <th>MONTO</th>
      <th>MOV</th>
      <th>USUARIO</th>      
      <th>ANU.</th>
   </tr>
   <?php
      for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         if($registros[tipomov]=="D"){$tipom='DEPOSITO';}
         if($registros[tipomov]=="H"){$tipom='A. AHORRO';}
         if($registros[tipomov]=="C"){$tipom='PAGO CUOTA';}
         if($registros[tipomov]=="A"){$tipom='AFILIACION';}
         if($registros[tipomov]=="I"){$tipom='INGRESO CAJA';}
         echo '<tr>
            <td>'. $i.'</td>
            <td>E-'.str_pad($registros[numeromov],7,'0',STR_PAD_LEFT).'</td>
            <td>'.$registros[horamov].'</td>';
            //<td>'.$registros[socio].'</td>
            if(($registros[tipomov]=='I')){
            $queryt = pg_query("select concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador where idtrabajador='". $registros[idsocio] ."' and sucursal='1';");
            $registrost = pg_fetch_array($queryt, null, PGSQL_ASSOC);
               echo "<td>".$registrost[trabajador]."</td>";
            }else{
               echo "<td>".$registros[socio]."</td>";          
            }
         echo '<td>'.$registros[descripcion].'</td>
            <td>'. $registros[cuenta].'</td>
            <td style="width:11%; text-align:right;"> S/.'.number_format($registros[monto],2,"."," ").'</td>
            <td>'.$registros[tipomov].'</td>
            <td>'.$registros[usuario].'</td>
            <td>'.$registros[anulado].'</td>
            </tr>';
         if($registros[anulado]=='NO'){
            $totali=$totali+$registros[monto];
         }
      }
   ?>
   <tr>
      <td colspan="6">TOTAL</td>
      <td style="width:11%; text-align:right;">S/. <?php echo number_format($totali,2,"."," ");?></td>
      <td colspan="3"></td>
   </tr>
   <tr>
      <td colspan="10">D - DEPOSITO  |  H - AHORRO  |  C - PAGO DE CUOTA  |  A - AFILIACION  |  I - INGRESO A CAJA</td>
   </tr>
   </table>

   <?php
   // OBTENEMOS LA OPERACIONES DETALLADAS EN EGRESOS
   $query = pg_query("select tm.numeromov, tm.horamov, tm.cuenta, tm.socio as idsocio, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tm.descripcion, tm.moneda, tm.monto, tm.pago, tm.tipomov, tt.usuario, tm.anulado from tmovimiento as tm, tsocio as ts, ttrabajador as tt where tm.socio=ts.idsocio and tm.usuario=tt.idtrabajador and tm.fechamov='".$fecha."' and flujomov='S' and tm.sucursal='". $sucursal ."' order by tm.numeromov");
   $tregistros = pg_numrows($query);
   $totale=0;
   ?>
   <br>
   <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
   <caption>OPERACIONES EN EGRESOS</caption>
   <tr>
      <th>N°</th>
      <th>OPERACIÓN</th>
      <th>HORA</th>
      <th>SOCIO</th>
      <th>DESCRIPCION</th>
      <th>CUENTA</th>
      <th>MONTO</th>
      <th>MOV</th>
      <th>USUARIO</th>      
      <th>ANU.</th>
   </tr>
   <?php
      for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         if($registros[tipomov]=="R"){$tipom='RETIRO';}
         if($registros[tipomov]=="P"){$tipom='PRESTAMO';}
         if($registros[tipomov]=="E"){$tipom='EGRESO CAJA';}
         echo '<tr>
            <td>'. $i.'</td>
            <td>S-'.str_pad($registros[numeromov],7,'0',STR_PAD_LEFT).'</td>
            <td>'.$registros[horamov].'</td>';
            //<td>'.$registros[socio].'</td>
            if(($registros[tipomov]=='E')){
            $queryt = pg_query("select concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador where idtrabajador='". $registros[idsocio] ."' and sucursal='1';");
            $registrost = pg_fetch_array($queryt, null, PGSQL_ASSOC);
               echo "<td>".$registrost[trabajador]."</td>";
            }else{
               echo "<td>".$registros[socio]."</td>";          
            }
            pg_fetch_result($queryt);
         echo '<td>'.$registros[descripcion].'</td>
            <td>'. $registros[cuenta].'</td>
            <td style="width:11%; text-align:right;">S/. '.number_format($registros[monto]*(-1),2,"."," ").'</td>
            <td>'.$registros[tipomov].'</td>
            <td>'.$registros[usuario].'</td>
            <td>'.$registros[anulado].'</td>
            </tr>';
         if($registros[anulado]=='NO'){
         $totale=$totale+$registros[monto]*(-1);
         }
      }
   ?>
      <tr>
         <td colspan="6">TOTAL</td>
         <td style="width:11%; text-align:right;">S/. <?php echo number_format($totale,2,"."," "); ?></td>
         <td colspan="3"></td>
      </tr>
      <tr>
         <td colspan="10">R - RETIRO  |  P - DESEMBOLSO DE PRESTAMO  |  E - EGRESO DE CAJA</td>
      </tr>
      </table>
</div>
<center>
<button id="bfxdimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
</center><br>
<?php  
}
?>


<?php
  pg_free_result($query);
  pg_close($BD_conexion);

?>