<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - CAJA CHICA</h3>

<table id="tdatos" class="display" border="0" width="100%">
   <thead>
   <tr>
      <th>#</th>
      <th>ID</th>
      <th>PERIODO</th>
      <th>MONTO</th>
      <th>SALDO</th>
      <th>DETALLE</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
   </tr>
   </thead>
   <tbody>
   </tbody>
   <tfoot>
   <tr>
      <th>#</th>
      <th>ID</th>
      <th>PERIODO</th>
      <th>MONTO</th>
      <th>SALDO</th>
      <th>DETALLE</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
   </tr>
   </tfoot>
</table>
</div>


<div id="dmodnuevocajachica" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">REGISTRAR NUEVO PERIODO          
      </div>
      <div class="dmodalcontenido">
         <table id="trsmodal">
         <tr class="separar">
            <td width="100px"><label>PERIODO:</label></td>
            <td width="150px"><select id="acccmes" class="opcionp">
                <option value="ENERO">ENERO</option><option value="FEBRERO">FEBRERO</option>
                <option value="MARZO">MARZO</option><option value="ABRIL">ABRIL</option>
                <option value="MAYO">MAYO</option><option value="JUNIO">JUNIO</option>
                <option value="JULIO">JULIO</option><option value="AGOSTO">AGOSTO</option>
                <option value="SEPTIEMBRE">SEPTIEMBRE</option><option value="OCTUBRE">OCTUBRE</option>
                <option value="NOVIEMBRE">NOVIEMBRE</option><option value="DICIEMBRE">DICIEMBRE</option>
                </select>
                <select id="acccano" class="opcionp">
                <option value="2018">2018</option><option value="2019">2019</option>
                </select>
                </td>
         </tr>
         <tr class="separar">
            <td width="100px"><label>MONTO:</label></td>
            <td width="150px"><input type="text" id="acccmonto" class="textom" maxlength="20"></td>
         </tr>
         <tr class="separar">
            <td width="100px"><label>DETALLE:</label></td>
            <td width="150px"><input type="text" id="acccdetalle" class="textom" maxlength="20"></td>
         </tr>
         </table>
         <button id="bmodcccnguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
         <button id="bmodcccncerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>


<div id="dmodregcajachica" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">INGRESAR MOVIMIENTO CAJA CHICA
      </div>
      <div class="dmodalcontenido">

         <table id="trsmodal">

         <tr class="separar">
            <td style="text-align:center" colspan="2" width="100px"><h3>PERIODO: <label id="larccperiodo"></label><label id="larccidcaja" style="display:none"></label></h3></td>
         </tr>

         <tr class="separar">
            <td><label>TRABAJADOR:</label></td>
            <td width="150px"><select id="acccrtrabajador" class="opcionm">
            <?php
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador, CONCAT(apaterno,' ',amaterno,' ',nombres) as trabajador from ttrabajador where tipotrabajador!=0 and sucursal='1' order by trabajador;");
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
            <td width="100px"><label>DETALLE:</label></td>
            <td width="150px"><input type="text" id="acccrdetalle" class="textom" maxlength="35" required pattern="[0-9A-Za-z\s]+"></td>
         </tr>

         <tr class="separar">
            <td><label>MOVIMIENTO:</label></td>
            <td><select id="acccrtipomov" class="opcionm">
                <option value="E">EGRESO</option>
                <option value="I">INGRESO</option>
                </select></td>
         </tr>

         <tr class="separar">
            <td><label>MONEDA:</label></td>
            <td><select id="acccrmoneda" class="opcionm">
                <option value="SOL">S/.</option>
                <option value="DOL">$</option>
                <option value="EUR">€</option>
                </select></td>
         </tr>

         <tr class="separar">
            <td><label>MONTO:</label></td>
            <td><input type="text" id="acccrmonto" class="textom"  maxlength="10" required></td>
         </tr class="separar">

         <tr class="separar">
            <td><label>DOCUMENTO:</label></td>
            <td><select id="acccrdocumento" class="opcionm">
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
            <td><input type="text" id="acccrnumero" class="textom" maxlength="9" pattern="[0-9]+"></td>
         </tr>

         <tr class="separar">
            <td><label>FECHA:</label></td>
            <td><input type="date" id="acccrfechamov" class="textom"></td>
         </tr>

         <tr class="separar">
            <td width="140px"><label>OBSERVACIONES:</label></td>
            <td><textarea id="acccrobservaciones" class="textom" rows="5" cols="20"></textarea></td>
         </tr>
         </table>   
         <button id="bmodcccrguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
         <button id="bmodcccrcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>


<div id="dmodcajachicamov" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:800px;">
      <div class="dmodaltitulo">REGISTRO DE MOVIMIENTOS
      </div>

      <div id="dcajachicamov" class="dmodalcontenido" style="height: 520px; overflow: auto;">
      </div>

   </div>  
</div>


<div id="dticketingreso" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketdingreso" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>