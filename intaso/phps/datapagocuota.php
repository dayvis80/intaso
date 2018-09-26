<?php 
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
     include('configuracion.php');
     $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
  }

date_default_timezone_set("America/Lima");
$tipo=$_POST['tipo'];

if($tipo=='DATA'){

  //    Select tp.idprestamo, tp.idsocio, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.descripcion, tp.monto, tp.fprestamo, tp.plazo, tp.estado, tp.nprestamo  from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and estado='EN ESPERA';
  $query = pg_query("select tp.idprestamo as n, tp.idsocio as id, concat(ts.nombres,' ',ts.apaterno,' ',ts.amaterno) as socio, tp.descripcion as descripcion, tp.monto as monto, tp.fprestamo as fprestamo, tp.plazo as plazo, tp.estado as estado, tp.nprestamo as cuenta from tprestamo as tp, tsocio as ts where tp.idsocio = ts.idsocio and estado='EN PROCESO' and aprobado='SI';");
  $tregistros = pg_numrows($query);

    for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
    }
  echo json_encode($data);
}


if($tipo=='PGC'){

$idsocio=$_POST['idsocio'];
$cuenta=$_POST['nprestamo'];
$descripcion=$_POST['descripcion'];
$monto=$_POST['monto'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];
$vcuota=$_POST['vcuota'];
$dmora=$_POST['dmora'];
$vmora=$_POST['vmora'];
$vdescuento=$_POST['vdescuento'];
$ncuota=$_POST['ncuota'];
$fechaprog=$_POST['fechaprog'];

  if(($tipotrabajador==2) or ($tipotrabajador==3) or ($tipotrabajador==4) or ($tipotrabajador==5) or ($tipotrabajador==10) or ($tipotrabajador==12)){
      //select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and ttt.idtipotrabajador='5' and tt.idtrabajador='2';
  $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='3' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
  $datos=pg_query($query);
  $tregistros = pg_numrows($datos);
  $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
  $idcaja=$registros[idcaja];

    if(($tregistros == 1) or ($tipotrabajador==12) or ($tipotrabajador==3)){

      if(($tipotrabajador==12) or ($tipotrabajador==3))
       {$idcaja=0; }

      // ----- Buscamos el ultimo número de movimiento y sumamos uno para el nuevo numero de prestamo
      $query = pg_query("select max(numeromov) as num from tmovimiento where flujomov='E' and sucursal='".$sucursal."';");
      $tregistros = pg_numrows($query);
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);

      if($registros[num]==null){
      $nmovimiento=1;
      }else{
      $nmovimiento=$registros[num]+1;
      }

     // ----- REGISTRAMOS EL MOVIMIENTO  -----//
     //insert into tmovimiento (idcaja,idtipomov,socio,cuenta,numeromov,moneda,monto,fmovimiento,hora,pago,conciliado,usuario,sucursal) values ('1','1','1','3000002','100001','SOL','20.00','2017-09-12','10:33:24','PUNTUAL','NO','1','1');
     if($dmora<=0){
     $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,ncuota,fechaprog,dmora,vmora,vdescuento,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','C','". $idsocio ."','". $cuenta . "','". $descripcion ."','E','". $nmovimiento ."','SOL','". $vcuota ."','". $fecha ."','". $hora ."','". $ncuota ."','". $fechaprog ."','". $dmora ."','". $vmora ."','". $vdescuento ."','PUNTUAL','NO','NO','" . $usuario ."','" . $sucursal . "');";
     pg_query($query);
     }else{
     $query = "insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,ncuota,fechaprog,dmora,vmora,vdescuento,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','C','". $idsocio ."','". $cuenta . "','". $descripcion ."','E','". $nmovimiento ."','SOL','". $vcuota ."','". $fecha ."','". $hora ."','". $ncuota ."','". $fechaprog ."','". $dmora ."','". $vmora ."','". $vdescuento ."','VENCIDO','NO','NO','" . $usuario ."','" . $sucursal . "');";
     pg_query($query);
     }
     
     if($tipotrabajador==12)
     {}else{
     // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
     //update tcaja set mfinal=mfinal+10 where idcaja='1';
     $query="update tcaja set mfinal=mfinal+". $vcuota ." where idcaja='" . $idcaja . "';";
     pg_query($query);
     }

     // ----- CAMBIAMOS ESTADO DE PAGO DE CUOTA  -----//
     //update tcuotas set estado='PAGADO', dmora='0', vmora='0' where ncuota='1' and nprestamo ='2000001';
     //$query="update tcuotas set estado='PAGADO', dmora='" . $dmora . "', vmora='" . $vmora . "' where ncuota='" . $ncuota . "' and nprestamo ='" . $cuenta . "';";
     $query="update tcuotas set estado='PAGADO', dmora='" . $dmora . "', vmora='" . $vmora . "', fpago='". $fecha ."' where ncuota='" . $ncuota . "' and nprestamo ='" . $cuenta . "';";
     pg_query($query);
     if($monto==0){
      $vuelto=0;
     }else{
     $vuelto=$monto-$vcuota;
     }
     $phptoajax[0]="EL PAGO DE CUOTA SE REGISTRO CORRECTAMENTE. EL VUELTO ES DE: ".$vuelto;
     $phptoajax[1]=$nmovimiento;
     $phptoajax[2]="C";
     echo json_encode($phptoajax);

    }else{
      echo '1';
    }
  }else{
    echo '2';
  }
}


