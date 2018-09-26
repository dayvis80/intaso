<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
    $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>NUEVO PRESTAMO</h3>
<center>
   <div id="dinfo"> 
      <?php
      if (!$_POST){ 
         prestamo();
      }else{ 
         prestamo();
         previo();
      } 
      ?> 
   </div>
</center>
</div> 


<?php
function prestamo(){
?>
   <table class="tpinfo" id="tpsocio" style="width: 840px;">
   <tr><td colspan="2"><h2>INFORMACIÓN DEL SOCIO<h2></td>
      <td>DNI SOCIO:</td>
      <td><input type="text" name="apndni" id="apndni" class="textop"></td>
      <td><button id="bpnbuscarsocio" class="bsistema"><img src="../recursos/socio.png"/><span>BUSCAR</span></button></td>
   </tr>
   <tr><td colspan="2">NOMBRE</td>
      <td colspan="2">DIRECCIÓN</td>
      <td>TIPO</td>
   </tr>
   <tr class="separar"><td colspan="2"><input type="text" name="apnsocio" id="apnsocio" class="textog"></td>
      <td colspan="2"><input type="text" name="apndireccion" id="apndireccion" class="textog"></td>
      <td><input type="text" name="apntipo" id="apntipo" class="textop">
      <input type="text" name="apnidsocio" id="apnidsocio" class="textop" style="display: none;"></td>
   </tr>
   </table>

   <table class="tpinfo" id="tpprestamo" style="width: 840px;">
   <tr class="separar">
      <td colspan="2"><h2>INFORMACIÓN DE PRESTAMO</h2></td>
      <td><select name="apntipoprestamo" id="apntipoprestamo" class="opcionm">
      <?php
         $query = pg_query("select idtipoprestamo, descripcion, plazo, tem, moneda, comision, mora, montomin, montomax from ttipoprestamo;");
         $tregistros = pg_numrows($query);
         for($i=1;$i<=$tregistros; $i++){
         $registros = pg_fetch_array($query, null, PGSQL_ASSOC);      
         $valores=$registros[idtipoprestamo].'&'.$registros[descripcion].'&'.$registros[plazo].'&'.$registros[tem].'&'.$registros[moneda].'&'.$registros[comision].'&'.$registros[mora].'&'.$registros[montomin].'&'.$registros[montomax];
         echo "<option value='".$valores."'>".$registros[descripcion]." ".$registros[plazo]."</option>";
         }
      ?>
      </select></td>
      <td><button id="bpngenerar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>GENERAR</span></button></td>
   </tr>
   <tr>
      <td>TEM %</td>
      <td>PLAZO EN MESES</td>
      <td>COMSION %</td>
      <td>MORA %</td>
   </tr>
   <tr><td><input type="text" name="apntem" id="apntem" class="textop"></td>
      <td><input type="text" name="apnplazo" id="apnplazo" class="textop"></td>
      <td><input type="text" name="apncomision" id="apncomision" class="textop"></td>
      <td><input type="text" name="apnmora" id="apnmora" class="textop"></td>
   </tr>
   <tr>
      <td>MONTO: S/.</td>
      <td>FREC. PAGO</td>
      <td>APORTE: S/.</td>
      <td>CONDICIÓN</td>
   </tr>

   <tr>
      <td><input type="text" name="apnmonto" id="apnmonto" class="textop"></td>
      <td><select name="apnfecpago" id="apnfecpago" class="opcionm">
         <option value="1">LUNES A VIERNES</option>
         <option value="2">LUNES A SABÁDO</option>
         <option value="3">SEMANAL</option>
         <option value="4">QUINCENAL</option>
         <option value="5">MENSUAL</option>
      </select></td>
      <td><input type="text" name="apnaporte" id="apnaporte" class="textop" value="0.40"></td>
      <td><select name="apncondicion" id="apncondicion" class="opcionm">
         <option value="1">NUEVO</option>
         <option value="2">RECURRENTE C/S</option>
         <option value="3">RECURRENTE S/S</option>
         <option value="4">PARALELO</option>
      </select></td>  
   </tr>

   <tr>
      <td colspan="2">ANALISTA:</td>
      <td colspan="2">RECAUDADOR:</td>
   </tr>

   <tr>
      <td colspan="2"><select name="apnanalista" id="apnanalista" class="opciong">
         <?php
            $query = pg_query("select idtrabajador as analista, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
               $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
               echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
            }
         ?>
      </select></td>
      <td colspan="2"><select name="apnrecaudador" id="apnrecaudador" class="opciong">
         <?php
            $query = pg_query("select idtrabajador as analista, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
               $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
               echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
            }
         ?>
      </select></td>
   </tr>
   </table>
<?php  
}
?>


