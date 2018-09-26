<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
     header('Location: login.php');
  } else{
     include('configuracion.php');
     include('dataprestamo.php');
     $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
  }

//$GLOBALS['tipo']=$_POST['tipo'];
$tipo=$_POST['tipo'];
//$GLOBALS['npretamo']=$_POST['nprestamo'];
$nprestamo=$_POST['nprestamo'];
$pcuota=0;
$ptotal=0;
$tregistros=0;

if($tipo=='MPCU'){
   detprestamo();
   detcuotas($nprestamo);
   detpgcuota();
}


if($tipo=='MPTO'){
   detprestamo();
   detcuotas($nprestamo);
   detpgtotal();
}


if($tipo=='MPDM'){
   detprestamo();
   detcuotas($nprestamo);
   detdescmora();
}


function detprestamo(){
   global $nprestamo;
   //$nprestamo=$GLOBALS['npretamo'];
   //  select tp.idprestamo, tp.idsocio, concat(ts.tipodoc,' ',ts.numerodoc), concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo as cuenta, tp.descripcion as prestamo, tp.plazo as plazo, tp.tem as tem, tp.monto as monto, tp.tcuotas as cuotas, tp.fprestamo as fapertura, tp.analista as analista, tp.recaudador as recaudador, tp.estado as estado  from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and estado='EN PROCESO' and nprestamo='2000004';
   $query = pg_query("select tp.idprestamo, tp.idsocio, concat(ts.tipodoc,' ',ts.numerodoc) as documento, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.nprestamo as cuenta, tp.descripcion as prestamo, tp.plazo as plazo, tp.tem as tem, tp.monto as monto, tp.tcuotas as cuotas, tp.fprestamo as fapertura, tp.analista as analista, tp.recaudador as recaudador, tp.estado as estado  from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and estado='EN PROCESO' and nprestamo='" . $nprestamo . "';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

   $querya = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as analista from ttrabajador where idtrabajador='".$registros[analista]."';");
   $registrosa = pg_fetch_array($querya, null, PGSQL_ASSOC);

   $queryo = pg_query("select concat(nombres,' ',apaterno,' ',amaterno) as recaudador from ttrabajador where idtrabajador='".$registros[recaudador]."';");
   $registroso = pg_fetch_array($queryo, null, PGSQL_ASSOC);

   echo '<table id="tdatos" class="tpinfo" style="width:580px; font-size:13px; text-align:center;">
   <tr>
      <th>N° CUENTA</th>
      <th>SOCIO</th>
      <th>DOCUMENTO</th>
      <th>CONDICION</th>          
   </tr>
   <tr>
      <td><label id="lpcnprestamo">'.$registros[cuenta].'</label></td>
      <td>'.$registros[socio].'<label id="lpcidsocio" style="display: none;">'.$registros[idsocio].'</label></td>
      <td>'.$registros[documento].'</td>
      <td>TITULAR</td>
   </tr>
   <tr class="separar">
      <th>MONTO</th>
      <th>PRESTAMO</th>
      <th>PLAZO</th>
      <th>TEM</th>
   </tr>
   <tr>
      <td>S/. '.$registros[monto].'</td>
      <td><label id="lpcdescripcion">'.$registros[prestamo].'</label></td>
      <td>'.$registros[plazo].' Meses</td>
      <td>'.$registros[tem].' %</td>
   </tr>
   <tr class="separar">
      <th>F APERTURA</th>
      <th>ANALISTA/RECAUDADOR</th>
      <th>N° CUOTAS</th>
      <th>ESTADO</th>
   </tr>
   <tr>
      <td>'.$registros[fapertura].'</td>
      <td>'.$registrosa[analista].'<br>'.$registroso[recaudador].'</td>
      <td>'.$registros[cuotas].'</td>
      <td>'.$registros[estado].'</td>
   </tr>
   </table>';
}


function detcuotas($nprestamo){
   global $nprestamo,$tipo,$pcuota,$ptotal,$tregistros;
   echo '<table id="tcuotas" class="tmdata">
   <tr>
      <th>Cuota</th>
      <th>F. Vencimiento</th>
      <th>Dias/Mora</th>
      <th>Mora</th>
      <th>Comisión</th>
      <th>Ahorro</th>
      <th>Interes</th>
      <th>Capital</th>
      <th>Descuento</th>
      <th>Total</th>
   </tr>';

   //select tc.ncuota, DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp) as diasmora, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora from tcuotas as tc, tprestamo as tt where tc.nprestamo=tt.nprestamo and tc.estado='PENDIENTE' and tc.nprestamo='2000001' order by tc.ncuota asc FETCH FIRST 10 ROWS ONLY
   if($tipo=='MPCU'){

   $query = pg_query("select tc.ncuota, tc.fvencimiento, DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp) as diasmora, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora, sum(tc.descuentom+tc.descuentoi+tc.descuentoc) as descuento from tcuotas as tc, tprestamo as tt where tc.nprestamo=tt.nprestamo and tc.estado='PENDIENTE' and tc.nprestamo='". $nprestamo . "' group by tc.ncuota, tc.fvencimiento, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora order by tc.ncuota asc FETCH FIRST 12 ROWS ONLY");
   $tregistros= pg_num_rows($query);

   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo '<tr><td>'.$registros[ncuota].'</td>';
      echo '<td>'.$registros[fvencimiento].'</td>';
      echo '<td>'.$registros[diasmora].'</td>';
      if($registros[diasmora]<=0){
         $pagomora=0;
      }else{
         $pagomora=($registros[interes]+$registros[amortizacion]+$registros[comision]+$registros[aporte])*(($registros[mora]*$registros[diasmora])/100);
         $pagomora=number_format($pagomora,2,"."," ");
      }
      echo '<td>'.$pagomora.'</td>';
      echo '<td colspan="1">'.$registros[comision].'</td>';
      echo '<td colspan="1">'.$registros[aporte].'</td>';
      echo '<td colspan="1">'.$registros[interes].'</td>';
      echo '<td colspan="1">'.$registros[amortizacion].'</td>';
      echo '<td colspan="1">'.$registros[descuento].'</td>';
      $totalcuota=$registros[amortizacion]+$registros[interes]+$registros[aporte]+$registros[comision]+$pagomora-$registros[descuento];
      $totalcuota=redondear(number_format($totalcuota,2,"."," "));
      echo '<td colspan="1">'.$totalcuota.'</td>';
      echo '</tr>';
      if($i==1){
         $pcuota=$totalcuota;
      }
   } // Final For
   } // FInal tipo MPCU

   if($tipo=='MPTO'){
      $query = pg_query("select tc.ncuota, tc.fvencimiento, DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp) as diasmora, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora, sum(tc.descuentom+tc.descuentoi+tc.descuentoc) as descuento from tcuotas as tc, tprestamo as tt where tc.nprestamo=tt.nprestamo and tc.estado='PENDIENTE' and tc.nprestamo='". $nprestamo . "' group by tc.ncuota, tc.fvencimiento, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora order by tc.ncuota");
      $tregistros= pg_num_rows($query);

   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo '<tr><td>'.$registros[ncuota].'</td>';   
      echo '<td>'.$registros[fvencimiento].'</td>';
      echo '<td>'.$registros[diasmora].'</td>';
      if($registros[diasmora]<=0){
         $pagomora=0;
      }else{
         $pagomora=($registros[interes]+$registros[amortizacion]+$registros[comision]+$registros[aporte])*(($registros[mora]*$registros[diasmora])/100);
         $pagomora=number_format($pagomora,2,"."," ");
      }
      echo '<td>'.$pagomora.'</td>';
      if($i==1){
         $comision=$registros[comision];
         $aporte=$registros[aporte];
         $interes=$registros[interes];
      }else{
         $comision=0;
         $aporte=0;
         $interes=0;
      }
      echo '<td colspan="1">'.$comision.'</td>';
      echo '<td colspan="1">'.$aporte.'</td>';
      echo '<td colspan="1">'.$interes.'</td>';
      echo '<td colspan="1">'.$registros[amortizacion].'</td>';
      echo '<td colspan="1">'.$registros[descuento].'</td>';
      $totalcuota=$registros[amortizacion]+$interes+$aporte+$comision+$pagomora-$registros[descuento];
      $totalcuota=redondear(number_format($totalcuota,2,"."," "));
      echo '<td colspan="1">'.$totalcuota.'</td>';
      echo '</tr>';
      $ptotal=$ptotal+$totalcuota;
   } // Final For
   }

   // Generamos la cuotas para realizar los descuentos correspondientes
   if($tipo=='MPDM'){

   $query = pg_query("select tc.ncuota, tc.fvencimiento, DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp) as diasmora, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora, sum(tc.descuentom+tc.descuentoi+tc.descuentoc) as descuento from tcuotas as tc, tprestamo as tt where tc.nprestamo=tt.nprestamo and tc.estado='PENDIENTE' and tc.nprestamo='". $nprestamo . "' group by tc.ncuota, tc.fvencimiento, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora order by tc.ncuota");
   $tregistros= pg_num_rows($query);

   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo '<tr><td>'.$registros[ncuota].'</td>';
      echo '<td>'.$registros[fvencimiento].'</td>';
      echo '<td>'.$registros[diasmora].'</td>';
      if($registros[diasmora]<=0){
         $pagomora=0;
      }else{
         $pagomora=($registros[interes]+$registros[amortizacion]+$registros[comision]+$registros[aporte])*(($registros[mora]*$registros[diasmora])/100);
         $pagomora=number_format($pagomora,2,"."," ");
      }
      echo '<td>'.$pagomora.'</td>';
      echo '<td colspan="1">'.$registros[comision].'</td>';
      echo '<td colspan="1">'.$registros[aporte].'</td>';
      echo '<td colspan="1">'.$registros[interes].'</td>';
      echo '<td colspan="1">'.$registros[amortizacion].'</td>';
      echo '<td colspan="1">'.$registros[descuento].'</td>';
      $totalcuota=$registros[amortizacion]+$registros[interes]+$registros[aporte]+$registros[comision]+$pagomora-$registros[descuento];
      $totalcuota=redondear(number_format($totalcuota,2,"."," "));
      echo '<td colspan="1">'.$totalcuota.'</td>';
      echo '</tr>';
      if($i==1){
         $pcuota=$totalcuota;
      }
   } // Final For
   } // FInal tipo MPCU

   echo '</table>';
}


