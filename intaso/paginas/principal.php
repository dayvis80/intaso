<?php
session_start();
include('../phps/configuracion.php');
if(isset($_SESSION['login'])==false){
    header('Location: login.php');
}
?>

<!DOCTYPE HTML>
<html>
<head> 
    <title>INTEGRA ASOCIADOS</title>
    <link rel="shortcut icon" href="logoia16.ico">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<?php echo $rutacss ?>general.css"/>
    <link rel="stylesheet" href="<?php echo $rutacss ?>ol.css" type="text/css">
    <link rel="stylesheet" href="<?php echo $rutacss ?>jqdataTables.css" type="text/css">
    <script src="<?php echo $rutajs ?>ol.js"></script>
    <script src="<?php echo $rutajs ?>jquery.js"></script>
    <script src="<?php echo $rutajs ?>jqdataTables.js"></script>
    <script src="<?php echo $rutajs ?>acciones.js"></script>
</head>

<body>
    <header>
        <table>
            <tr><td width="140"><img src="<?php echo $rutarecursos ?>logoia.png" height="60" width="232"></td>
                <td width="856"><h2 class="vintage">COOPERATIVA DE AHORRO Y CREDITO INTEGRA ASOCIADOS LTDA.</h2></td>
            </tr>
        </table>          
    </header>

    <nav>
        <table align="left" border="0">
            <tr>
                <td width="498" style="padding-left:20px; font-size: 20px;"> 
                <?php
                    $dias = array("DOMINGO","LUNES","MARTES","MIERCOLES","JUEVES","VIERNES","SÁBADO");
                    $meses = array("ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE");
                    echo $dias[date('w')]." ".date('d')." DE ".$meses[date('n')-1];
                ?>
                </td>
                <td width="450" align="left"><label align>Bienvenido/a: <?php echo $_SESSION['trabajador'];?></label></td> 
                <td width="145" align="center"><button id="blosalir" class="bsistema"><img src="../recursos/bsalir.png"/><span>CERRAR</span></button></td>
            </tr>
        </table>
    </nav>
    
    <section id="fondo"> <!-- INICIO FONDO GENERAL -->
        <section id="central"> <!-- INICIO CENTRAL -->
            <aside>
                <?php
                if(($_SESSION['tipotrabajador'])==3)
                   {
                      require('menu3.php');
                   }else{
                      if(($_SESSION['tipotrabajador'])==4){
                         require('menu4.php');
                      }else{
                         if(($_SESSION['tipotrabajador'])==5){
                            require('menu5.php');
                         }else{
                            if(($_SESSION['tipotrabajador'])==10){
                               require('menu10.php');
                            }else{
                               if(($_SESSION['tipotrabajador'])==12){
                                  require('menu12.php');
                               }else{
                                  require('menu.php');
                               }
                            }
                         }
                      }
                   }
                ?>
            </aside>


            <article id="paginas"> <!-- INICIO DE CONTENIDOS -->
                <img src="<?php echo $rutarecursos ?>central.jpg" width="100%">
            </article> <!-- FIN DE CONTENIDOS -->
        </section> <!-- FIN CENTRAL -->
    </section> <!-- FIN FONDO GENERAL -->

    <footer><br><p>Copyright © 2018 - Todos los Derechos Reservados Integra Asociados Ltda.
    <br>Diseñado Por: Dayvis V. Farfan Gavancho</p>
    </footer>
</body>
</html>