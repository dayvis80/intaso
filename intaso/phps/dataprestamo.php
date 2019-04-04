<?php 
session_start();
if(isset($_SESSION['login'])==false){
   header('Location: login.php');
}else{
   include('configuracion.php');
   $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
}

$tipo=$_POST['tipo'];
$sucursal=$_SESSION['sucursal'];


//Se obtiene la Informacion de los prestamos y se debuelve en json
if($tipo=='DATA'){

   $aprobado=$_POST['aprobado'];
   $estado=$_POST['estado'];
   // CONSULTA PARA SELECCIONAR DATOS DE LA TABLA PRESTAMOS
   //select concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.monto, tp.tcuotas, tp.mcuota, tp.tem, tp.fecpago, tp.ftermino, tp.estado  from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and tp.aprobado = 'SI' and tp.sucursal='1' order by tp.idprestamo;
   if($estado=='EN PROCESO'){
      $query = pg_query("select concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo as cuenta, tp.descripcion as prestamo, tp.monto as monto, tp.tcuotas as cuotas, tp.mcuota as vcuota, tp.plazo as plazo, tp.tem as tem, tp.fecpago as fecpago, tp.fprestamo as ftermino, tp.estado as estado from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and tp.aprobado = '". $aprobado ."' and (tp.estado='EN PROCESO' or tp.estado='CANCELADO') and tp.sucursal='". $sucursal ."' order by tp.fprestamo;");
   }else{
      $query = pg_query("select concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo as cuenta, tp.descripcion as prestamo, tp.monto as monto, tp.tcuotas as cuotas, tp.mcuota as vcuota, tp.plazo as plazo, tp.tem as tem, tp.fecpago as fecpago, tp.fprestamo as ftermino, tp.estado as estado from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and tp.aprobado = '". $aprobado ."' and tp.estado='". $estado ."' and tp.sucursal='". $sucursal ."' order by tp.fprestamo;");  
   }
   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
   }
   pg_free_result($query);
   echo json_encode($data);
}


//GUARDA EL DETALLE DEL PRESTAMO PARA SU DESEMBOLSO
if($tipo=='GUAR'){

$idsocio=$_POST['idsocio'];
$dni=$_POST['dni'];
$socio=$_POST['socio'];
$tprestamo=$_POST['tprestamo'];
$monto=$_POST['monto'];
$plazo=$_POST['plazo']; 
$comision=$_POST['comision'];
$aporte=$_POST['aporte'];
$tem=$_POST['tem'];
$mora=$_POST['mora'];
$tipopago = 'CUOTA FIJA';
$date = date("d-m-Y");
$fecpago=$_POST['fecpago']; // 1 - 2 = 27 --- 3 = 4 --- 4 = 2 --- 5 = 1
$condicion=$_POST['condicion'];
$garantia='SIN GARANTIA';
$analista=$_POST['analista'];
$recaudador=$_POST['recaudador'];
$estado='EN ESPERA';
$aprobado='NO';
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

  // --->1 Buscamos el ultimo número de prestamo y sumamos uno para el nuevo numero de prestamo
  $query = pg_query("select max(idprestamo) as num from tprestamo;");
  $tregistros = pg_numrows($query);
  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

  if($registros[num]==null){
    $nprestamo=20000001;
  }else{
    $nprestamo=$registros[num]+20000001;
  }
  pg_free_result($query);
  // Calculamos el valor del TEA
  $tea=number_format((((pow((1+$tem/100),12))-1)*100),2,"."," ");

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

  // ---> 2 Calcular el Total de cuotas
  $tcuotas=$ncuotas*$plazo;

  //Calcular el valor del Interes Diario, Semanal, Quincenal o Mensual
  if(($fecpago==1)||($fecpago==2))
  {
    $interes=($tem/100)/($ncuotas+1);
  }else{
    $interes=($tem/100)/$ncuotas;
  }

  // Calcular el Costo de la comision
  $costocomision= ((($comision/100)*$monto)/$ncuotas);
  //$costocomision= ($comision/$ncuotas); Anterior comsion en soless

  // --->3 Calcular el valor de la cuota Cuota Mensual
  $cuota=($monto*$interes*(pow((1+$interes),($ncuotas*$plazo))))/((pow((1+$interes),($ncuotas*$plazo)))-1);
  $cuotaf=number_format(($cuota+$costocomision+$aporte),2,"."," ");

  //INSERTAMOS LOS DATOS A LA TABLA PRESTAMO
  //insert into tprestamo (idsocio,nprestamo,descripcion,tcuotas,mcuota,monto,plazo,comision,aporte,tea,tem,mora,tipopago,fprestamo,ftermino,fecpago,condicion,garantia,analista,operador,estado,aprobado,sucursal) values ('1','10001','PAGO DIARIO',54,'54.34','1000',2,'5','0.40','15','112.05','5','CUOTA FIJA', '13/07/2018','13/07/2018','LUNES A VIERNES','','SIN GARANTIA','2','1','EN PROCESO','NO','1');
  $query = "insert into tprestamo (idsocio,nprestamo,descripcion,tcuotas,mcuota,monto,plazo,comision,aporte,tea,tem,mora,tipopago,fprestamo,ftermino,fecpago,condicion,garantia,analista,recaudador,estado,aprobado,usuario,sucursal) values ('". $idsocio ."','". $nprestamo ."',' " . $tprestamo ."',". $tcuotas . ",'". $cuotaf ."','". $monto ."'," . $plazo . ",'" . $comision . "','" . $aporte . "','" . $tea . "','" . $tem . "','" . $mora . "','" . $tipopago . "', '" . $date . "','" . $date . "','" . $descfpago . "','" . $condicion . "','" . $garantia . "','" . $analista . "','" . $recaudador . "','" . $estado . "','" . $aprobado . "','" . $usuario . "','" . $sucursal . "');";
  pg_query($query);

  echo "PRESTAMO REGISTRADO CORRECTAMENTE";
}


