<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
     header('Location: login.php');
  }else{
     include('configuracion.php');
     $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
  }

$tipo=$_POST['tipo'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$sucursal=$_SESSION['sucursal'];
$usuario=$_SESSION['idtrabajador'];


//SELECCIONAMOS LOS REGISTROS DE LA TABLA DE CAJA CHICA
if($tipo=='DATA'){
   $query = pg_query("select idcajachica, concat(periodomes,' ',periodoano) as periodo, concat('S/. ',monto) as monto, concat('S/. ',saldo) as saldo, detalle, case when estado=1 then 'ABIERTO' when estado='2' then 'RENDIDO' else 'CANCELADO' end as estado from tcajachica where sucursal='1';");

   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
   }	
pg_free_result($query);
echo json_encode($data);
}


//REGISTRAMOS NUEVO PERIODO EN LA CAJA CHICA
if($tipo=='NOVO'){

$mes=$_POST['mes'];
$ano=$_POST['ano'];
$monto=$_POST['monto'];
$detalle=$_POST['detalle'];

$query = "insert into tcajachica (periodomes,periodoano,monto,saldo,estado,detalle,usuario,sucursal) values ('". $mes ."','". $ano ."','". $monto ."','". $monto ."','1','". $detalle ."','". $usuario ."','". $sucursal ."')";
pg_query($query);

$query = pg_query("select max(idcajachica) as idcajachica from tcajachica where sucursal='". $sucursal ."';");
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);
$idcajachica=$registros[idcajachica];

$query = "insert into tdetcajachica (idcajachica,trabajador,detalle,tipomov,moneda,monto,tipodoc,numerodoc,fechamov,observaciones,fechareg,horareg,usuario,sucursal) values ('". $idcajachica ."','". $usuario ."','APERTURA CAJA CHICA','I','SOL','". $monto ."','','','". $fecha ."','". $observaciones ."','". $fecha ."','". $hora ."','". $usuario ."','". $sucursal ."');";
pg_query($query);

pg_free_result($query);
echo "EL NUEVO PERIODO DE CAJA CHICA FUE REGISTRADO CORRECTAMENTE";

}


//INSERTAR MOVIMIENTO DE CAJA CHICA
if($tipo=='INSE'){

$idcajachica=$_POST['idcajachica'];
$trabajador=$_POST['trabajador'];
$detalle=strtoupper($_POST['detalle']);
$tipomov=$_POST['tipomov'];
$moneda=$_POST['moneda'];
$monto=$_POST['monto'];
$tipodoc=$_POST['documento'];
$numerodoc=$_POST['numero'];
$fechamov=$_POST['fechamov'];
$observaciones=strtoupper($_POST['observaciones']);


   if($tipomov=='E'){
      $monto=$monto*(-1);
   }

$query = "insert into tdetcajachica (idcajachica,trabajador,detalle,tipomov,moneda,monto,tipodoc,numerodoc,fechamov,observaciones,fechareg,horareg,usuario,sucursal) values ('". $idcajachica ."','". $trabajador ."','". $detalle ."','". $tipomov ."','". $moneda ."','". $monto ."','". $tipodoc ."','". $numerodoc ."','". $fechamov ."','". $observaciones ."','". $fecha ."','". $hora ."','". $usuario ."','". $sucursal ."');";
pg_query($query);

$query ="update tcajachica set saldo=saldo+". $monto ." where idcajachica='". $idcajachica ."';";
pg_query($query);

echo "EL MOVIMIENTO SE REGISTRO CORRECTAMENTE";
}


if($tipo=='MOVS'){
   $idcajachica=$_POST['idcajachica'];
   $periodo=$_POST['periodo'];

   echo'<div id="dcccmovcontenido" class="dpagina" style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h3>RESUMEN DE MOVIMIENTOS CAJA CHICA</h3></center>
      <center><h3>PERIODO: '. $periodo .'</h3></center>
      <br>
      <table class="tpagina" style="font-size:10px">
      <caption>INFORMACION DE MOVIMIENTOS</caption>
      <tr>
         <th>#</th>
         <th>TRABAJADOR</th>
         <th>DESCRIPCIÓN</th>
         <th>TIPO MOV.</th>
         <th>MONTO</th>
         <th>DOCUMENTO</th>
         <th>NUMERO</th>
         <th>FECHA</th>
      </tr>';

   $query = pg_query("select concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as trabajador, tc.detalle, case when tc.tipomov='I' then 'INGRESO' when tc.tipomov='E' then 'EGRESO' end as tipomov, tc.monto as monto, tc.tipodoc as documento, tc.numerodoc as numero, tc.fechamov as fecha from tdetcajachica as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and tc.idcajachica='". $idcajachica ."' and tc.sucursal='". $sucursal ."' order by fecha asc, horareg asc;");

   $tregistros = pg_numrows($query);
   $total=0;
   for($i=1;$i<=$tregistros;$i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo "<tr>";
         echo "<td>".$i."</td>";
         echo "<td>".$registros[trabajador]."</td>";
         echo "<td>".$registros[detalle]."</td>";
         echo "<td>".$registros[tipomov]."</td>";
         echo "<td>".$registros[monto]."</td>";
         echo "<td>".$registros[documento]."</td>";
         echo "<td>".$registros[numero]."</td>";
         echo "<td>S/.".$registros[fecha]."</td>";
      echo "</tr>";
      $total=$total+$registros[monto];
   }

   echo '<tr><td colspan="3" style="text-align:right">TOTAL:</td>
        <td colspan="2" style="text-align:right">S/. '. number_format($total,2,"."," ") .'</td>
        <td colspan="3"></td>';

   echo '</table>
      </div>
      <button id="bcccmovimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
      <button id="bcccmovcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';

}

//pg_free_result($query);
pg_close($BD_conexion);
?>