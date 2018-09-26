<?php

session_start();
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

//$tipo=$_POST['tipo'];
$tipomov=$_POST['tipomov'];
$nmovimiento=$_POST['nmovimiento'];

   $query = pg_query("select socio, descripcion, cuenta, monto, saldo, pago, ncuota, fechaprog, vmora, dmora, usuario from tmovimiento where tipomov='".$tipomov."' and numeromov='".$nmovimiento."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $socio=$registros[socio];
   $descripcion=$registros[descripcion];
   $cuenta=$registros[cuenta];
   $monto=$registros[monto];
   $saldo=$registros[saldo];
   $pago=$registros[pago];
   $ncuota=$registros[ncuota];
   $fpago=$registros[fechaprog];
   $vmora=$registros[vmora];
   $dmora=$registros[dmora];
   $usuario=$registros[usuario];
   $sucursal=$_SESSION['sucursal'];
   $query = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as socio from tsocio where idsocio='".$socio."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $nomsocio=$registros[socio];
   //select usuario  from tusuario where idusuario=".$usuario."'
   $query = pg_query("select usuario from tusuario where idusuario='".$usuario."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $nomusuario=$registros[usuario];
   $nticket=str_pad($nmovimiento,7,'0',STR_PAD_LEFT);
//}

if(($tipomov=="D") or ($tipomov=="A") or ($tipomov=="C") or ($tipomov=="H") or ($tipomov=="I") or ($tipomov=="T")){
    $voucher="E-".$nticket;
}

if(($tipomov=="R") or ($tipomov=="P") or ($tipomov=="E")) {
    $voucher="S-".$nticket;
}

echo '<div id="dticketcontenido" class="dticket" style="display: block;">
      <img src="../recursos/logoia.png"/>
      <table style="font-family: arialnarrow; font-size:11px;">
      <tr><td style="text-align:center">RUC: 20603428669  --  Telf: 084 211602</td>
      </tr>
      <tr><td style="text-align:center">Direccion: Av. Manual Callo Zevallos 444</td>
      </tr>
      <tr><td style="text-align:center">-----------------------------------------------</td>
      </tr>';

#La fecha también
date_default_timezone_set("America/Lima");

echo '<tr><td style="text-align:left">N° TICKET: '.$voucher.' | FECHA:'.date("d/m/Y H:i").'</td>
	 </tr>
	 <tr><td>CAJERO: '.$nomusuario.' SUCURSAL: AG. SICUANI</td>
	 </tr>';

// AFILIACION
if($tipomov=="A"){
	/* Generamos contendio de la Afiliación */
echo '<tr><td>SOCIO: '.$nomsocio.'</td></tr>
	<tr><td>MOVIMIENTO: AFILIACIÓN</td></tr>
	<tr><td>MONTO: S/. '.number_format($monto,2,"."," ").'</td></tr>';
}

// PAGAR CUOTA
if($tipomov=="C"){
	// Seleccionamos Proxima Cuota
	//select ncuota,fvencimiento from tcuotas where nprestamo='2000001' and estado='PENDIENTE' and sucursal='1' order by ncuota FETCH FIRST 1 ROWS ONLY;

    $query = pg_query("select ncuota,fvencimiento,montocuota from tcuotas where nprestamo='".$cuenta."' and estado='PENDIENTE' and sucursal='".$sucursal."' order by ncuota FETCH FIRST 1 ROWS ONLY;");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $pcuota=$registros[ncuota];
    $pfvencimiento=$registros[fvencimiento];
    $mcuota=$registros[montocuota];

    // Seleccionamos total de cuotas
	//select tcuotas from tprestamo where nprestamo='2000001' and sucursal ='1';
    $query = pg_query("select tcuotas from tprestamo where nprestamo='".$cuenta."' and sucursal ='".$sucursal."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $tcuotas=$registros[tcuotas];

	/* Generamos contendio de la Afiliación */
echo'<tr><td>SOCIO:'.$nomsocio.'</td>
	</tr>
	<tr><td>MOVIMIENTO: PAGO DE CUOTA</td>
	</tr>
	<tr><td>PRESTAMO: '.$descripcion.' - CUENTA: '.$cuenta.'</td>
	</tr>
	<tr><td>CUOTA: '.$ncuota.'/'.$tcuotas.'   ---   FECHA PAGO: '.$fpago.'</td>
	</tr>';

	if($dmora<=0){
		$dmora=0;
	}

echo'<tr><td>MONTO: S/. '.number_format($mcuota,2,"."," ").'   ---   DÍAS MORA: '.$dmora.'</td>
	</tr>
	<tr><td>MORA: S/. '.number_format($vmora,2,"."," ").'</td>
	</tr>
		<tr><td>TOTAL: S/. '.number_format($monto,2,"."," ").'</td>
	</tr>
		<tr><td>----------------------------------------------</td>
	</tr>
		<tr><td>PROXIMA CUOTA: '.$pcuota.' - FECHA PAGO: '.$pfvencimiento.'</td>
	</tr>';
}


// PAGA TOTAL DE PRESTAMO
if($tipomov=="T"){

    $ncuotas=$_POST['ncuotas'];
	
    // Seleccionamos total de cuotas
	//select tcuotas from tprestamo where nprestamo='2000001' and sucursal ='1';
    $query = pg_query("select tcuotas from tprestamo where nprestamo='".$cuenta."' and sucursal ='".$sucursal."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $tcuotas=$registros[tcuotas];

	/* Generamos contendio de la Afiliación */
echo'<tr><td>SOCIO:'.$nomsocio.'</td>
	</tr>
	<tr><td>MOVIMIENTO: CANCELACIÓN DE PRESTAMO</td>
	</tr>
	<tr><td>PRESTAMO: '.$descripcion.' - CUENTA: '.$cuenta.'</td>
	</tr>
	<tr><td>CUOTAS PAGADAS: '.$ncuotas.' DE UN TOTAL DE '.$tcuotas.'</td>
	</tr>';

echo'<tr><td>MONTO: S/. '.number_format($monto,2,"."," ").'</td>
	</tr>
	<tr><td>----------------------------------------------</td>
	</tr>
		<tr><td>GRACIAS POR CANCELAR SU PRESTAMO</td>
	</tr>';
}


// DEPOSITO
if($tipomov=="D"){
	/* Generamos contendio del Deposito */
echo'<tr><td>SOCIO: '.$nomsocio.'</td>
	</tr>
	<tr><td>MOVIMIENTO: DEPOSITO</td>
	</tr>
	<tr><td>AHORRO: '.$descripcion.' - N° CUENTA: '.$cuenta.'</td>
	</tr>
	<tr><td>MONTO: S/. '.number_format($monto,2,"."," ").'</td>
	</tr>
	<tr><td>SALDO: S/. '.number_format($saldo,2,"."," ").'</td>
	</tr>';
}

// AHORRO
if($tipomov=="H"){
	/* Generamos contendio del Deposito */
echo '<tr><td>SOCIO: '.$nomsocio.'</td></tr>
	<tr><td>MOVIMIENTO: APERTURA CUENTA DE AHORRO</td></tr>
	<tr><td>AHORRO: '.$descripcion.' - N° CUENTA: '.$cuenta.'</td></tr>
	<tr><td>MONTO: S/. '.number_format($monto,2,"."," ").'</td></tr>';
}


// RETIRO
if($tipomov=="R"){
	/* Generamos contendio del Retiro */
echo '<tr><td>SOCIO: '.$nomsocio.'</td></tr>
	<tr><td>MOVIMIENTO: RETIRO</td></tr>
	<tr><td>AHORRO: '.$descripcion.' - N° CUENTA: '.$cuenta.'</td></tr>
	<tr><td>MONTO: S/. '.number_format($monto,2,"."," ").'</td></tr>
	<tr><td>SALDO: S/. '.number_format($saldo,2,"."," ").'</td></tr>';	
}


// PRESTAMO
if($tipomov=="P"){

    // Seleccionamos Datos del Prestamo 
	//select tcuotas,montocuota,plazo,fecpago from tprestamo where nprestamo='2000001' and sucursal ='1';
    $query = pg_query("select tcuotas,mcuota,plazo,fecpago from tprestamo where nprestamo='".$cuenta."' and sucursal ='".$sucursal."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $tcuotas=$registros[tcuotas];
    $montocuota=$registros[mcuota];
    $plazo=$registros[plazo];
    $fecpago=$registros[fecpago];

echo'<tr><td>SOCIO: '.$nomsocio.'</td></tr>
	<tr><td>MOVIMIENTO: DESEMBOLSO DE PRESTAMO</td></tr>
	<tr><td>PRESTAMO: '.$descripcion.' - N° CUENTA: '.$cuenta.'</td></tr>
	<tr><td>N° CUOTAS: '.$tcuotas.' - MONTO x CUOTA: '.number_format($montocuota,2,"."," ").'</td></tr>
	<tr><td>PLAZO: '.$plazo.' Meses - FEC. PAGO: '.$fecpago.'</td></tr>
	<tr><td>MONTO DESEMBOLSADO: S/. '.number_format($monto*(-1),2,"."," ").'</td></tr>';
	/* Generamos contendio del Deposito */
}


// INGRESO A CAJA
if($tipomov=="I"){
	/* Generamos contendio del Ingreso a Caja */
   $query = pg_query("select concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador where idtrabajador='". $socio ."' and sucursal='1';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $nomsocio=$registros[trabajador];

echo '<tr><td>TRABAJADOR: '.$nomsocio.'</td></tr>
	<tr><td>MOVIMIENTO: INGRESO A CAJA</td></tr>
	<tr><td>DESCRIPCIÓN: '. $descripcion.'</td></tr>
	<tr><td>MONTO: S/. '.number_format($monto,2,"."," ").'</td></tr>';
}


// EGRESO A CAJA
if($tipomov=="E"){
	/* Generamos contendio del Egreso a Caja */
   $query = pg_query("select concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador where idtrabajador='". $socio ."' and sucursal='1';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $nomsocio=$registros[trabajador];

echo '<tr><td>TRABAJADOR: '.$nomsocio.'</td></tr>
	<tr><td>MOVIMIENTO: EGRESO A CAJA</td></tr>
	<tr><td>DESCRIPCIÓN: '. $descripcion.'</td></tr>
	<tr><td>MONTO: S/. '.number_format($monto*(-1),2,"."," ").'</td></tr>';
}

echo '<tr><td><br><br>----------------------------------</td>
	</tr>
	<tr><td>FIRMA DEL CLIENTE</td>
	</tr>
	</table>
	</div>
    <button id="bdticketimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
    <button id="bdticketcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';

pg_free_result($query);
pg_close($conn);

?>