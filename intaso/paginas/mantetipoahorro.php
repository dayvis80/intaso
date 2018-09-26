<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>REGISTRAR TIPO DE AHORROS</h3>

  <table id="tdatos" class="display" border="0" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>DESCRIPCION</th>
      <th>PLAZO EN MESES</th>
      <th>TEM MIN.</th>
      <th>MONEDA</th>
      <th>MONTO MINIMO</th>
      <th>MONTO MAXIMO</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>DESCRIPCION</th>
      <th>PLAZO EN MESES</th>
      <th>TEM MIN.</th>
      <th>MONEDA</th>
      <th>MONTO MINIMO</th>
      <th>MONTO MAXIMO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>


  <div id="dmodtipoahorro" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">REGISTRAR NUEVO TIPO AHORRO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>DESCRIPCION:</label></td>
            <td width="150px"><input type="text" name="artadescripcion" id="artadescripcion" class="textom"></td>
          </tr>
          
          <tr class="separar">
            <td><label>PLAZO EN MESES:</label></td>
            <td><input type="text" name="artaplazo" id="artaplazo" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>TEM MINIMO:</label></td>
            <td><input type="text" name="artatem" id="artatem" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>MONEDA:</label></td>
            <td><select id="artamoneda">
                <option value="SOL">S/.</option>
                <option value="DOL">$</option>
                <option value="EUR">€</option>
                </select></td>
          </tr class="separar">
      
          <tr class="separar">
            <td><label>MONTO MÍNIMO:</label></td>
            <td><input type="text" name="artamontomin" id="artamontomin" class="textop"></td>
          </tr>      

          <tr class="separar">
            <td><label>MONTO MÁXIMO:</label></td>
            <td><input type="text" name="artamontomax" id="artamontomax" class="textop"></td>
          </tr>

        </table>   
        <button id="bmodtaguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>GUARDAR</span></button>
        <button id="bmodtacerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>


  <div id="dmodmtipoahorro" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">MODIFICAR DATOS TIPO AHORRO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="120px"><label id="lmtaid" style="display:none;">9</label><label>DESCRIPCION:</label></td>
            <td width="150px"><input type="text" name="amtadescripcion" id="amtadescripcion" class="textom"></td>
          </tr>
          
          <tr class="separar">
            <td><label>PLAZO EN MESES:</label></td>
            <td><input type="text" name="amtaplazo" id="amtaplazo" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>TEM MINIMO:</label></td>
            <td><input type="text" name="amtatem" id="amtatem" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>MONEDA:</label></td>
            <td><select id="amtamoneda">
                <option value="SOL">S/.</option>
                <option value="DOL">$</option>
                <option value="EUR">€</option>
                </select></td>
          </tr class="separar">
      
          <tr class="separar">
            <td><label>MONTO MÍNIMO:</label></td>
            <td><input type="text" name="amtamontomin" id="amtamontomin" class="textop"></td>
          </tr>      

          <tr class="separar">
            <td><label>MONTO MÁXIMO:</label></td>
            <td><input type="text" name="amtamontomax" id="amtamontomax" class="textop"></td>
          </tr>

        </table>   
        <button id="bmodmtaguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>GUARDAR</span></button>
        <button id="bmodmtacerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>
