<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
      include('../phps/dataprestamo.php');
      $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>GESTIÓN MORA - MOROSOS</h3>
<center>
   <div id="dinfo"> 
   <?php
      detalle();
   ?>
   </div>
</center>
</div> 


<?php
function detalle(){
$fecha = date("d-m-Y");
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$sucursal=$_SESSION['sucursal'];
?>
<div id="dgmmorosos" class="dpaginah" style="display: block;">
<img src="../recursos/logoian.png"/>
<hr>
<br>
<center><h2>MOROSOS POR TIPO DE PRESTAMO</h2></center>
<center>AL: <?php echo $fecha;?> </center>
<br>
<?php
   // OBTENEMOS LA DESCRIPCION POR TIPO DE PRESTAMO
   //select distinct descripcion from tprestamo where sucursal='1' order by descripcion
   $queryp = pg_query("select distinct descripcion from tprestamo where sucursal='1' order by descripcion");
   $tregistrosp = pg_num_rows($queryp);
   for($i=1;$i<=$tregistrosp; $i++){
      $registrosp = pg_fetch_array($queryp, null, PGSQL_ASSOC);
      $descripcion=$registrosp['descripcion'];

      // OBTENEMOS LOS PRESTAMOS POR PROMOTOR
      $query = pg_query("select (ts.idsocio+100000000) as id, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.nprestamo, tp.fprestamo, tp.monto, coalesce(tc.scapital,'0') as scapital, tp.tcuotas, tp.mcuota, tc.fdeuda, coalesce(tc.cuotas,'0') as cuotas, coalesce(tc.diasmora,'0') as diasmora, coalesce(tc.total,'0') as total, concat(substring(tt.nombres from 1 for 1),tt.apaterno) as gestor, concat('TELEFONO: ',ts.tcelular,' DOMICILIO: ',ts.direccion) as direccion
      from tsocio as ts, ttrabajador as tt, tprestamo as tp left join (select tc.nprestamo, max(tc.capital) as scapital, min(tc.fvencimiento) as fdeuda, count(tc.ncuota) as cuotas, sum(DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp)) as diasmora,
      sum(tc.amortizacion+tc.interes+tc.aporte+tc.comision+((tc.amortizacion+tc.interes+tc.aporte+tc.comision)*(tp.mora*(DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp)))/100)) as total
      from tcuotas as tc, tprestamo as tp where tc.nprestamo=tp.nprestamo and tc.estado='PENDIENTE' and tc.fvencimiento::date < '".$fecha."' group by tc.nprestamo)
      tc on tp.nprestamo = tc.nprestamo where tp.idsocio=ts.idsocio and tp.analista=tt.idtrabajador and tp.estado='EN PROCESO' and tp.sucursal='1' and tp.descripcion='".$descripcion."' order by diasmora desc");
      $tregistros = pg_num_rows($query);
      $totalm=0;
      $totalc=0;
      $totaldm=0;
   ?>   
      <table class="tpagina" border="1" style="border-collapse: collapse; font-size:9px;">
      <caption>PRESTAMO: <?php echo $descripcion; ?></caption>
      <tr>
         <th>N°</th>
         <th>CONTRATO</th>
         <th>SOCIO</th>
         <th>F. PRESTAMO</th>
         <th>MONTO</th>
         <th>SALDO CAPITAL</th>
         <th>N° DE CUOTA</th>
         <th>CUOTA MENSUAL</th>
         <th>FECHA DEUDA</th>
         <th>CUOTA MORA</th>
         <th>DIAS MORA</th>
         <th>TOTAL COBRAR</th>
         <th>GESTOR</th>
         <th>DIRECCION</th>
      </tr>
      <?php
         for($j=1;$j<=$tregistros; $j++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo '<tr>
               <td>'. $j.'</td>
               <td>'.$registros[id].'</td>
               <td>'.$registros[socio].'</td>
               <td>'.$registros[fprestamo].'</td>
               <td> S/.'.$registros[monto].'</td>
               <td>'.$registros[scapital].'</td>
               <td>'. $registros[tcuotas].'</td>
               <td>S/.'.$registros[mcuota].'</td>
               <td>'.$registros[fdeuda].'</td>
               <td>'.$registros[cuotas].'</td>
               <td>'.$registros[diasmora].'</td>
               <td> S/.'.redondear(number_format($registros[total],2,"."," ")).'</td>
               <td>'.$registros[gestor].'</td>
               <td>'.$registros[direccion].'</td>
               </tr>';
            $totalm=$totalm+$registros[monto];
            $totalc=$totalc+redondear(number_format($registros[total],2,"."," "));
            $totaldm=$totaldm+$registros[diasmora];
         }
      ?>
      <tr>
         <td colspan="4"></td>
         <td >S/. <?php echo $totalm;?></td>
         <td colspan="5"></td>
         <td ><?php echo $totaldm;?></td>
         <td >S/. <?php echo  redondear(number_format($totalc,2,"."," "));?></td>
         <td colspan="2"></td>
      </tr>
      </table><br>
   <?php
   }// fin del For
?>

 
</div>
<center>
<button id="bgmmimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
</center><br>
<?php  
}
?>


<?php
  pg_free_result($query);
  pg_close($BD_conexion);
?>