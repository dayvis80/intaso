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
<h3 class='titulocontenedor'>GESTIÓN MORA - REPORTE MORA</h3>
<center>
   <div id="dinfo"> 
   <?php
   if (!$_POST){
      rmora();
   }else{
      rmora();
      detalle();
   }
   ?>
   </div>
</center>
</div> 


<?php
function rmora(){
?>
<table class="tpinfo" style="width: 840px; padding:10px;">
   <tr><td><h3>SELECCIONAR ANALISTA:</h3></td>
      <td>ANALISTA:</td>
      <td colspan="2"><select name="agmrmanalista" id="agmrmanalista" class="opciong">
         <option value='0'>TODOS</option>
      <?php
         $sucursal=$_SESSION['sucursal'];
         //$query = pg_query("select idtrabajador, concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador as trabajador where (tipotrabajador=3 or tipotrabajador=12) and sucursal='". $sucursal ."' order by apaterno, amaterno, nombres");
         $query = pg_query("select distinct tp.analista as idanalista, concat(tt.apaterno,' ',tt.nombres) as tanalista from tprestamo as tp, ttrabajador as tt where tp.analista=tt.idtrabajador and tp.sucursal='".$sucursal."' order by tanalista");
         $tregistros = pg_numrows($query);
         for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo "<option value='".$registros[idanalista]."'>".$registros[tanalista]."</option>";
         }
      ?></select></td>
      <td colspan="2" style="text-align:center;"><button id="bgmrmgenerar" class="bsistema"><img src="../recursos/bgenerar.png"/><span>GENERAR</span></button></td>
   </tr>
</table>
<?php  
}
?>

