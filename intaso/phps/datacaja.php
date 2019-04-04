<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
  }

$tipo=$_POST['tipo'];
$sucursal=$_SESSION['sucursal'];

if($tipo=='DATA'){
  $filtrado=$_POST['filtrado'];
  //  select tc.idcaja as n, tc.trabajador as id, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, concat(tc.fapertura,'  ',tc.hapertura) as apertura, concat(tc.fcierre,' ',tc.hcierre) as cierre, tc.minicial as minicial, tc.mfinal as mfinal, tc.abierto as abierto from tcaja as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and tc.sucursal='1' order by fapertura;
  if($filtrado=='VS'){
  $query = pg_query("select tc.idcaja as n, tc.trabajador as id, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, concat(tc.fapertura,'  ',tc.hapertura) as apertura, concat(tc.fcierre,' ',tc.hcierre) as cierre, tc.minicial as minicial, tc.mfinal as mfinal, tc.mcierre as mcierre, tc.abierto as abierto from tcaja as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and fapertura >= now()::date-'1 week'::interval and tc.sucursal='".$sucursal."' order by fapertura desc;");
  }
  if($filtrado=='VM'){
  $query = pg_query("select tc.idcaja as n, tc.trabajador as id, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, concat(tc.fapertura,'  ',tc.hapertura) as apertura, concat(tc.fcierre,' ',tc.hcierre) as cierre, tc.minicial as minicial, tc.mfinal as mfinal, tc.mcierre as mcierre, tc.abierto as abierto from tcaja as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and fapertura >= now()::date-'1 month'::interval and tc.sucursal='".$sucursal."' order by fapertura desc;");
  }
  if($filtrado=='VT'){
  $query = pg_query("select tc.idcaja as n, tc.trabajador as id, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, concat(tc.fapertura,'  ',tc.hapertura) as apertura, concat(tc.fcierre,' ',tc.hcierre) as cierre, tc.minicial as minicial, tc.mfinal as mfinal, tc.mcierre as mcierre, tc.abierto as abierto from tcaja as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and tc.sucursal='".$sucursal."' order by fapertura desc;");
  }
  $tregistros = pg_numrows($query);

    for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
    }
  echo json_encode($data);
}


if($tipo=='BILL'){
  $filtrado=$_POST['filtrado'];
  //  select tc.idcaja as n, tc.trabajador as id, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, concat(tc.fapertura,'  ',tc.hapertura) as apertura, concat(tc.fcierre,' ',tc.hcierre) as cierre, tc.minicial as minicial, tc.mfinal as mfinal, tc.abierto as abierto from tcaja as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and tc.sucursal='1' order by fapertura;
  if($filtrado=='VS'){
  $query = pg_query("select tb.idbilletaje as id, tb.trabajador as idtrabajador, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, tb.fbilletaje as fbilletaje, tb.stotal, concat(tb.freg,' ',tb.hreg) as fregistro from tbilletaje as tb, ttrabajador as tt where tb.trabajador=tt.idtrabajador and fbilletaje >= now()::date-'1 week'::interval and tb.sucursal='1' order by fbilletaje desc;");
  }
  if($filtrado=='VM'){
  $query = pg_query("select tb.idbilletaje as id, tb.trabajador as idtrabajador, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, tb.fbilletaje as fbilletaje, tb.stotal, concat(tb.freg,' ',tb.hreg) as fregistro from tbilletaje as tb, ttrabajador as tt where tb.trabajador=tt.idtrabajador and fbilletaje >= now()::date-'1 month'::interval and tb.sucursal='1' order by fbilletaje desc;");
  }
  if($filtrado=='VT'){
  $query = pg_query("select tb.idbilletaje as id, tb.trabajador as idtrabajador, concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, tb.fbilletaje as fbilletaje, tb.stotal, concat(tb.freg,' ',tb.hreg) as fregistro from tbilletaje as tb, ttrabajador as tt where tb.trabajador=tt.idtrabajador and tb.sucursal='1' order by fbilletaje desc;");
  }
  $tregistros = pg_numrows($query);

    for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
    }
  echo json_encode($data);
}


//Obtiene el ultimo valor de cierre de caja.
if($tipo=='MOCA'){
   $idcajero=trim($_POST['idcajero']);
   $sucursal= $_SESSION['sucursal'];
   $query = pg_query("select mfinal, abierto from tcaja where fapertura=(select max(fapertura) from tcaja where trabajador='". $idcajero ."' and sucursal='". $sucursal ."') and trabajador='". $idcajero ."' order by idcaja desc limit 1");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $estado=$registros[abierto];
   $monto=$registros[mfinal];
   if($estado=='SI'){
    echo 'NO';
   }else{
      if($monto==''){
         echo '0';
      }else{
         echo $monto;
      }
   }

   pg_free_result($query);
}