//Realizamos el Pago Total del Pretamo
if($tipo=='PGTO'){

$idsocio=$_POST['idsocio'];
$cuenta=$_POST['nprestamo'];
$descripcion=$_POST['descripcion'];
$fecha = date("Y-m-d");
$hora = date("H:i:s");
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];

   if(($tipotrabajador==4) or ($tipotrabajador==5) or ($tipotrabajador==10) or ($tipotrabajador==12)){
   //Verificamos si hay caja abierta del usuario
   $query = "select tc.idcaja from tcaja as tc, ttipotrabajador as ttt, ttrabajador as tt where (ttt.idtipotrabajador='2' or ttt.idtipotrabajador='3' or ttt.idtipotrabajador='4' or ttt.idtipotrabajador='5' or ttt.idtipotrabajador='10') and tc.abierto='SI' and tc.trabajador=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tt.idtrabajador='". $trabajador ."';";
   $datos=pg_query($query);
   $tregistros = pg_num_rows($datos);
   $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
   $idcaja=$registros[idcaja];
   pg_free_result($datos);

      if($tregistros == 1){

         $query = "select nprestamo, max(DATE_PART('day', current_date::timestamp - fvencimiento::timestamp)) as diasmora from tcuotas where nprestamo='". $cuenta ."' and estado='PENDIENTE' group by nprestamo";
         $datos=pg_query($query);
         $tregistros = pg_num_rows($datos);
         $registros = pg_fetch_array($datos, null, PGSQL_ASSOC);
         $diasmora=$registros[diasmora];
         pg_free_result($datos);      

         if($diasmora<=0)
         {  
            
            pg_query("BEGIN"); //or die("Could not start transaction\n");

            
            // ----- Buscamos el ultimo número de movimiento y sumamos uno para el nuevo numero de prestamo
            $query1 = pg_query("select max(numeromov) as num from tmovimiento where flujomov='E' and sucursal='".$sucursal."';");
            $tregistros = pg_num_rows($query1);
            $registros = pg_fetch_array($query1, null, PGSQL_ASSOC);

            if($registros[num]==null){
               $nmovimiento=1;
            }else{
               $nmovimiento=$registros[num]+1;
            }
            
            //Seleccionaos todas la cuotas del Prestamo
            $qcuota = pg_query("select tc.ncuota, tc.fvencimiento, DATE_PART('day', current_date::timestamp - tc.fvencimiento::timestamp) as diasmora, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora, sum(tc.descuentom+tc.descuentoi+tc.descuentoc) as descuento from tcuotas as tc, tprestamo as tt where tc.nprestamo=tt.nprestamo and tc.estado='PENDIENTE' and tc.nprestamo='". $cuenta . "' group by tc.ncuota, tc.fvencimiento, tc.comision, tc.aporte, tc.interes, tc.amortizacion, tt.mora order by tc.ncuota;");
            $tregistros= pg_num_rows($qcuota);

            $ptotal=0;
            $vdescuento=0;
            
            for($i=1;$i<=$tregistros; $i++){
               $registros = pg_fetch_array($qcuota, null, PGSQL_ASSOC);
               // ----- CAMBIAMOS ESTADO DE PAGO DE CUOTA  -----//
               //update tcuotas set estado='PAGADO', dmora='0', vmora='0' where ncuota='1' and nprestamo ='2000001';
               $dmora=$registros[diasmora];
               $ncuota=$registros[ncuota];
               if($registros[diasmora]<=0){
                  $vmora=0;
               }else{
                  $vmora=($registros[interes]+$registros[amortizacion]+$registros[comision]+$registros[aporte])*(($registros[mora]*$registros[diasmora])/100);
                  $vmora=number_format($vmora,2,"."," ");
               }

               if($i==1){
                  $ncuotas=$registros[ncuota];
                  $fechaprog=$registros[fvencimiento];
                  $comision=$registros[comision];
                  $aporte=$registros[aporte];
                  $interes=$registros[interes];
               }else{
                  $fechaprog=$registros[fvencimiento];
                  $comision=0;
                  $aporte=0;
                  $interes=0;
               }

               // ----- ACTUALIZAMOS ESTADO DE PAGO DE LAS CUOTAS  -----//
               $query2= pg_query("update tcuotas set estado='PAGADO', interes='". $interes ."', comision='". $comision ."', aporte='". $aporte ."' ,dmora='" . $dmora . "', vmora='" . $vmora . "', fpago='". $fecha ."' where ncuota='" . $ncuota . "' and nprestamo ='" . $cuenta . "';");

               $totalcuota=$registros[amortizacion]+$interes+$aporte+$comision+$vmora-$registros[descuento];
               $totalcuota=redondear(number_format($totalcuota,2,"."," "));
               $ptotal=$ptotal+$totalcuota;
               $vdescuento=$vdescuento+$registros[descuento];
            } // Finaliza la actualización de las cuotas
            
            
            // ----- REGISTRAMOS EL MOVIMIENTO  -----//
            //insert into tmovimiento (idcaja,idtipomov,socio,cuenta,numeromov,moneda,monto,fmovimiento,hora,pago,conciliado,usuario,sucursal) values ('1','1','1','3000002','100001','SOL','20.00','2017-09-12','10:33:24','PUNTUAL','NO','1','1');
            $query3 = pg_query("insert into tmovimiento (idcaja,tipomov,socio,cuenta,descripcion,flujomov,numeromov,moneda,monto,fechamov,horamov,ncuota,fechaprog,dmora,vmora,vdescuento,pago,conciliado,anulado,usuario,sucursal) values ('" . $idcaja . "','T','". $idsocio ."','". $cuenta . "','". $descripcion ."','E','". $nmovimiento ."','SOL','". $ptotal ."','". $fecha ."','". $hora ."','". $ncuotas ."','". $fechaprog ."','". $dmora ."','". $vmora ."','". $vdescuento ."','TOTAL','NO','NO','" . $usuario ."','" . $sucursal . "');");

            // ----- ACTUALIZAMOS EL SALDO DE LA CAJA  -----//
            //update tcaja set mfinal=mfinal+10 where idcaja='1';
            $query4=pg_query("update tcaja set mfinal=mfinal+". $ptotal ." where idcaja='" . $idcaja . "';");

            // ----- ACTUALIZAMOS EL ESTADO DEL PRESTAMO A CANCELADO -----//
            //update tprestamo set estado='CANCELADO' where nprestamo='2000002' and sucursal='1'
            $query5=pg_query("update tprestamo set estado='CANCELADO' where nprestamo='". $cuenta ."' and sucursal='1';");

            if ($query1 and $qcuota and $query3 and $query4) {
               pg_query("COMMIT"); //or die("Transaction commit failed\n");
               $vuelto=$monto-$ptotal;
               $phptoajax[0]="EL PAGO DE TOTAL SE REGISTRO CORRECTAMENTE. EL VUELTO ES DE: ".$vuelto;
               $phptoajax[1]=$nmovimiento;
               $phptoajax[2]="T";
               $phptoajax[3]=$tregistros;
               echo json_encode($phptoajax);
            }else{
               pg_query("ROLLBACK"); //or die("Transaction rollback failed\n");;
               $phptoajax[0]="HUBO ERROR EN EL PAGO: NM-".$nmovimiento.'<-> Cu-'. $ncuota .'<-> Mo-' .$ptotal.'--->'.$query;
               $phptoajax[1]=$nmovimiento;
               $phptoajax[2]="T";
               echo json_encode($phptoajax);
            }
         }else{
         echo '3';
         }
      }else{
      echo '1';
      }
   }else{
      echo '2';
   }
}


