<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>GESTIÓN DE USUARIOS</h3>

  <table id="tdatos" class="display" border="0" width="100%">
    <thead>
    <tr>
      <th>#</th>      
      <th>N°</th>
      <th>TRABAJADOR</th>
      <th>USUARIO</th>
      <th>CONT</th>
      <th>ID USUARIO</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>TRABAJADOR</th>
      <th>USUARIO</th>
      <th>CONT</th>
      <th>ID USUARIO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>


  <div id="dmodusuario" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">AGREGAR NUEVO USUARIO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>TRABAJADOR:</label></td>
            <td width="150px"><select name="arutrabajador" id="arutrabajador" class="opcionm">
            <?php
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador, CONCAT(nombres,' ',apaterno,' ',amaterno) as trabajador from ttrabajador where tipotrabajador!=0 and sucursal='1';");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo "<option value='".$registros[idtrabajador]."'>".$registros[trabajador]."</option>";
            }
            pg_free_result($query);
            pg_close($BD_conexion);
            ?>    
                </select>
            </td>
          </tr>
          
          <tr class="separar">
            <td><label>USUARIO:</label></td>
            <td><input type="text" name="aruusuario" id="aruusuario" class="textom" maxlength="16" required style="text-transform: none;"></td>
          </tr>

          <tr class="separar">
            <td><label>CONTRASEÑA:</label></td>
            <td><input type="password" name="arucontrasena" id="arucontrasena" class="textom" minlength="6" maxlength="10" required></td>
          </tr>

          <tr class="separar">
            <td><label>RE-CONTRASEÑA:</label></td>
            <td><input type="password" name="arurcontrasena" id="arurcontrasena" class="textom" minlength="6" maxlength="10" required></td>
          </tr>
        </table> 

        <div id="cmensaje">
          CONSIDERACIONES PARA SU CONTRASEÑA<br>
          <hr>
          1. Debe tener 2 letras mayúsculas, 2 minúsculas y 2 números.<br>
          2. Como mínimo 6 caracteres y como máximo 10 caracteres.<br>
          3. Usted es responsable de su contraseña y no debe compartir o prestar su contraseña.<br>
          4. Cámbielo periódicamente (mensual) o cuando crea que vieron su contraseña.
        </div>

        <button id="bmodruguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
        <button id="bmodrucerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>