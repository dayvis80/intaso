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
      <th>AFILIADO <select id="sropcafiliado" class="opcionp">
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
            <td width="110px"><label style="font-size:11px;">N° DE DOCUMENTO:</label></td>
            <td width="140px"><label style="font-size:11px;">APELLIDO PATERNO:</label></td>
            <td width="140px"><label style="font-size:11px;">APELLIDO MATERNO:</label></td>
            <td width="140px"><label style="font-size:11px;">NOMBRES:</label></td>
          </tr>
      
          <tr class="separar">
            <td><select id="arstipodoc">
                <option value="DNI">DNI</option>
                <option value="PASAPORTE">PASAPORTE</option>
                <option value="CARNET">CARNET EXTRANJERIA</option>
                </select></td>
            <td><input type="text" name="arsnumerodoc" id="arsnumerodoc" class="textop" maxlength="8" required pattern="[0-9]+"></td>
            <td><input type="text" name="arsapaterno" id="arsapaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsamaterno" id="arsamaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsnombres" id="arsnombres" class="textom" maxlength="30" required pattern="[A-Za-z\s]+"></td>
          </tr>
  
          <tr>
            <td><label style="font-size:11px;">N° DE HIJOS:</label></td>
            <td><label style="font-size:11px;">ESTADO CIVIL:</label></td>
            <td><label style="font-size:11px;">SEXO:</label></td>
            <td><label style="font-size:11px;">FECHA DE NACIMIENTO:</label></td>
            <td><label></label></td>
          </tr>

          <tr class="separar">
            <td><select id="arsnhijos">
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
            <td><select id="arsecivil">
              <option value="SOLTERO">SOLTERO</option>
              <option value="CASADO">CASADO</option>
              <option value="DIVORCIADO">DIVORCIADO</option>
              <option value="VIUDO">VIUDO</option>
              </select></td>
            <td><select id="arssexo">
              <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>
            </select></td>
            <td><input type="date" name="arsfnacimiento" id="arsfnacimiento" class="textom"></td>
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
            <td><input type="text" name="arstcelular" id="arstcelular" class="textop"  maxlength="9"></td>
            <td><input type="text" name="arstemergencia" id="arstemergencia" class="textop" maxlength="10"></td>
            <td><input type="text" name="arsemail" id="arsemail" class="textom" maxlength="30"></td>
            <td><input type="text" name="arsocupacion" id="arsocupacion" class="textom" maxlength="30"></td>
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
            <td><input type="text" name="arsdepartamento" id="arsdepartamento" class="textop" maxlength="15"></td>
            <td><input type="text" name="arsprovincia" id="arsprovincia" class="textop" maxlength="15"></td>
            <td><input type="text" name="arsdistrito" id="arsdistrito" class="textom" maxlength="15"></td>
            <td colspan="2"><input type="text" name="arsdireccion" id="arsdireccion" class="textog"  maxlength="60"></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">TIPO DE VIVIENDA:</label></td>
            <td colspan="2" style="font-size:11px;"><label>MATERIAL DE CONSTRUCCION:</label></td>
            <td colspan="2" style="font-size:11px;"><label>REFERENCIA DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><select id="arstvivienda">
              <option>PROPIO</option>
              <option>ALQUILER</option>
              <option>ANTICRESIS</option>
              <option>FAMILIAR</option>
              </select></td>
            <td colspan="2"><input type="text" name="arsmconstruccion" id="arsmconstruccion" class="textom"  maxlength="20"></td>
            <td colspan="2"><input type="text" name="arsrdomicilio" id="arsrdomicilio" class="textog"  maxlength="60"></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="2" align="left"><label style="font-size:11px;">UBICACION DEL TRABAJO/NEGOCIO</label></th>
            <th><label></label></th>
            <th colspan="2" align="left"><label style="font-size:11px;">REFERENCIA DEL TRABAJO/NEGOCIO</label></th>
          </tr>

          <tr class="separar">
            <td colspan="2"><input type="text" name="arsutrabajo" id="arsutrabajo" class="textog"  maxlength="60"></td>
            <td></td>
            <td colspan="2"><input type="text" name="arsrtrabajo" id="arsrtrabajo" class="textog" maxlength="60"></td>
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
            <td><input type="text" name="arscdni" id="arscdni" class="textop" maxlength="8" pattern="[0-9]+"></td>
            <td></td>
            <td><input type="text" name="arscapaterno" id="arscapaterno" class="textom" maxlength="15" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arscamaterno" id="arscamaterno" class="textom" maxlength="15" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arscnombres" id="arscnombres" class="textom" maxlength="20" pattern="[A-Za-z\s]+"></td>
          </tr>

          <tr>
            <td><label style="font-size:11px;">ANALISTA</label></td>
            <td><label></label></td>
            <td><label style="font-size:11px;">AFILIACION</label></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrsguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrscerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button></td>
          </tr>
          <tr>
            <td colspan="2"><select name="arsanalista" id="arsanalista" class="opciong">
            <?php
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador as analista, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
            }
            ?></select></td>
            <td>S/. <input type="text" name="arsafiliacion" id="arsafiliacion" class="textop"></td>
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
            <td width="110px"><label>TIPO DE DOCUMENTO:</label></td>
            <td width="110px"><label>N° DE DOCUMENTO:</label></td>
            <td width="140px"><label>APELLIDO PATERNO:</label></td>
            <td width="140px"><label>APELLIDO MATERNO:</label></td>
            <td width="140px"><label>NOMBRES:</label></td>
          </tr>
      
          <tr class="separar">
            <td><select id="arsmtipodoc">
                <option value="DNI">DNI</option>
                <option value="PASAPORTE">PASAPORTE</option>
                <option value="CARNET">CARNET EXTRANJERIA</option>
                </select></td>
            <td><input type="text" name="arsmnumerodoc" id="arsmnumerodoc" class="textop" maxlength="8" required pattern="[0-9]+"></td>
            <td><input type="text" name="arsmapaterno" id="arsmapaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsmamaterno" id="arsmamaterno" class="textom" maxlength="20" required pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsmnombres" id="arsmnombres" class="textom" maxlength="30" required pattern="[A-Za-z\s]+"></td>
          </tr>
  
          <tr>
            <td><label>N° DE HIJOS:</label></td>
            <td><label>ESTADO CIVIL:</label></td>
            <td><label>SEXO:</label></td>
            <td><label>FECHA DE NACIMIENTO:</label></td>
            <td><label></label></td>
          </tr>

          <tr class="separar">
            <td><select id="arsmnhijos">
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
            <td><select id="arsmecivil">
              <option value="SOLTERO">SOLTERO</option>
              <option value="CASADO">CASADO</option>
              <option value="DIVORCIADO">DIVORCIADO</option>
              <option value="VIUDO">VIUDO</option>
              </select></td>
            <td><select id="arsmsexo">
              <option value="MASCULINO">MASCULINO</option>
              <option value="FEMENINO">FEMENINO</option>
            </select></td>
            <td><input type="date" name="arsmfnacimiento" id="arsmfnacimiento" class="textom"></td>
            <td></td>
          </tr>

          <tr>
            <td><label>TELEFONO CELULAR:</label></td>
            <td><label>TEL. DE EMERGENCIA:</label></td>
            <td><label>CORREO ELECTRONICO:</label></td>
            <td><label>OCUPACION:</label></td>
            <td><label></label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" name="arsmtcelular" id="arsmtcelular" class="textop" maxlength="9"></td>
            <td><input type="text" name="arsmtemergencia" id="arsmtemergencia" class="textop" maxlength="10"></td>
            <td><input type="text" name="arsmemail" id="arsmemail" class="textom" maxlength="30"></td>
            <td><input type="text" name="arsmocupacion" id="arsmocupacion" class="textom" maxlength="30"></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="5" align="left">UBICACION DE DOMICILIO ACTUAL</th>
          </tr>

          <tr>
            <td><label>DEPARTAMENTO:</label></td>
            <td><label>PROVINCIA:</label></td>
            <td><label>DISTRITO:</label></td>
            <td colspan="2"><label>DIRECCION DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" name="arsmdepartamento" id="arsmdepartamento" class="textop" maxlength="15"></td>
            <td><input type="text" name="arsmprovincia" id="arsmprovincia" class="textop" maxlength="15"></td>
            <td><input type="text" name="arsmdistrito" id="arsmdistrito" class="textom" maxlength="15"></td>
            <td colspan="2"><input type="text" name="arsmdireccion" id="arsmdireccion" class="textog" maxlength="60"></td>
          </tr>

          <tr>
            <td><label>TIPO DE VIVIENDA:</label></td>
            <td colspan="2"><label>MATERIAL DE CONSTRUCCION:</label></td>
            <td colspan="2"><label>REFERENCIA DE DOMICILIO:</label></td>
          </tr>

          <tr class="separar">
            <td><select id="arsmtvivienda">
              <option>PROPIO</option>
              <option>ALQUILER</option>
              <option>ANTICRESIS</option>
              <option>FAMILIAR</option>
              </select></td>
            <td colspan="2"><input type="text" name="arsmmconstruccion" id="arsmmconstruccion" class="textom"></td>
            <td colspan="2"><input type="text" name="arsmrdomicilio" id="arsmrdomicilio" class="textog"></td>
            <td></td>
          </tr>

          <tr>
            <th colspan="2" align="left"><label>UBICACION DEL TRABAJO/NEGOCIO</label></th>
            <th><label></label></th>
            <th colspan="2" align="left"><label>REFERENCIA DEL TRABAJO/NEGOCIO</label></th>
          </tr>

          <tr class="separar">
            <td colspan="2"><input type="text" name="arsmutrabajo" id="arsmutrabajo" class="textog" maxlength="60"></td>
            <td></td>
            <td colspan="2"><input type="text" name="arsmrtrabajo" id="arsmrtrabajo" class="textog" maxlength="60"></td>
          </tr>

          <tr>
            <th colspan="5" align="left">DATOS DEL CONYUGE</th>
          </tr>

          <tr>
            <td><label>N° DE DNI</label></td>
            <td><label></label></td>
            <td><label>APELLIDO PATERNO</label></td>
            <td><label>APELLIDO MATERNO</label></td>
            <td><label>NOMBRES</label></td>
          </tr>

          <tr class="separar">
            <td><input type="text" name="arsmcdni" id="arsmcdni" class="textop" maxlength="8" pattern="[0-9]+"></td>
            <td></td>
            <td><input type="text" name="arsmcapaterno" id="arsmcapaterno" class="textom" maxlength="20" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsmcamaterno" id="arsmcamaterno" class="textom" maxlength="20" pattern="[A-Za-z\s]+"></td>
            <td><input type="text" name="arsmcnombres" id="arsmcnombres" class="textom" maxlength="20" pattern="[A-Za-z\s]+"></td>
          </tr>

          <tr>
            <td><label>ANALISTA</label></td>
            <td><label></label></td>
            <td><label>AFILIACION</label></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrsmguardar" class="bsistema"><img src="../recursos/bguardar.png"/><span>GUARDAR</span></button></td>
            <td rowspan="2" style="text-align: center;"><button id="bmodrsmcerrar" class="bsistema"><img src="../recursos/bcancelar.png"/><span>CANCELAR</span></button></td>
          </tr>
          <tr>
            <td colspan="2"><select name="arsmanalista" id="arsmanalista" class="opciong">
            <?php
            $BD_conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");
            $query = pg_query("select idtrabajador as analista, CONCAT(nombres,' ',apaterno,' ',amaterno) as nombre from ttrabajador;");
            $tregistros = pg_numrows($query);
            for($i=1;$i<=$tregistros; $i++){
              $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
              echo "<option value='".$registros[analista]."'>".$registros[nombre]."</option>";
            }
            ?></select></td>
            <td>S/. <input type="text" name="arsmafiliacion" id="arsmafiliacion" class="textop"></td>
          </tr>
        </table>   
      </div>
    </div>  
  </div>