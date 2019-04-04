<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - BOVEDA</h3>

<?php
   $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
   $sucursal=$_SESSION['sucursal'];
   $usuario=$_SESSION['idtrabajador'];
   $query = pg_query("select tb.idboveda, concat(tt.apaterno,' ',tt.amaterno,' ',tt.nombres) as responsable, tb.trabajador, tb.efectivo, tb.sucursal, ts.descripcion as agencia from tboveda as tb, ttrabajador as tt, tsucursal as ts  where tb.trabajador=tt.idtrabajador and tb.sucursal=ts.idsucursal and tb.sucursal='". $sucursal ."';");
   $registros = pg_fetch_array($query, null, PGSQL_ASSOC);      
   $idboveda = $registros[idboveda];
   $responsable = $registros[responsable];
   $trabajador = $registros[trabajador];
   $efectivo = $registros[efectivo];
   $agencia = $registros[agencia];
   pg_free_result($query);
   pg_close($BD_conexion);
?>

   <div id="dinfo"> 
   <table class="tpinfo" id="tasocio" style="width: 840px;">
   <tr><td colspan="2"><h2>INFORMACIÓN DE BOVEDA</h2></td>
      <td><h3>RESPONSABLE:</h3></td>
      <td><h3><?php echo '<label id="lacbtrabajador" style="display:none;">' .$trabajador. '</label>' . $responsable; ?></h3></td>
      <td rowspan="2"><button id="bcbovhistorial" class="bsistema"><img src="../recursos/socio.png"/><span>HISTORIAL</span></button></td>
   </tr>

   <tr><td><h3>SUCURSAL:</h3></td>
      <td><h3><?php echo $agencia; ?></h3></td>
      <td><h3>EFECTIVO</h3></td>
      <td><h2>S/. <?php echo '<label id="lacbidboveda" style="display:none;">'. $idboveda. '</label>' . $efectivo; ?></h2></td>
      </tr>
   </table>
   </div>

  <table id="tdatos" class="display" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>ID</th>
      <th>CAJERO</th>
      <th>TRABAJADOR</th>
      <th>F APERTURA</th>
      <th>EFECTIVO</th>
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
      <th>CAJERO</th>
      <th>TRABAJADOR</th>
      <th>F APERTURA</th>
      <th>EFECTIVO</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>


<div id="dmodbohabilitacion" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">HABILITACION DE EFECTIVO         
      </div>
      <div class="dmodalcontenido">
         <table id="trsmodal">
         <tr class="separar">
            <td width="100px"><label id="lacbhidboveda" style="display:none;"></label></td>
            <td width="150px"><label id="lacbhidcaja" style="display:none;"></label></td>
         </tr>

         <tr class="separar">
            <td width="100px"><label>MOVIMIENTO:</label></td>
            <td width="150px"><select id="acbhtipomov" class="opcionp">
                <option value="HA">HABILITAR</option><option value="RE">RECAUDAR</option>
                </select>
                </td>
         </tr>
         
         <tr class="separar">
            <td width="100px"><label>MONTO:</label></td>
            <td width="150px"><input type="text" id="acbhmonto" class="textom" maxlength="20"></td>
         </tr>
         
         </table>
         <button id="bmodcbhaceptar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>ACEPTAR</span></button>
         <button id="bmodcbhcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>


<div id="dmodbovedamov" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:800px;">
      <div class="dmodaltitulo">HISTORIAL DE MOVIMIENTOS
      </div>

      <div id="dbovedamov" class="dmodalcontenido" style="height: 520px; overflow: auto;">
      </div>

   </div>  
</div>