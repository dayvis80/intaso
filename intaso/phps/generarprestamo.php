<?php 
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$query = pg_query("select max(idprestamo) as num from tprestamo;");
$tregistros = pg_numrows($query);
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);

if($registros[num]==null){
	$nprestamo=1+2000000;
}else{
	$nprestamo=$registros[num]+1+2000000;
}

$idsocio=$_POST['idsocio'];
$dni=$_POST['dni'];
$socio=$_POST['socio'];
$tipo=$_POST['tipo'];
$tprestamo=$_POST['tprestamo'];
$plazo=$_POST['plazo'];
$comision=$_POST['comision'];
$mora=$_POST['mora'];
$monto=$_POST['monto'];
$tem=$_POST['tem'];
$fecpago=$_POST['fecpago'];  // 1 - 2 = 27 --- 3 = 4 --- 4 = 2 --- 5 = 1
$aporte=$_POST['aporte'];
$condicion=$_POST['condicion'];
$analista=$_POST['analista'];
$recaudador=$_POST['recaudador'];
$date = date("d-m-Y");

//Recuperamos Datos del Socio
//$query = pg_query("select tt.idtrabajador, CONCAT(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as analista from ttrabajador as tt, tsocio as ts where tt.idtrabajador=ts.analista and ts.idsocio='".$idsocio."'");

$tea=number_format((((pow((1+$tem/100),12))-1)*100),4,",",".");
$dias = array('DOM','LUN','MAR','MIE','JUE','VIE','SAB');

  switch ($fecpago) {
    case 1:
        $ncuotas=27;
        $descfpago='LUNES A VIERNES';
        break;
    case 2:
        $ncuotas=27;
        $descfpago='LUNES A SÁBADO';
        break;
    case 3:
        $ncuotas=4;
        $descfpago='SEMANAL';
        break;
    case 4:
        $ncuotas=2;
        $descfpago='QUINCENAL';
        break;
    case 5:
        $ncuotas=1;
        $descfpago='MENSUAL';
        break;
  }


//Calcular el Total de cuotas
$tcuotas=$ncuotas*$plazo;

//Calcular el interes mensual
if(($fecpago==1)||($fecpago==2))
{
  $interes=($tem/100)/($ncuotas+1);
}else{
   $interes=($tem/100)/$ncuotas;
}

// Calcular el Costo de la comision
$costocomision= ($comision/$ncuotas);
//  $costocomision=((($monto*$comision)/100)/$ncuotas)/$plazo;

//Calcular la Cuota Mensual
$cuota=($monto*$interes*(pow((1+$interes),$ncuotas*$plazo)))/((pow((1+$interes),($ncuotas*$plazo)))-1);
  $cuotaf=number_format(($cuota+$costocomision+$aporte),2,"."," ");

?>

<h3><center>HOJA INFORMATIVA DEL PRESTAMO</center></h3>
<table name="informacion">
	<tr>
	  <th colspan="4">DATOS DEL SOCIO:</th>			
	</tr>
	<tr>
	  <th>CODIGO</th>
 	  <th>DNI</th>
  	  <th>NOMBRES</th>
  	  <th>TIPO</th>					
	</tr>
	<tr class="separar">
	  <td><?php echo $idsocio+1000000;?></td>
 	  <td><?php echo $dni;?></td>
  	  <td><?php echo $socio;?></td>
  	  <td><?php echo $tipo;?></td>		
	</tr>
	<tr>
	  <th colspan="4">DATOS DEL PRESTAMO:</th>
	</tr>
	<tr>
	<th>N° PRESTAMO:</th>
	<th>TIPO PRESTAMO:</th>
	<th>N° CUOTAS:</th>
	<th>CUOTA FINAL:</th>
	</tr>
	<tr>
	  <td><?php echo $nprestamo;?></td>
	  <td><?php echo $tprestamo;?></td>
	  <td><?php echo $tcuotas;?></td>
	  <td><?php echo $cuotaf;?></td>
	</tr>
	<tr>
	<th>MONTO NETO:</th>
	<th>PLAZO:</th>
	<th>COMISIÓN:</th>
	<th>APORTE X CUOTA:</th>
	</tr>
	<tr>
	  <td><?php echo $monto;?></td>
	  <td><?php echo $plazo;?></td>
	  <td><?php echo $comision;?></td>
	  <td><?php echo $aporte;?></td>
	</tr>
	<tr>
	<th>TEA:</th>
	<th>TEM:</th>
	<th>INTERES MORATORIO:</th>
	<th>TIPO PAGO:</th>
	</tr>
	<tr>
	  <td><?php echo $tea;?></td>
	  <td><?php echo $tem;?></td>
	  <td><?php echo $mora;?></td>
	  <td>CUOTA FIJA</td>
	</tr>
	<tr>
	  <td>FECHA DE PRESTAMO:</td>
	  <td>FRECUENCIA DE PAGO:</td>
	  <td>CONDICIÓN:</td>
	  <td>GARANTIA:</td>
	</tr>
	<tr>
	  <td><?php echo $date;?></td>
	  <td><?php echo $descfpago;?></td>
	  <td><?php echo $condicion;?></td>
	  <td>SIN GARANTIA</td>
	</tr>
	<tr>
	  <td colspan="2">ANALISTA</td>
	  <td colspan="2">RECAUDADOR</td>
	</tr>
	<tr>
	  <td colspan="2"><?php echo $analista;?></td>
	  <td colspan="2"><?php echo $recaudador;?></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> <button id="bpnguardar" class="boton" style="float:right; margin: 15px 30px 0px 0px;"><span>Guardar &nbsp;</span><img src="../recursos/bcancelar.png"/></button> </td>
	</tr>
</table>