<?php
  session_start();
  if(isset($_SESSION['login'])==false){
    header('Location: login.php');
  } else{
    include('../phps/configuracion.php');
  }
?>

<div id="dcontenedor">
<h3 class='titulocontenedor'>GESTIÓN DE SOCIOS</h3>

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
      <th>AFILIADO <select id="sropcafiliado" class="opcion numero">
            <option></option>
            <option value="SI">SI</option>
            <option value="NO">NO</option>
          </select></th>
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


  <div id="dmodsocionuevo" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:740px;">
      <div class="dmodaltitulo">REGISTRAR SOCIO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr>
            <td width="110px"><label style="font-size:11px;">DOCUMENTO:</label></td>
            <td width="110px"><label style="font-size:11px;">N° DE DOC.:</label></td>
            <td width="140px"><label style="font-size:11px;">APELLIDO PATERNO:</label></td>
            <td width="140px"><label style="font-size:11px;">APELLIDO MATERNO:</label></td>
            <td width="140px"><label style="font-size:11px;" id='lrsnombre'>NOMBRES:</label></td>
          </tr>
      
          <tr class="separar">
            <td><select id="arstipodoc" class="opcion pequeno" required>
                <option value="DNI">DNI</option>
                <option value="PASAPORTE">PASAPORTE</option>
                <option value="CARNET">CARNET EXTRANJERIA</option>
                <option value="RUC">RUC</option>
                </select></td>
            <td><input type="text" id="arsnumerodoc" class="texto pequeno" maxlength="8" required pattern="[0-9]+" title="Ingresar solo números. Maximo 8 Caracteres"></td>
            <td><input type="text" id="arsapaterno" class="texto mediano" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" id="arsamaterno" class="texto mediano" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" id="arsnombres" class="texto mediano" maxlength="50" required pattern="[A-Za-z\s]+"></td>
          </tr>
  
          <tr>
            <td><label style="font-size:11px;">N° DE HIJOS:</label></td>
            <td><label style="font-size:11px;">ESTADO CIVIL:</label></td>
            <td><label style="font-size:11px;">SEXO:</label></td>
            <td><label style="font-size:11px;" id='lrsfnacimiento'>FECHA DE NACIMIENTO:</label></td>
            <td><label></label></td>
          </tr>

          <tr class="separar">
            <td><select id="arsnhijos" class="opcion numero" required>
              <option value="0">0</option>
              <option value="1">1</option>              
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
            </select></td>
            <td><select id="arsecivil" class="opcion pequeno" required>
              <option value="SOLTERO">SOLTERO</option>
              <option value="CASADO">CASADO</option>
              <option value="DIVORCIADO">DIVORCIADO</option>
              <option value="VIUDO">VIUDO</option>
              </select></td>
            <td><select id="arssexo" class="opcion pequeno" required>
              <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>
            </select></td>
            <td><input type="date" name="arsfnacimiento" id="arsfnacimiento" class="texto mediano" required></td>
            <td></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">TEL. CELULAR:</label></td>
            <td><label style="font-size:11px;">TEL. EMERGENCIA:</label></td>
            <td><label style="font-size:11px;">CORREO ELECTRONICO:</label></td>
            <td><label style="font-size:11px;" id='lrsocupacion'>OCUPACION:</label></td>
            <td><label style="font-size:11px;"></label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" id="arstcelular" class="texto pequeno"  maxlength="9" required pattern="[0-9]+"></td>
            <td><input type="text" id="arstemergencia" class="texto pequeno" maxlength="10"></td>
            <td><input type="text" id="arsemail" class="texto mediano" maxlength="30"></td>
            <td><input type="text" id="arsocupacion" class="texto mediano" maxlength="30" required></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="5" align="left">UBICACION DE DOMICILIO ACTUAL</th>
          </tr>

          <tr>
            <td><label style="font-size:11px;">DEPARTAMENTO:</label></td>
            <td><label style="font-size:11px;">PROVINCIA:</label></td>
            <td><label style="font-size:11px;">DISTRITO:</label></td>
            <td colspan="2"><label style="font-size:11px;">DIRECCION DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" id="arsdepartamento" class="texto pequeno" maxlength="15" required></td>
            <td><input type="text" id="arsprovincia" class="texto pequeno" maxlength="15" required></td>
            <td><input type="text" id="arsdistrito" class="texto mediano" maxlength="15" required></td>
            <td colspan="2"><input type="text" id="arsdireccion" class="texto grande"  maxlength="60" required></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">TIPO DE VIVIENDA:</label></td>
            <td colspan="2" style="font-size:11px;"><label>MATERIAL DE CONSTRUCCION:</label></td>
            <td colspan="2" style="font-size:11px;"><label>REFERENCIA DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><select id="arstvivienda" class="opcion pequeno" required>
              <option>PROPIO</option>
              <option>ALQUILER</option>
              <option>ANTICRESIS</option>
              <option>FAMILIAR</option>
              </select></td>
            <td colspan="2"><input type="text" id="arsmconstruccion" class="texto mediano"  maxlength="20"></td>
            <td colspan="2"><input type="text" id="arsrdomicilio" class="texto grande"  maxlength="60" required></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="2" align="left"><label style="font-size:11px;">UBICACION DEL TRABAJO/NEGOCIO</label></th>
            <th><label></label></th>
            <th colspan="2" align="left"><label style="font-size:11px;">REFERENCIA DEL TRABAJO/NEGOCIO</label></th>
          </tr>

          <tr class="separar">
            <td colspan="2"><input type="text" name="arsutrabajo" id="arsutrabajo" class="texto grande"  maxlength="60"></td>
            <td></td>
            <td colspan="2"><input type="text" name="arsrtrabajo" id="arsrtrabajo" class="texto grande" maxlength="60"></td>
          </tr>

          <tr>
            <th colspan="5" align="left"><label id='lrsdresponsable'>DATOS DEL CONYUGE</label></th>
          </tr>

          <tr>
            <td><label style="font-size:11px;">N° DE DNI</label></td>
            <td><label style="font-size:11px;"></label></td>
            <td><label style="font-size:11px;">APELLIDO PATERNO</label></td>
            <td><label style="font-size:11px;">APELLIDO MATERNO</label></td>
            <td><label style="font-size:11px;">NOMBRES</label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" name="arscdni" id="arscdni" class="texto pequeno" maxlength="8" pattern="[0-9]+"></td>
            <td></td>
            <td><input type="text" name="arscapaterno" id="arscapaterno" class="texto mediano" maxlength="15" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arscamaterno" id="arscamaterno" class="texto mediano" maxlength="15" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arscnombres" id="arscnombres" class="texto mediano" maxlength="20" pattern="[A-Za-z\s]+"></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">ANALISTA</label></td>
            <td><label></label></td>
            <td><label style="font-size:11px;">AFILIACION</label></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrsguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrscerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button></td>
          </tr>
          <tr>
            <td colspan="2"><select name="arsanalista" id="arsanalista" class="opcion grande" required>
            <?php
            $sucursal=$_SESSION['sucursal'];
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador as analista, CONCAT(apaterno,' ',amaterno,' ',nombres) as nombre from ttrabajador where sucursal='". $sucursal ."' order by nombre;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
            }
            pg_free_result($query);
            pg_close($BD_conn);
            ?></select></td>
            <td>S/. <input type="text" name="arsafiliacion" id="arsafiliacion" class="texto pequeno" required></td>
          </tr>
        </table>   
      </div>
    </div>  
  </div>

  <div id="dmodsociomodificar" class="dmodalfondo">
    <div class="dmodalmensaje" style="width:740px;">
      <div class="dmodaltitulo">MODIFICAR REGISTRO SOCIO          
      </div>
      <div class="dmodalcontenido">
        <table id="trsmodal">
          <tr>
            <td width="110px"><label style="font-size:11px;">DOCUMENTO:</label></td>
            <td width="110px"><label style="font-size:11px;">N° DE DOC.:</label></td>
            <td width="140px"><label style="font-size:11px;">APELLIDO PATERNO:</label></td>
            <td width="140px"><label style="font-size:11px;">APELLIDO MATERNO:</label></td>
            <td width="140px"><label style="font-size:11px;">NOMBRES:</label></td>
          </tr>
      
          <tr class="separar">
            <td><select id="arsmtipodoc" class="opcion pequeno" required>
                <option value="DNI">DNI</option>
                <option value="PASAPORTE">PASAPORTE</option>
                <option value="CARNET">CARNET EXTRANJERIA</option>
                </select></td>
            <td><input type="text" id="arsmnumerodoc" class="textop" maxlength="8" required pattern="[0-9]+"></td>
            <td><input type="text" id="arsmapaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" id="arsmamaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" id="arsmnombres" class="textom" maxlength="30" required pattern="[A-Za-z\s]+"></td>
          </tr>
  
          <tr>
            <td><label style="font-size:11px;">N° DE HIJOS:</label></td>
            <td><label style="font-size:11px;">ESTADO CIVIL:</label></td>
            <td><label style="font-size:11px;">SEXO:</label></td>
            <td><label style="font-size:11px;">FECHA DE NACIMIENTO:</label></td>
            <td><label style="font-size:11px;"></label></td>
          </tr>

          <tr class="separar">
            <td><select id="arsmnhijos" class="opcion numero" required>
              <option value="0">0</option>
              <option value="1">1</option>              
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
            </select></td>
            <td><select id="arsmecivil" class="opcion pequeno" required>
              <option value="SOLTERO">SOLTERO</option>
              <option value="CASADO">CASADO</option>
              <option value="DIVORCIADO">DIVORCIADO</option>
              <option value="VIUDO">VIUDO</option>
              </select></td>
            <td><select id="arsmsexo" class="opcion pequeno" required>
              <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>
            </select></td>
            <td><input type="date" id="arsmfnacimiento" class="texto mediano" required></td>
            <td></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">TEL. CELULAR:</label></td>
            <td><label style="font-size:11px;">TEL. EMERGENCIA:</label></td>
            <td><label style="font-size:11px;">CORREO ELECTRONICO:</label></td>
            <td><label style="font-size:11px;">OCUPACION:</label></td>
            <td><label style="font-size:11px;"></label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" id="arsmtcelular" class="texto pequeno" maxlength="9" required pattern="[0-9]+"></td>
            <td><input type="text" id="arsmtemergencia" class="texto pequeno" maxlength="10"></td>
            <td><input type="text" id="arsmemail" class="texto mediano" maxlength="30"></td>
            <td><input type="text" id="arsmocupacion" class="texto mediano" maxlength="30" required></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="5" align="left">UBICACION DE DOMICILIO ACTUAL</th>
          </tr>

          <tr>
            <td><label style="font-size:11px;">DEPARTAMENTO:</label></td>
            <td><label style="font-size:11px;">PROVINCIA:</label></td>
            <td><label style="font-size:11px;">DISTRITO:</label></td>
            <td colspan="2" style="font-size:11px;"><label>DIRECCION DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" id="arsmdepartamento" class="texto pequeno" maxlength="15" required></td>
            <td><input type="text" id="arsmprovincia" class="texto pequeno" maxlength="15" required></td>
            <td><input type="text" id="arsmdistrito" class="texto mediano" maxlength="15" required></td>
            <td colspan="2"><input type="text" id="arsmdireccion" class="texto grande" maxlength="60" required></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">TIPO DE VIVIENDA:</label></td>
            <td colspan="2"><label style="font-size:11px;">MATERIAL DE CONSTRUCCION:</label></td>
            <td colspan="2"><label style="font-size:11px;">REFERENCIA DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><select id="arsmtvivienda" class="opcion pequeno" required>
              <option>PROPIO</option>
              <option>ALQUILER</option>
              <option>ANTICRESIS</option>
              <option>FAMILIAR</option>
              </select></td>
            <td colspan="2"><input type="text" name="arsmmconstruccion" id="arsmmconstruccion" class="texto mediano"></td>
            <td colspan="2"><input type="text" name="arsmrdomicilio" id="arsmrdomicilio" class="texto grande" required></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="2" align="left"><label style="font-size:11px;">UBICACION DEL TRABAJO/NEGOCIO</label></th>
            <th><label></label></th>
            <th colspan="2" align="left"><label style="font-size:11px;">REFERENCIA DEL TRABAJO/NEGOCIO</label></th>
          </tr>

          <tr class="separar">
            <td colspan="2"><input type="text" name="arsmutrabajo" id="arsmutrabajo" class="texto grande" maxlength="60"></td>
            <td></td>
            <td colspan="2"><input type="text" name="arsmrtrabajo" id="arsmrtrabajo" class="texto grande" maxlength="60"></td>
          </tr>

          <tr>
            <th colspan="5" align="left">DATOS DEL CONYUGE</th>
          </tr>

          <tr>
            <td><label style="font-size:11px;">N° DE DNI</label></td>
            <td><label style="font-size:11px;"></label></td>
            <td><label style="font-size:11px;">APELLIDO PATERNO</label></td>
            <td><label style="font-size:11px;">APELLIDO MATERNO</label></td>
            <td><label style="font-size:11px;">NOMBRES</label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" name="arsmcdni" id="arsmcdni" class="texto pequeno" maxlength="8" pattern="[0-9]+"></td>
            <td></td>
            <td><input type="text" name="arsmcapaterno" id="arsmcapaterno" class="texto mediano" maxlength="20" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsmcamaterno" id="arsmcamaterno" class="texto mediano" maxlength="20" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsmcnombres" id="arsmcnombres" class="texto mediano" maxlength="20" pattern="[A-Za-z\s]+"></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">ANALISTA</label></td>
            <td><label></label></td>
            <td><label style="font-size:11px;">AFILIACION</label></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrsmguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrsmcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button></td>
          </tr>
          <tr>
            <td colspan="2"><select name="arsmanalista" id="arsmanalista" class="opcion grande" required>
            <?php
            $sucursal=$_SESSION['sucursal'];
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador as analista, CONCAT(apaterno,' ',amaterno,' ',nombres) as nombre from ttrabajador where tipotrabajador<>0 and sucursal='". $sucursal ."' order by nombre;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
            }
            pg_free_result($query);
            pg_close($BD_conn);
            ?></select></td>
            <td>S/. <input type="text" name="arsmafiliacion" id="arsmafiliacion" class="texto pequeno" required></td>
          </tr>
        </table>   
      </div>
    </div>  
  </div>