//MUESTRA LOS DETALLES ANTES DEL DESEMBOLSO
if($tipo=='DETA'){

   $nprestamo=$_POST['nprestamo'];
   $accion=$_POST['accion'];

   $query = pg_query("select ts.idsocio+10000 as idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.tcuotas, tp.mcuota, tp.monto, tp.plazo, tp.comision, tp.aporte, tp.tea, tp.tem, tp.mora, tp.fprestamo, tp.fecpago, tp.condicion, tp.garantia, tp.analista, tp.recaudador from tprestamo as tp, tsocio as ts where ts.idsocio=tp.idsocio and  tp.nprestamo='". $nprestamo ."'");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

   $querya = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as analista from ttrabajador where idtrabajador='".$registros[analista]."';");
   $registrosa = pg_fetch_array($querya, null, PGSQL_ASSOC);

   $queryo = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as operador from ttrabajador where idtrabajador='".$registros[recaudador]."';");
   $registroso = pg_fetch_array($queryo, null, PGSQL_ASSOC);

   echo '<div id="ddescontenido" class="dpagina" style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h2>HOJA DE RESUMEN INFORMATIVA</h2></center>
      <center><h2>Nº <label id="lcdnprestamo">'.$nprestamo.'</label></h2></center>
      <br>
      <table class="tpagina">
         <caption>DATOS DEL SOCIO:</caption>
      <tr>
         <th>CODIGO:</th>
         <th>DNI:</th>
         <th>NOMBRES:</th>
         <th>TIPO:</th>         
      </tr>
      <tr class="separar">
         <td>'.$registros[idsocio].'</td>
         <td>'. $registros[numerodoc] .'</td>
         <td>' . $registros[socio] . '</td>
         <td>TITULAR</td>    
      </tr>
      <tr>
         <th colspan="4" class="caption">DATOS DEL PRESTAMO:</th>
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
         <td> S/. '. $registros[mcuota].'</td>
      </tr>
      <tr>
         <th>MONTO NETO:</th>
         <th>PLAZO:</th>
         <th>COMISIÓN:</th>
         <th>APORTE X CUOTA:</th>
      </tr>
      <tr>
         <td>S/. '. $registros[monto] .'</td>
         <td>'. $registros[plazo] .' MESES</td>
         <td>'. $registros[comision] .' %</td>
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
         <td>'. $registros[mora] .' %</td>
         <td>CUOTA FIJA</td>
      </tr>
      <tr>
         <th>FECHA DE PRESTAMO:</th>
         <th>FRECUENCIA DE PAGO:</th>
         <th>CONDICIÓN:</th>
         <th>GARANTIA:</th>
      </tr>
      <tr>
         <td>' . $registros[fprestamo] . '</td>
         <td>' . $registros[fecpago] . '</td>
         <td>' . $registros[condicion] . '</td>
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

      switch ($registros[fecpago]) {
      case 'LUNES A VIERNES':
        $fpago=1;
        break;
      case 'LUNES A SÁBADO':
        $fpago=2;
        break;
      case 'SEMANAL':
        $fpago=3;
        break;
      case 'QUINCENAL':
        $fpago=4;
        break;
      case 'MENSUAL':
        $fpago=5;
        break;
      } 

   $tprestamo='';
   $monto=$registros[monto];
   $tem=$registros[tem];
   $aporte=$registros[aporte];
   $plazo=$registros[plazo];
   $comision=$registros[comision];
   $abcuotas=array();
   $abcuotas=gencuotas($tprestamo,$monto,$tem,$fpago,$aporte,$plazo,$comision);
   $tcuotas=count($abcuotas);
   
   $interestotal=0;
   $capitaltotal=0;
   $comisiontotal=0.00;
   $aportetotal=0;
   $pagototal=0;

echo '<br>
      <table class="tpagina">
      <caption>CRONOGRAMA DE PAGOS</caption>
      <tr>
         <th>CUOTA</th>
         <th>FECHA</th>
         <th>DIA</th>
         <th>SALDO</th>
         <th>INTERES</th>
         <th>AMORTIZ.</th>
         <th>COMISION</th>
         <th>APORTE</th>
         <th>TOTAL</th>
      </tr>
      <tbody>';

   for($i=1;$i<=$tcuotas;$i++){
      $interestotal=$interestotal+$abcuotas[$i][4];
      $capitaltotal=$capitaltotal+$abcuotas[$i][5];
      $comisiontotal=$comisiontotal+(float)$abcuotas[$i][6];
      $aportetotal=$aportetotal+$abcuotas[$i][7];
      $pagototal=$pagototal+$abcuotas[$i][8];
      echo "<tr>";
         echo "<td style='align-text:center;'>".$abcuotas[$i][0]."</td>";
         echo "<td>".$abcuotas[$i][1]."</td>";
         echo "<td>".$abcuotas[$i][2]."</td>";
         echo "<td style='align-text:right;'>S/. ".$abcuotas[$i][3]."</td>";
         echo "<td>"."S/. ".number_format($abcuotas[$i][4],2,"."," ")."</td>";
         echo "<td>"."S/. ".number_format($abcuotas[$i][5],2,"."," ")."</td>";
         echo "<td>"."S/. ".number_format($abcuotas[$i][6],2,"."," ")."</td>";
         echo "<td>"."S/. ".number_format($abcuotas[$i][7],2,"."," ")."</td>";
         echo "<td>"."S/. ".number_format($abcuotas[$i][8],2,"."," ")."</td>";
      echo "</tr>";
   }

      echo '<tr>
         <td colspan="4">TOTAL</td>
         <td>'."S/. ".number_format($interestotal,2,"."," ") .'</td>
         <td>'."S/. ".number_format($capitaltotal,2,"."," ") .'</td>
         <td>'."S/. ".number_format($comisiontotal,2,"."," ") .'</td>
         <td>'."S/. ".number_format($aportetotal,2,"."," ") .'</td>
         <td>'."S/. ".number_format($pagototal,2,"."," ") .'</td>
      </tr>
      </tbody>
      </table>
      </div>';
      if($accion=='DESEMBOLSO'){
      echo '<button id="bpndesguardar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>DESEMBOLSAR</span></button>';
      }
      if($accion=='APROBAR'){
      echo '<button id="bpnaprobar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>APROBAR</span></button>';
      }
      echo '<button id="bpndescerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';
      pg_free_result($query);
      pg_free_result($querya);
      pg_free_result($queryo);
}


