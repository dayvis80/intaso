<?php 
session_start();
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$tipo=$_POST['tipo'];


// MOSTRAMOS LOS DATO DE LOS SOCIOS PARA SU CONSULTA //
if($tipo=='DATA'){

   $afiliacion=$_POST['afiliacion'];
   //select ts.idsocio as id, ts.idsocio + 10000000 as nsocio, ts.tipodoc as tipo, ts.numerodoc as dni, CONCAT(ts.nombres,' ',ts.apaterno,' ', ts.amaterno) as socio, ts.mafiliacion as afiliacion, ts.fregistro as registro, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as usuario from tsocio as ts, ttrabajador as tt where ts.usuario=tt.idtrabajador and ts.afiliado='NO' order by socio;
   $query = pg_query("select ts.idsocio as id, ts.idsocio + 10000000 as nsocio, ts.tipodoc as tipo, ts.numerodoc as dni, CONCAT(ts.nombres,' ',ts.apaterno,' ', ts.amaterno) as socio, ts.mafiliacion as afiliacion, ts.fregistro as registro, ts.afiliado as afiliado, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as usuario from tsocio as ts, ttrabajador as tt where ts.usuario=tt.idtrabajador and ts.afiliado='". $afiliacion ."' order by socio;");
   $tregistros = pg_numrows($query);
      for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	     //$data["data"][]=array_map(utf8_encode, $registros);
         $data["data"][]=$registros;
	  }	
    echo json_encode($data);
}


if($tipo=='BUS'){
  $dni=$_POST['dni'];
  //select idsocio, numerodoc, CONCAT(nombres,' ',apaterno,' ',amaterno) as socio, direccion, afiliado from tsocio where numerodoc='20202020'
  $query = pg_query("select idsocio, numerodoc, CONCAT(nombres,' ',apaterno,' ',amaterno) as socio, direccion, afiliado from tsocio where numerodoc='".$dni."';");
  $tregistros = pg_numrows($query);

  if($tregistros < 1) {
	echo "ESTE SOCIO NO SE ENCUENTRA REGISTRADO";
  }else {
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    if($registros[afiliado]=="SI")
    //if(strcmp($registros['afiliado'],"SI")==0)
    {
    $data[]=$registros;
    echo json_encode($data);
    }else{
        echo "ESTE SOCIO NO SE ENCUENTRA AFILIADO";
    }
  }
}

