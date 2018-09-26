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
	//select idtipoahorro as n, descripcion, plazo, tem, moneda, montomin, montomax from ttipoahorro
	$query = pg_query("select idtipoahorro as n, descripcion, plazo, tem, moneda, montomin, montomax from ttipoahorro");

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
	$moneda=$_POST['moneda'];
	$montomin=$_POST['montomin'];
	$montomax=$_POST['montomax'];
	$sucursal=$_SESSION['sucursal'];

 	//insert into ttipoahorro (descripcion, plazo, tem, moneda, montomin, montomax,sucursal) values ('PLAZO FIJO',6,3.60,'SOL',1000,10000,1)

	$query = "insert into ttipoahorro (descripcion,plazo,tem,moneda,montomin,montomax,sucursal) values ('" . $descripcion . "'," . $plazo . ",'" . $tem . "','" . $moneda . "'," . $montomin .",". $montomax . "," . $sucursal . ");";

	pg_query($query);

	echo "EL NUEVO TIPO DE AHORRO SE REGISTRO CORRECTAMENTE-";
}


if($tipo=='ACT'){
    $id=$_POST['id'];
	$descripcion=strtoupper($_POST['descripcion']);
	$plazo=$_POST['plazo'];
	$tem=$_POST['tem'];
	$moneda=$_POST['moneda'];
	$montomin=$_POST['montomin'];
	$montomax=$_POST['montomax'];

 	//update ttipoahorro set descripcion='PAGA FIJO',plazo='12',tem='15',moneda='SOL',montomin='1200',montomax='10200' where idtipoahorro='1';

	$query = "update ttipoahorro set descripcion='" . $descripcion . "',plazo='" . $plazo . "',tem='" . $tem ."',moneda='" . $moneda . "',montomin='" . $montomin . "',montomax='" . $montomax . "' where idtipoahorro='" . $id . "';";

	pg_query($query);

	echo "EL NUEVO TIPO DE AHORRO SE REGISTRO CORRECTAMENTE-";
}

pg_free_result($query);
pg_close($BD_conexion);
?>