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
<h3 class='titulocontenedor'>CAJA - BILLETAJE</h3>

  <table id="tdatos" class="display" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>ID</th>
      <th>IDTRABAJADOR</th>
      <th>CAJERO</th>
      <th>F. BILLETAJE<br><select id="cbfilfbilletaje" class="opcion numero">
            <option></option>
            <option value="VS">1 SEMANA</option>
            <option value="VM">1 MES</option>
            <option value="VT">TODO</option>
          </select></th>
      <th>MONTO</th>
      <th>F. REGISTRO</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>ID</th>
      <th>IDTRABAJADOR</th>
      <th>CAJERO</th>
      <th>F. BILLETAJE</th>
      <th>MONTO</th>
      <th>F. REGISTRO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>


<div id="dmodcajabilletajes" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:400px;">
      <div class="dmodaltitulo">BILLETAJE SOLES          
      </div>
      <div class="dmodalcontenido">

    <table style="width: 380px; font-size:12px; text-align:center;" class="tpinfo">
      <tr>
        <td colspan="3">FECHA:
        <input type="date" id="acbfbilletaje" class="textom"></td>
      </tr>
      <tr>
      <td colspan="3">CAJERO:
        <select id="acbidtrabajador" class="opciong">
        <?php
            $idtrabajador=$_SESSION['idtrabajador'];
            //$query = pg_query("select idtrabajador as promotor, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador where tipotrabajador='5';");
            $query = pg_query("select idtrabajador as idcajero, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador where idtrabajador='". $idtrabajador ."';");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
               $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
               echo "<option value='".$registros[idcajero]."'>".$registros[nombre]."</option>";
        }
        ?></select></td>
      </tr>
      <tr>
        <td>MONTO</td>
        <td>CANTIDAD</td>
        <td>TOTAL</td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo200">200.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo200" value="0" style="text-align:right;"></td>
        <td><label id="bstotal200" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo100">100.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo100" value="0" style="text-align:right;"></td>
        <td><label id="bstotal100" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo50">50.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo50" value="0" style="text-align:right;"></td>
        <td><label id="bstotal50" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo20">20.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo20" value="0" style="text-align:right;"></td>
        <td><label id="bstotal20" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo10">10.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo10" value="0" style="text-align:right;"></td>
        <td><label id="bstotal10" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo5">5.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo5" value="0" style="text-align:right;"></td>
        <td><label id="bstotal5" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo2">2.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo2" value="0" style="text-align:right;"></td>
        <td><label id="bstotal2" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo1">1.00</label></td>
        <td><input type="text" class="texto numero" id="bstipo1" value="0" style="text-align:right;"></td>
        <td><label id="bstotal1" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo050">0.50</label></td>
        <td><input type="text" class="texto numero" id="bstipo050" value="0" style="text-align:right;"></td>
        <td><label id="bstotal050" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo020">0.20</label></td>
        <td><input type="text" class="texto numero" id="bstipo020" value="0" style="text-align:right;"></td>
        <td><label id="bstotal020" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">S/. <label id="lbstipo010">0.10</label></td>
        <td><input type="text" class="texto numero" id="bstipo010" value="0" style="text-align:right;"></td>
        <td><label id="bstotal010" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right;">TOTAL</td>
        <td>S/.<label id="bstotal" class="ltexto">0</label></td>
      </tr>
      <tr>
        <td style="text-align:right;">OBSERVACIÓN:</td>
        <td colspan="2"><input type="text" id="bsobservacion" class="texto grande"></td>
      </tr>
    </table>
         <button id="bmodcbsguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
         <button id="bmodcbscerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
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