// MUESTRA EL EXTRACTO DEL PRESTAMO
if($tipo=='EXTR'){
   $nprestamo=$_POST['nprestamo'];

   $query = pg_query("select ts.idsocio+10000000 as idsocio, ts.numerodoc, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo, tp.descripcion, tp.tcuotas, tp.mcuota, tp.monto, tp.plazo, tp.comision, tp.aporte, tp.tea, tp.tem, tp.mora, tp.fprestamo, tp.fecpago, tp.condicion, tp.garantia, tp.analista, tp.recaudador from tprestamo as tp, tsocio as ts where ts.idsocio=tp.idsocio and  tp.nprestamo='". $nprestamo ."'");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

   $querya = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as analista from ttrabajador where idtrabajador='".$registros[analista]."';");
   $registrosa = pg_fetch_array($querya, null, PGSQL_ASSOC);

   $queryo = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as operador from ttrabajador where idtrabajador='".$registros[recaudador]."';");
   $registroso = pg_fetch_array($queryo, null, PGSQL_ASSOC);

echo '<div id="dpextcontenido" class="dpagina" style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h2>HOJA DE RESUMEN INFORMATIVA</h2></center>
      <center><h2>Nº <label id="lcdnprestamo">'.$nprestamo.'</label></h2></center>
      <br>
      <table class="tpagina">
         <caption>DATOS DEL SOCIO:</caption>
      <tr>
         <th>CODIGO:</th>
         <th>DNI:</th>
         <th colspan="2">NOMBRES:</th>
         <th>TIPO:</th>         
      </tr>
      <tr class="separar">
         <td>'.$registros[idsocio].'</td>
         <td>'. $registros[numerodoc] .'</td>
         <td colspan="2">' . $registros[socio] . '</td>
         <td>TITULAR</td>    
      </tr>
      <tr>
         <th colspan="5" class="caption">DATOS DEL PRESTAMO:</th>
      </tr>
      <tr>
         <th>N° PRESTAMO:</th>
         <th>TIPO PRESTAMO:</th>
         <th>N° CUOTAS:</th>
         <th>MONTO:</th>
         <th>CUOTA FINAL:</th>
      </tr>
      <tr>
         <td>'. $registros[nprestamo].'</td>
         <td>'. $registros[descripcion].'</td>
         <td>'. $registros[tcuotas].'</td>
         <td>S/. '. $registros[monto] .'</td>
         <td> S/. '. $registros[mcuota].'</td>
      </tr>
      <tr>
         <th>PLAZO:</th>
         <th>COMISIÓN:</th>
         <th>APORTE X CUOTA:</th>
         <th>TEA:</th>
         <th>TEM:</th>
      </tr>
      <tr>
         <td>'. $registros[plazo] .' MESES</td>
         <td>'. $registros[comision] .' %</td>
         <td>S/. '. $registros[aporte] .'</td>
         <td>'. $registros[tea] .' %</td>
         <td>'. $registros[tem] .' %</td>
      </tr>
      <tr>
         <th>INTERES MORATORIO:</th>
         <th>TIPO PAGO:</th>
         <th>FECHA DE PRESTAMO:</th>
         <th>FRECUENCIA DE PAGO:</th>
         <th>CONDICIÓN:</th>
      </tr>
      <tr>
         <td>'. $registros[mora] .' %</td>
         <td>CUOTA FIJA</td>
         <td>' . $registros[fprestamo] . '</td>
         <td>' . $registros[fecpago] . '</td>
         <td>' . $registros[condicion] . '</td>
      </tr>
      <tr>
         <th colspan="2">ANALISTA</th>
         <th colspan="3">RECAUDADOR</th>
      </tr>
      <tr>
         <td colspan="2">'.$registrosa[analista].'</td>
         <td colspan="3">'.$registroso[operador].'</td>
      </tr>
      </table>'; 

   echo '<br>
      <table class="tpagina" style="font-size:10px">
      <tr>
         <th>CUOTA</th>
         <th>F PROG.</th>
         <th>CAPITAL</th>
         <th>AMORT.</th>
         <th>INTERES</th>
         <th>COMISION</th>
         <th>APORTE</th>
         <th>ESTADO</th>
         <th>D. MORA</th>
         <th>V. MORA</th>
         <th>M. PAGADO</th>
         <th>F. PAGO</th>
         <th>PUNTUAL</th>
      </tr>
      <tbody>';

      pg_free_result($query);
      pg_free_result($querya);
      pg_free_result($queryo);
//select tc.ncuota, tc.fvencimiento, tc.capital, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tc.estado, tm.dmora, tm.vmora, tm.monto, tm.fechamov, tm.pago from tcuotas as tc LEFT JOIN (select tm.ncuota, tm.cuenta,tm.dmora,tm.vmora, tm.monto, tm.fechamov, tm.pago from tmovimiento as tm where tm.cuenta='2000002') tm on tc.ncuota=tm.ncuota where tc.nprestamo='2000002' group by tc.ncuota, tc.fvencimiento, tm.dmora, tm.vmora, tm.monto, tc.capital, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tc.estado, tm.fechamov, tm.pago order by tc.ncuota asc
   $query = pg_query("select tc.ncuota, tc.fvencimiento, tc.capital, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tc.estado, tm.dmora, tm.vmora, tm.monto, tm.fechamov, tm.pago from tcuotas as tc LEFT JOIN (select tm.ncuota, tm.cuenta,tm.dmora,tm.vmora, tm.monto, tm.fechamov, tm.pago from tmovimiento as tm where tm.cuenta='".$nprestamo."' and tm.anulado='NO') tm on tc.ncuota=tm.ncuota where tc.nprestamo='".$nprestamo."' group by tc.ncuota, tc.fvencimiento, tm.dmora, tm.vmora, tm.monto, tc.capital, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tc.estado, tm.fechamov, tm.pago order by tc.ncuota asc");
   $tregistros = pg_numrows($query);

   for($i=1;$i<=$tregistros;$i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo "<tr>";
         echo "<td style='align-text:center;'>".$registros[ncuota]."</td>";
         echo "<td>".$registros[fvencimiento]."</td>";
         echo "<td>".$registros[capital]."</td>";
         echo "<td style='align-text:right;'>S/. ".$registros[amortizacion]."</td>";
         echo "<td>"."S/. ".$registros[interes]."</td>";
         echo "<td>"."S/. ".$registros[comision]."</td>";
         echo "<td>"."S/. ".$registros[aporte]."</td>";
         echo "<td>".$registros[estado]."</td>";
         echo "<td>".$registros[dmora]."</td>";
         echo "<td>"."S/. ".$registros[vmora]."</td>";
         echo "<td>"."S/. ".$registros[monto]."</td>";
         echo "<td>".$registros[fechamov]."</td>";
         echo "<td>".$registros[pago]."</td>";
      echo "</tr>";
   }
      echo '</tbody>
      </table>
      </div>
      <button id="bpextimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
      <button id="bpextcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';
}


