<?php
include('../phps/configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$nprestamo='2000004';

//select ts.idsocio+10000 as idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.tcuotas, tp.mcuota, tp.monto, tp.plazo, tp.comision, tp.aporte, tp.tea, tp.tem, tp.mora, tp.fprestamo, tp.fecpago, tp.condicion, tp.garantia, tp.analista, tp.operador from tprestamo as tp, tsocio as ts where ts.idsocio=tp.idsocio and  tp.nprestamo='1000010';

$query = pg_query("select ts.idsocio+1000000 as idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.tcuotas, tp.mcuota, tp.monto, tp.plazo, tp.comision, tp.aporte, tp.tea, tp.tem, tp.mora, tp.fprestamo, tp.fecpago, tp.condicion, tp.garantia, tp.analista, tp.recaudador from tprestamo as tp, tsocio as ts where ts.idsocio=tp.idsocio and  tp.nprestamo='". $nprestamo ."'");
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);

$querya = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as analista from ttrabajador where idtrabajador='".$registros[analista]."';");
$registrosa = pg_fetch_array($querya, null, PGSQL_ASSOC);

$queryo = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as operador from ttrabajador where idtrabajador='".$registros[operador]."';");
$registroso = pg_fetch_array($queryo, null, PGSQL_ASSOC);

$html= '<h3><center>CRONOGRAMA DE PAGOS</center></h3>
	<h3><center>Nº '.$nprestamo.'</center></h3>
  <table id="tinformacion">
  <thead>
  <tr>
    <th>DATOS DEL SOCIO:</th>     
  </tr>
  <tr>
    <th>CODIGO</th>
    <th>DNI</th>
      <th>NOMBRES</th>
      <th>TIPO</th>         
  </tr>
  <tr class="separar">
    <td>'.$registros[idsocio].'</td>
    <td>'. $registros[numerodoc] .'</td>
    <td>' . $registros[socio] . '</td>
    <td>TITULAR</td>    
  </tr>
  </table>
  <table>
  <tr>
    <th>DATOS DEL PRESTAMO:</th>
  </tr>
  <tr>
  <th>N° PRESTAMO:</th>
  <th>TIPO PRESTAMO:</th>
  <th>N° CUOTAS:</th>
  <th>CUOTA FINAL:</th>
  </tr>
  <tr>
    <td>'. $registros[nprestamo].'</td>
    <td>'. $registros[descripcion].'</td>
    <td>'. $registros[tcuotas].'</td>
    <td>'. $registros[mcuota].'</td>
  </tr>
  <tr>
  <th>MONTO NETO:</th>
  <th>PLAZO:</th>
  <th>COMISIÓN:</th>
  <th>APORTE X CUOTA:</th>
  </tr>
  <tr>
    <td>S/. '. $registros[monto] .'</td>
    <td>'. $registros[plazo] .'</td>
    <td>S/. '. $registros[comision] .' x Mes</td>
    <td>S/. '. $registros[aporte] .'</td>
  </tr>
  <tr>
  <th>TEA:</th>
  <th>TEM:</th>
  <th>INTERES MORATORIO:</th>
  <th>TIPO PAGO:</th>
  </tr>
  <tr>
    <td>'. $registros[tea] .' %</td>
    <td>'. $registros[tem] .' %</td>
    <td>'. $registros[mora] .' x día</td>
    <td>CUOTA FIJA</td>
  </tr>
  <tr>
    <th>FECHA DE PRESTAMO:</th>
    <th>FRECUENCIA DE PAGO:</th>
    <th>CONDICIÓN:</th>
    <th>GARANTIA:</th>
  </tr>
  <tr>
    <td>'. $registros[fprestamo]. '</td>
    <td>'. $registros[fecpago]. '</td>
    <td></td>
    <td>SIN GARANTIA</td>
  </tr>
  <tr>
    <th colspan="2">ANALISTA</th>
    <th colspan="2">OPERADOR</th>
  </tr>
  <tr>
    <td colspan="2">'.$registrosa[analista].'</td>
    <td colspan="2">'.$registroso[operador].'</td>
  </tr>
</table>';
 
$html = $html . '<br>
<table id="tinformacion">
  <thead>
  <tr>
  	<th>N° CUOTA</th>
	<th>FECHA</th>
	<th>DIA</th>
	<th>CAPITAL</th>
	<th>INTERES</th>
	<th>AMORTIZACION</th>
	<th>COMISION</th>
	<th>APORTE</th>
	<th>CUOTA</th>
  <tr>
  </thead>
  <tbody>';

  switch ($registros[fecpago]) {
    case 'LUNES A VIERNES':
        $ncuotas=27;
        $fecpago=1;
        break;
    case 'LUNES A SÁBADO':
        $ncuotas=27;
        $fecpago=2;
        break;
    case 'SEMANAL':
        $ncuotas=4;
        $fecpago=3;
        break;
    case 'QUINCENAL':
        $ncuotas=2;
        $fecpago=4;
        break;
    case 'MENSUAL':
        $ncuotas=1;
        $fecpago=5;
        break;
  } 

