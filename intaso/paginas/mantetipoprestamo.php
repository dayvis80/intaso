<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>REGISTRAR TIPO DE PRESTAMOS</h3>

  <table id="tdatos" class="display" border="0" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>N°</th>
      <th>DESCRIPCION</th>
      <th>PLAZO EN MESES</th>
      <th>TEM MIN. %</th>
      <th>MONEDA</th>
      <th>COMISION %</th>
      <th>MORA %</th>
      <th>MONTO MAXIMO</th>
      <th>MONTO MINIMO</th>
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
      <th>TEM MIN. %</th>
      <th>MONEDA</th>
      <th>COMISION %</th>
      <th>MORA %</th>
      <th>MONTO MAXIMO</th>
      <th>MONTO MINIMO</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>


  <div id="dmodtipoprestamo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">REGISTRAR TIPO PRESTAMO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="100px"><label>DESCRIPCION:</label></td>
            <td width="150px"><input type="text" name="artpdescripcion" id="artpdescripcion" class="textom"></td>
          </tr>
          
          <tr class="separar">
            <td><label>PLAZO EN MESES:</label></td>
            <td><input type="text" name="artpplazo" id="artpplazo" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>TEM MINIMO %:</label></td>
            <td><input type="text" name="artptem" id="artptem" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>COMISION %:</label></td>
            <td><input type="text" name="artpcomision" id="artpcomision" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>MORA (DIARIO) %:</label></td>
            <td><input type="text" name="artpmora" id="artpmora" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>MONEDA:</label></td>
            <td><select id="artpmoneda">
                <option value="SOL">S/.</option>
                <option value="DOL">$</option>
                <option value="EUR">€</option>
                </select></td>
          </tr class="separar">
      
          <tr class="separar">
            <td><label>MONTO MÍNIMO S/.:</label></td>
            <td><input type="text" name="artpmontomin" id="artpmontomin" class="textop"></td>
          </tr>      

          <tr class="separar">
            <td><label>MONTO MÁXIMO S/.:</label></td>
            <td><input type="text" name="artpmontomax" id="artpmontomax" class="textop"></td>
          </tr>

        </table>   
        <button id="bmodrtpguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
        <button id="bmodrtpcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>


  <div id="dmodmtipoprestamo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:320px;">
      <div class="dmodaltitulo">MODIFICAR DATOS TIPO PRESTAMO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="120px"><label id="lmtpid" style="display:none;">9</label><label>DESCRIPCION:</label></td>
            <td width="150px"><input type="text" name="amtpdescripcion" id="amtpdescripcion" class="textom"></td>
          </tr>
          
          <tr class="separar">
            <td><label>PLAZO EN MESES:</label></td>
            <td><input type="text" name="amtpplazo" id="amtpplazo" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>TEM MINIMO %:</label></td>
            <td><input type="text" name="amtptem" id="amtptem" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>COMISION %:</label></td>
            <td><input type="text" name="amtpcomision" id="amtpcomision" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>MORA (DIARIO) %:</label></td>
            <td><input type="text" name="amtpmora" id="amtpmora" class="textop"></td>
          </tr>

          <tr class="separar">
            <td><label>MONEDA:</label></td>
            <td><select id="amtpmoneda">
                <option value="SOL">S/.</option>
                <option value="DOL">$</option>
                <option value="EUR">€</option>
                </select></td>
          </tr class="separar">
      
          <tr class="separar">
            <td><label>MONTO MÍNIMO S/.:</label></td>
            <td><input type="text" name="amtpmontomin" id="amtpmontomin" class="textop"></td>
          </tr>      

          <tr class="separar">
            <td><label>MONTO MÁXIMO S/.:</label></td>
            <td><input type="text" name="amtpmontomax" id="amtpmontomax" class="textop"></td>
          </tr>

        </table>   
        <button id="bmodmtpguardar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button>
        <button id="bmodmtpcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
    </div>  
  </div>