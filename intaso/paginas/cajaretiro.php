<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - RETIRO AHORROS</h3>

<table id="tdatos" class="display" width="100%">
   <thead>
   <tr>
      <th>#</th>
      <th>N°</th>
      <th>ID SOCIO</th>
      <th>SOCIO</th>
      <th>N° CUENTA</th>
      <th>AHORRO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>      
      <th>F APERTURA</th>
      <th>F VENCIMIENTO</th>
      <th>ESTADO</th>
      <th>SALDO</th>
      <th>ACCIONES</th>
   </tr>
   </thead>
   <tbody>
   </tbody>
   <tfoot>
   <tr>
      <th>#</th>
      <th>N°</th>
      <th>ID SOCIO</th>
      <th>SOCIO</th>
      <th>N° CUENTA</th>
      <th>AHORRO</th>
      <th>PLAZO</th>
      <th>TEM</th>
      <th>MONEDA</th>      
      <th>F APERTURA</th>
      <th>F VENCIMIENTO</th>
      <th>ESTADO</th>
      <th>SALDO</th>
      <th>ACCIONES</th>
   </tr>
   </tfoot>
</table>
</div>


  <div id="dmodretirar" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:450px;">
      <div class="dmodaltitulo">REALIZAR RETIRO          
      </div>
      <div class="dmodalcontenido">
         <table id="trsmodal">
          <tr>
            <td colspan="2" style="text-align: center;">DATOS DE LA CUENTA DE AHORRO</td>
          </tr>
          <tr>
            <td width="130px">N° CUENTA DE AHORRO </td>
            <td width="300px"><label id="lcrcuenta"></label></td>  
          </tr>
          <tr>
            <td>SOCIO:</td>
            <td><label id="lcrsocio"></label><label id="lcridsocio" style="display: none;"></td>  
          </tr>
          <tr>
            <td>TIPO AHORRO:</td>
            <td><label id="lcrahorro"></label></td>  
          </tr>
          <tr>
            <td>PLAZO (MESES):</td>
            <td><label id="lcrplazo"></label></td>  
          </tr>
          <tr>
            <td>MONEDA</td>
            <td><label id="lcrmoneda"></label></td>  
          </tr>
          <tr>
            <td>FECHA APERTURA</td>
            <td><label id="lcrfapertura"></label></td>  
          </tr>
          <tr class="separar">
            <td  class="separar">FECHA VENCIMIENTO</td>
            <td><label id="lcrfvencimiento"></label></td>  
          </tr>
          <tr>
            <td></td>
            <td><label></label></td>  
          </tr>
          <tr>
            <td>ESTADO DE LA CUENTA</td>
            <td><label id="lcrestado"></label></td>  
          </tr>
          <tr>
          <td>SALDO DISPONIBLE</td>
            <td><label id="lcrsaldo"></label></td>  
          </tr>
          <tr>
            <td>MONTO A RETIRAR</td>
            <td><input type="text" id="acrmonto" name="acrmonto"></td>  
          </tr>
          <tr>
            <td colspan="2" style"text-align:center;"><button id="bcrretirar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><span>Retirar &nbsp;</span><img src="../recursos/baceptar.png"/></button>
            <button id="bcrcerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><span>Cerrar &nbsp;</span><img src="../recursos/bcancelar.png"/></button>
            </td>
          </tr>
          </table>
      </div>
    </div>  
  </div>


  <div id="dticketretiro" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketdretiro" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>