function detpgcuota(){
global $pcuota,$ptotal,$tregistros;
echo '<table class="tpinfo" style="width:580px">
   <tr>
      <td colspan="2" style="font-size:13px;">N° DE CUOTAS A PAGAR</td>
      <td><select id="lpcncutoas" disabled>';
      for($i=1;$i<=$tregistros; $i++){
         echo "<option value=".$i.">".$i."</option>";     
      }
    echo '</select>
      </td>
      <td style="text-align:right; font-size:13px;">TOTAL</td>
      <td style="text-align:right; font-size:16px;">S/. <label id="lpctotal">'.number_format($pcuota,2,"."," ").'</label></td>
   </tr>
   <tr>
      <td colspan="4" style="text-align:right; font-size:13px;">INGRESE EL MONTO RECIBIDO</td>
      <td style="text-align:right"><input type="text" id="apcmonto" name="" class="textop"></td>
   </tr>
   <tr>
      <td colspan="5" style="text-align:center">
      <button id="bcpgpagar" class="bsistema"><img src="../recursos/bpagar.png"/><span>PAGAR</span></button>     
       <button id="bcpgcerrar" class="bsistema"><img src="../recursos/bcerrar.png"/><span>CERRAR</span></button>
      </td>
   </tr>
   </table>';
}


