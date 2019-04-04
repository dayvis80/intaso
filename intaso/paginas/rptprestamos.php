<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
      $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>REPORTE - REPORTE DE PRESTAMOS</h3>
<center>
   <div id="dinfo"> 
   <?php
   if (!$_POST){
      flujo();
   }else{
      flujo();
      reporte();
   }
   ?>
   </div>
</center>
</div> 


<?php
function flujo(){
?>
<table class="tpinfo" style="width: 840px; padding:10px;">
   <tr><td><h3>ELEGIR REPORTE</h3></td>
      <td>POR:</td>
      <td><select class="opcion mediano">
         <option>ESTADO</option>
         <option>ESTADO</option>
         <option>ANALISTA</option>
      </select></td>
      <td><button id="brrpmostrar" class="bsistema"><img src="../recursos/breporte.png"/><span>REPORTE</span></button></td>
   </tr>
</table>
<?php  
}
?>


<?php
function detalle(){
$fecha=$_POST['fecha'];
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$tipotrabajador=$_SESSION['tipotrabajador'];
?>
<div id="dfxcdetalle" class="dpagina" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<br>
<center><h2>FLUJO X CAJEROS</h2></center>
<br>
   <table class="tpagina" border="1" style="border-collapse: collapse;">
   <caption>RESUMEN DE COBROS X CAJEROS</caption>
   <tr>
      <td colspan="2"></td>
      <tH>FECHA:</tH>
      <td><?php echo $fecha; ?></td>
   </tr>
   <tr>
      <td colspan="2" class="caption">INGRESOS</td>
      <td colspan="2" class="caption">EGRESOS</td>      
   </tr>
   <tr style="vertical-align: top;">
      <td colspan="2">
      <?php
          // OBTENEMOS LOS DATOS DE LOS INGRESOS COBRADOS POR LOS RECAUDADORES
          $query = pg_query("select concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador, tm.cantidad, tm.monto from ttrabajador as tt LEFT JOIN (select usuario, count(*) as cantidad, sum(monto) as monto from tmovimiento as tm where tm.fechamov='". $fecha ."' and tm.flujomov='E' and tm.anulado='NO' group by usuario) tm on tt.idtrabajador = tm.usuario where (tt.tipotrabajador=12 or tt.tipotrabajador=5 or tt.tipotrabajador=3) order by trabajador;");
          $tregistros = pg_numrows($query);
          $totali=0;
      ?>
         <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
         <tr>
            <th>N°</th>
            <th>TRABAJADOR</th>
            <th>MOV.</th>
            <th> TOTAL </th>
         </tr>
      <?php
         for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            if($registros[cantidad]==""){$cantidad=0;}else{$cantidad=$registros[cantidad];}
            if($registros[monto]==""){$monto=0;}else{$monto=$registros[monto];}
            echo '<tr>
               <td>'. $i.'</td>
               <td>'. $registros[trabajador].'</td>
               <td>'.$cantidad.'</td>
               <td>S/. '.$monto.'</td>
               </tr>';
            $totali=$totali+$registros[monto];
         }
      ?>
         <tr>
            <td colspan="3">TOTAL</td>
            <td>S/. <?php echo $totali;?></td>
         </tr>
         </table>
      </td>
      <td colspan="2">
      <?php
          // OBTENEMOS LOS DATOS DE LOS EGRESOS
         $query = pg_query("select concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador, tm.cantidad, tm.monto from ttrabajador as tt LEFT JOIN (select usuario, count(*) as cantidad, sum(monto) as monto from tmovimiento as tm where tm.fechamov='". $fecha ."' and tm.flujomov='S' and tm.anulado='NO' group by usuario) tm on tt.idtrabajador = tm.usuario where (tt.tipotrabajador=12 or tt.tipotrabajador=5 or tt.tipotrabajador=3) order by trabajador;");
         $tregistros = pg_numrows($query);
         $totale=0;
      ?>
         <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
         <tr>
            <th>N°</th>
            <th>TRABAJADOR</th>
            <th>MOV.</th>
            <th>TOTAL</th>
         </tr>
      <?php
         for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            if($registros[cantidad]==""){$cantidad=0;}else{$cantidad=$registros[cantidad];}
            echo '<tr>
               <td>'. $i.'</td>
               <td>'. $registros[trabajador].'</td>
               <td>'. $cantidad.'</td>
               <td>S/. '. $registros[monto]*(-1).'</td>
               </tr>';
            $totale=$totale+$registros[monto]*(-1);
         }
      ?>
         <tr>
            <td colspan="3">TOTAL</td>
            <td>S/. <?php echo $totale; ?></td>
         </tr>
         </table>
      </td>
    </tr>
    <tr>
       <td colspan="4">
          <center>
          <table border="1" style="border-collapse: collapse;">
          <tr>
             <td>TOTAL INGRESOS:</td>
             <td>S/. <?php echo $totali;?></td>
          </tr>
          <tr>
             <td>TOTAL EGRESOS:</td>
             <td>S/. <?php echo $totale;?></td>
          </tr>
          <tr>
             <td>SALDO:</td>
             <td>S/. <?php echo $totali-$totale; ?></td>
          </tr>
          </table>
          </center>
       </td>
    </tr>
    </table>
</div>
<center>
<button id="bfxcimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
</center><br>
<?php  
}
?>


<?php
  pg_free_result($query);
  pg_close($BD_conexion);

//SENTENCIA CORRECTA PARA QUE APAREZCA TODOS LOS RECAUDADORES
//select concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador, (select count(*) from tmovimiento as tm where tt.idtrabajador = tm.usuario and tm.fechamov='2018-08-01' and tm.idcaja='0' and (tm.tipomov='D' or tm.tipomov='H' or tm.tipomov='C' or tm.tipomov='A')) as cantidad, (select sum(monto) from tmovimiento as tm where tt.idtrabajador = tm.usuario and tm.fechamov='2018-08-01' and tm.idcaja='0' and (tm.tipomov='D' or tm.tipomov='H' or tm.tipomov='C' or tm.tipomov='A')) as monto from ttrabajador as tt where tt.tipotrabajador=12 or tt.tipotrabajador=5 or tt.tipotrabajador=2;

//SENTENCIA CON INNER JOIN
//select concat(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador, tm.cantidad, tm.monto from ttrabajador as tt LEFT JOIN (select usuario, count(*) as cantidad, sum(monto) as monto from tmovimiento as tm where tm.fechamov='2018-08-01' and tm.idcaja='0' and (tm.tipomov='D' or tm.tipomov='H' or tm.tipomov='C' or tm.tipomov='A') group by usuario) tm on tt.idtrabajador = tm.usuario where tt.tipotrabajador=12 or tt.tipotrabajador=5 or tt.tipotrabajador=2;
?>