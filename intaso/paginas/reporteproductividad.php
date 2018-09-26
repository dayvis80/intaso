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
<h3 class='titulocontenedor'>REPORTES - PRODUCTIVIDAD</h3>
<center>
   <div id="dinfo"> 
   <?php
   if (!$_POST){
      flujo();
   }else{
      flujo();
      detalle();
   }
   ?>
   </div>
</center>
</div> 


<?php
function flujo(){
?>
<table class="tpinfo" style="width: 840px; padding:10px;">
   <tr><td rowspan="2"><h3>INGRESAR DATOS</h3></td>
      <td>FECHA INICIO:</td>
      <td><input type="date" id="arprofinicio" class="textom"></td>
      <td>ANALISTA:</td>

      <td colspan="2"><select name="arprorecaudador" id="arprorecaudador" class="opciong">
         <option value='0'>TODOS</option>
      <?php
         $sucursal=$_SESSION['sucursal'];
         $query = pg_query("select idtrabajador, concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador as trabajador where (tipotrabajador=3 or tipotrabajador=12) and sucursal='". $sucursal ."' order by apaterno, amaterno, nombres");
         $tregistros = pg_numrows($query);
         for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo "<option value='".$registros[idtrabajador]."'>".$registros[trabajador]."</option>";
         }
      ?></select></td>
   </tr>
   <tr>
      <td>FECHA FIN:</td>
      <td><input type="date" id="arproffin" class="textom"></td>            
      <td colspan="2" style="text-align:center;"><button id="brprogenerar" class="bsistema"><img src="../recursos/bflujo.png"/><span>GENERAR</span></button></td>
   </tr>
</table>
<?php  
}
?>

<?php
function detalle(){
$finicio=$_POST['finicio'];
$ffin=$_POST['ffin'];
$idrecaudador=$_POST['idrecaudador'];
$recaudador=$_POST['recaudador'];
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$sucursal=$_SESSION['sucursal'];
?>
<div id="drproproductividad" class="dpagina" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<?php
if($idrecaudador!=0){
?>
   <br>
   <center><h2>PRODUCCION X ANALISTA: <?php echo $recaudador;?></h2></center>
   <center>DEL: <?php echo $finicio;?> AL: <?php echo $ffin;?> </center>
   <br>
   <?php
   // OBTENEMOS LOS PRESTAMOS POR PROMOTOR
   $query = pg_query("select tp.fprestamo, tp.nprestamo, tp.descripcion, tp.plazo, tp.tea, tp.tem, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.monto, tp.estado from tprestamo as tp, tsocio as ts, ttrabajador as tt, ttipotrabajador as ttt
   where tp.idsocio=ts.idsocio and tp.estado<>'EN ESPERA' and tp.usuario=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tp.analista='". $idrecaudador ."' and tp.fprestamo between '". $finicio ."' and '". $ffin ."' and tp.sucursal='". $sucursal ."'
   order by tp.fprestamo");
   $tregistros = pg_num_rows($query);
   $totali=0;
   ?>
   <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
   <caption>LISTADO DE PRESTAMOS</caption>
   <tr>
      <th>N°</th>
      <th>FECHA</th>
      <th>PRESTAMO</th>
      <th>DESCRIPCIÓN</th>
      <th>PLAZO</th>
      <th>TEA</th>
      <th>TEM</th>
      <th>SOCIO</th>
      <th>MONTO</th>
      <th>ESTADO</th>
   </tr>
   <?php
      for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         echo '<tr>
            <td>'. $i.'</td>
            <td>'.$registros[fprestamo].'</td>
            <td>'.$registros[nprestamo].'</td>
            <td>'.$registros[descripcion].'</td>
            <td>'.$registros[plazo].'</td>
            <td>'.$registros[tea].'%</td>
            <td>'. $registros[tem].'%</td>
            <td>'.$registros[socio].'</td>
            <td> S/.'.$registros[monto].'</td>
            <td>'.$registros[estado].'</td>
            </tr>';
         $totali=$totali+$registros[monto];
         }
   ?>
   <tr>
      <td colspan="8">TOTAL</td>
      <td colspan="2">S/. <?php echo $totali;?></td>
   </tr>
   </table>
<?php
}else{
?>
   <br>
   <center><h2>PRODUCCION X ANALISTA: <?php echo $recaudador;?></h2></center>
   <center>DEL: <?php echo $finicio;?> AL: <?php echo $ffin;?> </center>
   <br>
   <?php
   //OBTENEMOS TODOS LOS PROMOTORES
   $queryp = pg_query("select idtrabajador, concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador as trabajador where (tipotrabajador=3 or tipotrabajador=12) and sucursal='". $sucursal ."' order by apaterno, amaterno, nombres");
   $tregistrosp = pg_num_rows($queryp);
   for($i=1;$i<=$tregistrosp; $i++){
      $registrosp = pg_fetch_array($queryp, null, PGSQL_ASSOC);
      $idrecaudador=$registrosp['idtrabajador'];
      $recaudador=$registrosp['trabajador'];

      // OBTENEMOS LOS PRESTAMOS POR PROMOTOR
      $query = pg_query("select tp.fprestamo, tp.nprestamo, tp.descripcion, tp.plazo, tp.tea, tp.tem, concat(ts.apaterno,' ',ts.amaterno,' ',ts.nombres) as socio, tp.monto, tp.estado from tprestamo as tp, tsocio as ts, ttrabajador as tt, ttipotrabajador as ttt
      where tp.idsocio=ts.idsocio and tp.estado<>'EN ESPERA' and tp.usuario=tt.idtrabajador and tt.tipotrabajador=ttt.idtipotrabajador and tp.recaudador='". $idrecaudador ."' and tp.fprestamo between '". $finicio ."' and '". $ffin ."' and tp.sucursal='". $sucursal ."'
      order by tp.fprestamo");
      $tregistros = pg_num_rows($query);
      $totali=0;
   ?>   
      <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
      <caption>ANALISTA: <?php echo $recaudador; ?></caption>
      <tr>
         <th>N°</th>
         <th>FECHA</th>
         <th>PRESTAMO</th>
         <th>DESCRIPCIÓN</th>
         <th>PLAZO</th>
         <th>TEA</th>
         <th>TEM</th>
         <th>SOCIO</th>
         <th>MONTO</th>
         <th>ESTADO</th>
      </tr>
      <?php
         for($j=1;$j<=$tregistros; $j++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo '<tr>
               <td>'. $j.'</td>
               <td>'.$registros[fprestamo].'</td>
               <td>'.$registros[nprestamo].'</td>
               <td>'.$registros[descripcion].'</td>
               <td>'.$registros[plazo].'</td>
               <td>'.$registros[tea].'%</td>
               <td>'. $registros[tem].'%</td>
               <td>'.$registros[socio].'</td>
               <td> S/.'.$registros[monto].'</td>
               <td>'.$registros[estado].'</td>
               </tr>';
            $totali=$totali+$registros[monto];
         }
      ?>
      <tr>
         <td colspan="8">TOTAL</td>
         <td colspan="2">S/. <?php echo $totali;?></td>
      </tr>
      </table><br>
   <?php
   }// fin del For
}
?>
</div>
<center>
<button id="brpropimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
</center><br>
<?php  
}
?>

<?php
  pg_free_result($query);
  pg_close($BD_conexion);

?>