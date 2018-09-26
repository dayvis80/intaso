<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
//    $BD_conexion = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
//    $query = pg_query("select * from tdispositivo");
//    $tregistros = pg_numrows($query);
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>GESTIÓN DE FERIADOS</h3>

  <table id="tdemo" class="display" border="0" width="100%">
    <thead>
    <tr>
      <th>N°</th>
      <th>DESCRIPCION</th>
      <th>FECHA</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>N°</th>
      <th>DESCRIPCION</th>
      <th>FECHA</th>
    </tr>
    </tfoot>
  </table>
</div>


  <div id="dmodferiado" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">REGISTRAR NUEVO FERIADO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>DESCRIPCION:</label></td>
            <td width="150px"><input type="text" name="amfdescripcion" id="amfdescripcion" class="textom"></td>
          </tr>
          
          <tr class="separar">
            <td><label>FECHA:</label></td>
            <td><input type="date" name="amffecha" id="amffecha" class="textom"></td>
          </tr>
        </table>   

        <button id="bmodmfguardar" class="boton" style="float:left; margin: 15px 0px 0px 30px;"><span>Guardar &nbsp;</span><img src="../recursos/baceptar.png"/></button>
        <button id="bmodmfcerrar" class="boton" style="float:right; margin: 15px 30px 0px 0px;"><span>Cancelar &nbsp;</span><img src="../recursos/bcancelar.png"/></button>
      </div>
    </div>  
  </div>

  <div id="dmodmferiado" class="dmodalfondo" data-reg="" data-clave="">
    <div class="dmodalmensaje" style="width:340px;">
      <div class="dmodaltitulo">MODIFICAR FERIADO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>DNI:</label></td>
            <td width="150px"><input type="text" name="artdni" id="artdni" class="textop"></td>
          </tr>
          
          <tr class="separar">
            <td><label>A. PATERNO:</label></td>
            <td><input type="text" name="artapaterno" id="artapaterno" class="textom"></td>
          </tr>

        </table>
        <button id="bmodrtmguardar" class="boton" style="float:left; margin: 15px 0px 0px 30px;"><span>Aceptar &nbsp;</span><img src="../recursos/baceptar.png"/></button>
        <button id="bmodrtmcerrar" class="boton" style="float:right; margin: 15px 30px 0px 0px;"><span>Cancelar &nbsp;</span><img src="../recursos/bcancelar.png"/></button>
      </div>
    </div>  
  </div>
