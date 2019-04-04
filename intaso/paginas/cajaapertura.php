<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - APERTURA</h3>

  <table id="tdatos" class="display" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>ID</th>
      <th>CAJERO</th>
      <th>F. APERTURA<select id="cafilfapertura" class="opcion numero">
            <option></option>
            <option value="VS">1 SEMANA</option>
            <option value="VM">1 MES</option>
            <option value="VT">TODO</option>
          </select></th>
      <th>F. CIERRE</th>
      <th>MONTO INCIAL</th>
      <th>MONTO FINAL</th>
      <th>FLUJO DIARIO</th>
      <th>ABIERTO</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>ID</th>
      <th>CAJERO</th>
      <th>F. APERTURA</th>
      <th>F. CIERRE</th>
      <th>M. INICIAL</th>
      <th>M. FINAL</th>
      <th>FLUJO DIARIO</th>
      <th>ABIERTO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>


<div id="dmodcajapertura" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">APERTURAR NUEVA CAJA          
      </div>
      <div class="dmodalcontenido">
         <table id="trsmodal">
         <tr class="separar">
            <td width="120px"><label>CAJERO:</label></td>
            <td width="160px"><select name="acacajero" id="acacajero" class="opcionm">
               <option value='0'>SELECCIONCAR</option>
            <?php
            $sucursal= $_SESSION['sucursal'];
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador as id, CONCAT(nombres,' ',apaterno,' ',amaterno) as cajero from ttrabajador where (tipotrabajador=2 or tipotrabajador=4 or tipotrabajador=5 or tipotrabajador=10) and sucursal='1' order by cajero;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo "<option value='".$registros[id]."'>".$registros[cajero]."</option>";
            }
            pg_free_result($query);
            pg_close($BD_conexion);
            ?></select></td>
         </tr>
         <tr class="separar">
            <td><label>F. APERTURA:</label></td>
            <?php
            echo '<td><input type="date" name="acafapertura" id="acafapertura" class="textom" value="'. date("Y-m-d") .'" disabled></td>'
            ?>
         </tr>
         <tr class="separar">
            <td><label>M. INICIAL:</label></td>
            <td><input type="text" name="acaminicial" id="acaminicial" class="textom" disabled=""></td>
         </tr>
         </table>
         <button id="bmodcaguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
         <button id="bmodcacerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>


<div id="dmodcajamov" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:800px;">
      <div class="dmodaltitulo">REGISTRO DE MOVIMIENTOS
      </div>

      <div id="dcajamov" class="dmodalcontenido" style="height: 520px; overflow: auto;">
      </div>

   </div>  
</div>

<div id="dmodcajacerrar" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:500px;">
      <div class="dmodaltitulo">CERRAR CAJA
      </div>

      <div id="dcajacerrar" class="dmodalcontenido" style="height: 520px; overflow: auto;">
      </div>

   </div>  
</div>