//SE REALIZA LA APROBACION DEL PRESTAMO;
if($tipo=='APRO'){

$nprestamo=$_POST['nprestamo'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

   if( ($tipotrabajador==4) or ($tipotrabajador==10)) {
   //Actualizamosestado de Prestamo;
   //update tprestamo set aprobado='SI' where nprestamo='2000013' and sucursal='1';
   $query = pg_query("update tprestamo set aprobado='SI', estado='EN ESPERA' where nprestamo='".$nprestamo."' and sucursal='".$sucursal."';");
   echo 'EL PRESTAMO SE APROBO CORRECTAMENTE';
   }else{
      echo '2';
   } // Fin if de Consulta de cajero
}


//REALIZA EL DESEMBOLSO Y SE REGISTRA EL PAGO DE CUOTAS EN LA BASE DE DATOS
if($tipo=='DESE'){

$nprestamo=$_POST['nprestamo'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

if(($tipotrabajador==2) or ($tipotrabajador==3) or ($tipotrabajador==4) or ($tipotrabajador==5) or ($tipotrabajador==10)) {
  //select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
  $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='3' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."' and tc.sucursal='". $sucursal ."';";
  $datos=pg_query($query);
  $tregistros = pg_numrows($datos);
  $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
  $idcaja=$registros[idcaja];

  if($tregistros == 1){

    //Seleccionar Datos del Prestamo
    //select tem, monto, fecpago, tcuotas, comision, aporte, sucursal from tprestamo
    $query = pg_query("select idsocio, descripcion, tem, monto, plazo, fecpago, tcuotas, comision, aporte, sucursal from tprestamo where nprestamo = '". $nprestamo ."';");
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

    //t->6.5 m->-INF f->1 tc->162 c->10 a->0.40 s->1
    $idsocio=$registros[idsocio];
    $descripcion=$registros[descripcion];
    $tem=$registros[tem];
    $monto=$registros[monto];
    $mprestamo=$registros[monto]*(-1);
    $plazo=$registros[plazo];;
    $fecpago=$registros[fecpago];
    $tcuotas=$registros[tcuotas];
    $comision=$registros[comision];
    $aporte=$registros[aporte];
    $date = date("d-m-Y");
    $fecha = date("Y-m-d");
    $hora = date("H:i:s"); 
    $usuario=$_SESSION['idtrabajador'];
    $sucursal=$registros[sucursal];

    switch ($registros[fecpago]) {
      case 'LUNES A VIERNES':
        $fpago=1;
        break;
      case 'LUNES A SÁBADO':
        $fpago=2;
        break;
      case 'SEMANAL':
        $fpago=3;
        break;
      case 'QUINCENAL':
        $fpago=4;
        break;
      case 'MENSUAL':
        $fpago=5;
        break;
    } 

   $tprestamo='';
   $abcuotas=array();
   $abcuotas=gencuotas($tprestamo,$monto,$tem,$fpago,$aporte,$plazo,$comision);
   $tcuotas=count($abcuotas);


   // Inciamos el Ingreso de la cuotas
   for($i=1;$i<=$tcuotas;$i++)
   {
      $fvencimiento=$abcuotas[$i][1];
      $scapital=$abcuotas[$i][3];
      $interes=$abcuotas[$i][4];
      $amortizacion=$abcuotas[$i][5];
      $comision=$abcuotas[$i][6];
      $aporte=$abcuotas[$i][7];
      $cuotaf=$abcuotas[$i][8];
      //Insertamos en la Tabla Cuotas
      //insert into tcuotas (nprestamo,ncuota,fvencimieno,capital,interes,amortizacion,comision,aporte,montocuota,sucural) values ('10001',2,'fecha','2.3','3.2','23.3','34.4','0.40','23.98',1)
      $query = "insert into tcuotas (nprestamo,ncuota,fvencimiento,capital,interes,amortizacion,comision,aporte,montocuota,estado,sucursal) values ('". $nprestamo ."'," . $i . ",'" . $fvencimiento . "','" . number_format($scapital,2,".","") . "','" . number_format($interes,2,"."," ") . "','" . number_format($amortizacion,2,"."," ") . "','" . number_format($comision,2,"."," ") . "','" . number_format($aporte,2,".","") . "','" .  number_format($cuotaf,2,".","") ."','PENDIENTE',". $sucursal .");";
      pg_query($query);
      // Insertamos en la Tabla cronograma
      $queryc = "insert into tcronograma (nprestamo,ncuota,fvencimiento,capital,interes,amortizacion,comision,aporte,montocuota,sucursal) values ('". $nprestamo ."'," . $i . ",'" . $fvencimiento . "','" . number_format($scapital,2,".","") . "','" . number_format($interes,2,"."," ") . "','" . number_format($amortizacion,2,"."," ") . "','" . number_format($comision,2,"."," ") . "','" . number_format($aporte,2,".","") . "','" .  number_format($cuotaf,2,".","") ."',". $sucursal .");";
      pg_query($queryc);
   }

   //Actualizamosestado de Prestamo;
   //update tprestamo set aprobado='NO' where nprestamo='2000001';
   $query = pg_query("update tprestamo set aprobado='SI', estado='EN PROCESO' where nprestamo='".$nprestamo."';");

   // ----- Buscamos el ultimo número de movimiento y sumamos uno para el nuevo numero de prestamo
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
   $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','P','". $idsocio ."','". $nprestamo . "','". $descripcion ."','S','". $nmovimiento ."','SOL','". $mprestamo ."','". $fecha ."','". $hora ."','OK','NO','NO','" . $usuario ."','" . $sucursal . "');";
   pg_query($query);

   // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
   //update tcaja set mfinal=mfinal+10 where idcaja='1';
   $query="update tcaja set mfinal=mfinal+". $mprestamo ." where idcaja='" . $idcaja . "';";
   pg_query($query);

   $phptoajax[0]="DESEMBOLSO REGISTRADO EXITOSAMENTE";
   $phptoajax[1]=$nmovimiento;
   $phptoajax[2]="P";
   echo json_encode($phptoajax);
  }else{
  echo '1';
  }
}else{
  echo '2';
} // Fin if de Consulta de cajero

}


//FUNCION QUE GENERA LAS CUOTAS DEL PRESTAMO.
function gencuotas($tprestamo,$monto,$tem,$fpago,$aporte,$plazo,$comision){

$dias = array('DOM','LUN','MAR','MIE','JUE','VIE','SAB');

   switch ($fpago) {
      case 1:
         $ncuotas=27;
         break;
      case 2:
         $ncuotas=27;
         break;
      case 3:
         $ncuotas=4;
         break;
      case 4:
         $ncuotas=2;
         break;
      case 5:
         $ncuotas=1;
         break;
   }

   //Calcular el interes mensual
   if(($fpago==1)||($fpago==2))
   {
      $interes=($tem/100)/($ncuotas+1);
   }else{
      $interes=($tem/100)/$ncuotas;
   }

   // Calcular el Costo de la comision
   $costocomision= ((($comision/100)*$monto)/$ncuotas);

   //Calcular la Cuotra Mensual
   $cuota=($monto*$interes*(pow((1+$interes),$ncuotas*$plazo)))/((pow((1+$interes),($ncuotas*$plazo)))-1);
   $cuotaf=$cuota+$costocomision+$aporte;

   //Obtenemos los Feriados y los alamacenamos en un arreglo
   $query = pg_query("select fecha from tferiado;");
   $tregistros = pg_num_rows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $arrayfecha[]=date("d-m-Y",strtotime($registros[fecha]));
   }

   $acronograma=array();
   $cdias=0;
   $cmes=0;

   //For para generar las cuotas
   for($i=1;$i<=($ncuotas*$plazo);$i++){

      if(($fpago==1)or($fpago==2)){
      $cdias=$cdias+1;
      evaldiario:
      $control=$cdias;
      $mod_date = strtotime($date."+".$cdias."days");
    $feriado=date("d-m-Y",$mod_date);
       while(in_array($feriado,$arrayfecha)){
          $cdias=$cdias+1;
            $mod_date = strtotime($date."+".$cdias."days");
          $feriado=date("d-m-Y",$mod_date);
         }
      $dia = $dias[date('w', $mod_date)];
      if($fpago==1){
         if(strcmp($dia,"SAB")==0){
            $cdias=$cdias+2;  
         } elseif(strcmp($dia,"DOM")==0) {
            $cdias=$cdias+1;
       }
    }else{
       if(strcmp($dia,"DOM")==0) {
            $cdias=$cdias+1;
       }
    }
    if($control!=$cdias){
      goto evaldiario;
    }
    //return $mod_date;
   } elseif (($fpago==3)or($fpago==4)) {
      $cdias=0;
      if($fpago==3){
         $cdias=7*$i;
      }elseif($fpago==4){
         $cdias=14*$i;
      }
      evalsemanal:
      $control=$cdias;
      $mod_date = strtotime($date."+".$cdias."days");
    $feriado=date("d-m-Y",$mod_date);
       while(in_array($feriado,$arrayfecha)){
          $cdias=$cdias+1;
            $mod_date = strtotime($date."+".$cdias."days");
          $feriado=date("d-m-Y",$mod_date);
         }
         $dia = $dias[date('w', $mod_date)];
     if(strcmp($dia,"DOM")==0){
            $cdias=$cdias+1;
       }
       if($control!=$cdias){
       goto evalsemanal;
       }
   } elseif($fpago==5){
      $cdias=0;
      $cmes=$cmes+1;
      $mdate = date("d-m-Y",strtotime($date."+".$cmes."months"));
      evalmensual:
      $control=$cdias;
      $mod_date = strtotime($mdate."+".$cdias."days");
      $feriado=date("d-m-Y",$mod_date);
       while(in_array($feriado,$arrayfecha)){
          $cdias=$cdias+1;
            $mod_date = strtotime($mdate."+".$cdias."days");
          $feriado=date("d-m-Y",$mod_date);
         }
         $dia = $dias[date('w', $mod_date)];
     if(strcmp($dia,"DOM")==0){
            $cdias=$cdias+1;
       }
       if($control!=$cdias){
       goto evalmensual;
       }
   }
   //Numero de Cuota
   $acronograma[$i][0]=$i;
   //Fecha de Pago
   $acronograma[$i][1]=date("d-m-Y",$mod_date);
   //Día de Pago
   $dia = $dias[date('w', $mod_date)];
   $acronograma[$i][2]=$dia;
   //Monto
   $acronograma[$i][3]=number_format($monto,2,".","");
   //Interes 
   $interes1=$monto*$interes;
   $acronograma[$i][4]=number_format($interes1,4,".","");
   //Amortizacion
   $amortizacion1=$cuota-($monto*$interes);
   $acronograma[$i][5]=number_format($amortizacion1,4,".","");
   //Comision
   $acronograma[$i][6]=number_format($costocomision,4,".","");
   //Aporte
   $acronograma[$i][7]=$aporte;
   //Cuota Final
   $cuotaf=$interes1+$amortizacion1+$costocomision+$aporte;
   $acronograma[$i][8]=number_format($cuotaf,4,".","");

   $monto=$monto-($cuota-($monto*$interes));
   }
   pg_free_result($query);
   return $acronograma;
}

//funcion redondear valor
function redondear($num){
   if($num!=''){
      $dividir = explode(".",$num);
      $entera=$dividir[0];
      $redondear=$dividir[1];
      $redondear=$redondear/10;
      $decimal=ceil($redondear);
      $decimal=$decimal*10;
      if($decimal==100){
      $entera=$entera+1;
      $decimal='00';
      $num=$entera.'.'.$decimal;
      }else{
      $num=$entera.'.'.$decimal;
      }
      return $num;
   }else{
      echo "Error al recibir numero";
      return 0;
   }
}


// Muestra datos de Cambio de Cartera
if($tipo=='CARTE'){
   $aprobado=$_POST['aprobado'];
   $estado=$_POST['estado'];
   // CONSULTA PARA SELECCIONAR DATOS DE LA TABLA PRESTAMOS
   //select tp.idprestamo, tp.idsocio, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.nprestamo, tp.descripcion, tp.monto, tp.analista, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as nanalista from tprestamo as tp, tsocio as ts, ttrabajador as tt where tp.idsocio=ts.idsocio and tp.analista=tt.idtrabajador and tp.estado='EN PROCESO' and tp.aprobado='SI' and tp.sucursal='1' group by tp.idprestamo, tp.idsocio, socio, tp.nprestamo, tp.descripcion, tp.monto, tp.analista, nanalista order by analista
   $query = pg_query("select tp.idprestamo, tp.idsocio, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.nprestamo, tp.descripcion, tp.monto, tp.analista, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as nanalista from tprestamo as tp, tsocio as ts, ttrabajador as tt where tp.idsocio=ts.idsocio and tp.analista=tt.idtrabajador and tp.estado='". $estado ."' and tp.aprobado='". $aprobado ."' and tp.sucursal='". $sucursal ."' group by tp.idprestamo, tp.idsocio, socio, tp.nprestamo, tp.descripcion, tp.monto, tp.analista, nanalista order by analista");

   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
   }
   pg_free_result($query);
   echo json_encode($data);
}


//Actualiza analista de Cambio de Cartera
if($tipo=='UPCAR'){
  $idprestamo=$_POST['idprestamo'];
  $idanalista=$_POST['idanalista'];

  //CONSULTA PARA ACTUALIZAR ANALISTA
  //update tprestamo set analista='17' where idprestamo='166' and sucursal='1'
  $query = pg_query("update tprestamo set analista='". $idanalista ."' where idprestamo='". $idprestamo ."' and sucursal='". $sucursal ."';");  

  if ($query) {
    echo 'EL ANALISTA FUE ACTUALIZADO CORRECTAMENTE';
    pg_free_result($query);  
  }else{
    echo 'NO SE PUDO ACTUALIZAR EL DATO DEL ANALISTA';
    pg_free_result($query);
  }

}

//pg_free_result($query);
pg_close($BD_conexion);
?>