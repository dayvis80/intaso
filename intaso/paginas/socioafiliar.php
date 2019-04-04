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
<h3 class='titulocontenedor'>AFILIAR SOCIO</h3>

  <table id="tdatos" class="display" width="100%">
    <thead>
    <tr>
      <th>#</th>
      <th>ID</th>
      <th>N° SOCIO</th>
      <th>DOC.</th>
      <th>NUMERO</th>
      <th>SOCIO</th>
      <th>AFILIACION</th>
      <th>F REGISTRO</th>
      <th>AFILIADO</th>      
      <th>TRABAJADOR</th>
      <th>ACCIONES</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
    <tr>
      <th>#</th>
      <th>ID</th>
      <th>N° SOCIO</th>
      <th>DOC.</th>
      <th>NUMERO</th>
      <th>SOCIO</th>
      <th>AFILIACION</th>
      <th>F REGISTRO</th>
      <th>AFILIADO</th>      
      <th>TRABAJADOR</th>
      <th>ACCIONES</th>
    </tr>
    </tfoot>
  </table>
</div>

  <div id="dmodsocioafiliar" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:360px;">
      <div class="dmodaltitulo">AFILIAR NUEVO SOCIO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr class="separar">
            <th colspan="2" width="320px" style="font-size: 14px;"><label>SE PROCEDERA A AFILIAR AL SIGUIENTE SOCIO:</label></th>
          </tr>

          <tr class="separar">
            <td></td>
            <td style="font-size: 14px;"></td>
          </tr>

          <tr class="separar">
            <td>SOCIO:</td>
            <td style="font-size: 14px;"><label id="lansocio"></label> <label id="lanidsocio" style="display: none;"></label></td>
          </tr>

          <tr class="separar">
            <td>DOCUMENTO:</td>
            <td style="font-size: 14px;"><label id="lantipo"></label><label id="landni"></label></td>
          </tr>

          <tr class="separar">
            <td style="font-size: 14px;">MONTO:</td>
            <td style="font-size: 14px;"> S/. <label id="lanmonto"></label> </td>
          </tr>
        </table>   

        <button id="bmodsaafiliar" class="bsistema" style="float:left; margin: 15px 0px 0px 30px;"><span>AFILIAR &nbsp;</span><img src="../recursos/bafiliar.png"/></button>
        <button id="bmodsacerrar" class="bsistema" style="float:right; margin: 15px 30px 0px 0px;"><span>CANCELAR &nbsp;</span><img src="../recursos/bcancelar.png"/></button>
      </div>
    </div>  
  </div>


    <div id="dticketafiliar" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:340px;">
      <div id="dcticketafiliar" class="dmodalcontenido" style="overflow: auto;">
 
      </div>
    </div>  
</div>