<?php
function detalle(){
$fecha = date("d/m/Y");
$hora = date("H:i:s");
$idanalista=$_POST['idanalista'];
$analista=$_POST['analista'];
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$sucursal=$_SESSION['sucursal'];
?>
<div id="dgmrmora" class="dpaginah" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<?php
if($idanalista!=0){
?>
   <br>
   <center><h2>MORA DE PRESTAMOS X ANALISTA: <?php echo $analista;?></h2></center>
   <center>AL: <?php echo $fecha.'  '.$hora;?> </center>
   <br>
   <?php
   // OBTENEMOS LOS PRESTAMOS POR PROMOTOR
   $query = pg_query("select (ts.idsocio+100000000) as idsocio, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.nprestamo, tp.descripcion, coalesce(tc.scapital,'0') as scapital, tp.mcuota, tc.fdeuda, coalesce(tc.cuotas,'0') as cuotasmora, coalesce(tc.diasmora,'0') as diasmora, coalesce(tc.total,'0') as total, concat('TRABAJO: ',ts.utrabajo,' TELEFONO: ',ts.tcelular,' DOMICILIO: ',ts.direccion, ' (',ts.referencia,')') as direccion
   from tsocio as ts, tprestamo as tp left join (select tc.nprestamo, max(tc.capital) as scapital, min(tc.fvencimiento) as fdeuda, count(tc.ncuota) as cuotas, max(DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp)) as diasmora,
   sum(tc.amortizacion+tc.interes+tc.aporte+tc.comision+((tc.amortizacion+tc.interes+tc.aporte+tc.comision)*(tp.mora*(DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp)))/100)) as total 
   from tcuotas as tc, tprestamo as tp where tc.nprestamo=tp.nprestamo and tc.estado='PENDIENTE' and tc.fvencimiento::date < '".$fecha."' group by tc.nprestamo)
   tc on tp.nprestamo = tc.nprestamo where tp.idsocio=ts.idsocio and tp.estado='EN PROCESO' and tp.sucursal='".$sucursal."' and tp.analista='".$idanalista."' order by diasmora desc");
   $tregistros = pg_num_rows($query);
   $totalcm=0;
   $totaldm=0;
   $totalsc=0;
   $totalc=0;
   ?>
   <table class="tpagina" border="1" style="border-collapse: collapse; font-size:10px;">
   <caption>LISTADO DE PRESTAMOS</caption>
   <tr>
      <th>N°</th>
      <th>CONTRATO</th>
      <th>SOCIO</th>
      <th>DESCRIPCIÓN</th>
      <th>SALDO CAPITAL</th>
      <th>CUOTA MENSUAL</th>
      <th>FECHA DEUDA</th>
      <th>CUOTA MORA</th>
      <th>DIAS MORA</th>
      <th>TOTAL COBRAR</th>
      <th>DIRECCION</th>      
   </tr>
   <?php
      for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         if($registros[diasmora]>=9){
         echo '<tr style="background: #FF4943;">';
         }else{
            if($registros[diasmora]>=5){
               echo '<tr style="background: #EFB241;">';
            }else{
               echo '<tr style="background: #B7DB71;">';
            }
         }
         echo '<td>'. $i.'</td>
            <td><label id="bgmrmextracto">'.$registros[nprestamo].'</label></td>
            <td>'.$registros[socio].'</td>
            <td>'.$registros[descripcion].'</td>
            <td>S/.'.number_format($registros[scapital],2,"."," ").'</td>
            <td>S/.'.redondear(number_format($registros[mcuota],2,"."," ")).'</td>
            <td>'. $registros[fdeuda].'</td>
            <td style="text-align:center;">'.$registros[cuotasmora].'</td>
            <td style="text-align:center;">'.$registros[diasmora].'</td>
            <td>S/.'.redondear(number_format($registros[total],2,"."," ")).'</td>
            <td>'.$registros[direccion].'</td>
            </tr>';
         $totalcm=$totalcm+$registros[cuotasmora];
         $totaldm=$totaldm+$registros[diasmora];  
         $totalsc=$totalsc+number_format($registros[scapital],2,"."," ");
         $totalc=$totalc+redondear(number_format($registros[total],2,"."," "));
         }
   ?>
   <tr>
      <td colspan="4">TOTAL</td>
      <td colspan="3">S/. <?php echo number_format($totalsc,2,"."," ");?></td>
      <td style="text-align:center;"><?php echo $totalcm?> </td>
      <td style="text-align:center;"><?php echo $totaldm;?> </td>
      <td colspan="2">S/. <?php echo number_format($totalc,2,"."," ");?></td>
   </tr>
   </table>
