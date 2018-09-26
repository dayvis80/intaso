<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   } else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>CAJA - DEPÓSITO AHORROS</h3>

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


<div id="dmoddepositar" class="dmodalfondo">
<div class="dmodalmensaje" style="width:450px;">
   <div class="dmodaltitulo">AHORRO - DEPOSITAR           
   </div>
   <div class="dmodalcontenido">
      <table id="trsmodal">
      <tr class="separar">
         <td colspan="2" style="text-align: center;">DATOS DE LA CUENTA DE AHORRO</td>
      </tr>
      <tr>
         <td width="130px">N° CUENTA DE AHORRO </td>
         <td width="300px"><label id="lcdcuenta"></label></td>  
      </tr>
      <tr>
         <td>SOCIO:</td>
         <td><label id="lcdsocio"></label><label id="lcdidsocio" style="display: none;"></label></td>  
      </tr>
      <tr>
         <td>TIPO AHORRO:</td>
         <td><label id="lcdahorro"></label></td>  
      </tr>
      <tr>
         <td>PLAZO (MESES):</td>
         <td><label id="lcdplazo"></label></td>  
      </tr>
      <tr>
         <td>MONEDA</td>
         <td><label id="lcdmoneda"></label></td>  
      </tr>
      <tr>
         <td>FECHA APERTURA</td>
         <td><label id="lcdfapertura"></label></td>  
      </tr>
      <tr>
         <td  class="separar">FECHA VENCIMIENTO</td>
         <td><label id="lcdfvencimiento"></label></td>  
      </tr>
      <tr>
         <td></td>
         <td><label></label></td>  
      </tr>
      <tr>
         <td>MONTO A DEPOSITAR</td>
         <td><input type="text" id="acdmonto" name="acdmonto"></td>  
      </tr>
      <tr>
         <td colspan="2"><button id="bcddepositar" class="bsistema"><img src="../recursos/baceptar.png"/><span>DEPOSITAR</span></button>
            <button id="bcdcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CERRAR</span></button>
         </td>
      </tr>
      </table>
   </div>
</div>  
</div>


<div id="dticketdepo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketdeposito" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>