//BUSCAR LOS DATOS DEL SOCIO
if($tipo=='BSE'){
	$dni= trim($_POST['dni']);

	$query = pg_query("select tipodoc, numerodoc, apaterno, amaterno, nombres, numhijos, ecivil, sexo, fnacimiento, tcelular, temergencia, email, ocupacion, departamento, provincia, distrito, direccion, referencia, tvivienda, mconstruccion, utrabajo, rtrabajo, cdni, capaterno, camaterno, cnombres, analista, mafiliacion from tsocio where numerodoc='".$dni."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
	$data[]=$registros;
	echo json_encode($data);
}


if($tipo=='INS'){

	$tipodoc=$_POST['tipodoc'];
	$numerodoc= trim($_POST['numerodoc']);
	$apaterno=strtoupper($_POST['apaterno']);
	$amaterno=strtoupper($_POST['amaterno']);
	$nombres=strtoupper($_POST['nombres']);
	$nhijos=$_POST['nhijos'];
	$ecivil=$_POST['ecivil'];
	$sexo=$_POST['sexo'];
	$fnacimiento=$_POST['fnacimiento'];
	$tcelular=$_POST['tcelular'];
	$temergencia=$_POST['temergencia'];
	$email=strtoupper($_POST['email']);
	$ocupacion=strtoupper($_POST['ocupacion']);
	$departamento=strtoupper($_POST['departamento']);
	$provincia=strtoupper($_POST['provincia']);
	$distrito=strtoupper($_POST['distrito']);
	$direccion=strtoupper($_POST['direccion']);
	$tvivienda=$_POST['tvivienda'];
	$mconstruccion=strtoupper($_POST['mconstruccion']);
	$rdomicilio=strtoupper($_POST['rdomicilio']);
	$utrabajo=strtoupper($_POST['utrabajo']);
	$rtrabajo=strtoupper($_POST['rtrabajo']);
	$cdni=$_POST['cdni'];
	$capaterno=strtoupper($_POST['capaterno']);
	$camaterno=strtoupper($_POST['camaterno']);
	$cnombres=strtoupper($_POST['cnombres']);
	$analista=$_POST['analista'];
	$afiliacion=$_POST['afiliacion'];
	$usuario=$_SESSION['idtrabajador'];
	$sucursal=$_SESSION['sucursal'];
	$fregistro=date("Y-m-d H:i:s");

	//select * from tsocio where numerodoc='40700920';
	$query = pg_query("select * from tsocio where numerodoc = '" . $numerodoc ."';");
	$tregistros = pg_numrows($query);

	if($tregistros < 1) {

    //    insert into tsocio (tipodoc,numerodoc,apaterno,amaterno,nombres,numhijos,ecivil,sexo,fnacimiento,tcelular,temergencia,email,ocupacion,departamento,provincia,distrito,direccion,referencia,tvivienda,mconstruccion,utrabajo,rtrabajo,cdni,capaterno,camaterno,cnombres,analista,mafiliacion,fregistro,sucursal) values('DNI','40700920','FARFAN','GAVANCHO','DAYVIS VICTOR',1,'SOLTERO','MASCULINO','08/06/1980','951680606','','DAYVIS.FARFAN@GMAIL.COM','ING. DE SISTEMAS','CUSCO','CANCHIS','SICUANI','AV. JOSE PARRA S/N','A 1/2 CUADRA DE LA PLAZA BOLOGNESI','FAMILIAR','MATERIAL NOBLE','','','43768776','TORRES','ARPI','HILDA',3,1000,now(),1)

	$query = "insert into tsocio (tipodoc,numerodoc,apaterno,amaterno,nombres,numhijos,ecivil,sexo,fnacimiento,tcelular,temergencia,email,ocupacion,departamento,provincia,distrito,direccion,referencia,tvivienda,mconstruccion,utrabajo,rtrabajo,cdni,capaterno,camaterno,cnombres,analista,mafiliacion,afiliado,sucursal,usuario,fregistro) values('" . $tipodoc . "','" . $numerodoc . "','". $apaterno . "','" . $amaterno . "','" . $nombres . "'," . $nhijos . ",'" . $ecivil . "','" . $sexo . "','" . $fnacimiento . "','" . $tcelular . "','". $temergencia ."','" . $email . "','" . $ocupacion . "','" . $departamento . "','" . $provincia . "','" . $distrito ."','" . $direccion . "','" . $rdomicilio . "','" . $tvivienda . "','" . $mconstruccion . "','" . $utrabajo . "','" . $rtrabajo . "','". $cdni . "','" . $capaterno ."','" . $camaterno . "','" . $cnombres . "',". $analista . ",". $afiliacion . ",'NO',". $sucursal .",'". $usuario . "','". $fregistro ."');";

	pg_query($query);

	echo "SE REGISTRO CORRECTAMENTE EL NUEVO SOCIO";

	}else {
	echo "ESTE SOCIO YA SE ENCUENTRA REGISTRADO";
	}
}


if($tipo=='ACT'){
	$tipodoc=$_POST['tipodoc'];
	$numerodoc= trim($_POST['numerodoc']);
	$apaterno=strtoupper($_POST['apaterno']);
	$amaterno=strtoupper($_POST['amaterno']);
	$nombres=strtoupper($_POST['nombres']);
	$nhijos=$_POST['nhijos'];
	$ecivil=$_POST['ecivil'];
	$sexo=$_POST['sexo'];
	$fnacimiento=$_POST['fnacimiento'];
	$tcelular=$_POST['tcelular'];
	$temergencia=$_POST['temergencia'];
	$email=strtoupper($_POST['email']);
	$ocupacion=strtoupper($_POST['ocupacion']);
	$departamento=strtoupper($_POST['departamento']);
	$provincia=strtoupper($_POST['provincia']);
	$distrito=strtoupper($_POST['distrito']);
	$direccion=strtoupper($_POST['direccion']);
	$tvivienda=$_POST['tvivienda'];
	$mconstruccion=strtoupper($_POST['mconstruccion']);
	$rdomicilio=strtoupper($_POST['rdomicilio']);
	$utrabajo=strtoupper($_POST['utrabajo']);
	$rtrabajo=strtoupper($_POST['rtrabajo']);
	$cdni=$_POST['cdni'];
	$capaterno=strtoupper($_POST['capaterno']);
	$camaterno=strtoupper($_POST['camaterno']);
	$cnombres=strtoupper($_POST['cnombres']);
	$analista=$_POST['analista'];
	$afiliacion=$_POST['afiliacion'];
	//$sucursal=1;
	//$fregistro=date("Y-m-d H:i:s");

    // update tsocio set apaterno='FARFAN', amaterno='GAVANCHO', nombres='DAYVIS', numhijos='1', ecivil='SOLTERO', sexo='MASCULINO', fnacimiento='1980-06-08', tcelular='951680606', temergencia='951680606', email='DAYVIS.FARFAN@GMAIL.COM', ocupacion='ING. DE SISTEMAS', departamento='PUNO', provincia='PUNO', distrito='PUNO', direccion='URB. SAN APOLINAR C-16', referencia='COLEGIO 45', tvivienda='PROPIO', mconstruccion='DE CEMENTO', utrabajo='JULIACA', rtrabajo='POR EL OVALO', cdni='43768776', capaterno='TORRES', camaterno='ARPI', cnombres='HILDA', analista='2', mafiliacion='15' where numerodoc='40700920';

    $query="update tsocio set apaterno='" . $apaterno . "', amaterno='" . $amaterno . "', nombres='" . $nombres . "', numhijos='" . $nhijos . "', ecivil='" . $ecivil . "', sexo='" . $sexo . "', fnacimiento='" . $fnacimiento . "', tcelular='" . $tcelular . "', temergencia='" . $temergencia . "', email='" . $email . "', ocupacion='" . $ocupacion . "', departamento='" . $departamento . "', provincia='" . $provincia . "', distrito='" . $distrito . "', direccion='" . $direccion . "', referencia='" . $rdomicilio . "', tvivienda='" . $tvivienda . "', mconstruccion='" . $mconstruccion . "', utrabajo='" . $utrabajo . "', rtrabajo='" . $rtrabajo . "', cdni='" . $cdni . "', capaterno='" . $capaterno . "', camaterno='" . $camaterno . "', cnombres='" . $cnombres . "', analista='" . $analista . "', mafiliacion='" . $afiliacion . "' where numerodoc='" . $numerodoc . "';";

	pg_query($query);

	echo "SE ACTUALIZO CORRECTAMENTE LOS DATOS DEL SOCIO";
}



if($tipo=='AFI'){

$idsocio=$_POST['idsocio'];
$descripcion='AFILIACION';
$dni=$_POST['dni'];
$monto=$_POST['monto'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

  if(($tipotrabajador==2) or ($tipotrabajador==3) or ($tipotrabajador==4) or ($tipotrabajador==5) or ($tipotrabajador==10)){
  	//select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
	$query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='3' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
	$datos=pg_query($query);
	$tregistros = pg_numrows($datos);
    $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
    $idcaja=$registros[idcaja];
	
	if($tregistros == 1){
	  //----- ACTUALIZAR EL SOCIO A AFILIADO SI -----//
	  //update tsocio set afiliado='NO' where numerodoc='20202020';
	  $query = "update tsocio set afiliado='SI' where numerodoc='".$dni."';";
	  pg_query($query);

  	// ----- Buscamos el ultimo número de movimiento y sumamos uno para el nuevo numero de prestamo
  	$query = pg_query("select max(numeromov) as num from tmovimiento where flujomov='E' and sucursal='".$sucursal."';");
  	$tregistros = pg_numrows($query);
  	$registros = pg_fetch_array($query, null, PGSQL_ASSOC);

  	if($registros[num]==null){
    $nmovimiento=1;
  	}else{
    $nmovimiento=$registros[num]+1;
  	}

	  // ----- REGISTRAMOS EL MOVIMIENTO  -----//
	  //insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('4','A','3','40700920','AFILIACION','E','176','SOL','7.50','2018-08-07','18:32','OK','NO','NO','1','1');
	  $query2 = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','A','". $idsocio ."','". $dni ."','". $descripcion ."','E','". $nmovimiento ."','SOL','". $monto ."','". $fecha ."','". $hora ."','OK','NO','NO','" . $usuario ."','" . $sucursal . "');";
	  pg_query($query2);

	  // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
	  //update tcaja set mfinal=mfinal+10 where idcaja='1';
	  $query="update tcaja set mfinal=mfinal+". $monto ." where idcaja='" . $idcaja . "';";
	  pg_query($query);

      $phptoajax[0]="SE AFILIO CORRECTAMENTE AL SOCIO";
      $phptoajax[1]=$nmovimiento;
      $phptoajax[2]="A";
      echo json_encode($phptoajax);

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