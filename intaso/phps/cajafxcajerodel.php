<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
    $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
 }

//$tipo=$_POST['tipo'];


//if($tipo=='FXC'){

echo '<table><tr style="vertical-align:top;"><td>';
//select descripcion, tipomov, moneda, monto from tmovimiento where fechamov='2018-07-24' and idcaja='3' and (tipomov='D' or tipomov='H' or tipomov='C' or tipomov='A')
$query = pg_query("select descripcion, tipomov, moneda, monto from tmovimiento where fechamov='2018-07-24' and idcaja='3' and (tipomov='D' or tipomov='H' or tipomov='C' or tipomov='A')");
$tregistros = pg_numrows($query);

echo 'INGRESOS
<table bodder="1">
  <tr>
	<td>DESCRIPCION</td>
	<td>TIPO</td>
	<td>MONEDA</td>
	<td>TOTAL</td>
  </tr>';

$total=0;

  for($i=1;$i<=$tregistros; $i++){
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	echo '<tr>
	<td>'. $registros[descripcion].'</td>
	<td>'. $registros[tipomov].'</td>
	<td>'. $registros[moneda].'</td>
	<td>'. $registros[monto].'</td>
  	</tr>';
  	$total=$total+$registros[monto];
  }
echo '<tr>
	<td colspan="3">TOTAL</td>
	<td>'.$total.'</td>
  </tr>';
echo '</table>';

echo '</td><td>';
//select descripcion, tipomov, moneda, monto from tmovimiento where fechamov='2018-07-24' and idcaja='3' and (tipomov='R' or tipomov='P')

$query = pg_query("select descripcion, tipomov, moneda, monto from tmovimiento where fechamov='2018-07-24' and idcaja='3' and (tipomov='R' or tipomov='P');");
$tregistros = pg_numrows($query);

echo 'EGRESOS
<table bodder="1">
  <tr>
	<td>DESCRIPCION</td>
	<td>TIPO</td>
	<td>MONEDA</td>
	<td>TOTAL</td>
  </tr>';

$total=0;

  for($i=1;$i<=$tregistros; $i++){
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	echo '<tr>
	<td>'. $registros[descripcion].'</td>
	<td>'. $registros[tipomov].'</td>
	<td>'. $registros[moneda].'</td>
	<td>'. $registros[monto]*(-1).'</td>
  	</tr>';
  	$total=$total+$registros[monto]*(-1);
  }
echo '<tr>
	<td colspan="3">TOTAL</td>
	<td>'.$total.'</td>
  </tr>';
echo '</table>';

echo '</td></tr></table>';


  pg_free_result($query);
  pg_close($BD_conexion);
?>