<?php
}else{
?>
   <br>
   <center><h2>MORA DE PRESTAMOS X ANALISTA: TODOS</h2></center>
   <center>AL: <?php echo $fecha.'  '.$hora;?> </center>
   <br>
   <?php
   //OBTENEMOS TODOS LOS ANALISTAS
   //$queryp = pg_query("select idtrabajador, concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador as trabajador where (tipotrabajador=3 or tipotrabajador=12) and sucursal='". $sucursal ."' order by apaterno, amaterno, nombres");
   $queryp = pg_query("select distinct tp.analista as idanalista, concat(tt.apaterno,' ',tt.nombres) as tanalista from tprestamo as tp, ttrabajador as tt where tp.analista=tt.idtrabajador and tp.sucursal='".$sucursal."' order by tanalista");
   $tregistrosp = pg_num_rows($queryp);
   for($i=1;$i<=$tregistrosp; $i++){
      $registrosp = pg_fetch_array($queryp, null, PGSQL_ASSOC);
      $idanalista=$registrosp['idanalista'];
      $analista=$registrosp['tanalista'];

      // OBTENEMOS LOS PRESTAMOS POR PROMOTOR
      $query = pg_query("select (ts.idsocio+100000000) as idsocio, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.nprestamo, tp.descripcion, coalesce(tc.scapital,'0') as scapital, tp.mcuota, tc.fdeuda, coalesce(tc.cuotas,'0') as cuotasmora, coalesce(tc.diasmora,'0') as diasmora, coalesce(tc.total,'0') as total, concat('TRABAJO: ',ts.utrabajo,' TELEFONO: ',ts.tcelular,' DOMICILIO: ',ts.direccion, ' (',ts.referencia,')') as direccion
      from tsocio as ts, tprestamo as tp left join (select tc.nprestamo, max(tc.capital) as scapital, min(tc.fvencimiento) as fdeuda, count(tc.ncuota) as cuotas, max(DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp)) as diasmora,
      sum(tc.amortizacion+tc.interes+tc.aporte+tc.comision+((tc.amortizacion+tc.interes+tc.aporte+tc.comision)*(tp.mora*(DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp)))/100)) as total 
      from tcuotas as tc, tprestamo as tp where tc.nprestamo=tp.nprestamo and tc.estado='PENDIENTE' and tc.fvencimiento::date < '".$fecha."' group by tc.nprestamo)
      tc on tp.nprestamo = tc.nprestamo where tp.idsocio=ts.idsocio and tp.estado='EN PROCESO' and tp.sucursal='".$sucursal."' and tp.analista='".$idanalista."' order by diasmora desc");
      $tregistros = pg_num_rows($query);
      $totalsc=0;
      $totalcm=0;
      $totaldm=0;
      $totalc=0;
   ?>   
      <table class="tpagina" border="1" style="border-collapse: collapse; font-size:10px;">
      <caption>ANALISTA: <?php echo $analista; ?></caption>
      <tr>
         <th>N°</th>
         <th>CONTRATO</th>
         <th>SOCIO</th>
         <th>DESCRIPCIÓN</th>
         <th>SALDO CAPITAL</th>
         <th>CUOTA MENSUAL</th>
         <th>FECHA DEUDA</th>
         <th>CUOTA MORA</th>
         <th>DIAS MORA</th>
         <th>TOTAL COBRAR</th>
         <th>DIRECCION</th>   
      </tr>
      <?php
         for($j=1;$j<=$tregistros; $j++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         if($registros[diasmora]>=9){
         echo '<tr style="background: #FF4943;">';
         }else{
            if($registros[diasmora]>=5){
               echo '<tr style="background: #EFB241;">';
            }else{
               echo '<tr style="background: #B7DB71;">';
            }
         }
         echo '<td>'. $j.'</td>
               <td><label id="bgmrmextracto">'.$registros[nprestamo].'</label></td>
               <td>'.$registros[socio].'</td>
               <td>'.$registros[descripcion].'</td>
               <td>S/.'.number_format($registros[scapital],2,"."," ").'</td>
               <td>S/.'.redondear(number_format($registros[mcuota],2,"."," ")).'</td>
               <td>'. $registros[fdeuda].'</td>
               <td style="text-align:center;">'.$registros[cuotasmora].'</td>
               <td style="text-align:center;">'.$registros[diasmora].'</td>
               <td>S/.'.redondear(number_format($registros[total],2,"."," ")).'</td>
               <td>'.$registros[direccion].'</td>
               </tr>';
            $totalsc=$totalsc+number_format($registros[scapital],2,"."," ");
            $totalcm=$totalcm+$registros[cuotasmora];
            $totaldm=$totaldm+$registros[diasmora];
            $totalc=$totalc+redondear(number_format($registros[total],2,"."," "));
         }
      ?>
      <tr>
         <td colspan="4">TOTAL</td>
         <td colspan="3">S/. <?php echo number_format($totalsc,2,"."," ");?></td>
         <td style="text-align:center;"><?php echo $totalcm?> </td>
         <td style="text-align:center;"><?php echo $totaldm;?> </td>
         <td colspan="2">S/. <?php echo number_format($totalc,2,"."," ");?></td>
      </tr>
      </table><br>
   <?php
   }// fin del For
}
?>
</div>
<center>
<button id="bgmrmimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
</center><br>

  <div id="dmodextractoprestamo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:800px;">
      <div class="dmodaltitulo">EXTRACTO PRESTAMO
      </div>

      <div id="dextractoprestamo" class="dmodalcontenido" style="height: 520px; overflow: auto;">
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