$tem=$registros[tem];
//$ncuotas=($registros[tcuotas]/$registros[plazo]);
$monto=$registros[monto];
$plazo=$registros[plazo];
$comision=$registros[comision];
$aporte=$registros[aporte];

  //Calcular el interes mensual
  if(($fecpago==1)||($fecpago==2))
  {
    $interes=($tem/100)/($ncuotas+1);
  }else{
  	$interes=($tem/100)/$ncuotas;
  }


  // Calcular el Costo de la comision
  $costocomision=((($monto*$comision)/100)/$ncuotas)/$plazo;

  //Calcular la Cuotra Mensual
  $cuota=($monto*$interes*(pow((1+$interes),$ncuotas*$plazo)))/((pow((1+$interes),($ncuotas*$plazo)))-1);
  $cuotaf=number_format(($cuota+$costocomision+$aporte),2,"."," ");

  $dias = array('DOM','LUN','MAR','MIE','JUE','VIE','SAB');
  $pagototal=0;
  $interestotal=0;
  $capitaltotal=0;
  $comisiontotal=0;
  $aportetotal=0;
  $cdias=0;


  for($i=1;$i<=($ncuotas*$plazo);$i++)
  {
	$dia = $dias[date('w', strtotime($date."+".$cdias."days"))];
	switch ($fecpago) {
    case 1:
        if(strcmp($dia,"VIE")==0){
        	$cdias=$cdias+3;
        }else{
        	$cdias=$cdias+1;
        }
        break;
    case 2:
        if(strcmp($dia,"SAB")==0){
        	$cdias=$cdias+2;
        }else{
        	$cdias=$cdias+1;
        }
        break;
    case 3:
    	if(strcmp($dia,"DOM")==0){
        	$cdias=$cdias+8;
        }else{
        	$cdias=$cdias+7;
        }
        break;
    case 4:
        if(strcmp($dia,"DOM")==0){
        	$cdias=$cdias+15;
        }else{
        	$cdias=$cdias+14;
        }
        break;
    case 5:
        if(strcmp($dia,"DOM")==0){
        	$cdias=$cdias+30;
        }else{
        	$cdias=$cdias+30;
        }
        break;
	}

$html = $html . '<tr><td>'.$i.'</td>';

	//Obtiene la Fecha
	$mod_date = strtotime($date."+".$cdias."days");
	//Obtiene eldía
	$dia = $dias[date('w', strtotime($date."+".$cdias."days"))];

$html = $html .	'<td>'.date("d-m-Y",$mod_date).'</td>'; //Fecha
$html = $html .	'<td>'.$dia.'</td>'; //Dia

$html = $html .	'<td>'.number_format($monto,2,",",".").'</td>'; //Capital
	$interestotal=$interestotal+($monto*$interes);
$html = $html .	'<td>'.number_format($monto*$interes,2,",",".").'</td>'; //interes
	$capitaltotal=$capitaltotal+($cuota-($monto*$interes));
$html = $html .	'<td>'.number_format($cuota-($monto*$interes),2,",",".").'</td>'; // Amortizacion
  $comisiontotal=$comisiontotal+$costocomision;
$html = $html .	'<td>'.number_format($costocomision,2,",",".").'</td>'; // Comision
   $aportetotal=$aportetotal+$aporte;
$html = $html .	'<td>'.$aporte.'</td>'; // Aporte
	$pagototal=$pagototal+$cuotaf;
$html = $html . '<td>'.number_format($cuotaf,2,",",".").'</td>'; // Cuota

	$monto=$monto-($cuota-($monto*$interes));

 $html = $html . '</tr>';
  }


$html = $html . '
  </tbody>	
  </table>';

//==============================================================
//==============================================================
//==============================================================

include("mpdf/mpdf.php");

//new mPDF($mode, $format, $font_size, $font, $margin_left, $margin_right, $margin_top, $margin_bottom, $margin_header, $margin_footer, $orientation);
$mpdf=new mPDF('c','A4');

$mpdf->SetDisplayMode('fullpage');

// LOAD a stylesheet
$stylesheet = file_get_contents('formatoA4.css');
$mpdf->WriteHTML($stylesheet,1);	// The parameter 1 tells that this is css/style only and no body/html/text

$header = '<table width="100%" style="border-bottom: 1px solid #000000; vertical-align: bottom; font-family: serif; font-size: 9pt; color: #000088;"><tr>
<td style="text-align: left;"><img src="logoia.png"></td>
</tr></table>';

$footer = '<table width="100%" style="border-top: 1px solid #000000; vertical-align: top; font-family: serif; font-size: 8pt; color: #000088;"><tr>
  <td style="text-align: center;">AV. Manuel Callo Zevallos Nº 444 - Telf. 084 - 211602 <br> Distrito de Sicuani, Provincia de Canchis y Departamento del Cusco.</td>
</tr></table>';

$mpdf->setAutoTopMargin = 'stretch';
$mpdf->setAutoBottomMargin = 'stretch';

$mpdf->SetHTMLHeader($header);
$mpdf->SetHTMLFooter($footer);


$mpdf->WriteHTML($html);

$mpdf->Output();

exit;
//==============================================================
//==============================================================
//==============================================================

?>