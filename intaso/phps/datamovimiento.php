<?php 
session_start();
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$tipo=$_POST['tipo'];
$sucursal=$_SESSION['sucursal'];


if($tipo=='DATA'){
   //select tm.idmovimiento, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tm.descripcion, tm.cuenta, tm.moneda, tm.monto, tm.fechamov, tm.tipomov, concat(tm.flujomov,'-',lpad(numeromov::text,8,'0')) as operacion, tm.numeromov, tm.pago, CASE WHEN tipomov='A' THEN 'AFILIACION'
   // WHEN tipomov='H' THEN 'APERTURA' WHEN tipomov='D' THEN 'DEPOSITO' WHEN tipomov='R' THEN 'RETIRO' WHEN tipomov='P' THEN 'DESEMBOLSO' WHEN tipomov='C' THEN 'PAGO CUOTA' ELSE 'NO EXISTE'
   //END as movimiento from tmovimiento as tm, tsocio as ts where tm.socio=ts.idsocio and tm.sucursal='1' and tm.flujomov='E' and tm.fechamov='2018-07-19' order by tm.numeromov;
   $flujo=$_POST['flujo'];
   $fecha=$_POST['fecha'];
   $fanulacion = date("Y-m-d");

   $query = pg_query("select tm.idmovimiento, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tm.descripcion, tm.cuenta, tm.moneda, tm.monto, tm.fechamov, tm.tipomov, concat(tm.flujomov,'-',lpad(numeromov::text,8,'0')) as operacion, tm.numeromov, tm.pago, CASE WHEN tipomov='A' THEN 'AFILIACION'
    WHEN tipomov='H' THEN 'APERTURA' WHEN tipomov='D' THEN 'DEPOSITO' WHEN tipomov='R' THEN 'RETIRO' WHEN tipomov='P' THEN 'DESEMBOLSO' WHEN tipomov='C' THEN 'PAGO CUOTA' ELSE 'NO EXISTE'
	END as movimiento from tmovimiento as tm, tsocio as ts where tm.socio=ts.idsocio and tm.sucursal='".$sucursal."' and tm.flujomov='".$flujo."' and tm.fechamov='".$fecha."' and tm.anulado='NO' order by tm.numeromov;");
   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
   }
   echo json_encode($data);
}


