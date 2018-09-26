<?php
include('../phps/configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$ncuenta=$_GET['cuenta'];//"3000001"; //$_GET['dni'];//'40700920'; //$_POST['dni'];

//select ta.idahorro as n, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, concat(ts.tipodoc,' ',ts.numerodoc) as documento, ts.direccion as direccion, ta.cuenta as cuenta, ta.descripcion as ahorro, ta.plazo as plazo, ta.tem as tem, ta.fapertura as fapertura, ta.fvencimiento as fvencimiento, ta.saldo as saldo from tahorro as ta, tsocio as ts where ts.idsocio=ta.idsocio and ta.sucursal='1' and cuenta='3000001';
$query = pg_query("select ta.idahorro as n, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, concat(ts.tipodoc,' ',ts.numerodoc) as documento, ts.direccion as direccion, ta.cuenta as cuenta, ta.descripcion as ahorro, ta.plazo as plazo, ta.tem as tem, ta.fapertura as fapertura, ta.fvencimiento as fvencimiento, ta.mapertura as mapertura from tahorro as ta, tsocio as ts where ts.idsocio=ta.idsocio and ta.sucursal='1' and cuenta='" . $ncuenta . "';");
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);

$html = '
	<h3><center>CONTRATO DE DEPOSITO DE AHORROS</center></h3>
	<h3><center>CUENTA Nº '.$ncuenta.'</center></h3>
  	<p> Conste por el presente documente privado el contrato de cuenta de depósitos de ahorro que celebran de una parte “INTEGRA ASOCIADOS”, debidamente representado por los funcionarios que suscriben este documento y de la otra parte el socio, cuyos datos se detallan en el presente contrato; en los términos y condiciones siguientes:<br>
 <b>Primero.–</b> Apertura: “INTEGRA ASOCIADOS” entregará al titular de la cuenta su correspondiente formulario contractual, comprobante de apertura y las condiciones como parte de este contrato, en donde se indica el detalle de la tasa de interés aplicable, así como las comisiones fecha de culminación del contrato. Toda cantidad que se abone y/o retire de la cuenta de depósito de ahorros serán constatados con recibos o comprobantes de cada operación. La apertura de la cuenta podrá realizarse de forma mancomunada, bajo la modalidad conjunta (forma “y”) o indistinta (“o”), mediante la firma de todos los cotitulares en el formato que facilita “INTEGRA ASOCIADOS”. En el caso de modalidad conjunta, toda instrucción referida al movimiento de la cuenta deberá realizarse con la intervención de todos los cotitulares de la cuenta. En la modalidad indistinta, bastara la intervención de uno de los cotitulares para poder efectuar instrucciones con relación a la cuenta. Así mismo, en caso de fallecimiento, quiebra o interdicción de alguno de los cotitulares, se procederá al cierre de la cuenta entendiéndose el saldo de la misma distribuido de forma proporcional entre los cotitulares, quedando a disposición de los herederos, juez o curador, la parte proporcional correspondiente al causante, quebrado.<br>
	<b>Segundo.–</b> Embargos y medidas cautelares: “INTEGRA ASOCIADOS” no se responsabiliza por los perjuicios que pudieran producirse como consecuencia de las retenciones, embargos, secuestros, medidas cautelares u otras de naturaleza similar, que se traben o apliquen sobre los fondos existentes en la cuenta del cliente, efectuados en cumplimiento de mandatos judiciales, arbitrales o administrativos contra uno o varios titulares de la cuenta. Dichos actos solo surtirán efecto sobre el saldo que el cliente ostente, después que “INTEGRA ASOCIADOS” haya efectuado en dicha cuenta todos los cargos que correspondan por las deudas vencidas y exigibles que el cliente tenga a la fecha de notificación de los mismos y siempre que los fondos de la cuenta no sean sujetos a gravamen alguno a favor de “INTEGRA ASOCIADOS”. Una vez efectuada la retención en la cuenta del cliente, y a su solicitud, “INTEGRA ASOCIADOS” proporcionará la información relacionada a la medida ejecutada. El costo por la ejecución de las medidas antes señaladas, será asumido por el cliente, de acuerdo los costos señalados en la cartilla de información.<br>
	<b>Tercero.-</b> Autorización para recibir comunicaciones: el cliente manifiesta de manera expresa e inequívoca su consentimiento para recibir llamadas telefónicas, mensajes de texto a su celular o mensajes electrónicos masivos para promover productos y servicios por par de “INTEGRA ASOCIADOS”, a partir de 72 horas de suscrito el presente contrato. El cliente podrá dejar sin efecto esta autorización mediante la presentación de una carta en la que manifieste expresamente su voluntad de no continuar recibiendo nuevas promociones de productos y servicios de “INTEGRA ASOCIADOS” a través de los medios señalados, la misma que surtirá efectos a partir de las 72 horas de recibida.<br>
	<b>Cuarto.-</b> Autorización de recopilación, tratamiento de información y declaración de veracidad del cliente: por medio del presente el cliente otorga su consentimiento libre, previo, expreso e informado, a “INTEGRA ASOCIADOS” para que directamente o a través de un tercero que designe, tanto a nivel nacional como internacional proceda a la recopilación, registro, almacenamiento, procesamiento, extracción, suministro, consulta, transferencia, tratamiento y uso de datos personales y/o sensibles, y, en general, de toda la información que el cliente proporcione a “INTEGRA ASOCIADOS” y/o que sean obtenidos de fuentes  de acceso público, para la gestión o manejo de la relación y comercial con el cliente; así como para ofrecerle productos y/o servicios en forma directa, a través de terceros o mediante asociaciones, alianzas o convenios comerciales; y/o envió de ofertas comerciales, publicidad de información en general.<br>
	<b>Quinto.–</b> Modificaciones contractuales: el cliente reconoce y acepta expresamente que “INTEGRA ASOCIADOS” podrá modificar unilateralmente  y en cualquier momento los términos  y/o condiciones del presente contrato, por causas asociadas a cualquiera de las siguientes situaciones, cuando correspondan: (I) cambios en el régimen tributario; (II) incremente o modificación del régimen de encajes; (III) cambios en la leyes o normas aplicables y/o en política monetaria vigente y/o impacto de las disposiciones legales sobre costos y otros aspectos del contrato; (IV) cambio en las regulaciones bancarias que afectan el régimen legal vigente; (V) emisión de disposiciones del banco central de reserva del Perú y otra entidad gubernamental; (VI) incremente de tasas de referencia del banco central de reserva del Perú; (VII) condiciones del mercado y/o cambiones en la economía nacional o internacional y/o crisis financiera; (VIII) el funcionamiento o tendencias de los mercados; (IX) la adopción de políticas de gobierno o de estado; (X) inflación o deflación; (XI) devaluación o revaluación de la moneda; (XII) incremento del índice de morosidad; (XIII) aplicación de políticas de riesgo y/o comerciales de “INTEGRA ASOCIADOS”; (XIV) encarecimiento de los servicios prestados por terceros cuyos costos son trasladados a el cliente o de costos de prestación de los productos y servicios ofrecidos por “INTEGRA ASOCIADOS”; (XV) condiciones de riesgo del cliente; (XVI) hechos ajenos a la voluntad de las partes; tales como conmoción social o desastres naturales; terrorismo o guerra; caso fortuito o fuerza mayor; mandato de autoridad competente entre otros; se dará un comunicado de tal hecho con una anticipación de siete días.<br>
	<b>Sexto.-</b> Los depósitos que sean cancelados de forma anticipada antes del plazo pactado serán pagados con la tasa mínima (TEA, penalidad) con la que este disponible, el cual debe ser proporcional al tiempo establecido en meses.<br>
	<b>Séptimo.–</b> La renovación del contrato es automática esto a la tase de interés vigente al plazo establecido, en caso de no tener un correspondiente al plazo pactado se le colocara una tasa aproximada.<br>
	<b>Octavo.-</b> El contrato tiene las siguientes condiciones.
  	</p>


	<table class="datos">
	<tr><th width="200px">NOMBRES Y APELLIDOS:</th>
		<td width="250px">'.$registros[socio].'</td></tr>
	<tr><th>DOCUMENTO:</th>
		<td>'.$registros[documento].'</td></tr>
	<tr><th>DIRECCIÓN:</th>
		<td>'.$registros[direccion].'</td></tr>
	<tr><th>AHORRO:</th>
		<td>'.$registros[ahorro].'</td></tr>
	<tr><th>N° CUENTA:</th>
		<td>'.$registros[cuenta].'</td></tr>
	<tr><th>FECHA DE APERTURA:</th>
		<td>'.$registros[fapertura].'</td></tr>
	<tr><th>FECHA DE VENCIMIENTO:</th><td>'.$registros[fvencimiento].'</td></tr>
	<tr><th>PLAZO</th><td>'.$registros[plazo].' Meses</td></tr>
	<tr><th>T.E.M.:</th><td>'.$registros[tem].'</td></tr>
	<tr><th>MONTO DE APERTURA:</th><td>S/. '.$registros[mapertura].'</td></tr>
	<tr><th>INTERÉS ESTIMADO</th><td>Variable</td></tr>
	<tr><th>MONTO FINAL</th><td>Variable</td></tr>
	</table>

	<p>
	Las partes declaran haber leído previamente el contrato, tarifario habiendo sido instruido(s) acerca de los alcances y significado de los términos y condiciones establecidos, por lo que lo suscriben el presente contrato en señal de conformidad y aceptación, recibiendo en este mismo momento un ejemplar de dichos documentos. Cardo de recepción declaro haber recibido el contrato de cuento de depósito de ahorros, que he suscrito con “INTEGRA ASOCIADOS”, declaro aceptar en su integridad.
	</p>
	<table class="datos">
		<tr><td width="100px"></td><td class="firma"></td><td width="100px"></td><td class="huella"></td><td></td></tr>
		<tr><td></td><td style="text-align: center;">FIRMA DEL SOCIO</td><td></td><td>HUELLA DIGITAL</td><td></td></tr>
		<tr><td></td><td>Nombre: '.$registros[socio].'</td><td></td><td></td><td></td></tr>
		<tr><td></td><td>Documento: '. $registros[documento] .'</td><td></td><td></td><td></td></tr>
	</table>
	<br><br><br><br><br><br>
	<table class="datos">
		<tr><td width="100px"></td><td class="firma"></td><td width="100px"></td><td></td><td></td></tr>
		<tr><td></td><td style="text-align: center;">FIRMA Y SELLO DEL REPRESENTATE</td><td></td><td></td><td></td></tr>
		<tr><td></td><td style="text-align: center;">INTEGRA ASOCIADOS LTDA</td><td></td><td></td><td></td></tr>
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