// Realizamos el Descuento Mora
if($tipo=='DMCU'){

$cuenta=$_POST['nprestamo'];
$ncuota=$_POST['ncuota'];
$descuentom=$_POST['descuentom'];
$descuentoc=$_POST['descuentoc'];
$descuentoi=$_POST['descuentoi'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$trabajador=$_SESSION['idtrabajador'];
$fecha = date("Y-m-d");
$hora = date("H:i:s"); 
$usuario=$_SESSION['idtrabajador'];
$sucursal=$_SESSION['sucursal'];


  if(($tipotrabajador==2) or ($tipotrabajador==7) or ($tipotrabajador==10)){

  //ACTUALIZAMOS LOS MONTOS DE LOS DESCUENTOS DE LAS CUOTAS
  //update tcuotas set descuentom='0.10', descuentoi='0.10', descuentoc='0.10'  where nprestamo='2000004' and ncuota='8' 
  $query = "update tcuotas set descuentom='". $descuentom ."', descuentoi='". $descuentoi ."', descuentoc='". $descuentoc ."' where nprestamo='". $cuenta ."' and ncuota='". $ncuota ."';";
  $datos=pg_query($query);

     echo 'SE ACTUALIZO EL DESCUENTO DE LA CUOTA';
  }else{
     echo 'UD. NO ESTA AUTORIZADO A REALIZAR DESCUENTOS DE MORAS';
  }
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

pg_free_result($query);
pg_close($BD_conexion);
?>