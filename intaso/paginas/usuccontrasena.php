<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAMBIAR CONTRASEÑA</h3>
<center>

<div id="dinfo">
   <table class="tpinfo" style="width: 340px;">
   <tr class="separar">
      <td width="100px"><label>TRABAJADOR:</label></td>
      <td width="150px"><select name="acctrabajador" id="acctrabajador" class="opcionm">
         <?php
         $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
         $query = pg_query("select tu.usuario, tt.idtrabajador, CONCAT(tt.nombres,' ',tt.apaterno,' ',tt.amaterno) as trabajador from  tusuario as tu, ttrabajador as tt where tu.idtrabajador=tt.idtrabajador and tt.idtrabajador='". $_SESSION['idtrabajador'] ."';");
         $tregistros = pg_numrows($query);
         for($i=1;$i<=$tregistros; $i++){
            $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
            echo "<option value='".$registros[idtrabajador]."'>".$registros[trabajador]."</option>";
         }
         pg_free_result($query);
         pg_close($BD_conexion);
         ?>    
      </select></td>
   </tr>
   <tr class="separar">
      <td><label>USUARIO:</label></td>
      <td><input type="text" name="accusuario" id="accusuario" class="textom" style="text-transform: none;" value="<?php echo $registros[usuario]?>"></td>
   </tr>
   <tr class="separar">
      <td><label>CONTRASEÑA:</label></td>
      <td><input type="password" name="acccontrasena" id="acccontrasena" class="textom"></td>
   </tr>
   <tr class="separar">
      <td><label>RE-CONTRASEÑA:</label></td>
      <td><input type="password" name="accrcontrasena" id="accrcontrasena" class="textom"></td>
   </tr>
   <tr style="text-align: center;"><td colspan="2" style="padding: 10px;">
      <button id="bcccambiar" class="bsistema"><img src="../recursos/baceptar.png"/><span>CAMBIAR</span></button></td>
   </tr>
   <tr><td colspan="2">
      <div id="cmensaje">
      CONSIDERACIONES PARA SU CONTRASEÑA<br>
      <hr>
      1. Debe tener 2 letras mayúsculas, 2 minúsculas y 2 números.<br>
      2. Como mínimo 6 caracteres y como máximo 10 caracteres.<br>
      3. Usted es responsable de su contraseña y no debe compartir o prestar su contraseña.<br>
      4. Cámbielo periódicamente (mensual) o cuando crea que vieron su contraseña.
      </div></td>           
   </tr>
   </table> 
</div>
</center>

</div>