<?php

session_start();
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

require __DIR__ . '/ticket/autoload.php'; //Nota: si renombraste la carpeta a algo diferente de "ticket" cambia el nombre en esta línea
use Mike42\Escpos\Printer;
use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;


//$tipo=$_POST['tipo'];
$tipomov=$_POST['tipomov'];

//if(($tipomov=="D") or ($tipomov=="R") or ($tipomov=="A") or ($tipomov=="C") or ($tipomov=="H")){
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
   $query = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as usuario from ttrabajador where idtrabajador='".$usuario."'");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $nomusuario=$registros[usuario];
   $nticket=str_pad($nmovimiento,7,'0',STR_PAD_LEFT);
//}

if(($tipomov=="D") or ($tipomov=="A") or ($tipomov=="C") or ($tipomov=="H")){
    $voucher="E-".$nticket;
}

if(($tipomov=="R") or ($tipomov=="P")) {
    $voucher="S-".$nticket;
}

//$nombre_impresora = "POSINTASO"; 

$nombre_impresora = "http://192.168.1.56/POSINTASO";
$connector = new WindowsPrintConnector($nombre_impresora);

//$connector = new NetworkPrintConnector("192.168.1.56", 9100);
$printer = new Printer($connector);

# Vamos a alinear al centro lo próximo que imprimamos
$printer->setJustification(Printer::JUSTIFY_CENTER);
$printer -> setTextSize(1, 1);

/* Cargar e imprimir el logo */
try{
	$logo = EscposImage::load("../recursos/logoia.png", false);
    $printer->bitImage($logo , Printer::IMG_DOUBLE_WIDTH | Printer::IMG_DOUBLE_HEIGHT);
}catch(Exception $e){/*No hacemos nada si hay error*/}

/* imprimir encabezado */

$printer->text("\n"."RUC: 20601861496  --  Telf: 084 211602". "\n");
$printer->text("Direccion: Av. Manual Callo Zevallos 444" . "\n");
$printer->text("-----------------------------------------------" . "\n");
$printer->setJustification(Printer::JUSTIFY_LEFT);
#La fecha también
date_default_timezone_set("America/Mexico_City");
$printer->text("N° Ticket: ".$voucher." | Fecha: ".date("d/m/Y H:i") . "\n");
$printer->text("CAJERO: ". $nomusuario ."\n");
$printer->text("SUCURSAL: AGENCIA SICUANI"."\n\n");

// AFILIACION
if($tipomov=="A"){
	/* Generamos contendio de la Afiliación*/
	$printer->text("SOCIO: ".$nomsocio."\n");
	$printer->text( "MOVIMIENTO: AFILIACIÓN\n");
	$printer->text("MONTO: S/. ".number_format($monto,2,"."," ")." \n");
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
	/* Generamos contendio de la Afiliación*/
	$printer->text("SOCIO: ".$nomsocio."\n");
	$printer->text( "MOVIMIENTO: PAGO DE CUOTA\n");
	$printer->text( "PRESTAMO: ".$descripcion." - CUENTA: ".$cuenta."\n");
	$printer->text( "CUOTA: ".$ncuota."/".$tcuotas."   ---   FECHA PAGO: ".$fpago."\n");
	if($dmora<=0){
		$dmora=0;
	}
	$printer->text( "MONTO: S/. ".number_format($mcuota,2,"."," ")."   ---   DÍAS MORA: ".$dmora."\n");
	$printer->text( "MORA: S/. ".number_format($vmora,2,"."," ")."\n");
	$printer->text( "TOTAL: S/. ".number_format($monto,2,"."," ")."\n");
	$printer->text( "---------------\n");
	$printer->text( "PROXIMA CUOTA: ".$pcuota." - FECHA PAGO: ".$pfvencimiento."\n");
}

// DEPOSITO
if($tipomov=="D"){
	/* Generamos contendio del Deposito*/
	$printer->text("SOCIO: ".$nomsocio."\n");
	$printer->text( "MOVIMIENTO: DEPOSITO\n");
	$printer->text( "AHORRO: ".$descripcion." - N° CUENTA: ".$cuenta."\n");
	$printer->text("MONTO: S/. ".number_format($monto,2,"."," ")." \n");
	$printer->text("SALDO: S/. ".number_format($saldo,2,"."," ")." \n");
}

// AHORRO
if($tipomov=="H"){
	/* Generamos contendio del Deposito*/
	$printer->text("SOCIO: ".$nomsocio."\n");
	$printer->text( "MOVIMIENTO: APERTURA CUENTA DE AHORRO\n");
	$printer->text( "AHORRO: ".$descripcion." - N° CUENTA: ".$cuenta."\n");
	$printer->text("MONTO: S/. ".number_format($monto,2,"."," ")." \n");
}

// RETIRO
if($tipomov=="R"){
	/* Generamos contendio del Retiro*/
	$printer->text("SOCIO: ".$nomsocio."\n");
	$printer->text( "MOVIMIENTO: RETIRO\n");
	$printer->text( "AHORRO: ".$descripcion." - N° CUENTA: ".$cuenta."\n");
	$printer->text("MONTO: S/. ".number_format($monto,2,"."," ")." \n");
	$printer->text("SALDO: S/. ".number_format($saldo,2,"."," ")." \n");
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

	/* Generamos contendio del Deposito*/
	$printer->text("SOCIO: ".$nomsocio."\n");
	$printer->text( "MOVIMIENTO: DESEMBOLSO DE PRESTAMO\n");
	$printer->text( "PRESTAMO: ".$descripcion." - N° CUENTA: ".$cuenta."\n");
	$printer->text( "N° CUOTAS: ".$tcuotas." - MONTO x CUOTA: ".number_format($montocuota,2,"."," ")."\n");
	$printer->text( "PLAZO: ".$plazo." Meses - FEC. PAGO: ".$fecpago."\n");
	$printer->text("MONTO DESEMBOLSADO: S/. ".number_format($monto*(-1),2,"."," ")." \n");
}

$printer->text( "\n\n------------------------\n");
$printer->text( "Firma del Cliente\n");


/*Alimentamos el papel 3 veces*/
$printer->feed(3);

/* Cortamos el papel. Si nuestra impresora 	no tiene soporte para ello, no generará ningún error */

$printer->cut();

/* Por medio de la impresora mandamos un pulso.
	Esto es útil cuando la tenemos conectada por ejemplo a un cajón */
$printer->pulse();

/* Para imprimir realmente, tenemos que "cerrar" 	la conexión con la impresora. Recuerda incluir esto al final de todos los archivos */
$printer->close();

pg_free_result($query);
pg_close($conn);

?>