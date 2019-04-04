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
	$query = pg_query("select tt.idtrabajador as n, tt.dni as dni, CONCAT(tt.apaterno,' ', tt.amaterno,' ',tt.nombres) as trabajador, tt.apaterno as apaterno, tt.amaterno as amaterno, tt.nombres as nombres, tt.celular as celular, ttt.descripcion as descripcion, tt.fregistro as registro, ts.descripcion as agencia, case when tt.tipotrabajador!=0 then 'ACTIVO' else 'DE BAJA' end as estado, tt.sucursal from ttrabajador as tt, ttipotrabajador as ttt, tsucursal as ts where tt.tipotrabajador = ttt.idtipotrabajador and tt.sucursal=ts.idsucursal order by estado, nombres;");

	$tregistros = pg_numrows($query);
	for($i=1;$i<=$tregistros; $i++){
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	//$data["data"][]=array_map(utf8_encode, $registros);
	$data["data"][]=$registros;
	}	
echo json_encode($data);
}


if($tipo=='INS'){
	$dni=$_POST['dni'];
	$apaterno=strtoupper($_POST['apaterno']);
	$amaterno=strtoupper($_POST['amaterno']);
	$nombres=strtoupper($_POST['nombres']);
	$celular=$_POST['celular'];
	$tipotrabajador=$_POST['tipotrabajador'];
	$sucursal=$_POST['sucursal'];
	$fregistro=date("Y-m-d H:i:s");

	//$query="insert into ttrabajador (dni,apaterno,amaterno,nombres,celular,tipotrabajador,sucursal,fregistro) values ('40700920','FARFAN','GAVANCHO','DAYVIS VICTOR','951680606','1','2018-06-28 11:12:31','1');";
	
	$query = "insert into ttrabajador (dni,apaterno,amaterno,nombres,celular,tipotrabajador,sucursal,fregistro) values ('".$dni."','".$apaterno."','".$amaterno."','".$nombres."','".$celular."',".$tipotrabajador.",'".$sucursal."','".$fregistro."');";
	//date("Y-m-d H:i:s")
	pg_query($query);
	echo"EL TRABAJADOR SE REGISTRO CORRECTAMENTE";
}


if($tipo=='ACT'){
	$dni=$_POST['dni'];
	$apaterno=strtoupper($_POST['apaterno']);
	$amaterno=strtoupper($_POST['amaterno']);
	$nombres=strtoupper($_POST['nombres']);
	$celular=$_POST['celular'];
	$tipotrabajador=$_POST['tipotrabajador'];
	$sucursal=$_POST['sucursal'];

	//update ttrabajador set apaterno='FARFAN', amaterno='GAVANCHO', nombres='DAYVIS', celular='943542546', tipotrabajador='1' where dni='40700920' ;
	
	$query = "update ttrabajador set apaterno='" . $apaterno . "', amaterno='" . $amaterno . "', nombres='" . $nombres . "', celular='" . $celular . "', tipotrabajador='" . $tipotrabajador . "', sucursal='". $sucursal ."' where dni='" . $dni . "';";

	//date("Y-m-d H:i:s")
	pg_query($query);
	echo"EL TRABAJADOR SE ACTUALIZO CORRECTAMENTE";
}


if($tipo=='BAJA'){
	$dni=$_POST['dni'];
	$idtrabajador=$_POST['idtrabajador'];
	if($idtrabajador!=0){
		if($idtrabajador!=1){ 
		pg_query("delete from tusuario where idtrabajador='". $idtrabajador ."';");
		pg_query("update ttrabajador set tipotrabajador = '0' where idtrabajador='". $idtrabajador ."'");


//delete from tusuario where idtrabjador='2';
		echo 'SE DIO DE BAJA EXITOSAMENTE AL TRABAJADOR';
		}else{
			echo '1';
		}
	}else{

		echo '2';
	}
}


pg_free_result($query);
pg_close($BD_conexion);
?>