<?php 
session_start();
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

date_default_timezone_set("America/Lima");
$tipo=$_POST['tipo'];
$sucursal=$_SESSION['sucursal'];


if($tipo=='DATA'){
   //select ta.idahorro as n, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, ta.cuenta as cuenta, ta.descripcion as ahorro, ta.plazo as plazo, ta.tem as tem, ta.fapertura as fapertura, ta.saldo as saldo from tahorro as ta, tsocio as ts where ts.idsocio=ta.idsocio and ta.sucursal='1'
   $query = pg_query("select ta.idahorro as n, ta.idsocio as idsocio, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, ta.cuenta as cuenta, ta.descripcion as ahorro, ta.plazo as plazo, ta.tem as tem, ta.moneda as moneda, ta.fapertura as fapertura, ta.fvencimiento as fvencimiento, ta.estado as estado, ta.saldo as saldo from tahorro as ta, tsocio as ts where ts.idsocio=ta.idsocio and ta.sucursal='1';");
   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
   }
   echo json_encode($data);
}


if($tipo=='GUAR'){

$idsocio=$_POST['idsocio'];
$dni=$_POST['dni'];
$socio=$_POST['socio'];
$direccion=$_POST['direccion'];
$tahorro=$_POST['tahorro'];
$tem=$_POST['tem'];
$plazo=$_POST['plazo'];
$moneda=$_POST['moneda'];
$monto=$_POST['monto'];
$ncuenta=$_POST['ncuenta'];
$fapertura = date("d-m-Y");
$mod_date = strtotime($fapertura."+".$plazo."months");
$fvencimiento=date("d-m-Y",$mod_date);
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

     // --->1 Buscamos la ultima cuenta de Ahorro y sumamos uno para la siguiente cuenta
     $query = pg_query("select max(idahorro) as num from tahorro;");
     $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

     if($registros[num]==null){
        $ncuenta=30000001;
     }else{
        $ncuenta=$registros[num]+30000001;
     }

      // SE CREA LA CUENTA DE AHORRO.
      //insert into tahorro (idsocio, cuenta, descripcion, plazo, tem , moneda, fapertura, fvencimiento, saldo, estado, usuario, sucursal) values (1,'3000001','PLAZO FIJO', '12', '4','SOL','2018-07-20','2019-01-20' ,'1000','1',1)	;
      $query="insert into tahorro (idsocio, cuenta, descripcion, plazo, tem , moneda, fapertura, fvencimiento, saldo, estado, usuario, sucursal, mapertura) values (" . $idsocio .",'" . $ncuenta . "','" . $tahorro . "','" . $plazo . "','" . $tem . "','" . $moneda . "','" . $fapertura . "','" . $fvencimiento . "','" . $monto . "','VIGENTE','" . $usuario . "','" . $sucursal . "','" . $monto . "')";
  	  $result =  pg_query($query);

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
	    //insert into tmovimiento (idcaja,idtipomov,socio,cuenta,numeromov,moneda,monto,fmovimiento,hora,pago,conciliado,usuario,sucursal) values ('1','1','1','3000002','100001','SOL','20.00','2017-09-12','10:33:24','PUNTUAL','NO','1','1');
	    $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,saldo,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','H','". $idsocio ."','". $ncuenta . "','". $tahorro ."','E','". $nmovimiento ."','SOL','". $monto ."','". $monto ."','". $fecha ."','". $hora ."','OK','NO','NO','" . $usuario ."','" . $sucursal . "');";
	    pg_query($query);

	    // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
	    //update tcaja set mfinal=mfinal+10 where idcaja='1';
	    $query="update tcaja set mfinal=mfinal+". $monto ." where idcaja='" . $idcaja . "';";
	    pg_query($query);


  	  if (!$result) {
    	   echo $query;
  	  }else{
         $phptoajax[0]="CUENTA APERTURADA EXITOSAMENTE";
         $phptoajax[1]=$nmovimiento;
         $phptoajax[2]="H";
         echo json_encode($phptoajax);
  	  }
   }else{
	echo '1';
  } //Fin de Registro 1
}else{
	echo '2';
}
}


