<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>MANTENIMIENTO - BLOQUEAR CUENTA DE AHORRO</h3>

   <table id="tdatos" class="display" width="100%">
   <thead>
   <tr>
      <th>#</th>
      <th>N</th>
      <th>IDSOCIO</th>
      <th>SOCIO</th>
      <th>N° CUENTA</th>
      <th>AHORRO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>
      <th>F APERTURA</th>
      <th>F VENCIMIENTO</th>
      <th>SALDO</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
   </tr>
   </thead>
   <tbody>
   </tbody>
   <tfoot>
   <tr>
      <th>#</th>
      <th>N</th>
      <th>IDSOCIO</th>
      <th>SOCIO</th>
      <th>N° CUENTA</th>
      <th>AHORRO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>
      <th>F APERTURA</th>
      <th>F VENCIMIENTO</th>
      <th>SALDO</th>
      <th>ESTADO</th>
      <th>ACCIONES</th>
   </tr>
   </tfoot>
   </table>
</div>


<div id="dmodbloahorro" class="dmodalfondo">
   <div class="dmodalmensaje" style="width:360px;">
      <div class="dmodaltitulo">BLOQUEAR CUENTA DE AHORRO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <td width="320px" style="font-size: 14px;"><label>SE PROCEDERA A CAMBIAR ESTADO DE LA CUENTA DE AHORRO N°:</label></td>
          </tr>
          
          <tr class="separar">
            <td style="font-size: 20px; text-align:center;"><label id="labacuenta"></label>  <label id="labaid" style="display: none;"></label><label id="lamatipomov" style="display: none;"></label></td>
          </tr>

          <tr class="separar">
            <td style="font-size: 16px; text-align:center;">SALDO DE LA CUENTA: S/. <label id="labasaldo"></label></td>
          </tr>
        </table>

        <button id="bbabloquear" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><img src="../recursos/baceptar.png"/><span>ACEPTAR</span></button>
        <button id="bbacancelar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button>
      </div>
   </div>  
</div>