if($tipo=='ANUL'){
   $idmov=$_POST['idmov'];
   $tipomov=$_POST['tipomov'];

   $query = pg_query("select socio, idcaja, cuenta, monto, ncuota, fconciliado from tmovimiento where idmovimiento='".$idmov."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);     
   $idsocio=$registros[socio];
   $idcaja=$registros[idcaja];
   $cuenta=$registros[cuenta];
   $monto=$registros[monto];
   $ncuota=$registros[ncuota];
   $fconciliado=$registros[fconciliado];
   $fanulacion=date("Y-m-d");
   // ANULAMOS MOVIMIENTOS DE AFILIACION
if($fconciliado==null){
   if($tipomov=='A'){
      //Restamo el monto de afiliacion de la cuenta de la caja
      $query="update tcaja set mfinal=mfinal-". $monto ." where idcaja='" . $idcaja . "';";
      pg_query($query);
      // Marcamos el movimiento como Anulado.
      $query="update tmovimiento set anulado='SI', fconciliado='". $fanulacion ."' where idmovimiento='". $idmov ."';";
      pg_query($query);
      // Actualizamos estado de Afiliacion del socio.
      $query="update tsocio set afiliado='NO' where idsocio='". $idsocio ."';";
      pg_query($query);

      echo 'AFILIACIÓN ANULADO CON EXITO';
   }

   // ANULAMOS MOVIMIENTOS DE APERTURA
   if($tipomov=='H'){
      //Restamo el monto de afiliacion de la cuenta de la caja
      $query="update tcaja set mfinal=mfinal-". $monto ." where idcaja='" . $idcaja . "';";
      pg_query($query);
      //Marcamos el movimiento como Anulado.
      $query="  update tmovimiento set anulado='SI', fconciliado='". $fanulacion ."' where idmovimiento='". $idmov ."';";
      pg_query($query);          

      //Eliminamos la cuenta de ahorro aperturada
      $query="delete from tahorro where cuenta='". $cuenta ."';";
      pg_query($query);

      echo 'LA CUENTA APERTURADA SE ELIMINO CON EXITO'.$cuenta;
   }

   // ANULAMOS MOVIMIENTOS DE DEPOSITO
   if($tipomov=='D'){
      //Restamo el monto de afiliacion de la cuenta de la caja
      $query="update tcaja set mfinal=mfinal-". $monto ." where idcaja='" . $idcaja . "';";
      pg_query($query);
      //Marcamos el movimiento como Anulado.
      $query="  update tmovimiento set anulado='SI', fconciliado='". $fanulacion ."' where idmovimiento='". $idmov ."';";
      pg_query($query);
      // Restamos el Saldo de la cuenta de Ahorro.
      $query="update tahorro set saldo=saldo-'" . $monto . "' where cuenta='" . $cuenta . "';";
      pg_query($query);

      echo 'DEPÓSITO ANULADO CON EXITO';
   }

   // ANULAMOS MOVIMIENTOS DE RETIRO
   if($tipomov=='R'){
      //Restamo el monto de afiliacion de la cuenta de la caja
      $query="update tcaja set mfinal=mfinal+". $monto*(-1) ." where idcaja='" . $idcaja . "';";
      pg_query($query);
      //Marcamos el movimiento como Anulado.
      $query="  update tmovimiento set anulado='SI', fconciliado='". $fanulacion ."' where idmovimiento='". $idmov ."';";
      pg_query($query);
      // Restamos el Saldo de la cuenta de Ahorro.
      $query="update tahorro set saldo=saldo+'" . $monto*(-1) . "' where cuenta='" . $cuenta . "';";
      pg_query($query);

      echo 'RETIRO ANULADO CON ÉXITO';
   }

   // ANULAMOS MOVIMIENTOS DE PRESTAMO Y DESEMBOLSO
   if($tipomov=='P'){

       $query = pg_query("select count(*) as total from tcuotas where estado='PAGADO' and nprestamo='".$cuenta."' and sucursal='".$sucursal."';");
       $registros = pg_fetch_array($query, null, PGSQL_ASSOC);     

       if($registros[total]==0){
          //Restamo el monto de afiliacion de la cuenta de la caja
          $query="update tcaja set mfinal=mfinal+". $monto*(-1) ." where idcaja='" . $idcaja . "';";
          pg_query($query);
          //Marcamos el movimiento como Anulado.
          $query="  update tmovimiento set anulado='SI', fconciliado='". $fanulacion ."' where idmovimiento='". $idmov ."';";
          pg_query($query);
          //Regresamos el prestamo a la Bandeja de Desembolso.
          $query = "update tprestamo set aprobado='NO', estado='ANULADO' where nprestamo='".$cuenta."';";
          pg_query($query);
          //Eliminamos la cuotas del Desembolso.
          $query = "delete from tcuotas where nprestamo='".$cuenta."'";
          pg_query($query);

          echo 'DESEMBOLSO ANULADO EXITOSAMENTE';
       }else{
          echo 'ESTE DEMSEMBOLSO NO PUEDE SER ANULADO PORQUE TIENE CUOTAS PAGADAS';
       }

   }

   // ANULAMOS MOVIMIENTOS DE PAGO DE CUOTA
   if($tipomov=='C'){
      //Restamo el monto de afiliacion de la cuenta de la caja
      $query="update tcaja set mfinal=mfinal-". $monto ." where idcaja='" . $idcaja . "';";
      pg_query($query);
      //Marcamos el movimiento como Anulado.
      $query="  update tmovimiento set anulado='SI', fconciliado= '". $fanulacion ."' where idmovimiento='". $idmov ."';";
      pg_query($query);

      $query="update tcuotas set estado='PENDIENTE', dmora=null, vmora=null where ncuota='" . $ncuota . "' and nprestamo ='" . $cuenta . "';";
      pg_query($query);

      echo 'PAGO CUOTA ANULADO CON ÉXITO';
   }
}else{
   echo 'ESTA OPERACIÓN NO SE PUEDE ANULAR PORQUE YA SE ENCUENTRA CONCILIADO.';
}

}

pg_free_result($query);
pg_close($conn);
?>
