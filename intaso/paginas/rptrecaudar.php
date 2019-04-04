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
<h3 class='titulocontenedor'>REPORTES - RECAUDACIÓN POR PROMOTOR</h3>
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
      <td>PERIODO:</td>
      <td><select id="arrecperiodo" class="opcion mediano">
         <option value="1">ENERO</option>
         <option value="2">FEBRERO</option>
         <option value="3">MARZO</option>
         <option value="4">ABRIL</option>
         <option value="5">MAYO</option>
         <option value="6">JUNIO</option>
         <option value="7">JULIO</option>
         <option value="8">AGOSTO</option>
         <option value="9">SEPTIEMBRE</option>
         <option value="10">OCTUBRE</option>
         <option value="11">NOVIEMBRE</option>
         <option value="12">DICIEMBRE</option>
      </select></td>
      <td>PROMOTOR:</td>

      <td colspan="2"><select id="arrecpromotor" class="opciong">
         <option value='0'>TODOS</option>
      <?php
         $sucursal=$_SESSION['sucursal'];
         $query = pg_query("select idtrabajador, concat(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador as trabajador where tipotrabajador=12 and sucursal='1' order by apaterno, amaterno, nombres");
         $tregistros = pg_numrows($query);
         for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo "<option value='".$registros[idtrabajador]."'>".$registros[trabajador]."</option>";
         }
      ?></select></td>
   </tr>
   <tr>
      <td>AÑO:</td>
      <td><select id="arrecano" class="opcion mediano">
         <option value='2019'>2019</option>
         <option value='2018'>2018</option>
      </select></td>
      <td colspan="2" style="text-align:center;"><button id="brrecmostrar" class="bsistema"><img src="../recursos/bflujo.png"/><span>MOSTRAR</span></button></td>
   </tr>
</table>
<?php  
}
?>

<?php
function detalle(){
$periodo=$_POST['periodo'];
$ano=$_POST['ano'];
$idrecaudador=$_POST['idrecaudador'];
$recaudador=$_POST['recaudador'];
$trabajador=$_SESSION['trabajador'];
$idtrabajador=$_SESSION['idtrabajador'];
$tipotrabajador=$_SESSION['tipotrabajador'];
$sucursal=$_SESSION['sucursal'];

   $month = $periodo;//date('m');
   $year = $ano;//date('Y');
   $dias = array('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');
   // Calcula el Primer dia del mes recibido
   $pdia=date('Y-m-d', mktime(0,0,0, $month, 1, $year));
   // Calcula el umtimo dia del mes recibido
   $day = date("d", mktime(0,0,0, $month+1, 0, $year));
   $udia=date('Y-m-d', mktime(0,0,0, $month, $day, $year));
?>
<div id="drrecrecaudar" class="dpagina" style="display: none;">
<img src="../recursos/logoian.png"/>
<hr>
<?php
if($idrecaudador!=0){
?>
   <br>
   <center><h2>RECAUDACIÓN X PROMOTOR: <?php echo $recaudador;?></h2></center>
   <center>DEL: <?php echo $pdia;?> AL: <?php echo $udia;?> </center>
   <br>
   <?php
   // OBTENEMOS LOS PRESTAMOS POR PROMOTOR
   $query = pg_query("select tr.idpromotor, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as promotor, tr.cmovimientos, tr.total,tr.fcobro, tr.frecaudacion, tr.hrecaudacion 
from trecaudar as tr, ttrabajador as tt where tr.idpromotor=tt.idtrabajador and tr.fcobro  between '".$pdia."' and '".$udia."' and idpromotor='".$idrecaudador."' and tr.sucursal='1' order by tr.fcobro");
   $tregistros = pg_num_rows($query);
   $totali=0;
   $totalm=0;
   ?>
   <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
   <caption>LISTADO DE PRESTAMOS</caption>
   <tr>
      <th>N°</th>
      <th>F. COBRO</th>
      <th>DIA</th>
      <th>MOVIMIENTOS</th>
      <th>TOTAL</th>
      <th>F. RECAUDACION</th>
      <th>H. RECAUDACION</th>
   </tr>
   <?php
      for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
         echo '<tr>
            <td>'. $i.'</td>
            <td>'.$registros[fcobro].'</td>
            <td>'.$dias[date("w",strtotime($registros[fcobro]))].'</td>
            <td>'.$registros[cmovimientos].'</td>
            <td>S/. '.number_format($registros[total],2,"."," ").'</td>
            <td>'.$registros[frecaudacion].'</td>
            <td>'. $registros[hrecaudacion].'</td>
            </tr>';
         $totali=$totali+$registros[total];
         $totalm=$totalm+$registros[cmovimientos];
         }
   ?>
   <tr>
      <td colspan="3">TOTAL</td>
      <td colspan="1"><?php echo $totalm;?></td>
      <td colspan="3">S/. <?php echo number_format($totali,2,"."," ");?></td>
   </tr>
   </table>
<?php
}else{
?>
   <br>
   <center><h2>PRODUCCION X TODOS LOS PROMOTORES</h2></center>
   <center>DEL: <?php echo $pdia;?> AL: <?php echo $udia;?> </center>
   <br>
   <?php
   //OBTENEMOS TODOS LOS PROMOTORES
   $queryp = pg_query("select distinct tr.idpromotor, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as promotor  from trecaudar as tr, ttrabajador as tt where tr.idpromotor=tt.idtrabajador and fcobro between '".$pdia."' and '".$udia."' order by promotor");
   $tregistrosp = pg_num_rows($queryp);
   for($i=1;$i<=$tregistrosp; $i++){
      $registrosp = pg_fetch_array($queryp, null, PGSQL_ASSOC);
      $idpromotor=$registrosp['idpromotor'];
      $promotor=$registrosp['promotor'];

      // OBTENEMOS LO RECAUDADO POR PROMOTOR
      $query = pg_query("select tr.idpromotor, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as promotor, tr.cmovimientos, tr.total,tr.fcobro, tr.frecaudacion, tr.hrecaudacion 
from trecaudar as tr, ttrabajador as tt where tr.idpromotor=tt.idtrabajador and tr.fcobro  between '".$pdia."' and '".$udia."' and idpromotor='".$idpromotor."' and tr.sucursal='1' order by tr.frecaudacion");
      $tregistros = pg_num_rows($query);
      $totali=0;
      $totalm=0;      
   ?>   
      <table class="tpagina" border="1" style="border-collapse: collapse; font-size:11px;">
      <caption>PROMOTOR: <?php echo $promotor; ?></caption>
      <tr>
       <th>N°</th>
      <th>F. COBRO</th>
      <th>DIA</th>
      <th>MOVIMIENTOS</th>
      <th>TOTAL</th>
      <th>F. RECAUDACION</th>
      <th>H. RECAUDACION</th>
      </tr>
      <?php
         for($j=1;$j<=$tregistros; $j++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo '<tr>
               <td>'. $j.'</td>
               <td>'.$registros[fcobro].'</td>
               <td>'.$dias[date("w",strtotime($registros[fcobro]))].'</td>
               <td>'.$registros[cmovimientos].'</td>
               <td>S/. '.number_format($registros[total],2,"."," ").'</td>
               <td>'.$registros[frecaudacion].'</td>
               <td>'. $registros[hrecaudacion].'</td>
               </tr>';
            $totali=$totali+$registros[total];
            $totalm=$totalm+$registros[cmovimientos];                     
         }
      ?>
      <tr>
         <td colspan="3">TOTAL</td>
         <td colspan="1"><?php echo $totalm;?></td>
         <td colspan="3">S/. <?php echo number_format($totali,2,"."," ");?></td>
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