<?php
function previo(){

$idsocio=$_POST['idsocio'];
$dni=$_POST['dni'];
$socio=$_POST['socio'];
$tipo=$_POST['tipo'];
$tprestamo=$_POST['tprestamo'];
$plazo=$_POST['plazo'];
$comision=$_POST['comision'];
$mora=$_POST['mora'];
$monto=$_POST['monto'];
$tem=$_POST['tem'];
$fecpago=$_POST['fecpago'];  // 1 - 2 = 27 --- 3 = 4 --- 4 = 2 --- 5 = 1
$aporte=$_POST['aporte'];
$condicion=$_POST['condicion'];
$analista=$_POST['analista'];
$recaudador=$_POST['recaudador'];
$date = date("d-m-Y");

$tea=number_format((((pow((1+$tem/100),12))-1)*100),4,",",".");

$query = pg_query("select max(idprestamo) as num from tprestamo;");
$tregistros = pg_numrows($query);
$registros = pg_fetch_array($query, null, PGSQL_ASSOC);

if($registros[num]==null){
  $nprestamo=20000001;
}else{
  $nprestamo=$registros[num]+20000001;
}

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

//Calcular el Total de cuotas
$tcuotas=$ncuotas*$plazo;

//Calcular el interes mensual
if(($fecpago==1)||($fecpago==2))
{
  $interes=($tem/100)/($ncuotas+1);
}else{
   $interes=($tem/100)/$ncuotas;
}

// Calcular el Costo de la comision
$costocomision= ((($comision/100)*$monto)/$ncuotas);


//Calcular la Cuota Mensual
$cuota=($monto*$interes*(pow((1+$interes),$ncuotas*$plazo)))/((pow((1+$interes),($ncuotas*$plazo)))-1);
$cuotaf=number_format(($cuota+$costocomision+$aporte),2,"."," ");
?>

<div id="dcuotas" class='dpagina' style="display: block;">
   <img src="../recursos/logoian.png"/>
   <hr>
   <br>
   <center><h2>HOJA INFORMATIVA DEL PRESTAMO</h2></center>
   <br>

   <table class="tpagina">
   <tr>
      <caption>DATOS DEL SOCIO:</caption>     
   </tr>
   <tr>
      <th>CODIGO</th>
      <th>DNI</th>
      <th>NOMBRES</th>
      <th>TIPO</th>         
   </tr>
   <tr class="separar">
      <td><?php echo $idsocio+10000000;?></td>
      <td><?php echo $dni;?></td>
      <td><?php echo $socio;?></td>
      <td><?php echo $tipo;?></td>    
   </tr>
   <tr>
      <th colspan="4" class='caption'>DATOS DEL PRESTAMO:</th>
   </tr>
   <tr>
      <th>N° PRESTAMO:</th>
      <th>TIPO PRESTAMO:</th>
      <th>N° CUOTAS:</th>
      <th>CUOTA FINAL:</th>
   </tr> 
   <tr>
      <td><?php echo $nprestamo;?></td>
      <td><?php echo $tprestamo;?></td>
      <td><?php echo $tcuotas;?></td>
      <td>S/. <?php echo $cuotaf;?></td>
   </tr>
   <tr>
      <th>MONTO NETO:</th>
      <th>PLAZO:</th>
      <th>COMISIÓN:</th>
      <th>APORTE X CUOTA:</th>
   </tr>
   <tr>
      <td>S/. <?php echo $monto;?></td>
      <td><?php echo $plazo;?> MESES</td>
      <td><?php echo $comision;?> %</td>
      <td>S/. <?php echo $aporte;?></td>
   </tr>
   <tr>
      <th>TEA:</th>
      <th>TEM:</th>
      <th>INTERES MORATORIO:</th>
      <th>TIPO PAGO:</th>
   </tr>
   <tr>
      <td><?php echo $tea;?> %</td>
      <td><?php echo $tem;?> %</td>
      <td><?php echo $mora;?></td>
      <td>CUOTA FIJA</td>
   </tr>
   <tr>
      <th>FECHA DE PRESTAMO:</th>
      <th>FRECUENCIA DE PAGO:</th>
      <th>CONDICIÓN:</th>
      <th>GARANTIA:</th>
   </tr>
   <tr>
      <td><?php echo $date;?></td>
      <td><?php echo $descfpago;?></td>
      <td><?php echo $condicion;?></td>
      <td>SIN GARANTIA</td>
   </tr>
   <tr>
      <th colspan="2">ANALISTA</th>
      <th colspan="2">RECAUDADOR</th>
   </tr>
   <tr>
      <td colspan="2"><?php echo $analista;?></td>
      <td colspan="2"><?php echo $recaudador;?></td>
   </tr>
   </table>
   <br>
   <center><button id="bpnguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button> </center>
</div>
<?php  
}
?>

<?php
  pg_free_result($query);
  pg_close($BD_conexion);
?>