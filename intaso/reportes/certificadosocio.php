<?php
include('../phps/configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$dni=$_GET['dni'];//'40700920'; //$_POST['dni'];

$query = pg_query("select idsocio+10000000 as ncliente, CONCAT(ts.nombres,' ',ts.apaterno,' ',ts.amaterno,' ') as socio,ts.tipodoc,ts.numerodoc,ts.fnacimiento,ts.sexo,ts.ecivil,CONCAT(ts.direccion,' ',ts.distrito,' ',ts.provincia,' ',ts.departamento) as direccion,ts.referencia,ts.tcelular,ts.fregistro,ts.email,CONCAT(tt.nombres,' ',tt.apaterno,' ',tt.amaterno,' ') as analista from tsocio as ts, ttrabajador as tt where numerodoc = '".$dni."' and ts.analista=tt.idtrabajador;");
$tregistros = pg_numrows($query);
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);
//$registros['tipodoc']
$rutarecursos="../recursos/logoia.png";
$html = '
	<h3><center><u>CERTIFICADO DE AFILIACION</u></center></h3>
	<h3><center>Nº '.$registros[ncliente].'</center></h3>
  	<p> La Cooperativa de Ahorro y Crédito INTEGRA ASOCIADOS Limitada, en adelante INTEGRA ASOCIADOS, identificado con RUC Nº 20603428669, con domicilio fiscal AV. Manuel Callo Zevallos Nº 444, Distrito de Sicuani, Provincia de Canchis y Departamento del Cusco; de acuerdo al marco normativo vigente para cooperativas, afilia al socio(a) cuyos datos se mencionan en el cuadro siguiente:
  	</p>

	<table class="datos">
	<tr><td width="180px">NOMBRE SOCIO:</td><td>'.$registros[socio].'</td></tr>
	<tr><td>TIPO DE DOCUMENTO:</td><td>'.$registros[tipodoc].'</td></tr>
	<tr><td>Nº DOCUMENTO:</td><td>'.$dni.'</td></tr>
	<tr><td>FECHA NACIMIENTO:</td><td>'.$registros[fnacimiento].'</td></tr>
	<tr><td>SEXO:</td><td>'.$registros[sexo].'</td></tr>
	<tr><td>ESTADO CIVIL:</td><td>'.$registros[ecivil].'</td></tr>
	<tr><td>DIRECCIÓN:</td><td>'.$registros[direccion].'</td></tr>
	<tr><td>REFERENCIA:</td><td>'.$registros[referencia].'</td></tr>
	<tr><td>TELÉFONO:</td><td>'.$registros[tcelular].'</td></tr>
	<tr><td>FECHA AFILIACIÓN:</td><td>'.$registros[fregistro].'</td></tr>
	<tr><td>TIPO SOCIO:</td><td>PERSONA NATURAL</td></tr>
	<tr><td>CORREO ELECTRÓNICO:</td><td>'.$registros[email].'</td></tr>
	<tr><td>RESPONSABLE:</td><td>'.$registros[analista].'</td></tr>
	</table>

	<p> Otorgándole todo los derechos y obligaciones, contemplados en la Ley General del Sistema Financiero, Ley General de Cooperativas y la Resolución de la Superintendencia de Banca y Seguros, así como las disposiciones internas aprobados por los órganos correspondientes, lo cual debidamente informado y puesto en conocimiento de todos los afiliados, en adelante el término equivaldrá a socios para todos los efectos legales.
	</p>
	<ol type="A">
	<li>OBLIGACIONES DEL AFILIADO</li> 
		<ul>
		<li>Informarse y realizar consultas sobre los lineamientos, cláusulas y disposiciones de los diferentes contratos de servicios financieros, ahorros, depósitos y créditos, con respecto a la tasa de interés , rendimientos, comisiones, gastos asociados al servicio y/o modificación de tarifario, penalidades, vencimiento de contrato y otros.</li>
		<li>Cumplir con normas, estatuto, acuerdos de los órganos competentes de INTEGRA ASOCIADOS.</li>
		<li>Cumplir con los pagos mensuales de sus aportes.</li>
		<li>Contribuir con la buena imagen de la institución.</li>
		</ul>

	<li>DERECHO DEL AFILIADO</li>
		<ul>
		<li>Beneficiarse de los productos y servicios financieros que ofrece INTEGRA ASOCIADOS.</li>
		<li>Participar en las diferentes promociones, campañas realizadas por INTEGRA ASOCIADOS.</li>
		</ul>

	<li>SANCIONES Y PENALIDADES POR INCUMPLIMIENTO</li>
		<ul>
		<li>En el caso de que el asociado afecte la buena imagen de la institución financiera, INTEGRA ASOCIADOS iniciará las acciones administrativas y legales de acuerdo a la Ley.</li>
		</ul>
	
	<li>DECLARACIONES Y FIRMAS</li>
		<ul>
		<p>Como asociado, dejo constancia de haber leído y recibido el Certificado de Afiliación para asociados, así como los contratos anexos de ser el caso. Así mismo declaro que todas las dudas y consultas relacionadas a estos documentos me fueron absueltas, por lo que firmo la presente con conocimiento pleno de las condiciones establecidas en dichos documentos.<p>
		</ul>
	</ol>
	<table class="datos">
		<tr><td width="100px"></td><td class="firma"></td><td width="100px"></td><td class="huella"></td><td></td></tr>
		<tr><td></td><td style="text-align: center;">FIRMA DEL SOCIO</td><td></td><td>HUELLA DIGITAL</td><td></td></tr>
		<tr><td></td><td>Nombre: '.$registros[socio].'</td><td></td><td></td><td></td></tr>
		<tr><td></td><td>Documento: '. $registros[tipodoc].' - '.$registros[numerodoc] .'</td><td></td><td></td><td></td></tr>
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