//Generamos el Extracto.
if($tipo=='EXTR'){
  $ncuenta=$_POST['ncuenta'];

   //Seleccionamos datos de la Cuenta de Ahorro
   //select ts.idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, ts.direccion, ta.descripcion, ta.plazo, ta.tem, ta.mapertura, ta.moneda, ta.fapertura, ta.fvencimiento from tahorro as ta, tsocio as ts where ts.idsocio=ta.idsocio and ta.cuenta='30000001' and sucursal='1';
   $query = pg_query("select ts.idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, ts.direccion, ta.descripcion, ta.plazo, ta.tem, ta.mapertura, ta.moneda, ta.fapertura, ta.fvencimiento from tahorro as ta, tsocio as ts where ts.idsocio=ta.idsocio and ta.cuenta='".$ncuenta."' and ta.sucursal='". $sucursal ."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

   echo'<div id="dahocontenido" class="dpagina" style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h2>HOJA RESUMEN DE CUENTA DE AHORRO</h2></center>
      <br>
      <table class="tpagina">
      <caption>DATOS DEL SOCIO</caption>     
      <tr>
         <th colspan="2" width="15%">CODIGO:</th>
         <th colspan="2" width="15%">DNI:</th>
         <th colspan="2" width="35%">NOMBRES:</th>
         <th colspan="2" width="35%">DIRECCIÓN:</th>          
      </tr>
      <tr class="separar">
         <td colspan="2">'. ($registros[idsocio]+100000) .'</td>
         <td colspan="2">'. $registros[numerodoc] .'</td>
         <td colspan="2">'. $registros[socio] .'</td>
         <td colspan="2">'. $registros[direccion] .'</td>   
      </tr>
      <tr>
        <td colspan="8" class="caption">DATOS DE LA CUENTA DE AHORRO:</th>
     </tr>
     <tr>
        <th colspan="2">N° CUENTA:</th>
        <th colspan="2">TEM:</th>
        <th colspan="2">TIPO AHORRO:</th>
        <th colspan="2">PLAZO:</th>
     </tr>
     <tr>
        <td colspan="2">'.$ncuenta.'</td>
        <td colspan="2">'. $registros[tem] .' %</td>
        <td colspan="2">'. $registros[descripcion].'</td>
        <td colspan="2">'. $registros[plazo] .' Meses</td>
     </tr>
     <tr>
        <th colspan="2">MONTO APERTURA:</th>
        <th colspan="2">MONEDA:</th>
        <th colspan="2">FECHA APERTURA:</th>
        <th colspan="2">FECHA DE VENCIMIENTO:</th>
     </tr>
     <tr>
        <td colspan="2"> S/.'. $registros[mapertura] .'</td>
        <td colspan="2">'. $registros[moneda] .'</td>
        <td colspan="2">'. $registros[fapertura] .'</td>
        <td colspan="2">' . $registros[fvencimiento] . '</td>
     </tr>
     </table>';

   echo '<br>
      <table class="tpagina" style="font-size:10px">
      <tr>
         <th>#</th>
         <th>N° OPERACION</th>
         <th>MONTO</th>
         <th>MONEDA</th>
         <th>FECHA MOV</th>
         <th>HORA MOV</th>
         <th>TIPO MOV.</th>
         <th>SALDO</th>
      </tr>';

//select idmovimiento, numeromov, monto, moneda, fechamov, horamov, saldo , tipomov from tmovimiento where cuenta='30000001' order by fechamov, idmovimiento
   $query = pg_query("select idmovimiento, numeromov, monto, moneda, fechamov, horamov, saldo , tipomov from tmovimiento where cuenta='".$ncuenta."' and anulado='NO' and sucursal='".$sucursal."' order by idmovimiento, fechamov");
   $tregistros = pg_numrows($query);

   for($i=1;$i<=$tregistros;$i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo "<tr>";
         if($registros[tipomov]=='H'){
          $mov='APERTURA';
          $voucher='E-'.str_pad($registros[numeromov],7,'0',STR_PAD_LEFT); }
         if($registros[tipomov]=='D'){$mov='DEPOSITO';
          $voucher='E-'.str_pad($registros[numeromov],7,'0',STR_PAD_LEFT); }
         if($registros[tipomov]=='R'){$mov='RETIRO';
          $voucher='S-'.str_pad($registros[numeromov],7,'0',STR_PAD_LEFT); }
         echo "<td>".$i."</td>";
         echo "<td>".$voucher."</td>";
         echo "<td>S/. ".$registros[monto]."</td>";
         echo "<td>".$registros[moneda]."</td>";
         echo "<td>".$registros[fechamov]."</td>";
         echo "<td>".$registros[horamov]."</td>";
         echo "<td>".$mov."</td>";
         echo "<td>S/.".$registros[saldo]."</td>";
      echo "</tr>";
   }


   echo '</table>
      </div>
      <button id="baextimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
      <button id="baextcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';

}


if($tipo=='DEP'){

$idsocio=$_POST['idsocio'];
$cuenta=$_POST['cuenta'];
$monto=$_POST['monto'];
$tahorro=$_POST['tahorro'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

  if(($tipotrabajador==2) or ($tipotrabajador==3) or ($tipotrabajador==4) or ($tipotrabajador==5) or ($tipotrabajador==10) or ($tipotrabajador==12)){
  	//select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
	$query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='3' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
	$datos=pg_query($query);
	$tregistros = pg_numrows($datos);
    $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
    $idcaja=$registros[idcaja];

	if(($tregistros == 1) or ($tipotrabajador==12)){

     if($tipotrabajador==12)
       {$idcaja=0; }

  	  // ----- Buscamos el ultimo número de movimiento y sumamos uno para el nuevo numero de prestamo
  	  $query = pg_query("select max(numeromov) as num from tmovimiento where flujomov='E' and sucursal='".$sucursal."';");
  	  $tregistros = pg_numrows($query);
  	  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

  	  if($registros[num]==null){
    	$nmovimiento=1;
  	  }else{
    	$nmovimiento=$registros[num]+1;
  	  }

  	  // ----- Seleccionamos el Saldo de la Cuenta de ahorro
  	  $query = pg_query("select saldo from tahorro where cuenta='".$cuenta."' and sucursal='".$sucursal."';");
  	  $tregistros = pg_numrows($query);
  	  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
  	  $saldo = $registros[saldo]+$monto;


	  // ----- REGISTRAMOS EL MOVIMIENTO  -----//
	  //insert into tmovimiento (idcaja,idtipomov,socio,cuenta,numeromov,moneda,monto,fmovimiento,hora,pago,conciliado,usuario,sucursal) values ('1','1','1','3000002','100001','SOL','20.00','2017-09-12','10:33:24','PUNTUAL','NO','1','1');
	  $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,saldo,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','D','". $idsocio ."','". $cuenta . "','". $tahorro ."','E','". $nmovimiento ."','SOL','". $monto ."','". $saldo ."','". $fecha ."','". $hora ."','OK','NO','NO','" . $usuario ."','" . $sucursal . "');";
	  pg_query($query);


	  // ----- ACTUALIZAMOS EL SALDO DE LA CUENTA DE AHORRO  -----//
	  //update tahorro set saldo=saldo+500 where cuenta='3000001';
	  $query="update tahorro set saldo='" . $saldo . "' where cuenta='" . $cuenta . "';";
	  pg_query($query);

    if($tipotrabajador==12)
    {}else{
	  // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
	  //update tcaja set mfinal=mfinal+10 where idcaja='1';
	  $query="update tcaja set mfinal=mfinal+". $monto ." where idcaja='" . $idcaja . "';";
	  pg_query($query);
    }

    $phptoajax[0]="EL DEPOSITO RE REGISTRO CORRECTAMENTE";
    $phptoajax[1]=$nmovimiento;
    $phptoajax[2]="D";
	  echo json_encode($phptoajax);

	}else{
	echo '1';
	}
  }else{
		echo '2';
  }

}


if($tipo=='RET'){
$idsocio=$_POST['idsocio'];
$cuenta=$_POST['cuenta'];
$tahorro=$_POST['tahorro'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$monto=($_POST['monto']);
$saldo=$_POST['saldo'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];
//$naldo=$saldo+$monto;

  if($saldo >= $monto)
  {
  $monto=$monto*(-1);
    if(($tipotrabajador==2) or ($tipotrabajador==5) or ($tipotrabajador==10)){
      	//select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
	    $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
		$datos=pg_query($query);
		$tregistros = pg_numrows($datos);
    	$registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
    	$idcaja=$registros[idcaja];
    	
    	if($tregistros == 1){

  	  	  // ----- Buscamos el ultimo número de movimiento y sumamos uno para el nuevo numero de prestamo
  	  	  $query = pg_query("select max(numeromov) as num from tmovimiento where flujomov='S' and sucursal='".$sucursal."';");
  	  	  $tregistros = pg_numrows($query);
  	  	  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
  	  	  if($registros[num]==null){
    	  	$nmovimiento=1;
  	      }else{
    	    $nmovimiento=$registros[num]+1;
  	      }


	  	  // ----- Seleccionamos el Salod de la Cuenta de ahorro
  		  $query = pg_query("select saldo from tahorro where cuenta='".$cuenta."' and sucursal='".$sucursal."';");
	  	  $tregistros = pg_numrows($query);
  		  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
        $saldo = $registros[saldo]+$monto;

	  	  // ----- REGISTRAMOS EL MOVIMIENTO  -----//
	      //insert into tmovimiento (idcaja,idtipomov,socio,cuenta,numeromov,moneda,monto,fmovimiento,hora,pago,conciliado,usuario,sucursal) values ('1','1','1','3000002','100001','SOL','20.00','2017-09-12','10:33:24','PUNTUAL','NO','1','1');
	  	  $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,saldo,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','R','". $idsocio ."','". $cuenta . "','". $tahorro ."','S','". $nmovimiento ."','SOL','". $monto ."','". $saldo ."','". $fecha ."','". $hora ."','OK','NO','NO','" . $usuario ."','" . $sucursal . "');";
	      pg_query($query);

	      // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
	      //update tcaja set mfinal=mfinal+10 where idcaja='1';
	      $query="update tcaja set mfinal=mfinal+". $monto ." where idcaja='" . $idcaja . "';";
	      pg_query($query);

      	  // ----- ACTUALIZAMOS EL SALDO DE LA CUENTA DE AHORRO  -----//
	  	  //update tahorro set saldo=saldo+500 where cuenta='3000001';
	  	  $query="update tahorro set saldo='" . $saldo . "' where cuenta='" . $cuenta . "';";
	  	  pg_query($query);

        $phptoajax[0]="EL RETIRO SE REALIZO CON EXITO";
        $phptoajax[1]=$nmovimiento;
        $phptoajax[2]="R";
        echo json_encode($phptoajax);

    	}else{
		  echo '1';
		}
    }else{
		echo '2';
	}
  }else{
	echo "UD NO CUENTA CON SALDO SUFICIENTE";
  }

}


if($tipo=='BLOQ'){
  $cuenta=$_POST['ncuenta'];
  $id=$_POST['id'];

  // ----- Seleccionamos el estado de la Cuenta de ahorro
  $query = pg_query("select estado from tahorro where cuenta='".$cuenta."' and sucursal='".$sucursal."';");
  $tregistros = pg_numrows($query);
  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

  if($registros[estado]=='VIGENTE'){
     // ----- BLOQUEAMOS LA CUENTA DE AHORRO  -----//
     //update tahorro set estado='BLOQUEADO' where cuenta='30000041'
     $query="update tahorro set estado='BLOQUEADO' where cuenta='".$cuenta."' and sucursal='".$sucursal."';";
     pg_query($query);
     echo "LA CUENTA HA SIDO BLOQUEADO EXITOSAMENTE";
  }else{
     $query="update tahorro set estado='VIGENTE' where cuenta='".$cuenta."' and sucursal='".$sucursal."';";
     pg_query($query);
     echo "LA CUENTA HA SIDO DESBLOQUEADA EXITOSAMENTE";
  }
}

pg_free_result($query);
pg_close($conn);
?>