if($tipo=='INS'){
   $idcajero=trim($_POST['idcajero']);
   $fapertura = date("Y-m-d");
   $hapertura = date("H:i:s"); 
   $monto= trim($_POST['minicial']);
   $sucursal= $_SESSION['sucursal'];
   $usuario=$_SESSION['idtrabajador'];

   // BUSCAMO QUE EL CAJERO NO TENGA CAJAS ABIERTAS;
   //select * from tcaja where abierto='SI' and trabajador='2';
   $query = pg_query("select * from tcaja where abierto='SI' and trabajador='". $idcajero ."';");
   $tregistros = pg_numrows($query);
   if($tregistros < 1){
      //insert into tcaja (trabajador,fapertura,hapertura,minicial,mfinal,movimientos,abierto,usuario,sucursal) values ('1','2018-07-18','13:21:34','1000','1000','0','SI','2','1');
      $query = "insert into tcaja (trabajador,fapertura,hapertura,minicial,mfinal,movimientos,abierto,usuario,sucursal) values ('" . $idcajero . "','" . $fapertura ."','" . $hapertura . "','" . $monto . "','" . $monto . "','0','SI','" . $usuario . "','" . $sucursal . "');";
      pg_query($query);
      echo "LA CAJA FUE APERTURADA CORRECTAMENTE";
   }else{
      echo "UD NO PUEDE APERTURAR CAJA PORQUE YA EXISTE CAJA APERTURADA";
   }
}


