<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
     header('Location: login.php');
  }else{
     include('configuracion.php');
     $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
  }

$tipo=$_POST['tipo'];


if($tipo=='DATA'){
	$query = pg_query(" select tu.idusuario as n, CONCAT(tt.nombres,' ',tt.apaterno,' ', tt.amaterno) as trabajador, tu.usuario as usuario, tu.contrasena as contrasena, tt.idtrabajador as idtrabajador from tusuario as tu, ttrabajador as tt where tu.idtrabajador= tt.idtrabajador;");

	$tregistros = pg_numrows($query);
	for($i=1;$i<=$tregistros; $i++){
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	//$data["data"][]=array_map(utf8_encode, $registros);
	$data["data"][]=$registros;
	}	
echo json_encode($data);
}


if($tipo=='INS'){
	$usuario=$_POST['usuario'];
	$contrasena=$_POST['contrasena'];
	$idtrabajador=$_POST['idtrabajador'];

	//select * from tusuario where idtrabajador=1;
	$query = pg_query("select * from tusuario where idtrabajador=".$idtrabajador.";");
	$tregistros = pg_numrows($query);
	
	if($tregistros < 1) {

	// Generamos un salt aleatoreo, de 22 caracteres para Bcrypt
	$salt = substr(base64_encode(openssl_random_pseudo_bytes('30')), 0, 22);
	// A Crypt no le gustan los '+' así que los vamos a reemplazar por puntos.
	$salt = strtr($salt, array('+' => '.')); 
	// Generamos el hash
	$hash = crypt($contrasena, '$2y$10$' . $salt . '$');

	//insert into tusuario (usuario,contrasena,clave,idtrabajador) values ('Dayvis','D1440669','','1');

	$query = "insert into tusuario (idusuario, usuario, contrasena, clave, idtrabajador) values ('".$idtrabajador."','".$usuario."','". $hash ."','". $salt  ."','". $idtrabajador ."');";

	pg_query($query);

	echo "EL USUARIO SE REGISTRO CORRECTAMENTE";

	}else {
	echo "Este Trabajador ya registro su usuario";
	}
}


if($tipo=='RES'){
	$usuario=$_POST['usuario'];
	$idtrabajador=$_POST['idtrabajador'];
	
	// OBTENEMOS EL DNI
	$query = pg_query("select dni from ttrabajador where idtrabajador = '".$idtrabajador."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $dni = $registros['dni'];

    // OBTENEMOS EL SALT
	$query = pg_query("select clave from tusuario where idusuario='".$usuario."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $clave = $registros['clave'];

    // Encriptamos el DNI
	$hash = crypt($dni, '$2y$10$' . $clave . '$');

	// Actualizamos la contraseña
	$query = "update tusuario set contrasena='".$hash."' where idtrabajador=".$idtrabajador;
	pg_query($query);

	echo "CONTRASEÑA ACTUALIZADA CORRECTAMENTE";
}


if($tipo=='ACT'){
	$usuario=$_POST['usuario'];
	$contrasena=$_POST['contrasena'];
	$idtrabajador=$_POST['idtrabajador'];

   // OBTENEMOS EL SALT
		//select clave from tusuario where idtrabajador='1'
	$query = pg_query("select clave from tusuario where idtrabajador='".$idtrabajador."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $clave = $registros['clave'];

    // Encriptamos la Nueva Contraseña
	$hash = crypt($contrasena, '$2y$10$' . $clave . '$');

	// Actualizamos la contraseña
	$query = "update tusuario set usuario='". $usuario ."', contrasena='".$hash."' where idtrabajador=".$idtrabajador;
	pg_query($query);

	echo "CONTRASEÑA ACTUALIZADA CORRECTAMENTE";
}

pg_free_result($query);
pg_close($BD_conexion);
?>