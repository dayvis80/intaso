<?php
session_start();
include('../phps/configuracion.php');
  if(isset($_SESSION['login'])==true){
    header('Location: principal.php');
  }
?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>INTEGRA ASOCIADOS</title>
        <meta content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="<?php echo $rutacss ?>general.css"/>
        <script src="<?php echo $rutajs ?>jquery.js"></script>
        <script src="<?php echo $rutajs ?>acciones.js"></script>
    </head>
    
    <body>
        <div id="dlocentral" class="centrarhv" align="center">
            <br>   
            <h2 class="merriweatherb">COOPERATIVA INTEGRA ASOCIADOS LTDA.</h2>
            <br>
            
            <div id="dloimagen"><img src="../recursos/isesion.png" width="110" style="margin-top:16px">
            </div>

            <div id="dlosesion">
                <table id="tlosesion">
                    <tr><td align="right">Usuario:</td>
                        <td><input class="texto mediano" type="text" id="elousuario" style="text-transform: none;" maxlength="16"></td>
                    </tr>
                
                    <tr><td align="right">Contraseña:</td>
                        <td><input class="texto mediano" type="password" id="elopassword" maxlength="10" onkeypress="validar(event)"/></td>
                    </tr>

                    <tr>
                    <td colspan="2" align="left"><center><button id="bloingresar" class="bsistema"><img src="../recursos/bingresar.png"><span>INICIAR SESIÓN</span></button></center></td>
                    </tr>
                </table>
             </div>
            
            <table width="440px">
                <tr><td width="100px" style="text-align: left; font-size: 12px; padding: 5px">    </td>
                    <td class="merriweatherb" width="340px" style="text-align: right; font-size: 18px; padding: 5px">
                        <?php
                        $dias = array("DOMINGO","LUNES","MARTES","MIERCOLES","JUEVES","VIERNES","SÁBADO");
                        $meses = array("ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE");
                         echo $dias[date('w')]." ".date('d')." DE ".$meses[date('n')-1];
                        ?>
                    </td></tr>
            </table>

            <div id="dloerror">
            </div>
        </div>    
    </body>
</html>