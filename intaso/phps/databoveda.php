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
   $query = pg_query("select tc.idcaja, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as cajero, tc.trabajador as trabajador, tc.fapertura as fecha, concat('S/. ',tc.mfinal) as efectivo, tc.abierto from tcaja as tc, ttrabajador as tt where tc.trabajador=tt.idtrabajador and EXISTS (select trabajador, max(fapertura) from tcaja where sucursal='". $sucursal ."' group by trabajador having trabajador = tc.trabajador and tc.sucursal='". $sucursal ."' and max(fapertura) = tc.fapertura)");

   $tregistros = pg_numrows($query);
   for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
   }	
pg_free_result($query);
echo json_encode($data);
}


//REGISTRAMOS NUEVO MOVIMIENTO DE LA BOVEDA
if($tipo=='HABI'){

$idboveda=$_POST['idboveda'];
$idcaja=$_POST['idcaja'];
$tipomov=$_POST['tipomov'];
$monto=$_POST['monto'];

//select efectivo from tboveda where idboveda='1' and sucursal='1';
$query = pg_query("select efectivo from tboveda where idboveda='". $idboveda ."' and sucursal='". $sucursal ."';");
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);
$efectivo=$registros[efectivo];
if($tipomov=='HA'){
   $monto=$monto*(-1);
}
$efectivo=$efectivo+$monto;

$query = "insert into tdetboveda (idboveda, idcaja, tipomov, monto, saldo, fecha, hora, usuario, sucursal) values ('". $idboveda ."','". $idcaja ."','". $tipomov ."','". $monto ."','". $efectivo ."','". $fecha ."','". $hora ."','". $usuario ."','". $sucursal ."');";
pg_query($query);

$query = "update tboveda set efectivo='". $efectivo ."' where idboveda='". $idboveda ."' and sucursal='". $sucursal ."';";
pg_query($query);

//insert into tmovimiento (idcaja, tipomov, socio, descripcion, numeromov, moneda, monto, flujomov, fechamov, horamov, pago, conciliado, usuario, sucursal) values ('','','','HABILITACION DE EFECTIVO','0','SOL','','E','','','OK','NO','','');
if($tipomov=='HA'){
   $monto=$monto*(-1);
   $query = "update tcaja set mfinal=mfinal+'". $monto ."' where idcaja='". $idcaja ."' and sucursal='". $sucursal ."';";
   pg_query($query);
   $query = "insert into tmovimiento (idcaja, tipomov, socio, descripcion, numeromov, moneda, monto, flujomov, anulado, fechamov, horamov, pago, conciliado, usuario, sucursal) values ('". $idcaja ."','". $tipomov ."','". $usuario ."','HABILITACION DE EFECTIVO','0','SOL','". $monto ."','E','NO','". $fecha ."','". $hora ."','OK','NO','". $usuario ."','". $sucursal ."');";
   pg_query($query);
}else{
   $query = "update tcaja set mfinal=mfinal-'". $monto ."' where idcaja='". $idcaja ."' and sucursal='". $sucursal ."';";
   pg_query($query);
   $query = "insert into tmovimiento (idcaja, tipomov, socio, descripcion, numeromov, moneda, monto, flujomov, anulado, fechamov, horamov, pago, conciliado, usuario, sucursal) values ('". $idcaja ."','". $tipomov ."','". $usuario ."','HABILITACION DE EFECTIVO','0','SOL','". $monto ."','S','NO','". $fecha ."','". $hora ."','OK','NO','". $usuario ."','". $sucursal ."');";
   pg_query($query);
}

pg_free_result($query);
echo "EL MOVIMIENTO SE REALIZO CORRECTAMENTE" . $idboveda . '-' .$idcaja. '-' . $tipomov . '-' . $monto;

}


//Mostramos el Historial de Movimientos de la Boveda
if($tipo=='MOVS'){
   $idboveda=$_POST['idboveda'];
   //$periodo=$_POST['periodo'];

   echo'<div id="dcbmovcontenido" class="dpagina" style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h3>HISTORIAL DE MOVIMIENTOS BOVEDA</h3></center>
      <br>
      <table class="tpagina" style="font-size:10px">
      <caption>INFORMACION DE MOVIMIENTOS</caption>
      <tr>
         <th>#</th>
         <th>CAJERO</th>
         <th>FECHA CAJA</th>
         <th>MOVIMIENTO</th>
         <th>REGISTRADO</th>
         <th>MONTO</th>
         <th>SALDO</th>
         <th>USUARIO</th>
      </tr>';

   $query = pg_query("select concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as trabajador, tc.fapertura as fcaja, case when td.tipomov='HA' then 'HABILITAR' when td.tipomov='RE' then 'RECAUDAR' end as tipomov, concat(td.fecha,' ',td.hora) as fechamov, td.monto as monto, td.saldo as saldo, tt.usuario as usuario from tdetboveda as td, tcaja as tc, ttrabajador as tt where td.idcaja=tc.idcaja and td.usuario=tt.idtrabajador and td.idboveda='1' and td.sucursal='". $sucursal ."' order by fecha;");

   $tregistros = pg_numrows($query);
   $total=0;
   for($i=1;$i<=$tregistros;$i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo "<tr>";
         echo "<td>".$i."</td>";
         echo "<td>".$registros[trabajador]."</td>";
         echo "<td>".$registros[fcaja]."</td>";
         echo "<td>".$registros[tipomov]."</td>";
         echo "<td>".$registros[fechamov]."</td>";
         echo "<td>S/. ".number_format($registros[monto],2,"."," ")."</td>";
         echo "<td>S/. ".$registros[saldo]."</td>";
         echo "<td>".$registros[usuario]."</td>";
      echo "</tr>";
      $total=$total+$registros[monto];
   }

   echo '<tr><td colspan="4" style="text-align:right">TOTAL:</td>
        <td colspan="2" style="text-align:right">S/. '. number_format($total,2,"."," ") .'</td>
        <td colspan="2"></td>';

   echo '</table>
      </div>
      <button id="bcbovmovimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
      <button id="bcbovmovcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>';

}

//pg_free_result($query);
pg_close($BD_conexion);
?>