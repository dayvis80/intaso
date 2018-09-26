<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
	include('configuracion.php');
	$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
  }

$tipo=$_POST['tipo'];


if($tipo=='DATA'){
	$query = pg_query("select idtipoprestamo as n, descripcion, plazo, tem, moneda, comision, mora, montomin, montomax from ttipoprestamo");

	$tregistros = pg_numrows($query);
	for($i=1;$i<=$tregistros; $i++){
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	//$data["data"][]=array_map(utf8_encode, $registros);
	$data["data"][]=$registros;
	}	
echo json_encode($data);
}


if($tipo=='INS'){
	$descripcion=strtoupper($_POST['descripcion']);
	$plazo=$_POST['plazo'];
	$tem=$_POST['tem'];
	$comision=$_POST['comision'];
	$mora=$_POST['mora'];
	$moneda=$_POST['moneda'];
	$montomin=$_POST['montomin'];
	$montomax=$_POST['montomax'];
	$sucursal=$_SESSION['sucursal'];

	//$query = "insert into ttipoprestamo (descripcion,plazo,tem,moneda,comision,mora,montomin,montomax) values ('PAGO DIA',3,'15','SOL','4','5',1000,10000);";

	$query = "insert into ttipoprestamo (descripcion,plazo,tem,moneda,comision,mora,montomin,montomax,sucursal) values ('" . $descripcion . "'," . $plazo . ",'" . $tem . "','" . $moneda . "','". $comision . "','" . $mora ."'," . $montomin .",". $montomax . ",".$sucursal.");";

	pg_query($query);

	echo "EL NUEVO TIPO DE PRESTAMO SE REGISTRO CORRECTAMENTE";
}


if($tipo=='ACT'){
	$id=$_POST['id'];
	$descripcion=strtoupper($_POST['descripcion']);
	$plazo=$_POST['plazo'];
	$tem=$_POST['tem'];
	$comision=$_POST['comision'];
	$mora=$_POST['mora'];
	$moneda=$_POST['moneda'];
	$montomin=$_POST['montomin'];
	$montomax=$_POST['montomax'];

	//update ttipoprestamo set descripcion='PAGA DIARIO',plazo='1',tem='15',moneda='SOL',comision='10',mora='3',montomin='1200',montomax='10200' where idtipoprestamo='1'

	$query = "update ttipoprestamo set descripcion='" . $descripcion . "',plazo='" . $plazo . "',tem='" . $tem . "',moneda='" . $moneda . "',comision='" . $comision ."',mora='" . $mora . "',montomin='" . $montomin . "',montomax='" . $montomax . "' where idtipoprestamo='" . $id . "';";

	pg_query($query);

	echo "EL TIPO DE PRESTAMO SE ACTUALIZO CORRECTAMENTE";
}


pg_free_result($query);
pg_close($BD_conexion);
?>