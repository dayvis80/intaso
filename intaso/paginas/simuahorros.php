<?php
   session_start();
   if(isset($_SESSION['login'])==false){
      header('Location: login.php');
   }else{
      include('../phps/configuracion.php');
   }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>SIMULADOR DE AHORROS</h3>
<center>
   <div id="dinfo" style="width: 400px; padding: 10px;"> 
      
      <table id="tsimahorro" class="tpinfo" style="width: 350px;">
      <tr class="separar">
         <td width="200px" style="text-align:center;"><label>MONTO A SIMULAR:</label></td>
      </tr>
      <tr>
         <td width="200px" style="text-align:center;"><input type="text" name="asamonto" id="asamonto" class="textom"></td>
      </tr>
      <tr class="separar">
         <td style="text-align:center; padding-top:15px;"><button id="bsasimular" class="bsistema"><img src="../recursos/bsimular.png"/><span>SIMULAR</span></button></td>
      </tr>
      </table> 

        <div id="dcalcular" style="display: none;">
         </div>
   </div>
</center>
</div>