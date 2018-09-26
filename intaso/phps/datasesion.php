<?php
session_start();
include('configuracion.php');
$BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);

/*
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
    $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
 } */


$tipo=$_POST['tipo'];

if($tipo=='ING'){
	$usuario = addslashes($_POST['usuario']);
	$password = addslashes($_POST['password']);
	//select tu.idtrabajador, tu.contrasena, CONCAT(tt.nombres, tt.apaterno, tt.amaterno) as trabajador, tt.tipotrabajador, tt.sucursal from tusuario as tu, ttrabajador as tt where tu.idtrabajador=tt.idtrabajador and usuario='Dayvis';;
	$vusuario = pg_query("select tu.idtrabajador, tu.contrasena, CONCAT(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador, tt.tipotrabajador, tt.sucursal from tusuario as tu, ttrabajador as tt where tu.idtrabajador=tt.idtrabajador and tu.usuario = '".$usuario."';");
	if(pg_numrows($vusuario)<1){
		echo 1;
	}else{
		$consulta = pg_fetch_array($vusuario,null, PGSQL_ASSOC);
		if (password_verify($password, $consulta[contrasena])) {
			$_SESSION['login'] = TRUE;
         	$_SESSION['idtrabajador'] = $consulta[idtrabajador];
         	$_SESSION['trabajador'] = $consulta[trabajador];
         	$_SESSION['tipotrabajador'] = $consulta[tipotrabajador];
         	$_SESSION['sucursal'] = $consulta[sucursal];         	   
		} else {
			echo 2;
		}
	}
}

if($tipo=='SAL'){
	unset ($_SESSION['login']);
	unset ($_SESSION['idtrabajador']);
	unset ($_SESSION['trabajador']);
	unset ($_SESSION['tipotrabajador']);
	unset ($_SESSION['sucursal']);
	session_destroy();
	echo "Se Cerro la sesion";
}


// ----------TRANASSCIONES EN POSTGRESQL DESDE PHP----------//
/*
$con = pg_connect("host=$host dbname=$db user=$user password=$pass")
    or die ("Could not connect to server\n"); 

pg_query("BEGIN") or die("Could not start transaction\n");

$res1 = pg_query("DELETE FROM cars WHERE id IN (1, 9)");
$res2 = pg_query("INSERT INTO cars VALUES (1, 'BMW', 36000), (9, 'Audi', 52642)");

if ($res1 and $res2) {
    echo "Commiting transaction\n";
    pg_query("COMMIT") or die("Transaction commit failed\n");
} else {
    echo "Rolling back transaction\n";
    pg_query("ROLLBACK") or die("Transaction rollback failed\n");;
}
*/
  pg_free_result($query);
  pg_close($BD_conexion);

?>