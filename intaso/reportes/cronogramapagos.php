<?php
include('../phps/configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$nprestamo=$_GET['nprestamo'];//'2000004';

//select ts.idsocio+10000 as idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.tcuotas, tp.mcuota, tp.monto, tp.plazo, tp.comision, tp.aporte, tp.tea, tp.tem, tp.mora, tp.fprestamo, tp.fecpago, tp.condicion, tp.garantia, tp.analista, tp.operador from tprestamo as tp, tsocio as ts where ts.idsocio=tp.idsocio and  tp.nprestamo='1000010';

$query = pg_query("select ts.idsocio+1000000 as idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.tcuotas, tp.mcuota, tp.monto, tp.plazo, tp.comision, tp.aporte, tp.tea, tp.tem, tp.mora, tp.fprestamo, tp.fecpago, tp.condicion, tp.garantia, tp.analista, tp.recaudador from tprestamo as tp, tsocio as ts where ts.idsocio=tp.idsocio and  tp.nprestamo='". $nprestamo ."'");
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);

$querya = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as analista from ttrabajador where idtrabajador='".$registros[analista]."';");
$registrosa = pg_fetch_array($querya, null, PGSQL_ASSOC);

$queryo = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as recaudador from ttrabajador where idtrabajador='".$registros[recaudador]."';");
$registroso = pg_fetch_array($queryo, null, PGSQL_ASSOC);

$html= '<h3><center>CRONOGRAMA DE PAGOS</center></h3>
	<h3><center>PRESTAMO Nº '.$nprestamo.'</center></h3>
  <table class="tinformacion">
  <thead>
    <tr>
      <th colspan="4">DATOS DEL SOCIO:</th>
    </tr>
  </thead>
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
  </table><br>
  <table id="tprestamo">
  <thead>
  <tr>
    <th colspan="4">DATOS DEL PRESTAMO:</th>
  </tr>
  </thead>
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
    <td>S/. '. $registros[mcuota].'</td>
  </tr>
  <tr>
  <th>MONTO NETO:</th>
  <th>PLAZO:</th>
  <th>COMISIÓN:</th>
  <th>APORTE X CUOTA:</th>
  </tr>
  <tr>
    <td>S/. '. $registros[monto] .'</td>
    <td>'. $registros[plazo] .' Meses</td>
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
    <td>'. $registros[mora] .' % x día</td>
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
    <td>' . $registros[condicion] . '</td>
    <td>SIN GARANTIA</td>
  </tr>
  <tr>
    <th colspan="2">ANALISTA</th>
    <th colspan="2">RECAUDADOR</th>
  </tr>
  <tr>
    <td colspan="2">'.$registrosa[analista].'</td>
    <td colspan="2">'.$registroso[recaudador].'</td>
  </tr>
</table>';
 
$html = $html . '<br>
<table id="tcuotas">
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

$dias = array('DOM','LUN','MAR','MIE','JUE','VIE','SAB');
//select ncuota, fvencimiento, capital, interes, amortizacion, comision, aporte, montocuota from tcuotas where nprestamo='2000004';
$query = pg_query("select ncuota, fvencimiento, capital, interes, amortizacion, comision, aporte, montocuota from tcronograma where nprestamo='".$nprestamo."' order by ncuota;");
$tregistros = pg_numrows($query);

$interestotal=0;
$capitaltotal=0;
$comisiontotal=0.00;
$aportetotal=0;
$pagototal=0;

  for($i=1;$i<=$tregistros;$i++)
  {
  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
  $html = $html . '<tr><td>'.$registros[ncuota].'</td>';
  $html = $html . '<td>'.$registros[fvencimiento].'</td>'; //Fecha
	//Obtiene eldía
  $fecha=date("d-m-Y",strtotime($registros[fvencimiento]));
  $dia = $dias[date('w', strtotime($fecha))];

  $html = $html .	'<td>'.$dia.'</td>'; //Dia
  $html = $html .	'<td>S/. '.$registros[capital].'</td>'; //Capital
  $html = $html .	'<td>S/. '.$registros[interes].'</td>'; //interes
  $html = $html .	'<td>S/. '.$registros[amortizacion].'</td>'; // Amortizacion
  $html = $html .	'<td>S/. '.$registros[comision].'</td>'; // Comision
  $html = $html .	'<td>S/. '.$registros[aporte].'</td>'; // Aporte
  $html = $html . '<td>S/. '.$registros[montocuota].'</td>'; // Cuota
  $html = $html . '</tr>';
  $interestotal=$interestotal+$registros[interes];
  $capitaltotal=$capitaltotal+$registros[amortizacion];
  $comisiontotal=$comisiontotal+$registros[comision];
  $aportetotal=$aportetotal+$registros[aporte];
  $pagototal=$pagototal+$registros[montocuota];
  }

  $html = $html . '<tr><td colspan="4">TOTAL</td>';
  $html = $html . '<td>'."S/. ".number_format($interestotal,2,"."," ") .'</td>';
  $html = $html . '<td>'."S/. ".number_format($capitaltotal,2,"."," ") .'</td>';
  $html = $html . '<td>'."S/. ".number_format($comisiontotal,2,"."," ") .'</td>';
  $html = $html . '<td>'."S/. ".number_format($aportetotal,2,"."," ") .'</td>';
  $html = $html . '<td>'."S/. ".number_format($pagototal,2,"."," ") .'</td></tr>';

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
<td style="text-align: left;"><img src="logoia.gif"></td>
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