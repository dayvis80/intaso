<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>MANTENIMIENTO - CAMBIO CARTERA</h3>

   <table id="tdatos" class="display" width="100%">
   <thead>
      <tr>
        <th>#</th>
        <th>IDPRESTAMO</th>
        <th>IDSOCIO</th>        
        <th>SOCIO</th>
        <th>CUENTA</th>
        <th>PRESTAMO</th>
        <th>MONTO</th>
        <th>IDANALISTA</th>        
        <th>ANALISTA</th>
        <th>ACCIONES</th>
      </tr>
   </thead>
   <tbody>
   </tbody>
   <tfoot>
   <tr>
        <th>#</th>
        <th>IDPRESTAMO</th>
        <th>IDSOCIO</th>        
        <th>SOCIO</th>
        <th>CUENTA</th>
        <th>PRESTAMO</th>
        <th>MONTO</th>
        <th>IDANALISTA</th>        
        <th>ANALISTA</th>
        <th>ACCIONES</th>
   </tr>
   </tfoot>
   </table>
</div>

<div id="dmodccartera" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:440px;">
      <div class="dmodaltitulo">CAMBIO DE CARTERA
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td colspan="2" width="400px" style="font-size: 14px;"><label>SE PROCEDERA A CAMBIAR EL PROMOTOR DEL SOCIO:</label></td>
          </tr>
          
          <tr class="separar">
            <td colspan="2" style="font-size: 16px; text-align:center;"><label id="lmccidprestamo" style="display: none;"></label><b><label id="lmccsocio">SOCIO</label></b>  <label id="lmccidsocio" style="display: none;"></label></td>
          </tr>

          <tr class="separar">
            <td width="50%" style="font-size: 14px; text-align:right;">PROMOTOR ACTUAL: <label id="lmccidpromotor" style="display: none;"></label></td>
            <td style="font-size: 14px; text-align:left;"><input type="text" id="amccpromotor" class="texto grande" disabled=""></td>
          </tr>

          <tr class="separar">
            <td style="font-size: 14px; text-align:right;">NUEVO PROMOTOR: </td>
            <td style="font-size: 14px; text-align:left;"><select id="smccanalista" class="opcion grande" required>
               <?php
               $sucursal=$_SESSION['sucursal'];
               $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
               $query = pg_query("select idtrabajador as analista, CONCAT(apaterno,' ',amaterno,' ',nombres) as nombre from ttrabajador where tipotrabajador=12 and sucursal='". $sucursal ."' order by nombre;");
               $tregistros = pg_numrows($query);
                  for($i=1;$i<=$tregistros; $i++){
                  $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
                  echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
                  }
               pg_free_result($query);
               pg_close($BD_conn);
               ?></select></td>
          </tr>
        </table>

        <button id="bmcccambiar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>CAMBIAR</span></button>
        <button id="bmcccancelar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>