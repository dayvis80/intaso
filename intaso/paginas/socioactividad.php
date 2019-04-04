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
	<h3 class='titulocontenedor'>SOCIO - ACTIVIDAD</h3>
   <div id="dinfo"> 
<?php
$fecha = date("d-m-Y");
//$trabajador=$_SESSION['trabajador'];
//$sucursal=$_SESSION['sucursal'];
?>

	<div id="dsactividad" class="dpaginah" style="display: block;">
	<img src="../recursos/logoian.png"/>
	<hr>
	<br>
	<center><h2>REPORTE DE ACTIVIDAD DEL SOCIO</h2></center>
	<center>AL: <?php echo $fecha;?> </center>
	<br>

   <table class="tpagina" border="1" style="border-collapse: collapse; font-size:9px;">
   <caption>PRESTAMO: <?php echo $descripcion; ?></caption>
   <tr>
      <th>N°</th>
      <th>SOCIO</th>
      <th>DESCRIPCION</th>
      <th>CUENTA</th>
      <th>SALDO</th>
      <th>U. MOVIMIENTO</th>
      <th>INACTIVO</th>
      <th>PROMOTOR</th>
   </tr>

   <?php
	$query = pg_query("select concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, ta.idsocio as idsocio, ta.descripcion as descripcion, tm.cuenta as cuenta, ta.saldo as saldo, max(tm.fechamov) as umovimiento, min(DATE_PART('day', current_date::timestamp - tm.fechamov::timestamp)) as inactividad, ts.analista as idpromotor, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as promotor from tmovimiento as tm, tahorro as ta, tsocio as ts, ttrabajador as tt where tm.cuenta=ta.cuenta and tm.tipomov!='PI' and ta.idsocio = ts.idsocio and ts.analista=tt.idtrabajador and ta.descripcion like '%AHORRO%' group by tm.cuenta, ta.saldo, ta.idsocio, ta.descripcion, ts.apaterno, ts.amaterno, ts.nombres, ts.analista, tt.apaterno, tt.amaterno, tt.nombres order by inactividad desc, ta.idsocio;");
	$tregistros = pg_num_rows($query);   
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      if($registros[inactividad]>=8){
         echo '<tr style="background: #FF4943;">';
         }else{
            if($registros[inactividad]>=3){
               echo '<tr style="background: #EFB241;">';
            }else{
               echo '<tr style="background: #B7DB71;">';
            }
         }
      //echo '<tr>'
      echo '<td>'. $i.'</td>
      		<td>'. $registros[socio] . '</td>
      		<td>'. $registros[descripcion] .'</td>
      		<td>'. $registros[cuenta] .'</td>
				<td> S/.'. number_format($registros[saldo],2,"."," ") .'</td>
      		<td>'. $registros[umovimiento] .'</td>
      		<td>'. $registros[inactividad].'</td>
      		<td>'.$registros[promotor].'</td>
      		</tr>';
   }
   ?>
   </table><br>
   </div>
	<center>
	<button id="bsaimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
	</center><br>
	</div>
</div>

