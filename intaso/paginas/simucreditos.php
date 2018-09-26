<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
      $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
      $query = pg_query("select idtipoprestamo as n, descripcion, plazo, tem, moneda, comision, mora, montomin, montomax from ttipoprestamo");
      $tregistros = pg_numrows($query);
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>SIMULADOR DE CREDITOS</h3>
<center>

   <div id="dinfo"> 
   <table id="tsimcredito" class='tmdata' style="width: 760px;">
   <thead>
   <tr>
      <caption>TIPOS DE PRESTAMO</caption>
   </tr>
   <tr><th></th>
      <th>PRESTAMO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>
      <th>COMISION</th>
      <th>MORA</th>
      <th>MINIMO</th>
      <th>MAXIMO</th>
   </tr>
   </thead>
   <tbody>
   <?php
      for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      echo "<tr>";
      echo "<td> <input type='radio' id='aselcredito' name='sccredito' class='selcredito' value='".$registros[n]."'></td>";
      echo "<td>".$registros[descripcion]."</td>";
      echo "<td>".$registros[plazo]."</td>";
      echo "<td>".number_format($registros[tem], 2, '.', ' ').'%'."</td>";
      echo "<td>".$registros[moneda]."</td>";
      echo "<td>".number_format($registros[comision], 2, '.', ' ')."%</td>";
      echo "<td>".$registros[mora]."%"."</td>";
      echo "<td>"."S/. ".number_format($registros[montomin], 2, '.', ' ')."</td>"; 
      echo "<td style='text-align:right;'>"."S/. ".number_format($registros[montomax], 2, '.', ' ')."</td>"; 
      echo "</tr>";
      } 
   ?>
   </tbody>
   </table>

   <table id="trsmodal" class="tpinfo" style="width: 760px;">
   <tr>
      <td width="100px"><label>MONTO DE CREDITO:</label></td>
      <td width="150px"><label>TEM:</label></td>
      <td width="100px"><label>FRECUENCIA DE PAGO:</label></td>
      <td width="100px"><label>APORTE X CUOTA:</label></td>
   </tr>

   <tr class="separar">
      <td width="100px"><input type="text" name="ascmonto" id="ascmonto" class="textom"></td>
      <td width="150px"><input type="text" name="asctem" id="asctem" class="textop">
                        <input type="text" name="ascprestamo" id="ascprestamo" class="textop" style="display:none;">
                        <input type="text" name="ascplazo" id="ascplazo" class="textop" style="display:none;">
                        <input type="text" name="asccomision" id="asccomision" class="textop" style="display:none;">
                        <input type="text" name="ascmora" id="ascmora" class="textop" style="display:none;">
      </td>
      <td width="150px"><select name="ascfpago" id="ascfpago" class="opcionm">
         <option value="1" selected>LUNES A VIERNES</option>
         <option value="2">LUNES A SÁBADO</option>
         <option value="3">SEMANAL</option>
         <option value="4">QUINCENAL</option>
         <option value="5">MENSUAL</option>
         </select></td>
      <td width="100px"><input type="text" name="ascaporte" id="ascaporte" class="textom" value="0.40"></td>
      <td width="150px"><button id="bscsimular" class="bsistema"><img src="../recursos/bsimular.png"/><span>SIMULAR</span></button></td>
   </table> 
   </div>
</center>

</div>