function detpgtotal(){
global $ptotal,$tregistros;
echo '<table class="tpinfo" style="width:580px">
   <tr>
      <td colspan="2" style="font-size:13px;">MONTO TOTAL A PAGAR</td>
      <td style="text-align:right; font-size:20px;><label id="lpttotal">S/. '.number_format($ptotal,2,"."," ").'</label></td>
      <td style="text-align:right;">MONTO RECIBIDO:</td>
      <td style="text-align:right"><input type="text" id="apcmonto" name="" class="textop"></td>
   </tr>
   <tr>
      <td colspan="5" style="text-align:center">
      <button id="bcpgtopagar" class="bsistema"><img src="../recursos/bpagar.png"/><span>PAGAR</span></button>     
       <button id="bcpgtocerrar" class="bsistema"><img src="../recursos/bcerrar.png"/><span>CERRAR</span></button>
      </td>
   </tr>
   </table>';
}


function detdescmora(){
global $pcuota,$ptotal,$tregistros;
echo '<table class="tpinfo" style="width:580px">
   <tr>
      <td colspan="1" rowspan="2" style="font-size:14px;">INGRESAR DESCUENTO:</td>
      <td style="text-align:center;></td>
      <td style="text-align:center;>CUOTA</td>
      <td style="text-align:center;">D. MORA:</td>
      <td style="text-align:center;">D. COMISION:</td>
      <td style="text-align:center;">D. INTERES:</td>
      <td style="text-align:center;">TOTAL:</td>
   </tr>
   <tr> 
      <td style="text-align:center; font-size:18px;"><label id="ldmncuota">0</label></td>
      <td style="text-align:center;"><input type="text" id="amdmmora" name="" class="textop"></td>
      <td style="text-align:center;"><input type="text" id="amdmcomision" name="" class="textop"></td>
      <td style="text-align:center;"><input type="text" id="amdminteres" name="" class="textop"></td>
      <td style="text-align:center; font-size:16px;">S/. <label id="ldmtotal">20.00<label></td>
   </tr>
   <tr>
      <td colspan="5" style="text-align:center">
      <button id="bcdesmguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>     
       <button id="bcdesmcerrar" class="bsistema"><img src="../recursos/bcerrar.png"/><span>CERRAR</span></button>
      </td>
   </tr>
   </table>';
}

pg_free_result($query);
pg_close($BD_conexion);
?>