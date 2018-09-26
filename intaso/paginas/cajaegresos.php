<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - EGRESOS DE CAJA</h3>

<table id="tdatos" class="display" border="0" width="100%">
   <thead>
   <tr>
      <th>#</th>
      <th>ID</th>
      <th>DETALLE</th>
      <th>TRABAJADOR</th>
      <th>MONTO</th>
      <th>DOCUMENTO</th>
      <th>NUMERO</th>
      <th>FECHA</th>
      <th>OBSERVACONES</th>
   </tr>
   </thead>
   <tbody>
   </tbody>
   <tfoot>
   <tr>
      <th>#</th>
      <th>ID</th>
      <th>DETALLE</th>
      <th>TRABAJADOR</th>
      <th>MONTO</th>
      <th>DOCUMENTO</th>
      <th>NUMERO</th>
      <th>FECHA</th>
      <th>OBSERVACONES</th>
   </tr>
   </tfoot>
</table>

</div>


<div id="dmodegresos" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">REGISTRAR NUEVO EGRESO          
      </div>
      <div class="dmodalcontenido">
         <table id="trsmodal">
         <tr class="separar">
            <td width="100px"><label>DETALLE:</label></td>
            <td width="150px"><input type="text" id="acecdetalle" class="textom" maxlength="35" required pattern="[0-9A-Za-z\s]+"></td>
         </tr>
          
         <tr class="separar">
            <td><label>TRABAJADOR:</label></td>
            <td width="150px"><select id="acectrabajador" class="opcionm">
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
                </select></td>
         </tr>

         <tr class="separar">
            <td><label>MONEDA:</label></td>
            <td><select id="acecmoneda" class="opcionm">
                <option value="SOL">S/.</option>
                <option value="DOL">$</option>
                <option value="EUR">€</option>
                </select></td>
         </tr>

         <tr class="separar">
            <td><label>MONTO:</label></td>
            <td><input type="text" id="acecmonto" class="textom"  maxlength="10" required></td>
         </tr class="separar">

         <tr class="separar">
            <td><label>DOCUMENTO:</label></td>
            <td><select id="acecdocumento" class="opcionm">
                <option value="REC">RECIBO</option>
                <option value="BOL">BOLETA DE VENTA</option>
                <option value="FAC">FACTURA</option>
                <option value="NOT">NOTA DE VENTA</option>
                <option value="DEC">DECLARACIÓN</option>
                <option value="OTR">OTROS</option>
                </select></td>
         </tr>
      
         <tr class="separar">
            <td><label>NUMERO:</label></td>
            <td><input type="text" id="acecnumero" class="textom" maxlength="9" pattern="[0-9]+"></td>
         </tr>

         <tr class="separar">
            <td><label>FECHA:</label></td>
            <td><input type="date" id="acecfechaineg" class="textom"></td>
         </tr>

         <tr class="separar">
            <td width="140px"><label>OBSERVACIONES:</label></td>
            <td><textarea id="acecobservaciones" class="textom" rows="5" cols="20"></textarea>
         </tr>
         </table>   
         <button id="bmodcecguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
         <button id="bmodceccerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>

<div id="dticketegreso" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketdegreso" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>