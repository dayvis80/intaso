<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>GESTIÓN DE TRABAJADORES</h3>

  <table id="tdatos" class="display" border="0" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>DNI</th>
      <th>TRABAJADOR</th>
      <th>A. PATERNO</th>
      <th>A. MATERNO</th>
      <th>NOMBRES</th>
      <th>CELULAR</th>
      <th>TIPO</th>
      <th>REGISTRADO</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>DNI</th>
      <th>TRABAJADOR</th>
      <th>A. PATERNO</th>
      <th>A. MATERNO</th>
      <th>NOMBRES</th>
      <th>CELULAR</th>
      <th>TIPO</th>
      <th>REGISTRADO</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>

</div>


  <div id="dmodtrabajador" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">REGISTRAR NUEVO TRABAJADOR          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>DNI:</label></td>
            <td width="150px"><input type="text" name="artdni" id="artdni" class="textop" maxlength="8" required pattern="[0-9]+"></td>
          </tr>
          
          <tr class="separar">
            <td><label>A. PATERNO:</label></td>
            <td><input type="text" name="artapaterno" id="artapaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
          </tr>

          <tr class="separar">
            <td><label>A. MATERNO:</label></td>
            <td><input type="text" name="artamaterno" id="artamaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
          </tr>

          <tr class="separar">
            <td><label>NOMBRES:</label></td>
            <td><input type="text" name="artnombres" id="artnombres" class="textom"  maxlength="30" required pattern="[A-Za-z\s]+"></td>
          </tr class="separar">

          <tr class="separar">
            <td><label>CELULAR:</label></td>
            <td><input type="text" name="artcelular" id="artcelular" class="textom" maxlength="9" pattern="[0-9]+"></td>
          </tr>
      
          <tr class="separar">
            <td width="140px"><label>TIPO TRABAJADOR:</label></td>
            <td><select name="arttipotrabajador" id="arttipotrabajador" class="opcionm">
                <option value="1">ADMINISTADOR DE SISTEMAS</option>
                <option value="2">ADMINISTRADOR DE OFICINA</option>
                <option value="3" selected="selected">ANALISTA</option>
                <option value="4">AUXILIAR DE OPERACIONES</option>
                <option value="5">CAJERO</option>
                <option value="6">CONTADOR</option>
                <option value="7">GESTOR DE RECUPERACIONES</option>
                <option value="8">JEFE DE AHORROS</option>
                <option value="9">JEFE DE CREDITOS</option>
                <option value="10">JEFE DE OPERACIONES</option>
                <option value="11">JEFE DE UNIDAD DE COBRANZAS</option>
                <option value="12">PROMOTOR DE AHORRO Y CREDITOS</option>
                </select></td>  
          </tr>
        </table>   
        <button id="bmodrtguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>GUARDAR</span></button>
        <button id="bmodrtcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>

  <div id="dmodmtrabajador" class="dmodalfondo" data-reg="" data-clave="">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">MODIFICAR DATOS DE TRABAJADOR          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>DNI:</label></td>
            <td width="150px"><input type="text" name="amtdni" id="amtdni" class="textop"></td>
          </tr>
          
          <tr class="separar">
            <td><label>A. PATERNO:</label></td>
            <td><input type="text" name="amtapaterno" id="amtapaterno" class="textom"></td>
          </tr>

          <tr class="separar">
            <td><label>A. MATERNO:</label></td>
            <td><input type="text" name="amtamaterno" id="amtamaterno" class="textom"></td>
          </tr>

          <tr class="separar">
            <td><label>NOMBRES:</label></td>
            <td><input type="text" name="amtnombres" id="amtnombres" class="textom"></td>
          </tr class="separar">

          <tr class="separar">
            <td><label>CELULAR:</label></td>
            <td><input type="text" name="amtcelular" id="amtcelular" class="textom"></td>
          </tr>
      
          <tr class="separar">
            <td width="140px"><label>TIPO TRABAJADOR:</label></td>
            <td><select name="amttipotrabajador" id="amttipotrabajador" class="opcionm">
                <option value="1">ADMINISTADOR DE SISTEMAS</option>
                <option value="2">ADMINISTRADOR DE OFICINA</option>
                <option value="3">ANALISTA</option>
                <option value="4">AUXILIAR DE OPERACIONES</option>
                <option value="5">CAJERO</option>
                <option value="6">CONTADOR</option>
                <option value="7">GESTOR DE RECUPERACIONES</option>
                <option value="8">JEFE DE AHORROS</option>
                <option value="9">JEFE DE CREDITOS</option>
                <option value="10">JEFE DE OPERACIONES</option>
                <option value="11">JEFE DE UNIDAD DE COBRANZAS</option>
                <option value="12">PROMOTOR DE AHORRO Y CREDITOS</option>
                </select></td>  
          </tr>
        </table>
        <button id="bmodmmtguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>GUARDAR</span></button>
        <button id="bmodmmtcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>

  <div id="dmodbtrabajador" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:360px;">
      <div class="dmodaltitulo">DAR DE BAJA TRABAJADOR          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="320px" style="font-size: 14px;"><label>SE PROCEDERA A DAR DE BAJA AL SIGUIENTE TRABAJADOR:</label></td>
          </tr>
          
          <tr class="separar">
            <td style="font-size: 14px;">NOMBRE:  <label id="labtnombre"></label></td>
          </tr>

          <tr class="separar">
            <td style="font-size: 14px;">DNI:  <label id="labtdni"></label><label id="labtid" style="display: none;"></label></td>
          </tr>

          <tr class="separar">
            <td style="font-size: 14px;"><label id="latmensaje" style="font-size:10px">AL DAR DE BAJA A ESTE TRABAJADOR SE BORRARA SU USUARIO Y QUEDARA BLOQUEADO</label></td>
          </tr>
        </table>   

        <button id="bmodbtaceptar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>ACEPTAR</span></button>
        <button id="bmodbtcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>