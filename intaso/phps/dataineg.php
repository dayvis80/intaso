<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
     header('Location: login.php');
  }else{
     include('configuracion.php');
     $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
  }

$tipo=$_POST['tipo'];
$tipomov=$_POST['tipomov'];
$sucursal=$_SESSION['sucursal'];

//SELECCIONAMOS LOS REGISTROS DE LA TABLA
if($tipo=='DATA'){
   $query = pg_query("select ti.idineg, ti.detalle, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as trabajador, concat('S/. ',ti.monto) as monto, ti.tipodoc, ti.numerodoc, ti.fechaineg as fecha, ti.observaciones from tineg as ti, ttrabajador as tt where ti.trabajador=tt.idtrabajador and ti.tipomov='". $tipomov ."' and ti.sucursal='". $sucursal ."';");

   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $data["data"][]=$registros;
   }	
echo json_encode($data);
}


if($tipo=='INGC'){
   $detalle=strtoupper($_POST['detalle']);
   $idtrabajador=$_POST['trabajador'];
   $moneda=$_POST['moneda'];
   $monto=$_POST['monto'];
   $documento=$_POST['documento'];
   $numero=$_POST['numero'];
   $fechaineg=$_POST['fechaineg'];
   $observaciones=$_POST['observaciones'];
   $fecha = date("Y-m-d");
   $hora = date("H:i:s");
   $tipotrabajador=$_SESSION['tipotrabajador'];
   $trabajador=$_SESSION['idtrabajador'];
   $usuario=$_SESSION['idtrabajador'];

   if(($tipotrabajador==2) or ($tipotrabajador==4) or ($tipotrabajador==5)  or ($tipotrabajador==10)){

   // ----- BUSCAMOS SI EL USUARIO TIENE UNA CAJA ABIERTA  -----//
   //select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
   $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
   $datos=pg_query($query);
   $tregistros = pg_numrows($datos);
   $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
   $idcaja=$registros[idcaja];

   if($tregistros == 1){

      // ----- BUSCAMOS EL NUMERO DEL ULTIMO MOVIMIENTO Y AGREGAMOS UNO  -----//
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
      $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','I','". $idtrabajador ."','". $cuenta . "','". $detalle ."','E','". $nmovimiento ."','SOL','". $monto ."','". $fecha ."','". $hora ."','CORRECTO','NO','NO','" . $usuario ."','" . $sucursal . "');";
      pg_query($query);

     // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
     //update tcaja set mfinal=mfinal+10 where idcaja='1';
     $query="update tcaja set mfinal=mfinal+". $monto ." where idcaja='" . $idcaja . "';";
     pg_query($query);

     // ----- REGISTRAMO EL NUEVO INGRESO A CAJA -----//
     //insert into tineg (detalle, trabajador, tipomov, moneda, monto, tipodoc, numerodoc, observaciones, fechaineg, horaineg, usuario, sucursal) values ('PAGO TELEFONO','2','I','SOL','120.00','REC','001-00000231','','2018-08-22','12:25:33','2','1');
     $query="insert into tineg (detalle, trabajador, tipomov, moneda, monto, tipodoc, numerodoc, fechaineg, observaciones, fechareg, horareg, usuario, sucursal) 
     values ('". $detalle ."','". $idtrabajador ."','I','". $moneda ."','". $monto ."','". $documento ."','". $numero ."','". $fechaineg ."','". $observaciones ."','". $fecha ."','". $hora ."','". $usuario ."','". $sucursal ."');";
     pg_query($query);

     $phptoajax[0]="SE REGISTRO CORRECTAMENTE EL INGRESO";
     $phptoajax[1]=$nmovimiento;
     $phptoajax[2]="I";
     echo json_encode($phptoajax);
   }else{
      echo '1';
   }
}else{
   echo '2';
}
}


if($tipo=='EGRC'){
   $detalle=strtoupper($_POST['detalle']);
   $idtrabajador=$_POST['trabajador'];
   $moneda=$_POST['moneda'];
   $monto=$_POST['monto'];
   $documento=$_POST['documento'];
   $numero=$_POST['numero'];
   $fechaineg=$_POST['fechaineg'];
   $observaciones=$_POST['observaciones'];
   $fecha = date("Y-m-d");
   $hora = date("H:i:s");
   $tipotrabajador=$_SESSION['tipotrabajador'];
   $trabajador=$_SESSION['idtrabajador'];
   $usuario=$_SESSION['idtrabajador'];

   $monto=$monto*(-1);
   if(($tipotrabajador==2) or ($tipotrabajador==4) or ($tipotrabajador==5)  or ($tipotrabajador==10)){

   // ----- BUSCAMOS SI EL USUARIO TIENE UNA CAJA ABIERTA  -----//
   //select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
   $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
   $datos=pg_query($query);
   $tregistros = pg_numrows($datos);
   $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
   $idcaja=$registros[idcaja];

   if($tregistros == 1){

      // ----- BUSCAMOS EL NUMERO DEL ULTIMO MOVIMIENTO Y AGREGAMOS UNO  -----//
      $query = pg_query("select max(numeromov) as num from tmovimiento where flujomov='S' and sucursal='".$sucursal."';");
      $tregistros = pg_numrows($query);
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

      if($registros[num]==null){
      $nmovimiento=1;
      }else{
      $nmovimiento=$registros[num]+1;
      }

      // ----- REGISTRAMOS EL MOVIMIENTO  -----//
      //insert into tmovimiento (idcaja,idtipomov,socio,cuenta,numeromov,moneda,monto,fmovimiento,hora,pago,conciliado,usuario,sucursal) values ('1','1','1','3000002','100001','SOL','20.00','2017-09-12','10:33:24','PUNTUAL','NO','1','1');
      $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','E','". $idtrabajador ."','". $cuenta . "','". $detalle ."','S','". $nmovimiento ."','SOL','". $monto ."','". $fecha ."','". $hora ."','CORRECTO','NO','NO','" . $usuario ."','" . $sucursal . "');";
      pg_query($query);

     // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
     //update tcaja set mfinal=mfinal+10 where idcaja='1';
     $query="update tcaja set mfinal=mfinal+". $monto ." where idcaja='" . $idcaja . "';";
     pg_query($query);


   // ----- REGISTRAMO EL NUEVO EGRESO A LA CAJA  -----//
   //insert into tineg (detalle, trabajador, tipomov, moneda, monto, tipodoc, numerodoc, observaciones, fechaineg, horaineg, usuario, sucursal) values ('PAGO TELEFONO','2','E','SOL','120.00','REC','001-00000231','','2018-08-22','12:25:33','2','1');
   $query="insert into tineg (detalle, trabajador, tipomov, moneda, monto, tipodoc, numerodoc, fechaineg, observaciones, fechareg, horareg, usuario, sucursal) 
   values ('". $detalle ."','". $idtrabajador ."','E','". $moneda ."','". $monto ."','". $documento ."','". $numero ."','". $fechaineg ."','". $observaciones ."','". $fecha ."','". $hora ."','". $trabajador ."','". $sucursal ."');";
   pg_query($query);

   $phptoajax[0]="SE REGISTRO CORRECTAMENTE EL EGRESO";
   $phptoajax[1]=$nmovimiento;
   $phptoajax[2]="E";
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