//Generamos Extracto de Movimientos de Flujo de Caja.
if($tipo=='MOVS'){
  $idcaja=$_POST['idcaja'];

   //Seleccionamos datos del Cajero
   $query = pg_query("select concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as cajero, tt.dni from ttrabajador as tt, tcaja as tc where tc.trabajador=tt.idtrabajador and tc.idcaja='". $idcaja ."' and tc.sucursal='". $sucursal ."'");
   $registrost = pg_fetch_array($query, null, PGSQL_ASSOC);

   //select concat(fapertura,' ',hapertura) as fapertura, concat(fcierre,' ',hcierre) as fcierre, abierto,minicial,mfinal,movimientos,mcierre from tcaja where idcaja='2' and sucursal='1'
   $query = pg_query("select concat(fapertura,' ',hapertura) as fapertura, concat(fcierre,' ',hcierre) as fcierre, abierto,minicial,mfinal,movimientos,mcierre from tcaja where idcaja='". $idcaja ."' and sucursal='".$sucursal."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

   echo'<div id="dcamovcontenido" class="dpagina" style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h2>HOJA RESUMEN DE MOVIMIENTOS</h2></center>
      <br>
      <table class="tpagina">
      <caption>DATOS DEL CAJERO</caption>     
      <tr>
         <th colspan="4" >CAJERO:</th>
         <th>DNI:</th>
      </tr>
      <tr class="separar">
         <td colspan="4">'. ($registrost[cajero]) .'</td>
         <td>'. $registrost[dni] .'</td>
      </tr>
      <tr>
        <td colspan="5" class="caption">DATOS DE LA CAJA:</th>
     </tr>
     <tr>
        <th colspan="2">FECHA DE APERTURA:</th>
        <th colspan="2">FECHA DE CIERRE:</th>
        <th>CAJA ABIERTA:</th>
     </tr>
     <tr>
        <td colspan="2">'.$registros[fapertura].'</td>
        <td colspan="2">'. $registros[fcierre] .' %</td>
        <td>'. $registros[abierto].'</td>
     </tr>
     <tr>
        <th>MONTO APERTURA:</th>
        <th>MONTO FINAL:</th>
        <th>CANT. MOVIMIENTOS:</th>
        <th>MONTO DE CIERRE:</th>
        <th></th>
     </tr>
     <tr>
        <td>S/. '. $registros[minicial] .'</td>
        <td>S/. '. $registros[mfinal] .'</td>
        <td>'. $registros[movimientos] .'</td>
        <td>S/. ' . $registros[mcierre] . '</td>
        <td></td>
     </tr>
     </table>';

   echo '<br>
      <table class="tpagina" style="font-size:10px">
      <tr>
         <th>#</th>
         <th>N° OPERACIÓN</th>
         <th>FECHA MOV.</th>
         <th>CUENTA</th>
         <th>DESCRIPCIÓN</th>
         <th>SOCIO</th>
         <th>MONEDA</th>
         <th>MONTO</th>
         <th>MOVIMIENTO</th>
         <th>ANULADO</th>
      </tr>';

//select concat(tm.flujomov,'-',lpad(tm.numeromov::text,8,'0')) as operacion, concat(tm.fechamov,' ',tm.horamov) as fecha, tm.cuenta, tm.descripcion, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tm.moneda, tm.monto, CASE WHEN tm.tipomov='A' THEN 'AFILIACION'
//            WHEN tm.tipomov='H' THEN 'APERTURA' WHEN tm.tipomov='D' THEN 'DEPOSITO' WHEN tm.tipomov='R' THEN 'RETIRO' WHEN tm.tipomov='P' THEN 'DESEMBOLSO' WHEN tm.tipomov='C' THEN 'PAGO CUOTA' ELSE 'NO EXISTE' END as movimiento, tm.anulado from tmovimiento as tm, tsocio as ts, tusuario as tu, tcaja as tc where tm.socio=ts.idsocio and tm.usuario=tu.idusuario and tm.idcaja=tc.idcaja and tm.idcaja='5' order by tm.numeromov
   $query = pg_query("select concat(tm.flujomov,'-',lpad(tm.numeromov::text,8,'0')) as operacion, concat(tm.fechamov,' ',tm.horamov) as fecha, tm.cuenta, tm.descripcion, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tm.socio as idsocio, tm.moneda, tm.monto, tm.tipomov, CASE WHEN tm.tipomov='A' THEN 'AFILIACION' WHEN tm.tipomov='H' THEN 'APERTURA' WHEN tm.tipomov='D' THEN 'DEPOSITO' WHEN tm.tipomov='R' THEN 'RETIRO' WHEN tm.tipomov='P' THEN 'DESEMBOLSO' WHEN tm.tipomov='C' THEN 'PAGO CUOTA' WHEN tm.tipomov='I' THEN 'INGRESO CAJA' WHEN tm.tipomov='E' THEN 'EGRESO CAJA' WHEN tm.tipomov='T' THEN 'PAGO TOTAL' WHEN tm.tipomov='PI' THEN 'PAGO INTERES' ELSE 'NO EXISTE' END as movimiento, tm.anulado from tmovimiento as tm, tsocio as ts, ttrabajador as tt, tcaja as tc where tm.socio=ts.idsocio and tm.usuario=tt.idtrabajador and tm.idcaja=tc.idcaja and tm.idcaja='". $idcaja ."' order by tm.idmovimiento;");
//select concat(tm.flujomov,'-',lpad(tm.numeromov::text,8,'0')) as operacion, concat(tm.fechamov,' ',tm.horamov) as fecha, tm.cuenta, tm.descripcion, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tm.socio as idsocio, tm.moneda, tm.monto, CASE WHEN tm.tipomov='A' THEN 'AFILIACION' WHEN tm.tipomov='H' THEN 'APERTURA' WHEN tm.tipomov='D' THEN 'DEPOSITO' WHEN tm.tipomov='R' THEN 'RETIRO' WHEN tm.tipomov='P' THEN 'DESEMBOLSO' WHEN tm.tipomov='C' THEN 'PAGO CUOTA' WHEN tm.tipomov='I' THEN 'INGRESO CAJA' WHEN tm.tipomov='E' THEN 'EGRESO CAJA' WHEN tm.tipomov='T' THEN 'PAGO TOTAL' ELSE 'NO EXISTE' END as movimiento, tm.anulado from tmovimiento as tm, tsocio as ts, tusuario as tu, tcaja as tc where tm.socio=ts.idsocio and tm.usuario=tu.idusuario and tm.idcaja=tc.idcaja and tm.idcaja='". $idcaja ."' and tm.sucursal='". $sucursal ."' order by tm.idmovimiento;
   $tregistros = pg_numrows($query);
   $total=0;
   for($i=1;$i<=$tregistros;$i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo "<tr>";
         echo "<td>".$i."</td>";
         echo "<td>".$registros[operacion]."</td>";
         echo "<td>".$registros[fecha]."</td>";
         echo "<td>".$registros[cuenta]."</td>";
         echo "<td>".$registros[descripcion]."</td>";
         if(($registros[movimiento]=='INGRESO CAJA') or ($registros[movimiento]=='EGRESO CAJA')){
            $queryt = pg_query("select concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador where idtrabajador='". $registros[idsocio] ."' and sucursal='1';");
            $registrost = pg_fetch_array($queryt, null, PGSQL_ASSOC);
         echo "<td>".$registrost[trabajador]."</td>";
         }else{
         echo "<td>".$registros[socio]."</td>";          
         }
         echo "<td>".$registros[moneda]."</td>";
         echo "<td>S/.".$registros[monto]."</td>";
         echo "<td>".$registros[movimiento]."</td>";
         echo "<td>".$registros[anulado]."</td>";
      echo "</tr>";
      if($registros[anulado]=='NO'){
         if($registros[tipomov]!='PI'){ 
            $total=$total+$registros[monto];
         }
      }
   }
   echo '<tr><td colspan="6" style="text-align:right">TOTAL:</td>
        <td colspan="2" style="text-align:right">S/. '. number_format($total,2,"."," ") .'</td>
        <td colspan="2"></td>';

   echo '</table>
      </div>
      <button id="bcamovimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
      <button id="bcamovcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';
}


//Se Muestra los montos y usuarios que no recaudaron
if($tipo=='NORE'){
   $idcaja=$_POST['idcaja'];
   $minicial=$_POST['minicial'];
   $estado=$_POST['abierto'];
   $sucursal= $_SESSION['sucursal'];

   echo 'SE PROCEDERA A CERRAR CAJA<br><br>';
   echo 'EL MONTO DE CIERRE ES DE:'; 
   //select sum(monto) from tmovimiento where idcaja='69' and sucursal='1' and anulado='NO'
   $query = pg_query("select sum(monto) as total from tmovimiento where idcaja='". $idcaja ."' and sucursal='". $sucursal ."' and anulado='NO';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
   $total=$minicial+$registros[total];
   if($total<0){
   echo '<h2 style="color:red"> S/. ' . $total . '</h2><br>';
   }else{
   echo '<h2 style="color:blue"> S/. ' . $total . '</h2><br>';
   }
   echo 'RELACION DE PROMOTORES QUE NO SE RECAUDO<br><br>';
   echo '<table id="tcuotas" class="tmdata">
   <tr>
      <th>#</th>
      <th>Trabajador</th>
      <th>Mov.</th>
      <th>Total</th>
      <th>Fecha</th>
   </tr>';
   $query = pg_query("select concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador, tm.cantidad, tm.monto, tm.fechamov, tm.idcaja from ttrabajador as tt LEFT JOIN (select usuario, count(*) as cantidad, sum(monto) as monto, fechamov, idcaja from tmovimiento as tm where  tm.flujomov='E' and tm.anulado='NO' and tm.idcaja='0' group by usuario, idcaja, fechamov) tm on tt.idtrabajador = tm.usuario where (tt.tipotrabajador=12 or tt.tipotrabajador=5 or tt.tipotrabajador=3) order by fechamov, trabajador;");
   $tregistros= pg_num_rows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      if($registros[cantidad]!=null){
      echo '<tr><td>'.$i.'</td>';
      echo '<td>'.$registros[trabajador].'</td>';
      echo '<td>'.$registros[cantidad].'</td>';
      echo '<td>S/. '.$registros[monto].'</td>';
      echo '<td>'.$registros[fechamov].'</td>';
      echo '</tr>';
      }
   } //Final FOR
   echo '</table>
        <label id="lcaceidcaja" style="display:none;">'.$idcaja.'</label>
        <label id="lcaceminicial" style="display:none;">'.$minicial.'</label>
        <label id="lcaceestado" style="display:none;">'.$estado.'</label>
        <button id="bcaceaceptar" class="bsistema"><img src="../recursos/bpag.png"/><span>ACEPTAR</span></button>     
        <button id="bcacecancelar" class="bsistema"><img src="../recursos/bcerrar.png"/><span>CANCELAR</span></button>';

}


// Cerramos la caja y conciliaos las operaciones
if($tipo=='CERR'){

$idcaja=$_POST['idcaja'];
$minicial=$_POST['minicial'];
$caja=$_POST['abierto'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];
$total=0;

  if ($caja == 'SI')
  {

   $query = pg_query("select idmovimiento, monto, conciliado from tmovimiento where idcaja='".$idcaja."' and conciliado='NO' and anulado='NO';");
   $tregistros = pg_numrows($query);
        
      for($i=1;$i<=$tregistros; $i++){
        $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
        $total=$total+$registros[monto];
        
        // Cerramos los Movimientos
        $querya= pg_query("update tmovimiento set fconciliado='". $fecha ."', conciliado='SI' where idmovimiento='". $registros[idmovimiento] ."'");
      }
      $querya= pg_query("update tcaja set fcierre='". $fecha ."', hcierre='". $hora ."', movimientos='". $tregistros ."', mcierre='". $total ."', abierto='NO' where idcaja='". $idcaja ."'");
      $queryu= pg_query("update tcaja set mfinal=minicial+mcierre where idcaja='". $idcaja ."';");
      echo 'LA CAJA SE CERRO SATISFACTORIAMENTE: MONTO S/.'. number_format($total,2,".","");
  }else{
    echo 'La Caja se Encuentra Cerrada';
  }
}


// Recogemos el Dinero de los Socios juntado por los recaudadores
if($tipo=='REC'){
$idpromotor=$_POST['idpromotor'];
$promotor=$_POST['promotor'];
$fcobro=$_POST['fecha'];
$total=$_POST['total'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

if($total == 0)
{
  echo "No hay Monto a recaudar";
}else
{
if(($tipotrabajador==5) or ($tipotrabajador==10)){
  
  //select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
  $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='3' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $idtrabajador ."';";
  $datos=pg_query($query);
  $tregistros = pg_numrows($datos);
  $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
  $idcaja=$registros[idcaja];
    if($tregistros == 1){

      $query = pg_query("select idmovimiento,monto from tmovimiento as tm, ttrabajador as tt where tm.usuario=tt.idtrabajador and (tt.tipotrabajador='12' or tt.tipotrabajador='3') and tm.fechamov='". $fcobro ."' and tm.usuario='". $idpromotor ."' and tm.idcaja='0' and (tipomov='D' or tipomov='H' or tipomov='C' or tipomov='A');");
      $tregistros = pg_numrows($query);
        
      for($i=1;$i<=$tregistros; $i++){
        $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
        $totali=$totali+$registros[monto];
        
        // Pasamos los movimientos a la Cajera
        $querya= pg_query("update tmovimiento set idcaja='". $idcaja ."' where idmovimiento='". $registros[idmovimiento] ."'");
      }

    // ----- INGRESAMOS LOS DATOS A LA TABLA RECAUDAR  -----//
    //update tcaja set mfinal=mfinal+10 where idcaja='1';
    $query="insert into trecaudar (idcaja,idpromotor,cmovimientos,total,fcobro,frecaudacion,hrecaudacion,usuario,sucursal) values ('". $idcaja ."','". $idpromotor ."','". $tregistros ."','". $totali ."','". $fcobro ."','". $fecha ."','". $hora ."','". $usuario ."','". $sucursal ."');";
    pg_query($query);


    // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
    //update tcaja set mfinal=mfinal+10 where idcaja='1';
    $query="update tcaja set mfinal=mfinal+". $totali ." where idcaja='" . $idcaja . "';";
    pg_query($query);
           
    echo 'LA RECAUDACIÓN SE REALIZO SATISFACTORIAMENTE CON UN TOTAL DE: '.$totali;
    }else{
      echo '1';
    }
  }else{
    echo '2';
  }  
}
}

//REGISTRAMOS EL BILLETAJE DEL DIA
if($tipo=='GUAB'){
$idtrabajador=$_POST['idtrabajador'];
$fbilletaje=$_POST['fbilletaje'];
$s200=$_POST['s200'];
$s100=$_POST['s100'];
$s50=$_POST['s50'];
$s20=$_POST['s20'];
$s10=$_POST['s10'];
$s5=$_POST['s5'];
$s2=$_POST['s2'];
$s1=$_POST['s1'];
$s050=$_POST['s050'];
$s020=$_POST['s020'];
$s010=$_POST['s010'];
$stotal=$_POST['stotal'];
$bobservaciones==$_POST['bobservaciones'];
//$total=$_POST['total'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

  $query=pg_query("select idbilletaje from tbilletaje where trabajador='". $idtrabajador ."' and fbilletaje='". $fbilletaje ."'");
  $tregistros=pg_num_rows($query);
  if($tregistros>=1){
    echo 'EL BILLETAJE DE FECHA '. $fbilletaje .' YA SE ENCUENTRA REGISTRADO';
  }else{
    $query=pg_query("insert into tbilletaje (trabajador, fbilletaje, s200, s100, s50, s20, s10, s5, s2, s1, s050, s020, s010, stotal, observaciones, freg, hreg, usuario, sucursal) 
    values ('". $idtrabajador ."','". $fbilletaje ."','". $s200 ."','". $s100 ."','". $s50 ."','". $s20 ."','". $s10 ."','". $s5 ."','". $s2 ."','". $s1 ."','". $s050 ."','". $s020 ."','". $s010 ."','". $stotal ."','". $bobservaciones ."','". $fecha ."','". $hora ."','". $usuario ."','". $sucursal ."')");
    echo 'EL REGISTRO DEL BILLETAJE SE GUARDO EXITOSAMENTE';
  }

}


pg_free_result($query);
pg_close($BD_conexion);
?>