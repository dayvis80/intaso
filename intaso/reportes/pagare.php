<?php
include('../phps/configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$nprestamo=$_GET['nprestamo'];//'2000004';

$query = pg_query("select idsocio+1000000 as ncliente, CONCAT(ts.nombres,' ',ts.apaterno,' ',ts.amaterno,' ') as socio,ts.tipodoc,ts.numerodoc,ts.fnacimiento,ts.sexo,ts.ecivil,CONCAT(ts.direccion,' ',ts.distrito,' ',ts.provincia,' ',ts.departamento) as direccion,ts.referencia,ts.tcelular,ts.fregistro,ts.email,CONCAT(tt.nombres,' ',tt.apaterno,' ',tt.amaterno,' ') as analista from tsocio as ts, ttrabajador as tt where numerodoc = '".$dni."' and ts.analista=tt.idtrabajador;");
$tregistros = pg_numrows($query);
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);
//$registros['tipodoc']
$html = '
	<center><h2><b>PAGARÉ</b></h2></center>
	<table id="tprestamo">
	<tr><td width="400px">Pagare N° :</td>
		<td>Importe Deudor:</td>
	</tr>
	<tr><td>Importe Original:</td>
		<td>Vence el .... de ........ del 20...:</td>
	</tr>
	</table>
	<br>
	<p style="font-size:11px;">	Yo (nosotros)…................................................................................................................................................. reconozco (reconocemos) que adeudo (adeudamos) y pagaré (pagaremos) incondicionalmente en la fecha de vencimiento consignado en el presente Pagaré, a la orden de la COOPERATIVA DE AHORRO Y CREDITO INTEGRA ASOCIADOS LTDA. en adelante “INTEGRA ASOCIADOS”, o a quien esta se lo hubiera cedido, en su domicilio social o donde se presentare para su cobro, el importe de ………..................................................................... ....................................................(....................................), sin lugar a reclamo de clase alguna, para cuyo fiel y exacto cumplimiento, me obligo con todos mis bienes presentes y futuros en la mejor forma de derecho. Al efecto, asumo la obligación en las siguientes condiciones:
	</p>
	<h3><center><b>CONDICIONES ESPECIALES DEL TÍTULO</b></center></h3>
 
	<p style="font-size:11px;"> Primera: Este Pagaré será pagado en la misma moneda que expresa este título valor por ser producto de dinero otorgado por la COOPERATIVA. </p>
	<p style="font-size:11px;">Segunda: A su vencimiento, podrá ser prorrogado por la COOPERATIVA, o por su tenedor, por el plazo que éste señale en este mismo documento, sin que sea necesaria intervención alguna del obligado principal ni de avalistas solidarios.</p>
	<p style="font-size:11px;">Tercera: El pago del importe de este Pagaré podrá ser pactado en una o más cuotas, según el/los importe(s) y vencimiento que indique el correspondiente cronograma de pagos, que no requiera de suscripción adicional al presente documento.</p>
	<p style="font-size:11px;">Cuarto: El importe de este Pagaré y/o de las cuotas del crédito que representa, generarán desde la fecha de emisión hasta la fecha de su respectivo(s) vencimiento(s), un interés compensatorio que se pacta en la tasa efectiva de % anual y una tasa de interés moratorio efectivo de % anual.</p>
	<p style="font-size:11px;">Quinto: En caso de incumplimiento el pago de una o más cuotas pactadas, al importe deudor se le aplicarán los intereses compensatorios e intereses moratorios a las tasas máximas aprobadas por la COOPERATIVA desde la fecha de vencimiento hasta su total cancelación, sin que sea necesario efectuar requerimiento previo de pago para constituir en mora al obligado principal ni a los avalistas solidarios, incurriéndose en ésta automáticamente por el solo hecho del vencimiento. Siendo de aplicación en este caso lo dispuesto por el Artículo 1323 y Artículo 1333 del Código Civil.</p>
	<p style="font-size:11px;">Sexta: El Socio y su cónyuge o conviviente obligados principales y los deudores solidarios aceptan igualmente que las tasas de interés compensatorio y/o moratorio puedan ser variadas por la COOPERATIVA o su tenedor sin necesidad de aviso previo, de acuerdo a las tasas que ésta tenga vigentes de conformidad a lo establecido por el Artículo 1343 del Código Civil.</p>
	<p style="font-size:11px;">Sétima: Los obligados principales y solidarios suscribientes del presente Pagaré dejan constancia que éste documento no requiere el protesto notarial por falta de pago, para obtener mérito ejecutivo.</p>
	<p style="font-size:11px;">Octava: Serán de cargo de los obligados principales y avalistas solidarios, el pago íntegro de los tributos y gastos que afecten a este Pagaré o a la obligación en él contenida, los mismos que serán calculados y determinados por la COOPERATIVA o su tenedor en la oportunidad en que ello se verifique.</p>
	<p style="font-size:11px;">Novena: El o los obligados principales y los avalistas o fiadores solidarios autorizan desde ya expresamente a la COOPERATIVA a cargar directamente en sus cuentas de aportaciones, depósitos de ahorro y/o cuentas a plazo, (sea en moneda nacional y/o extranjera) que mantengan en ella, el o las cuotas del crédito que represente el Pagaré, así como a compensarlos con cualquier otro tipo de bien que pudiera tener en su poder, sin que ello obligue o signifique responsabilidad para la COOPERATIVA.</p>
	<p style="font-size:11px;">Décima: La COOPERATIVA o su tenedor podrá entablar acción judicial para efectuar el cobro de este Pagaré donde lo tuviera por conveniente, a cuyo efecto el obligado principal y los avalistas solidarios renuncian al fuero de su propio domicilio y a cuantos puedan favorecerlos en el proceso judicial o fuera de él, señalando como domicilio, para todos</p>
	<p style="font-size:11px;">Nosotros, los abajo firmantes, nos constituimos en avalistas permanentes y en garantes solidarios de los obligados principales y entre nosotros mismos, para lo cual comprometemos nuestro patrimonio y depósitos en “INTEGRA ASOCIADOS” en garantía del pago de las obligaciones contenidos en el presente Pagaré, obligándolos por la cantidad adecuada y aceptando sin limitaciones ni restricciones todas y cada una de las cláusulas especiales que figuran en el presente Pagaré.</p>
	<p style="text-align: right; font-size:11px;">……………. de ……………………………………… del …………<br><br><br><br><br></p>

	<table class="datos">
		<tr><td width="100px"></td>
			<td class="firma"></td>
			<td width="100px"></td>
			<td class="firma"></td>
			<td width="100px"></td>
			</tr>
		<tr><td></td>
			<td style="text-align: center;">FIRMA DEL SOCIO</td>
			<td></td>
			<td style="text-align: center;">AVALISTA</td>
			<td></td>
		</tr>
		<tr><td></td>
			<td>Nombre: '.$registros[socio].'</td>
			<td></td>
			<td>Nombre: </td>
			<td></td>
		</tr>
		<tr><td></td>
			<td>Documento: '. $registros[tipodoc].' - '.$registros[numerodoc] .'</td>
			<td></td>
			<td>Documento:</td>
			<td></td>
		</tr>
		<tr><td></td>
			<td>Domicilio: '. $registros[direccion].' - '.$registros[numerodoc] .'</td>
			<td></td>
			<td>Domicilio:</td>
			<td></td>
		</tr>
	</table>
';


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