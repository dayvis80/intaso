<?php 
session_start();
if(isset($_SESSION['login'])==false){
   header('Location: login.php');
}else{
   include('configuracion.php');
   include('dataprestamo.php');
   $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password);
}

$tprestamo=$_POST['tprestamo'];
$monto=$_POST['monto'];
$tem=$_POST['tem'];
$prestamo=$_POST['prestamo'];
$plazo=$_POST['plazo'];
$comision=$_POST['comision'];
$mora=$_POST['mora'];
$fpago=$_POST['fpago'];
$descfpago=$_POST['descfpago'];
$aporte=$_POST['aporte'];


$abcuotas=array();
$abcuotas=gencuotas($tprestamo,$monto,$tem,$fpago,$aporte,$plazo,$comision);
$tcuotas=count($abcuotas);

$interestotal=0;
$capitaltotal=0;
$comisiontotal=0.00;
$aportetotal=0;
$pagototal=0;
?>


<div id="dcontenedor">
<h3 class='titulocontenedor'>SIMULADOR DE CRÉDITOS</h3>
<center>
   <div id="dinfo">
      <div id="dsimcronograma" class='dpagina' style="display: block;">
      <img src="../recursos/logoian.png"/>
      <hr>
      <br>
      <center><h2>CRONOGRAMA DE PAGOS</h2></center>
      <br>
      <table class="tpagina" border="1" style="border-collapse: collapse;">
         <caption>DATOS DEL PRESTAMO</caption>
         <tr><th colspan="2">MONTO NETO:</th>
            <th colspan="3">TIPO PRESTAMO:</th>
            <th colspan="2">PLAZO:</th>
            <th colspan="2">TEA:</th>
         </tr>
         <tr>
            <td colspan="2">S/. <?php echo $monto?></td>
            <td colspan="3"><?php echo $prestamo?></td>
            <td colspan="2"><?php echo $plazo?> Meses</td>
            <td colspan="2"><?php echo number_format((((pow((1+$tem/100),12))-1)*100),4,",",".");?> %</td>
         </tr>
         <tr><th colspan="2">TEM:</th>
            <th colspan="3">INTERES MORATORIO:</th>
            <th colspan="2">TIPO PAGO:</th>
            <th colspan="2">APORTE x CUOTA:</th>
         </tr>
         <tr>
            <td colspan="2"><?php echo $tem?> %</td>
            <td colspan="3"><?php echo $mora?> % x Día</td>
            <td colspan="2">CUOTA FIJA</td>
            <td colspan="2">S/. <?php echo $aporte?></td>
         </tr>
         <tr><th colspan="2">FECHA DE PRESTAMO:</th>
            <th colspan="3">FRECUENCIA DE PAGO:</th>
            <th colspan="4">ANALISTA:</th>
         </tr>
         <tr>
            <td colspan="2"><?php echo date("d-m-Y") ?></td>
            <td colspan="3"><?php echo $descfpago?></td>
            <td colspan="4"></td>
         </tr>

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
         <?php
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
            echo "<td style='align-text:left;'>"."S/. ".$abcuotas[$i][3]."</td>";
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
                  </tr>';
         ?>
      </table>
      </div>
   <button id="bscimprimir" class="bsistema"><img src="../recursos/bimprimir.png"/><span>IMPRIMIR</span></button>
   <br>
   </div>
</div>

<?php
pg_free_result($query);
pg_close($BD_conexion);
?>