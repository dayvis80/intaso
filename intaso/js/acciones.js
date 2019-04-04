var dtable;
var espanol={
   "sProcessing":     "Procesando...",
   "sLengthMenu":     "MOSTRAR _MENU_ REGISTROS",
   "sZeroRecords":    "No se encontraron resultados",
   "sEmptyTable":     "Ningún dato disponible en esta tabla",
   "sInfo":           "Registros Del _START_ al _END_ de _TOTAL_ Registros",
   "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
   "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
   "sInfoPostFix":    "",
   "sSearch":         "BUSCAR:",
   "sUrl":            "",
   "sInfoThousands":  ",",
   "sLoadingRecords": "Cargando...",
   "oPaginate": {
      "sFirst":    "Primero",
      "sLast":     "Último",
      "sNext":     "Siguiente",
      "sPrevious": "Anterior"
   },
   "oAria": {
      "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
      "sSortDescending": ": Activar para ordenar la columna de manera descendente"
   },
   "decimal": ".",
   "thousands": " "
};
var dtlanguaje = espanol;
var columna,dtcolumna,coldefinir,dtcoldefinir;
var dturl,datos,dtdatos,dtdom,dttoolbar;
var row_num;

$(document).ready(function(){

function cargardata(){
   dtable = $('#tdatos').DataTable({
      "destroy":true,
      "ajax":{
         "method":"POST",
         "url":dturl,
         "data": dtdatos
      },
      "columns": dtcolumna,
      "columnDefs": dtcoldefinir,
      "order": [[ 1, 'asc' ]],
      "sPaginationType": "full_numbers",
      "language": dtlanguaje,
      "dom" : dtdom,
      "buttons":['excel','csv','pdf']
   });
  
   dtable.on('order.dt search.dt', function() {
      dtable.column(0, {
      search: 'applied',
      order: 'applied'
      }).nodes().each(function(cell, i) {
      cell.innerHTML = i + 1;
      });
   }).draw();
   $("div.toolbar").html(dttoolbar);  
}


function rsocio(afiliado){
    dturl="../phps/datasocio.php";
    datos={
          "tipo": "DATA",
          "afiliacion" : afiliado
          };
    dtdatos=datos;
    columna=[ {"data": null },
          {"data":"id"},
          {"data":"nsocio"},
          {"data":"tipo"},
          {"data":"dni"},
          {"data":"socio"},
          {"data":"afiliacion"},
          {"data":"registro"},
          {"data":"afiliado"},
          {"data":"usuario"},
          {"defaultContent":"<button id='bsreditar' class='bacciones'>EDITAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "25px" },
          { "targets": 4, "width": "75px" },
          { "targets": 5, "width": "240px" },
          { "targets": 6, "visible": false },
          { "targets": 7, "width": "110px" },
          { "targets": 8, "width": "80px" },
          { "targets": 9, "width": "240px" },
          { "targets": 10, "width": "80px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5)){
       dtdom='<"toolbar">lBfrtip';
    }else{
       dtdom='<"toolbar"><lf<t>ip>';
    }
    dttoolbar='<button id="brsnuevo" class="bsistema"><img src="../recursos/bsocio.png"/><span>NUEVO</span></button>';
}


function asocio(){
    dturl="../phps/datasocio.php";
    datos={
          "tipo": "DATA",
          "afiliacion" : 'NO'
          };
    dtdatos=datos;
    columna=[ {"data": null },
          {"data":"id"},
          {"data":"nsocio"},
          {"data":"tipo"},
          {"data":"dni"},
          {"data":"socio"},
          {"data":"afiliacion"},
          {"data":"registro"},
          {"data":"afiliado"},
          {"data":"usuario"},
          {"defaultContent":"<button id='bsaafiliar' class='bacciones'>AFILIAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "30px" },
          { "targets": 4, "width": "100px" },
          { "targets": 5, "width": "250px" },
          { "targets": 6, "width": "100px" },
          { "targets": 7, "width": "120px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "visible": false },
          { "targets": 10, "width": "80px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5)){
       dtdom='lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }    
    dttoolbar='';
}

function csocio(){
    dturl="../phps/datasocio.php";
    datos={
          "tipo": "DATA",
          "afiliacion" : 'SI'
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"id"},
          {"data":"nsocio"},
          {"data":"tipo"},
          {"data":"dni"},
          {"data":"socio"},
          {"data":"afiliacion"},
          {"data":"registro"},
          {"data":"afiliado"},
          {"data":"usuario"},
          {"defaultContent":"<button id='bsccertificado' class='bacciones'>CERTIFICADO</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "30px" },
          { "targets": 4, "width": "100px" },
          { "targets": 5, "width": "250px" },
          { "targets": 6, "visible": false },
          { "targets": 7, "width": "120px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "visible": false },
          { "targets": 10, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function aextracto(){
    dturl="../phps/dataahorro.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"idsocio"},
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"ahorro"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"fapertura"},
          {"data":"fvencimiento"},
          {"data":"saldo"},
          {"defaultContent":"<button id='baextracto' class='bacciones'>EXTRACTO</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "280px" },
          { "targets": 4, "width": "80px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "50px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "85px" },
          { "targets": 10, "width": "95px" },
          { "targets": 11, "visible": false },
          { "targets": 12, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function acontrato(){
    dturl="../phps/dataahorro.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"idsocio"},
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"ahorro"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"fapertura"},
          {"data":"fvencimiento"},
          {"data":"saldo"},
          {"defaultContent":"<button id='bacontrato' class='bacciones'>CONTRATO</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "280px" },
          { "targets": 4, "width": "80px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "50px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "85px" },
          { "targets": 10, "width": "95px" },
          { "targets": 11, "visible": false },
          { "targets": 12, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function adeposito(){
    dturl="../phps/dataahorro.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"idsocio"},
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"ahorro"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"fapertura"},
          {"data":"fvencimiento"},
          {"data":"estado"},
          {"data":"saldo"},
          {"defaultContent":"<button id='bcdmostrar' class='bacciones'>DEPOSITAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "290px" },
          { "targets": 4, "width": "60px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "40px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "80px" },
          { "targets": 10, "visible": false },
          { "targets": 11, "width": "60px" },
          { "targets": 12, "width": "60px" },
          { "targets": 13, "width": "80px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5)){
       dtdom='lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }
    dttoolbar='';
}


function aretiro(){
    dturl="../phps/dataahorro.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"idsocio"},
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"ahorro"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"fapertura"},
          {"data":"fvencimiento"},
          {"data":"estado"},
          {"data":"saldo"},
          {"defaultContent":"<button id='bcrmostrar' class='bacciones'>RETIRAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "290px" },
          { "targets": 4, "width": "60px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "40px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "80px" },
          { "targets": 10, "visible": false },
          { "targets": 11, "width": "60px" },
          { "targets": 12, "width": "60px" },
          { "targets": 13, "width": "80px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5)){
       dtdom='<"toolbar">lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }
    dttoolbar='';
}


function paprobar(){
    dturl="../phps/dataprestamo.php";
    datos={
          "tipo": "DATA",
          "aprobado" : 'NO',
          "estado":'EN ESPERA'
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"prestamo"},
          {"data":"monto"},
          {"data":"cuotas"},
          {"data":"vcuota"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"fecpago"},
          {"data":"ftermino"},
          {"defaultContent":"<button id='bcpaprobar' class='bacciones'>APROBAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "width": "280px" },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "110px" },
          { "targets": 4, "width": "40px" },
          { "targets": 5, "width": "30px" },
          { "targets": 6, "width": "30px" },
          { "targets": 7, "width": "30px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "70px" },
          { "targets": 10, "width": "70px" },
          { "targets": 11, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function pextracto(){
    dturl="../phps/dataprestamo.php";
    datos={
          "tipo": "DATA",
          "aprobado" : 'SI',
          "estado" : 'EN PROCESO'
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"prestamo"},
          {"data":"monto"},
          {"data":"cuotas"},
          {"data":"vcuota"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"fecpago"},
          {"data":"ftermino"},
          {"data":"estado"},
          {"defaultContent":"<button id='bpemostrar' class='bacciones'>EXTRACTO</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "width": "260px" },
          { "targets": 2, "width": "50px" },
          { "targets": 3, "width": "100px" },
          { "targets": 4, "width": "40px" },
          { "targets": 5, "width": "30px" },
          { "targets": 6, "width": "30px" },
          { "targets": 7, "width": "30px" },
          { "targets": 8, "width": "30px" },
          { "targets": 9, "width": "80px" },
          { "targets": 10, "width": "90px" },
          { "targets": 11, "visible": false },
          { "targets": 12, "width": "80px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5) || ($('#ltipotrabajador').text()==10) || ($('#ltipotrabajador').text()==15)){
       dtdom='lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }
    dttoolbar='';
}


function pduplicado(){
    dturl="../phps/dataprestamo.php";
    datos={
          "tipo": "DATA",
          "aprobado" : 'SI',
          "estado" : 'EN PROCESO'
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"prestamo"},
          {"data":"monto"},
          {"data":"cuotas"},
          {"data":"vcuota"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"fecpago"},
          {"data":"ftermino"},
          {"defaultContent":"<button id='bpchoja' class='bacciones'>H. RESUMEN</button><button id='bpccronograma' class='bacciones'>CRONOGRAMA</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "width": "210px" },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "100px" },
          { "targets": 4, "width": "40px" },
          { "targets": 5, "width": "30px" },
          { "targets": 6, "width": "30px" },
          { "targets": 7, "visible": false },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "70px" },
          { "targets": 10, "width": "70px" },
          { "targets": 11, "width": "190px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}

function pdesembolso(){
    dturl="../phps/dataprestamo.php";
    datos={
          "tipo": "DATA",
          "aprobado" : 'SI',
          "estado" : 'EN ESPERA'
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"prestamo"},
          {"data":"monto"},
          {"data":"cuotas"},
          {"data":"vcuota"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"fecpago"},
          {"data":"ftermino"},
          {"defaultContent":"<button id='bcdmostrar' class='bacciones'>MOSTRAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "width": "280px" },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "110px" },
          { "targets": 4, "width": "40px" },
          { "targets": 5, "width": "30px" },
          { "targets": 6, "width": "30px" },
          { "targets": 7, "width": "30px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "70px" },
          { "targets": 10, "width": "70px" },
          { "targets": 11, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function cboveda(){
    dturl="../phps/databoveda.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"idcaja"},
          {"data":"cajero"},
          {"data":"trabajador"},
          {"data":"fecha"},
          {"data":"efectivo"},
          {"data":"abierto"},
          {"defaultContent":"<button id='bcbhabilitar' class='bacciones'>HABILITAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "280px" },
          { "targets": 3, "visible": false },
          { "targets": 4, "width": "120px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "80px" },
          { "targets": 7, "width": "180px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function capertura(filtrado){
    dturl="../phps/datacaja.php";
    datos={
          "tipo": "DATA",
          "filtrado" : filtrado
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"id"},
          {"data":"cajero"},
          {"data":"apertura"},
          {"data":"cierre"},
          {"data":"minicial"},
          {"data":"mfinal"},
          {"data":"mcierre"},
          {"data":"abierto"},
          {"defaultContent":"<button id='bcamovimientos' class='bacciones'>MOVIMIENTOS</button><button id='bcacerrar' class='bacciones'>CERRAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "240px" },
          { "targets": 4, "width": "100px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "55px" },
          { "targets": 8, "width": "55px" },
          { "targets": 9, "width": "40px" },
          { "targets": 10, "width": "180px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5) || ($('#ltipotrabajador').text()==10)){
       dtdom='<"toolbar">lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }
    dttoolbar='<button id="bcanuevo" class="bsistema"><img src="../recursos/bcaja.png"/><span>NUEVO</span></button>';
}


function cbilletaje(filtrado){
    dturl="../phps/datacaja.php";
    datos={
          "tipo": "BILL",
          "filtrado" : filtrado
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"id"},
          {"data":"idtrabajador"},
          {"data":"cajero"},
          {"data":"fbilletaje"},
          {"data":"stotal"},
          {"data":"fregistro"},
          {"defaultContent":"<button id='bcbdetalles' class='bacciones'>VER</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "280px" },
          { "targets": 4, "width": "120px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "160px" },
          { "targets": 7, "width": "140px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5) || ($('#ltipotrabajador').text()==10)){
       dtdom='<"toolbar">lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }
    dttoolbar='<button id="bcbregistrar" class="bsistema"><img src="../recursos/bcaja.png"/><span>REGISTRAR</span></button>';
}


function cpagocuota(){
    dturl="../phps/datapagocuota.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"id"},
          {"data":"socio"},
          {"data":"descripcion"},
          {"data":"monto"},
          {"data":"fprestamo"},
          {"data":"plazo"},
          {"data":"estado"},
          {"data":"cuenta"},
          {"defaultContent":"<button id='bcpgdetalles' class='bacciones'>PAGAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "280px" },
          { "targets": 4, "width": "120px" },
          { "targets": 5, "width": "70px" },
          { "targets": 6, "width": "80px" },
          { "targets": 7, "width": "60px" },
          { "targets": 8, "width": "80px" },
          { "targets": 9, "width": "50px" },
          { "targets": 10, "width": "80px" }];
    dtcoldefinir=coldefinir;
    if(($('#ltipotrabajador').text()==1) || ($('#ltipotrabajador').text()==2) || ($('#ltipotrabajador').text()==5)){
       dtdom='lBfrtip';
    }else{
       dtdom='<lf<t>ip>';
    }
    dttoolbar='';
}


function cpagototal(){
    dturl="../phps/datapagocuota.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"id"},
          {"data":"socio"},
          {"data":"descripcion"},
          {"data":"monto"},
          {"data":"fprestamo"},
          {"data":"plazo"},
          {"data":"estado"},
          {"data":"cuenta"},
          {"defaultContent":"<button id='bcpgtodetalles' class='bacciones'>PAGO TOTAL</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "280px" },
          { "targets": 4, "width": "120px" },
          { "targets": 5, "width": "70px" },
          { "targets": 6, "width": "80px" },
          { "targets": 7, "width": "60px" },
          { "targets": 8, "width": "80px" },
          { "targets": 9, "width": "50px" },
          { "targets": 10, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function ccajachica(){
    dturl="../phps/datacajachica.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"idcajachica"},
          {"data":"periodo"},
          {"data":"monto"},
          {"data":"saldo"},
          {"data":"detalle"},
          {"data":"estado"},
          {"defaultContent":"<button id='bcccregistro' class='bacciones'>REGISTRAR E/I</button><button id='bcccmovimientos' class='bacciones'>MOVIMIENTOS</button><button id='bccccerrar' class='bacciones'>CERRAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "150px" },
          { "targets": 3, "width": "80px" },
          { "targets": 4, "width": "80px" },
          { "targets": 5, "width": "150px" },
          { "targets": 6, "width": "80px" },
          { "targets": 7, "width": "280px" }];
    dtcoldefinir=coldefinir;
    dtdom='<"toolbar"><lf<t>ip>';
    dttoolbar='<button id="bcccnuevo" class="bsistema"><img src="../recursos/bnuevo.png"/><span>NUEVO</span></button>';
}


function cineg(tipomov){
    dturl="../phps/dataineg.php";
    datos={
          "tipo": "DATA",
          "tipomov" : tipomov
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"idineg"},
          {"data":"detalle"},
          {"data":"trabajador"},
          {"data":"monto"},
          {"data":"tipodoc"},
          {"data":"numerodoc"},
          {"data":"fecha"},
          {"data":"observaciones"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "140px" },
          { "targets": 3, "width": "220px" },
          { "targets": 4, "width": "70px" },
          { "targets": 5, "width": "60px" },
          { "targets": 6, "width": "80px" },
          { "targets": 7, "width": "90px" },
          { "targets": 8, "width": "100px" }];
    dtcoldefinir=coldefinir;
    dtdom='<"toolbar"><lf<t>ip>';
    if(tipomov=='I'){
    dttoolbar='<button id="bcicnuevo" class="bsistema"><img src="../recursos/bingreso.png"/><span>INGRESOS</span></button>';
    }else{
    dttoolbar='<button id="bcecnuevo" class="bsistema"><img src="../recursos/begreso.png"/><span>EGRESOS</span></button>';
    }
}


function cduplicado(vfecha,vmovimiento){
    dturl="../phps/datamovimiento.php";
    datos={
          "tipo": "DATA",
          "flujo" : vmovimiento,
          "fecha" : vfecha
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"idmovimiento"},
          {"data":"socio"},
          {"data":"descripcion"},
          {"data":"cuenta"},
          {"data":"moneda"},
          {"data":"monto"},
          {"data":"fechamov"},
          {"data":"tipomov"}, 
          {"data":"operacion"},
          {"data":"numeromov"},
          {"data":"movimiento"},
          {"data":"pago"},          
          {"defaultContent":"<button id='bcdreimprimir' class='bacciones'>RE-IMPRIMIR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "270px" },
          { "targets": 3, "width": "130px" },
          { "targets": 4, "width": "50px" },
          { "targets": 5, "width": "30px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "80px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "60px" },
          { "targets": 10, "visible": false },
          { "targets": 11, "width": "80px" },
          { "targets": 12, "width": "50px" },
          { "targets": 13, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function manulacion(vfecha,vmovimiento){
    dturl="../phps/datamovimiento.php";
    datos={
          "tipo": "DATA",
          "flujo" : vmovimiento,
          "fecha" : vfecha
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"idmovimiento"},
          {"data":"socio"},
          {"data":"descripcion"},
          {"data":"cuenta"},
          {"data":"moneda"},
          {"data":"monto"},
          {"data":"fechamov"},
          {"data":"tipomov"}, 
          {"data":"operacion"},
          {"data":"numeromov"},
          {"data":"movimiento"},
          {"data":"pago"},          
          {"defaultContent":"<button id='bmaoperacion' class='bacciones'>ANULAR OP.</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "270px" },
          { "targets": 3, "width": "130px" },
          { "targets": 4, "width": "50px" },
          { "targets": 5, "width": "30px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "width": "80px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "60px" },
          { "targets": 10, "visible": false },
          { "targets": 11, "width": "80px" },
          { "targets": 12, "width": "50px" },
          { "targets": 13, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function mtrabajador(){
    dturl="../phps/datatrabajador.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"dni"},
          {"data":"trabajador"},
          {"data":"apaterno"},
          {"data":"amaterno"},
          {"data":"nombres"},
          {"data":"celular"},
          {"data":"descripcion"},
          {"data":"registro"},
          {"data":"agencia"},
          {"data":"estado"},
          {"data":"sucursal"},
          {"defaultContent":"<button id='bmteditar' class='bacciones'>MODIFICAR</button><button id='bmteliminar' class='bacciones'>DAR BAJA</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "35px" },
          { "targets": 3, "width": "200px" },
          { "targets": 4, "visible": false },
          { "targets": 5, "visible": false },
          { "targets": 6, "visible": false },
          { "targets": 7, "width": "55px" },
          { "targets": 8, "width": "100px" },
          { "targets": 9, "width": "50px" },
          { "targets": 10, "width": "55px" },
          { "targets": 11, "width": "50px" },
          { "targets": 12, "visible": false },
          { "targets": 13, "width": "180px" }];
    dtcoldefinir=coldefinir;
    dtdom='<"toolbar">lBfrtip';
    dttoolbar='<button id="brtnuevo" class="bsistema"><img src="../recursos/btrabajador.png"/><span>NUEVO</span></button>';
}


function musuario(){
    dturl="../phps/datausuario.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"trabajador"},
          {"data":"usuario"},
          {"data":"contrasena"},
          {"data":"idtrabajador"},
          {"defaultContent":"<button id='bmuresetpass' class='bacciones'>RESET PASS</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "350px" },
          { "targets": 3, "width": "100px" },
          { "targets": 4, "visible": false },
          { "targets": 5, "width": "50px" },
          { "targets": 6, "width": "100px" }];
    dtcoldefinir=coldefinir;
    dtdom='<"toolbar">lBfrtip';
    dttoolbar='<button id="brunuevo" class="bsistema"><img src="../recursos/busuario.png"/><span>NUEVO</span></button>';
}


function mtipoprestamo(){
    dturl="../phps/datatipoprestamo.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"descripcion"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"comision"},
          {"data":"mora"},
          {"data":"montomin"},
          {"data":"montomax"},
          {"defaultContent":"<button id='btpeditar' class='bacciones'>MODIFICAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "260px" },
          { "targets": 3, "width": "65px" },
          { "targets": 4, "width": "65px" },
          { "targets": 5, "width": "65px" },
          { "targets": 6, "width": "65px" },
          { "targets": 7, "width": "65px" },
          { "targets": 8, "width": "65px" },
          { "targets": 9, "width": "65px" },
          { "targets": 10, "width": "100px" }];
    dtcoldefinir=coldefinir;
    dtdom='<"toolbar"><lf<t>ip>';
    dttoolbar='<button id="brtpnuevo" class="bsistema"><img src="../recursos/bdispositivo.png"/><span>NUEVO</span></button>';
}


function mtipoahorro(){
    dturl="../phps/datatipoahorro.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"descripcion"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"montomin"},
          {"data":"montomax"},
          {"defaultContent":"<button id='btaeditar' class='bacciones'>MODIFICAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "width": "180px" },
          { "targets": 3, "width": "110px" },
          { "targets": 4, "width": "80px" },
          { "targets": 5, "width": "80px" },
          { "targets": 6, "width": "120px" },
          { "targets": 7, "width": "120px" },
          { "targets": 8, "width": "150px" }];
    dtcoldefinir=coldefinir;
    dtdom='<"toolbar"><lf<t>ip>';
    dttoolbar='<button id="brtanuevo" class="bsistema"><img src="../recursos/ahorro.png"/><span>NUEVO</span></button>';
}


function mccartera(){
    dturl="../phps/dataprestamo.php";
    datos={
          "tipo": "CARTE",
          "aprobado" : 'SI',
          "estado" : 'EN PROCESO'
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"idprestamo"},
          {"data":"idsocio"},
          {"data":"socio"},
          {"data":"nprestamo"},
          {"data":"descripcion"},
          {"data":"monto"},
          {"data":"analista"},
          {"data":"nanalista"},
          {"defaultContent":"<button id='bmccartera' class='bacciones'>CAMBIAR</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "240px" },
          { "targets": 4, "width": "50px" },
          { "targets": 5, "width": "130px" },
          { "targets": 6, "width": "50px" },
          { "targets": 7, "visible": false },
          { "targets": 8, "width": "210px" },
          { "targets": 9, "width": "90px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function mbahorro(){
    dturl="../phps/dataahorro.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"idsocio"},
          {"data":"socio"},
          {"data":"cuenta"},
          {"data":"ahorro"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"fapertura"},
          {"data":"fvencimiento"},
          {"data":"saldo"},
          {"data":"estado"},
          {"defaultContent":"<button id='bmbahorro' class='bacciones'>DES-BLOQUEO</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "270px" },
          { "targets": 4, "width": "60px" },
          { "targets": 5, "width": "100px" },
          { "targets": 6, "width": "35px" },
          { "targets": 7, "width": "35px" },
          { "targets": 8, "visible": false },
          { "targets": 9, "width": "80px" },
          { "targets": 10, "width": "80px" },
          { "targets": 11, "width": "40px" },
          { "targets": 12, "width": "50px" },
          { "targets": 13, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}


function mdescuento(){
    dturl="../phps/datapagocuota.php";
    datos={
          "tipo": "DATA"
          };
    dtdatos=datos;
    columna=[{"data": null },
          {"data":"n"},
          {"data":"id"},
          {"data":"socio"},
          {"data":"descripcion"},
          {"data":"monto"},
          {"data":"fprestamo"},
          {"data":"plazo"},
          {"data":"estado"},
          {"data":"cuenta"},
          {"defaultContent":"<button id='bmdescuento' class='bacciones'>DESCUENTO</button>"}];
    dtcolumna = columna;
    coldefinir=[{ "searchable": false, "orderable": false, "targets": 0, "width": "20px" },
          { "targets": 1, "visible": false },
          { "targets": 2, "visible": false },
          { "targets": 3, "width": "280px" },
          { "targets": 4, "width": "120px" },
          { "targets": 5, "width": "70px" },
          { "targets": 6, "width": "80px" },
          { "targets": 7, "width": "60px" },
          { "targets": 8, "width": "80px" },
          { "targets": 9, "width": "50px" },
          { "targets": 10, "width": "80px" }];
    dtcoldefinir=coldefinir;
    dtdom='<lf<t>ip>';
    dttoolbar='';
}
// ------------ INICIO FUNCIONES PAGINA INICIO DE SESION ------------//
$('#bloingresar').click(function(evento){
  evento.preventDefault();
    var vusuario = $('#elousuario').val();
    var vpassword = $('#elopassword').val();
    //var url = rutaphp+'iniciar_sesion.php';
    var blanco = vusuario.length * vpassword.length;
    if(blanco>0){
        $.ajax({
            type: 'POST',
            url: "../phps/datasesion.php",
            data: 'tipo=ING'+'&usuario='+vusuario+'&password='+vpassword,
            success: function(valor){
              if(valor == 1){
                  $('#dloerror').addClass('error').html('NOMBRE DE USUARIO INCORRECTO').show(50).delay(1500).hide(200);
                  $('#elousuario').focus();
                  return false;
              }else if(valor == 2){
                $('#dloerror').addClass('error').html('PASSWORD INCORRECTO').show(50).delay(1500).hide(200);
                $('#elopassword').focus();
                return false;
              }else{
                  document.location.href = '../paginas/principal.php';
                  //alert("Password Correcto");
              }
            }
        });
        return false;
    }else{
        $('#dloerror').addClass('error').html('FALTA INGRESAR DATOS').show(100).delay(1500).hide(200);
    }
});

//Tecla enter en texto password llama funcion inicio
$("#elopassword").keypress(function(e) {
   var code = (e.keyCode ? e.keyCode : e.which);
   if(code==13){
      $('#bloingresar').click();
   }
});


$('#blosalir').click(function(evento){
  evento.preventDefault();
    $.ajax({
      url: "../phps/datasesion.php",
      type: "POST",
      data: 'tipo=SAL',
      success: function(valor) {
          alert(valor);
          document.location.href = '../paginas/login.php';
      }
    });
});
// ------------ FIN FUNCIONES PAGINA INICIO DE SESION ---------------//
//-------------------------------------------------------------------//
// -------------- INICIO FUNCIONES PAGINA MENU ----------------------//
$('.opcmenu').click(function(evento){
  evento.preventDefault();
  var opcion = $(this).children('h3').attr("title");
  var imagen = "img"+opcion;
  if (window.document.getElementById(opcion).style.display == 'none') {
      $(".opcionesboton").each(function (index) { 
         $(this).css("display","none");
      })
      $(".imagenmenu").each(function (index) { 
         $(this).attr("src","../recursos/expander.png")
      }) 
      window.document.getElementById(opcion).style.display = 'block';
      document.getElementById(imagen).src = "../recursos/contraer.png";
  } else {
      window.document.getElementById(opcion).style.display = 'none';
      document.getElementById(imagen).src = "../recursos/expander.png";
  } 
});

        // INICIO MENU OPCIONES SOCIO //
$('#omesocioregistrar').click(function(evento){
  evento.preventDefault();
  var afiliado='NO';
  $.post('socioregistrar.php',function(data){
    $('#paginas').html(data);
    rsocio(afiliado);
    cargardata();
  });
});


$('#omesocioafiliar').click(function(evento){
  evento.preventDefault();
  $.post('socioafiliar.php',function(data){
    $('#paginas').html(data);
    asocio();
    cargardata();
  });
});


$('#omesocioactividad').click(function(evento){
  evento.preventDefault();
   $.post('socioactividad.php',function(data){
      $('#paginas').html(data);
   });
});


$('#omesociocertificado').click(function(evento){
  evento.preventDefault();
  $.post('sociocertificado.php',function(data){
    $('#paginas').html(data);
    csocio();
    cargardata();
  });
});
          //    FIN MENU OPCIONES SOCIO   //

          // INICIO MENU OPCIONES AHORROS //
$('#omeahorrosnuevo').click(function(evento){
  evento.preventDefault();
  $.post('ahorronuevo.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omeahorrosextracto').click(function(evento){
   evento.preventDefault();
   $.post('ahorroextracto.php',function(data){
      $('#paginas').html(data);
      aextracto();
      cargardata();
   });
});


$('#omeahorroscertificado').click(function(evento){
   evento.preventDefault();
   $.post('ahorrocertificado.php',function(data){
      $('#paginas').html(data);
      acontrato();
      cargardata();
   });
});
          //   FIN OPCIONES AHORROS  //

          // INICIO OPCIONES PRESTAMOS //
$('#omeprestamosnuevo').click(function(evento){
  evento.preventDefault();
  $.post('prestanuevo.php',function(data){
    $('#paginas').html(data);
  });
});

$('#omeprestamosaprobar').click(function(evento){
  evento.preventDefault();
  $.post('prestaaprobar.php',function(data){
    $('#paginas').html(data);
    paprobar();
    cargardata();
  });
});

$('#omeprestamosextracto').click(function(evento){
  evento.preventDefault();
   $.post('prestaextracto.php',function(data){
      $('#paginas').html(data);
      pextracto();
      cargardata();
   });
});


$('#omeprestamosscore').click(function(evento){
  evento.preventDefault();
  alert('Prestamos Score');
});


$('#omeprestamosduplicado').click(function(evento){
  evento.preventDefault();
  $.post('prestaduplicado.php',function(data){
    $('#paginas').html(data);
      pduplicado();
      cargardata();
  });
});
          //  FIN OPCIONES PRESTAMOS   //
          //  INICIO  OPCIONES  CAJA   //
$('#omecajadesembolso').click(function(evento){
  evento.preventDefault();
  $.post('cajadesembolso.php',function(data){
    $('#paginas').html(data);
    pdesembolso();
    cargardata();
  });
});


$('#omecajaboveda').click(function(evento){
  evento.preventDefault();
  $.post('cajaboveda.php',function(data){
    $('#paginas').html(data);
    cboveda();
    cargardata();
  });
});


$('#omecajaapertura').click(function(evento){
  evento.preventDefault();
  var filtrado='VS';
  $.post('cajaapertura.php',function(data){
    $('#paginas').html(data);
    capertura(filtrado);
    cargardata();
  });
});


$('#omecajapagocuota').click(function(evento){
  evento.preventDefault();
  $.post('cajapagocuota.php',function(data){
    $('#paginas').html(data);
    cpagocuota();
    cargardata();
  });
});


$('#omecajadeposito').click(function(evento){
   evento.preventDefault();
   $.post('cajadeposito.php',function(data){
      $('#paginas').html(data);
      adeposito();
      cargardata();
   });
});


$('#omecajaretiro').click(function(evento){
   evento.preventDefault();
   $.post('cajaretiro.php',function(data){
      $('#paginas').html(data);
      aretiro();
      cargardata();
   });
});


$('#omecajaretiroanticipado').click(function(evento){
  evento.preventDefault();
  alert('OPCION CAJA RETIRO ANTICIPADO');
});


$('#omecajarecaudar').click(function(evento){
  evento.preventDefault();
  $.post('cajarecaudar.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omecajabilletaje').click(function(evento){
  evento.preventDefault();
  var filtrado='VS';
  $.post('cajabilletaje.php',function(data){
    $('#paginas').html(data);
    cbilletaje(filtrado);
    cargardata();
  });
});


$('#omecajacajachica').click(function(evento){
  evento.preventDefault();
  $.post('cajacajachica.php',function(data){
    $('#paginas').html(data);
    ccajachica();
    cargardata();
  });
});


$('#omecajaingresoscaja').click(function(evento){
  evento.preventDefault();
  var tipomov='I';
  $.post('cajaingresos.php',function(data){
    $('#paginas').html(data);
    cineg(tipomov);
    cargardata();
  });
});


$('#omecajaegresoscaja').click(function(evento){
  evento.preventDefault();
  var tipomov='E';
  $.post('cajaegresos.php',function(data){
    $('#paginas').html(data);
    cineg(tipomov);
    cargardata();
  });
});


$('#omecajaflujoxcajeros').click(function(evento){
  evento.preventDefault();
  $.post('cajafxcajeros.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omecajaflujoxrecaudador').click(function(evento){
  $.post('cajafxrecaudador.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omecajaflujodetallado').click(function(evento){
  evento.preventDefault();
  $.post('cajafxdetallado.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omecajadevolaporteprestamo').click(function(evento){
  evento.preventDefault();
  swal('OPCION CAJA DEVOLVER APORTES PRESTAMO');
});


$('#omecajapagointeres').click(function(evento){
  evento.preventDefault();
  $.post('cajapagointeres.php',function(data){
     $('#paginas').html(data);
//     cpagototal();
//     cargardata();
  });
});


$('#omecajapagototal').click(function(evento){
  evento.preventDefault();
  $.post('cajapagototal.php',function(data){
     $('#paginas').html(data);
     cpagototal();
     cargardata();
  });
});


$('#omecajaduplicado').click(function(evento){
  evento.preventDefault();
   $.post('cajaduplicado.php',function(data){
      $('#paginas').html(data);
   });
});

          //     FIN  OPCIONES  CAJA   //
          // INICIO OPCIONES REPORTES  //
$('#omerepoprestamos').click(function(evento){
  $.post('rptprestamos.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omerepoproductividad').click(function(evento){
  evento.preventDefault();
  $.post('reporteproductividad.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omereporecaudacion').click(function(evento){
  evento.preventDefault();
  $.post('rptrecaudar.php',function(data){
    $('#paginas').html(data);
  });
});

          //   FIN OPCIONES REPORTES   //
          // INICIO OPCIONES GESTION MORA //
$('#omegmorareportemora').click(function(evento){
  evento.preventDefault();
   $.post('gmorarmora.php',function(data){
      $('#paginas').html(data);
   });
});


$('#omegmoramorosos').click(function(evento){
  evento.preventDefault();
   $.post('gmoramorosos.php',function(data){
      $('#paginas').html(data);
   });
});


$('#omegmoracobranzas').click(function(evento){
  evento.preventDefault();
  alert('Gestion Mora Cobranzas');
});
          //   FIN OPCIONES GESTION MORA   //

          // INICIO OPCIONES CONTABILIDAD  //
$('#omecontalventas').click(function(evento){
  evento.preventDefault();
  alert('Contabilidad Libro Ventas');
});


$('#omecontalcompras').click(function(evento){
  evento.preventDefault();
  alert('Contabilidad Libro Compras');
});
          //   FIN OPCIONES CONTABILIDAD   //

          // INICIO OPCIONES MANTENIMIENTO //
$('#omemanteaoperaciones').click(function(evento){
  evento.preventDefault();
   $.post('manteanulacion.php',function(data){
      $('#paginas').html(data);
   });
});


$('#omemantetrabajador').click(function(evento){
  evento.preventDefault();
  $.post('mantetrabajador.php',function(data){
    $('#paginas').html(data);
    mtrabajador();
    cargardata();
  });
});


$('#omemanteusuario').click(function(evento){
  evento.preventDefault();
  $.post('manteusuario.php',function(data){
    $('#paginas').html(data);
    musuario();
    cargardata();
  });
});


$('#omemantepinteresa').click(function(evento){
  evento.preventDefault();
  alert('Mantenimiento Pagar Interes Ahorro');
});


$('#omemantetipoprestamo').click(function(evento){
  evento.preventDefault();
  $.post('mantetipoprestamo.php',function(data){
    $('#paginas').html(data);
      mtipoprestamo();
      cargardata();
  });
});


$('#omemantetipoahorro').click(function(evento){
  evento.preventDefault();
  $.post('mantetipoahorro.php',function(data){
    $('#paginas').html(data);
    mtipoahorro();
    cargardata();
    //datostipoahorro();
  });
});


$('#omemanteccartera').click(function(evento){
   evento.preventDefault();
   $.post('manteccartera.php',function(data){
      $('#paginas').html(data);
      mccartera();
      cargardata();
   });
});


$('#omemantebahorro').click(function(evento){
  evento.preventDefault();
   $.post('mantebahorro.php',function(data){
      $('#paginas').html(data);
      mbahorro();
      cargardata();
   });
});


$('#omemantedmora').click(function(evento){
  evento.preventDefault();
  $.post('mantedescuento.php',function(data){
     $('#paginas').html(data);
     mdescuento();
     cargardata();
  });
});


$('#omemanteferiado').click(function(evento){
  evento.preventDefault();
  $.post('manteferiado.php',function(data){
    $('#paginas').html(data);
    datosferiado();
  });
});
          //   FIN OPCIONES MANTENIMIENTO  //

          //  INICIO OPCIONES SIMULADOR    //
$('#omesimuahorros').click(function(evento){
  evento.preventDefault();
  $.post('simuahorros.php',function(data){
    $('#paginas').html(data);
  });
});


$('#omesimucreditos').click(function(evento){
  evento.preventDefault();
    $.post('simucreditos.php',function(data){
    $('#paginas').html(data);
  });
});
          //    FIN OPCIONES SIMULADOR     //

          //  INICIO OPCIONES USUARIO    //
$('#omeusucambiar').click(function(evento){
  evento.preventDefault();
  $.post('usuccontrasena.php',function(data){
    $('#paginas').html(data);
  });
});
          //    FIN OPCIONES USUARIO     //


function datostipoahorro(){
    dtable = $('#tdemo').DataTable({
      "destroy":true,
      "ajax":{
        "method":"POST",
        "url":"../phps/datatipoahorro.php",
        "data": {
          "tipo": "CON"
          }
        },
      "columns":[
          {"data":"n"},
          {"data":"descripcion"},
          {"data":"plazo"},
          {"data":"tem"},
          {"data":"moneda"},
          {"data":"montomin"},
          {"data":"montomax"},
          {"defaultContent":"<button id='btaeditar' class='boton'>Modificar</button>"}
          ],
        "columnDefs": [
          { "targets": 0, "width": "25px" },
          { "targets": 1, "width": "180px" },
          { "targets": 2, "width": "110px" },
          { "targets": 3, "width": "80px" },
          { "targets": 4, "width": "80px" },
          { "targets": 5, "width": "120px" },
          { "targets": 6, "width": "120px" },
          { "targets": 7, "width": "150px" }
          ],
        "sPaginationType": "full_numbers",
        "dom" : '<"toolbar"><lf<t>ip>',
        "language": {
          "lengthMenu": "Mostrar _MENU_ registros",
              "zeroRecords": "No se encontraron registros",
          "info": "[Pagina _PAGE_] Mostrando del _START_ al _END_ de _TOTAL_ registros",
          "infoFiltered":   "(Filtrado de _MAX_ registros totales)",
            "infoEmpty": "No hay registros",
            "search": "Buscar:",
            "paginate": {
              "first":      "Primero",
              "last":       "Ultimo",
              "next":       "Siguiente",
              "previous":   "Anterior"
              }
          }
        });

      $("div.toolbar").html('<b>REGISTRO TIPOS DE AHORRO</b><button id="brtanuevo" class="boton"><span>Nuevo &nbsp;</span><img src="../recursos/bdispositivo.png"/></button>');
}


function datosferiado(){
    dtable = $('#tdemo').DataTable({
      "destroy":true,
      "bProcessing": true,
      "ajax":{
        "method":"POST",
        "url":"../phps/dataferiado.php",
        "data": {
          "tipo": "CON"
          }
        },
      "columns":[
          {"data":"n"},
          {"data":"dia"},
          {"data":"fecha"}
          ],
        "columnDefs": [
          { "targets": 0, "width": "25px" },
          { "targets": 1, "width": "250px" },
          { "targets": 2, "width": "120px" }
          ],
        "sPaginationType": "full_numbers",
        "dom" : '<"toolbar"><lf<t>ip>',
        "language": {
          "lengthMenu": "Mostrar _MENU_ registros",
              "zeroRecords": "No se encontraron registros",
          "info": "[Pagina _PAGE_] Mostrando del _START_ al _END_ de _TOTAL_ registros",
          "infoFiltered":   "(Filtrado de _MAX_ registros totales)",
            "infoEmpty": "No hay registros",
            "search": "Buscar:",
            "paginate": {
              "first":      "Primero",
              "last":       "Ultimo",
              "next":       "Siguiente",
              "previous":   "Anterior"
              }
          }
    });

      $("div.toolbar").html('<b>REGISTRO DE FERIADOS</b><button id="bmfnuevo" class="boton"><span>Nuevo &nbsp;</span><img src="../recursos/bdispositivo.png"/></button>');  
}


// ------------------ FIN FUNCIONES PAGINA MENU ---------------------//
//-------------------------------------------------------------------//
// ---------------- INICIO FUNCIONES OPCIONES SOCIO -----------------//

//INICIO DE FUNCIONES DE REGISTRO DE SOCIO
//Combo que permite seleccionar entre socios afiliados SI-NO
$('#central').on('change','#sropcafiliado',function(evento){ 
   var afiliado=$('#sropcafiliado').val();  
   $.post('socioregistrar.php',function(data){
      $('#paginas').html(data);
      rsocio(afiliado);
      cargardata();
  });
});

//REGISTRAR NUEVO SOCIO
// Muestra ventana Modal para registrar nuevo socio
$('#central').on('click','#brsnuevo',function(evento){ 
    document.getElementById('dmodsocionuevo').style.display='block';
}); 


$('#central').on('change','#arstipodoc',function(evento){ 

   if( $('#arstipodoc').val() == 'RUC' ){
      $('#arsnumerodoc').val('');
      $('#arsnumerodoc').attr('maxlength', 11);
      $('#arsapaterno').removeAttr("required");
      $('#arsapaterno').attr('disabled', true);
      $('#arsamaterno').removeAttr("required");
      $('#arsamaterno').attr('disabled', true);
      $('#lrsdresponsable').text('DATOS DEL REPRESENTANTE LEGAL');
      $('#lrsnombre').text('RAZON SOCIAL:');
      $('#lrsfnacimiento').text('FECHA DE CONSTITUCIÓN:');
      $('#lrsocupacion').text('RUBRO O ACTIVIDAD:');
      $('#arscdni').prop("required", true);
      $('#arscapaterno').prop("required", true);
      $('#arscamaterno').prop("required", true);
      $('#arscnombres').prop("required", true);
   }else{
      $('#arsnumerodoc').val('');
      $('#arsnumerodoc').attr('maxlength', 8);
      $('#arsapaterno').prop("required", true);
      $('#arsapaterno').attr('disabled', false);
      $('#arsamaterno').prop("required", true);
      $('#arsamaterno').attr('disabled', false);
      $('#lrsdresponsable').text('DATOS DEL CONYUGE');
      $('#lrsnombre').text('NOMBRES:');
      $('#lrsfnacimiento').text('FECHA DE NACIMIENTO:');
      $('#lrsocupacion').text('OCUPACION:');
      $('#arscdni').removeAttr("required");
      $('#arscapaterno').removeAttr("required");
      $('#arscamaterno').removeAttr("required");
      $('#arscnombres').removeAttr("required");
   }
});


// Boton para Guardar o Registrar nuevo socio
$('#central').on('click','#bmodrsguardar',function(evento){ 

   if( $('#arstipodoc').val() == 'RUC' ){
     var blanco = ($('#arsnumerodoc').val()).length * ($('#arsnombres').val()).length * ($('#arsfnacimiento').val()).length * ($('#arstcelular').val()).length * ($('#arsocupacion').val()).length * ($('#arsdepartamento').val()).length * ($('#arsprovincia').val()).length * ($('#arsdistrito').val()).length * ($('#arsdireccion').val()).length * ($('#arsdireccion').val()).length * ($('#arsrdomicilio').val()).length * ($('#arsafiliacion').val()).length * ($('#arscdni').val()).length * ($('#arscapaterno').val()).length * ($('#arscamaterno').val()).length * ($('#arscnombres').val()).length;
   }else{
     var blanco = ($('#arsnumerodoc').val()).length * ($('#arsapaterno').val()).length * ($('#arsamaterno').val()).length * ($('#arsnombres').val()).length * ($('#arsfnacimiento').val()).length * ($('#arstcelular').val()).length * ($('#arsocupacion').val()).length * ($('#arsdepartamento').val()).length * ($('#arsprovincia').val()).length * ($('#arsdistrito').val()).length * ($('#arsdireccion').val()).length * ($('#arsdireccion').val()).length * ($('#arsrdomicilio').val()).length * ($('#arsafiliacion').val()).length;
   }

  if(blanco>0) {
      var datos='tipo=INS'+'&tipodoc='+$('#arstipodoc').val()+'&numerodoc='+$('#arsnumerodoc').val()+'&apaterno='+$('#arsapaterno').val()+'&amaterno='+$('#arsamaterno').val()+'&nombres='+$('#arsnombres').val()+'&nhijos='+$('#arsnhijos').val()+'&ecivil='+$('#arsecivil').val()+'&sexo='+$('#arssexo').val()+'&fnacimiento='+$('#arsfnacimiento').val()+'&tcelular='+$('#arstcelular').val()+'&temergencia='+$('#arstemergencia').val()+'&email='+$('#arsemail').val()+'&ocupacion='+$('#arsocupacion').val()+'&departamento='+$('#arsdepartamento').val()+'&provincia='+$('#arsprovincia').val()+'&distrito='+$('#arsdistrito').val()+'&direccion='+$('#arsdireccion').val()+'&tvivienda='+$('#arstvivienda').val()+'&mconstruccion='+$('#arsmconstruccion').val()+'&rdomicilio='+$('#arsrdomicilio').val()+'&utrabajo='+$('#arsutrabajo').val()+'&rtrabajo='+$('#arsrtrabajo').val()+'&cdni='+$('#arscdni').val()+'&capaterno='+$('#arscapaterno').val()+'&camaterno='+$('#arscamaterno').val()+'&cnombres='+$('#arscnombres').val()+'&analista='+$('#arsanalista').val()+'&afiliacion='+$('#arsafiliacion').val();

     $.ajax({
      url: "../phps/datasocio.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          swal(valor);
          $.post('socioregistrar.php',function(data){
            $('#paginas').html(data);
            var afiliado='NO';
            rsocio(afiliado);
            cargardata();
          });
          document.getElementById('dmodsocionuevo').style.display='none';
      }
    });
  }else{
    swal("EXISTEN CAMPOS OBLIGATORIOS EN BLANCO");
  }
});

//Boton para Cerrar ventana modal de Registro de Socio
$('#central').on('click','#bmodrscerrar',function(evento){ 
  document.getElementById('dmodsocionuevo').style.display='none';
});


//SOCIO EDITAR
$('#central').on('click','#bsreditar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=BSE'+'&dni='+data['dni']; //var dni = data['dni'];
  $("#arsmtipodoc").find('option:contains("'+data['tipo']+'")').prop('selected', true);
  //$('#arsmtipodoc').val(data['tipo']);
  $('#arsmnumerodoc').val(data['dni']);
  $('#arsmtipodoc').prop('disabled', true);
  $('#arsmnumerodoc').prop('disabled', true);

  $.ajax({
    url: "../phps/datasocio.php",
    type: "POST",
    data: datos,
    success: function(valor) {
        var arreglo = JSON.parse(valor); // ok
        $('#arsmapaterno').val(arreglo[0].apaterno);
        $('#arsmamaterno').val(arreglo[0].amaterno);
        $('#arsmnombres').val(arreglo[0].nombres);
        $("#arsmnhijos").find('option:contains("'+arreglo[0].numhijos+'")').prop('selected', true);
        $("#arsmecivil").find('option:contains("'+arreglo[0].ecivil+'")').prop('selected', true);
        $("#arsmsexo").find('option:contains("'+arreglo[0].sexo+'")').prop('selected', true);
        $('#arsmfnacimiento').val(arreglo[0].fnacimiento);
        $('#arsmtcelular').val(arreglo[0].tcelular);
        $('#arsmtemergencia').val(arreglo[0].temergencia);
        $('#arsmemail').val(arreglo[0].email);
        $('#arsmocupacion').val(arreglo[0].ocupacion);
        $('#arsmdepartamento').val(arreglo[0].departamento);
        $('#arsmprovincia').val(arreglo[0].provincia);
        $('#arsmdistrito').val(arreglo[0].distrito);
        $('#arsmdireccion').val(arreglo[0].direccion);
        $('#arsmrdomicilio').val(arreglo[0].referencia);
        $("#arsmtvivienda").find('option:contains("'+arreglo[0].tvivienda+'")').prop('selected', true);        
        $('#arsmmconstruccion').val(arreglo[0].mconstruccion);
        $('#arsmutrabajo').val(arreglo[0].utrabajo);
        $('#arsmrtrabajo').val(arreglo[0].rtrabajo);
        $('#arsmcdni').val(arreglo[0].cdni);
        $('#arsmcapaterno').val(arreglo[0].capaterno);
        $('#arsmcamaterno').val(arreglo[0].camaterno);
        $('#arsmcnombres').val(arreglo[0].cnombres);
        $('#arsmanalista').val(arreglo[0].analista);
        $('#arsmafiliacion').val(arreglo[0].mafiliacion);
        document.getElementById('dmodsociomodificar').style.display='block';
    }
  });
});


$('#central').on('click','#bmodrsmguardar',function(evento){ 
  var datos='tipo=ACT'+'&tipodoc='+$('#arsmtipodoc').val()+'&numerodoc='+$('#arsmnumerodoc').val()+'&apaterno='+$('#arsmapaterno').val()+'&amaterno='+$('#arsmamaterno').val()+'&nombres='+$('#arsmnombres').val()+'&nhijos='+$('#arsmnhijos').val()+'&ecivil='+$('#arsmecivil').val()+'&sexo='+$('#arsmsexo').val()+'&fnacimiento='+$('#arsmfnacimiento').val()+'&tcelular='+$('#arsmtcelular').val()+'&temergencia='+$('#arsmtemergencia').val()+'&email='+$('#arsmemail').val()+'&ocupacion='+$('#arsmocupacion').val()+'&departamento='+$('#arsmdepartamento').val()+'&provincia='+$('#arsmprovincia').val()+'&distrito='+$('#arsmdistrito').val()+'&direccion='+$('#arsmdireccion').val()+'&tvivienda='+$('#arsmtvivienda').val()+'&mconstruccion='+$('#arsmmconstruccion').val()+'&rdomicilio='+$('#arsmrdomicilio').val()+'&utrabajo='+$('#arsmutrabajo').val()+'&rtrabajo='+$('#arsmrtrabajo').val()+'&cdni='+$('#arsmcdni').val()+'&capaterno='+$('#arsmcapaterno').val()+'&camaterno='+$('#arsmcamaterno').val()+'&cnombres='+$('#arsmcnombres').val()+'&analista='+$('#arsmanalista').val()+'&afiliacion='+$('#arsmafiliacion').val();
  $.ajax({
    url: "../phps/datasocio.php",
    type: "POST",
    data: datos,
    success: function(valor) {
      alert(valor);
      $.post('socioregistrar.php',function(data){
         $('#paginas').html(data);
            var afiliado='NO';
            rsocio(afiliado);
            cargardata();
      });
    document.getElementById('dmodsociomodificar').style.display='none';
    }
  });
});


$('#central').on('click','#bmodrsmcerrar',function(evento){ 
  document.getElementById('dmodsociomodificar').style.display='none';
});


// SOCIO AFILIAR
$('#central').on('click','#bsaafiliar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  $('#lansocio').text(data['socio']);
  $('#lantipo').text(data['tipo']+' ');
  $('#landni').text(data['dni']);
  $('#lanmonto').text(data['afiliacion']);
  $('#lanidsocio').text(data['id']);
  document.getElementById('dmodsocioafiliar').style.display='block';
});


$('#central').on('click','#bmodsaafiliar',function(evento){ 
    var datos='tipo=AFI'+'&dni='+$('#landni').text()+'&monto='+$('#lanmonto').text()+'&idsocio='+$('#lanidsocio').text();
    $.ajax({
      url: "../phps/datasocio.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            swal('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmodsocioafiliar').style.display='none';
          }else{
            if(valor=='1'){
              alert('NO APERTURO CAJA PARA REALIZAR COBROS');
              document.getElementById('dmodsocioafiliar').style.display='none';
            }else{
              var arreglo = JSON.parse(valor); // ok
              var mensaje = arreglo[0];
              var vnmovimiento = arreglo[1];
              var vtipomov = arreglo[2];
              alert(mensaje);
              document.getElementById('dmodsocioafiliar').style.display='none';
              asocio();
              cargardata();
              $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
              $('#dcticketafiliar').html(data);
              document.getElementById('dticketafiliar').style.display='block';
              });
              var tab = window.open('../reportes/certificadosocio.php'+'?dni='+dni, '_blank');
            }
          }
      }
    });
});


$('#central').on('click','#bmodsacerrar',function(evento){ 
    document.getElementById('dmodsocioafiliar').style.display='none';
});


//SOCIO CERTIFICADO
$('#central').on('click','#bsccertificado',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var dni = data['dni'];
  var tab = window.open('../reportes/certificadosocio.php'+'?dni='+dni, '_blank');
  if(tab){
      tab.focus(); //ir a la pestaña
      //window.print();
  }else{
      alert('Certificado Bloqueado, Active las Ventanas Emergentes del Navegador (Popups) ');
      return false;
  }
  //window.open('../reportes/reporte.php', '_blank');
});

$('#central').on('click','#bsreditar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var dni = data['dni'];
  document.getElementById('dmodsociomodificar').style.display='block';
});


$('#central').on('click','#bmodrsmguardar',function(evento){ 
  document.getElementById('dmodsociomodificar').style.display='none';
});


$('#central').on('click','#bmodrsmcerrar',function(evento){ 
  document.getElementById('dmodsociomodificar').style.display='none';
});
// ---------------- FIN FUNCIONES OPCIONES SOCIO --------------------//
//-------------------------------------------------------------------//
// --------------- INICIO FUNCIONES OPCIONES AHORROS ----------------//
$('#central').on('change','#aantipoahorro',function(evento){ 
   //alert($('#apntipoprestamo').val());
 var cadena = $(this).val(),
    valores = cadena.split('&');
    $('#aantem').val(valores[3]);
    $('#aanplazo').val(valores[2]);
    $('#aanmoneda').val(valores[4]);
});


$('#central').on('click','#banbuscarsocio',function(evento){ 
  var blanco = ($('#aandni').val()).length;

  if(blanco>0) {
    var datos='tipo=BUS'+'&dni='+$('#aandni').val();
    $('#aanidsocio').val('');
    $('#aansocio').val('');
    $('#aandireccion').val('');
    $('#aantipo').val('');
     $.ajax({
      url: "../phps/datasocio.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='ESTE SOCIO NO SE ENCUENTRA REGISTRADO'){
            swal(valor);
          }
          if(valor=='ESTE SOCIO NO SE ENCUENTRA AFILIADO'){
            swal(valor);
          }
          arreglo = JSON.parse(valor);
          $('#aansocio').val(arreglo[0].socio);
          $('#aandireccion').val(arreglo[0].direccion);
          $('#aanidsocio').val(arreglo[0].idsocio);
          $('#aantipo').val('TITULAR');
      }
    });
  }else
  {
    swal("DEBE INGRESAR UN DNI PARA BUSCAR AL SOCIO");
  }
});

//Boton Generar Previsualizamos la Cuenta de Ahorro
$('#central').on('click','#bangenerar',function(evento){ 
   var blanco= ($('#aanidsocio').val()).length * ($('#aantem').val()).length * ($('#aanplazo').val()).length * ($('#aanmoneda').val()).length * ($('#aanmonto').val()).length;
   if(blanco>0) {
         var val=$('#aanidsocio').val()+'&'+$('#aandni').val()+'&'+$('#aansocio').val()+'&'+$('#aandireccion').val()+'&'+$('#aantipoahorro option:selected').text()+'&'+$('#aantem').val()+'&'+$('#aanplazo').val()+'&'+$('#aanmoneda').val()+'&'+$('#aanmonto').val();
         var datos={ "idsocio": $('#aanidsocio').val(),"dni": $('#aandni').val(),"socio": $('#aansocio').val(),"direccion": $('#aandireccion').val(),"tahorro": $('#aantipoahorro option:selected').text(),"tem": $('#aantem').val(),"plazo":$('#aanplazo').val(),"moneda": $('#aanmoneda').val(),"monto": $('#aanmonto').val() };
         var dtdatos=datos;
  
         $.post('ahorronuevo.php', dtdatos ,function(data){
         $('#paginas').html(data);
         var cadena = val,
         valores = cadena.split('&');
         $('#aanidsocio').val(valores[0]);
         $('#aandni').val(valores[1]);
         $('#aansocio').val(valores[2]);
         $('#aandireccion').val(valores[3]);
         $('#aantipo').val('TITULAR');
         $("#aantipoahorro").find('option:contains("'+valores[4]+'")').prop('selected', true);
         $('#aantem').val(valores[5]);
         $('#aanplazo').val(valores[6]);
         $("#aanmoneda").find('option:contains("'+valores[8]+'")').prop('selected', true);
         $('#aanmonto').val(valores[8]);
         $("#tasocio").find("input,button,select,img,span").attr("disabled", "disabled");
         $("#taahorro").find("input,button,select").attr("disabled", "disabled");
         });
      }else
      {
         swal("FALTA INGRESAR DATOS PARA GENERAR EL PRESTAMO");
      }
});

// Guardamos la cuenta de Ahorro previsualizada
$('#central').on('click','#banguardar',function(evento){ 
  var blanco= ($('#aanidsocio').val()).length * ($('#aantem').val()).length * ($('#aanplazo').val()).length * ($('#aanmoneda').val()).length * ($('#aanmonto').val()).length;
    if(blanco>0) {
      if($('#aanmonto').val()>=3)
      {
      var datos='tipo=GUAR'+'&idsocio='+$('#aanidsocio').val()+'&dni='+$('#aandni').val()+'&socio='+$('#aansocio').val()+'&direccion='+$('#aandireccion').val()+'&tahorro='+$('#aantipoahorro option:selected').text()+'&tem='+$('#aantem').val()+'&plazo='+$('#aanplazo').val()+'&moneda='+$('#aanmoneda').val()+'&monto='+$('#aanmonto').val()+'&ncuenta='+$('#lanncuenta').text();
      var ncuenta=$('#lanncuenta').text();
      $.ajax({
        url: "../phps/dataahorro.php",
        type: "POST",
        data: datos,
        success: function(valor) {
            if(valor=='ERROR')
            {
              alert('Existio un error la Cuenta no pudo ser Creado');
            }else{
              var arreglo = JSON.parse(valor); // ok
              var mensaje = arreglo[0];
              var vnmovimiento = arreglo[1];
              var vtipomov = arreglo[2];
              alert(mensaje);
              $("#banguardar").attr("disabled", "disabled"); 
              $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
              $('#dcticketahorro').html(data);
              document.getElementById('dticketahorro').style.display='block';
              });
              var tab = window.open('../reportes/contratoahorro.php'+'?cuenta='+ncuenta, '_blank');
            }
        }
      });
      }else{
         swal("EL MONTO MINIMO PARA APERTURAR UNA CUENTA ES DE S/. 3.00 SOLES");
      }
    }else{
      swal("FALTAN DATOS PARA REALIZAR LA APERTURA DE LA NUEVA CUENTA DE AHORRO");
   }
});


// Visualiza Extracto del Ahorro
$('#central').on('click','#baextracto',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=EXTR'+'&ncuenta='+data['cuenta'];
      $.ajax({
        url: "../phps/dataahorro.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dextractoahorro').html(valor);
          document.getElementById('dmodextractoahorro').style.display='block';
        }
      });
});


//Imprime Extracto de Ahorro
$('#central').on('click','#baextimprimir',function(evento){ 
    var ficha = document.getElementById('dcaextracto');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});


//Cierra Extracto de Ahorro
$('#central').on('click','#baextcerrar',function(evento){ 
   document.getElementById('dmodextractoahorro').style.display='none';
});



//Imprime copia del Contrato
$('#central').on('click','#bacontrato',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var cuenta = data['cuenta'];
  var tab = window.open('../reportes/contratoahorro.php'+'?cuenta='+cuenta, '_blank');
  if(tab){
      tab.focus(); //ir a la pestaña
      //window.print();
  }else{
      alert('Certificado Bloqueado, Active las Ventanas Emergentes del Navegador (Popups) ');
      return false;
  }
});



// --------------- FIN FUNCIONES OPCIONES AHORROS -------------------//
//-------------------------------------------------------------------//
// --------------- INICIO FUNCIONES OPCIONES PRESTAMO ---------------//

$('#central').on('change','#apntipoprestamo',function(evento){ 
   //alert($('#apntipoprestamo').val());
 var cadena = $(this).val(),
    valores = cadena.split('&');
    $('#apntem').val(valores[3]);
    $('#apnplazo').val(valores[2]);
    $('#apncomision').val(valores[5]);
    $('#apnmora').val(valores[6]);
});

$('#central').on('click','#bpnbuscarsocio',function(evento){ 
  var blanco = ($('#apndni').val()).length;

  if(blanco>0) {
    var datos='tipo=BUS'+'&dni='+$('#apndni').val();
    $('#apnidsocio').val('');
    $('#apnsocio').val('');
    $('#apndireccion').val('');
    $('#apntipo').val('');
     $.ajax({
      url: "../phps/datasocio.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='ESTE SOCIO NO SE ENCUENTRA REGISTRADO'){
            swal(valor);
          }
          if(valor=='ESTE SOCIO NO SE ENCUENTRA AFILIADO'){
            swal(valor);
          }
          arreglo = JSON.parse(valor);
          $('#apnsocio').val(arreglo[0].socio);
          $('#apndireccion').val(arreglo[0].direccion);
          $('#apnidsocio').val(arreglo[0].idsocio);
          $('#apntipo').val('TITULAR');
      }
    });
  }else
  {
    swal("DEBE INGRESAR UN DNI PARA BUSCAR AL SOCIO");
  }
});

// Genera Vista Previo del Pretamo
$('#central').on('click','#bpngenerar',function(evento){ 
var blanco= ($('#apndni').val()).length * ($('#apnsocio').val()).length * ($('#apndireccion').val()).length * ($('#apntipo').val()).length * ($('#apnmonto').val()).length * ($('#apntem').val()).length * ($('#apnaporte').val()).length * ($('#apnplazo').val()).length * ($('#apncomision').val()).length * ($('#apnmora').val()).length;
   if(blanco>0) {
      var val=$('#apnidsocio').val()+'&'+$('#apndni').val()+'&'+$('#apnsocio').val()+'&'+$('#apndireccion').val()+'&'+$('#apntipo').val()+'&'+$('#apntipoprestamo option:selected').text()+'&'+$('#apnplazo').val()+'&'+$('#apncomision').val()+'&'+$('#apnmora').val()+'&'+$('#apnmonto').val()+'&'+$('#apntem').val()+'&'+$('#apnfecpago').val()+'&'+$('#apnaporte').val()+'&'+$('#apncondicion option:selected').text()+'&'+$('#apnanalista option:selected').text()+'&'+$('#apnrecaudador option:selected').text();
      var datos={ "idsocio": $('#apnidsocio').val(),"dni": $('#apndni').val(),"socio": $('#apnsocio').val(),"direccion": $('#apndireccion').val(),"tipo": $('#apntipo').val(),"tprestamo": $('#apntipoprestamo option:selected').text(),"plazo": $('#apnplazo').val(),"comision":$('#apncomision').val(),"mora": $('#apnmora').val(),"monto": $('#apnmonto').val(),"tem": $('#apntem').val(),"fecpago": $('#apnfecpago').val(),"aporte": $('#apnaporte').val(),"condicion": $('#apncondicion option:selected').text(),"analista": $('#apnanalista option:selected').text(), "recaudador": $('#apnrecaudador option:selected').text() };
      var dtdatos=datos;
      $.post('prestanuevo.php', dtdatos ,function(data){
         $('#paginas').html(data);
         var cadena = val,
         valores = cadena.split('&');
         $('#apnidsocio').val(valores[0]);
         $('#apndni').val(valores[1]);
         $('#apnsocio').val(valores[2]);
         $('#apndireccion').val(valores[3]);
         $('#apntipo').val(valores[4]);
         $("#apntipoprestamo").find('option:contains("'+valores[5]+'")').prop('selected', true);
         $('#apnplazo').val(valores[6]);
         $('#apncomision').val(valores[7]);
         $('#apnmora').val(valores[8]);
         $('#apnmonto').val(valores[9]);
         $('#apntem').val(valores[10]);
         $('#apnfecpago').val(valores[11]);
         $('#apnaporte').val(valores[12]);
         $("#apncondicion").find('option:contains("'+valores[13]+'")').prop('selected', true);
         $("#apnanalista").find('option:contains("'+valores[14]+'")').prop('selected', true);
         $("#apnrecaudador").find('option:contains("'+valores[15]+'")').prop('selected', true);
         $("#tpsocio").find("input,button,select,img,span").attr("disabled", "disabled");
         $("#tpprestamo").find("input,button,select").attr("disabled", "disabled"); 
      }); 
   }else{
      alert("Faltan Datos para Generar el Prestamo");
   }
});


//Guarda el Prestamo Generado
$('#central').on('click','#bpnguardar',function(evento){ 
  var datos='tipo=GUAR'+'&idsocio='+$('#apnidsocio').val()+'&dni='+$('#apndni').val()+'&socio='+$('#apnsocio').val()+'&tprestamo='+$('#apntipoprestamo option:selected').text()+'&monto='+$('#apnmonto').val()+'&plazo='+$('#apnplazo').val()+'&comision='+$('#apncomision').val()+'&aporte='+$('#apnaporte').val()+'&tem='+$('#apntem').val()+'&mora='+$('#apnmora').val()+'&fecpago='+$('#apnfecpago').val()+'&condicion='+$('#apncondicion option:selected').text()+'&analista='+$('#apnanalista').val()+'&recaudador='+$('#apnrecaudador').val();
  $.ajax({
    url: "../phps/dataprestamo.php",
    type: "POST",
    data: datos,
    success: function(valor) {
        alert(valor);
        $("#bpnguardar").attr("disabled", "disabled"); 
    }
  });
});


$('#central').on('change','#apnfecpago',function(evento){ 
    switch($('#apnfecpago').val()){
      case '1':
        $('#apnaporte').val('0.40');
        break;
      case '2':
        $('#apnaporte').val('0.40');
        break;
      case '3':
        $('#apnaporte').val('2.50');
        break;
      case '4':
        $('#apnaporte').val('5.00');
        break;
      case '5':
        $('#apnaporte').val('10.00');
        break;
    }
});

//FUNCIONOENS PARA APROBAR PRESTAMO
// Visualiza detalles del preatamo
$('#central').on('click','#bcpaprobar',function(evento){ 

  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=DETA'+'&accion=APROBAR'+'&nprestamo='+data['cuenta'];
      $.ajax({
        url: "../phps/dataprestamo.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcontenidoprestamo').html(valor);
          document.getElementById('dmoddetalleprestamo').style.display='block';
        }
      });
});

//Aprobamos el prestamo para su aprobación
$('#central').on('click','#bpnaprobar',function(evento){ 
  var nprestamo=$('#lcdnprestamo').html();
  var datos='tipo=APRO'+'&nprestamo='+$('#lcdnprestamo').html();
        $.ajax({
        url: "../phps/dataprestamo.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          if(valor=='2'){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA APROBAR EL PRESTAMO');
            document.getElementById('dmoddetalleprestamo').style.display='none';
          }else{
            document.getElementById('dmoddetalleprestamo').style.display='none';
            alert(valor);
            paprobar();
            cargardata();
          }
        }
      });
});

//FUNCIONES PARA MOSTRAR EXTRACTO DEL PRESTAMO.
// Visualiza Extracto del Prestamo
$('#central').on('click','#bpemostrar',function(evento){ 

  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=EXTR'+'&nprestamo='+data['cuenta'];
      $.ajax({
        url: "../phps/dataprestamo.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dextractoprestamo').html(valor);
          document.getElementById('dmodextractoprestamo').style.display='block';
          //datosahorro();
        }
      });
});


//Imprime Extracto de Prestamo
$('#central').on('click','#bpextimprimir',function(evento){ 
    var ficha = document.getElementById('dpextcontenido');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});


// Cerrar Extracto de Prestamo
$('#central').on('click','#bpextcerrar',function(evento){ 
   document.getElementById('dmodextractoprestamo').style.display='none';
});


$('#central').on('click','#bpchoja',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var nprestamo = data['cuenta'];
  var tab = window.open('../reportes/hojainformativa.php'+'?nprestamo='+nprestamo, '_blank');
  if(tab){
      tab.focus(); //ir a la pestaña
      //window.print();
  }else{
      alert('Hoja Informativa Bloqueado, Active las Ventanas Emergentes del Navegador (Popups) ');
      return false;
  }
});

$('#central').on('click','#bpccronograma',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var nprestamo = data['cuenta'];
  var tab = window.open('../reportes/cronogramapagos.php'+'?nprestamo='+nprestamo, '_blank');
  if(tab){
      tab.focus(); //ir a la pestaña
  }else{
      alert('Hoja Informativa Bloqueado, Active las Ventanas Emergentes del Navegador (Popups) ');
      return false;
  }
});
// -------------- FIN FUNCIONES OPCIONES PRESTAMO -------------------//
//-------------------------------------------------------------------//
// ----------------  INICIO FUNCIONES OPCIONES CAJA -----------------//

// Genere la Vita Previa del Prestamo con cronograma
$('#central').on('click','#bcdmostrar',function(evento){ 

  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=DETA'+'&accion=DESEMBOLSO'+'&nprestamo='+data['cuenta'];
      $.ajax({
        url: "../phps/dataprestamo.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcontenidoprestamo').html(valor);
          document.getElementById('dmoddetalleprestamo').style.display='block';
        }
      });
});


$("#dmoddetalleprestamo").keypress(function(e) {
   var code = (e.keyCode ? e.keyCode : e.which);
   if(code==27){
      document.getElementById('dmoddetalleprestamo').style.display='none';
   }
});


// Genera el Desembolso y Guarda las cuotas en la Tabla
$('#central').on('click','#bpndesguardar',function(evento){ 
  var nprestamo=$('#lcdnprestamo').html();
  var datos='tipo=DESE'+'&nprestamo='+$('#lcdnprestamo').html();
        $.ajax({
        url: "../phps/dataprestamo.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          if(valor=='2'){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmoddetalleprestamo').style.display='none';
          }else{
            if(valor=='1'){
              alert('NO SE APERTURO CAJA PARA REALIZAR DESEMBOLSOS');
              document.getElementById('dmoddetalleprestamo').style.display='none';
            }else{
              var arreglo = JSON.parse(valor); // ok
              var mensaje = arreglo[0];
              var vnmovimiento = arreglo[1];
              var vtipomov = arreglo[2];
              alert(mensaje);
              document.getElementById('dmoddetalleprestamo').style.display='none';
              pdesembolso();
              cargardata();
              $("#banguardar").attr("disabled", "disabled"); 
              $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
              $('#dcticketdesem').html(data);
              document.getElementById('dticketdesem').style.display='block';
              });
              var tab = window.open('../reportes/hojainformativa.php'+'?nprestamo='+nprestamo, '_blank');
              var tab = window.open('../reportes/cronogramapagos.php'+'?nprestamo='+nprestamo, '_blank');
              var tab = window.open('../reportes/pagare.php'+'?nprestamo='+nprestamo, '_blank');
            }
          }
        }
      });
});


$('#central').on('click','#bpndescerrar',function(evento){ 
    document.getElementById('dmoddetalleprestamo').style.display='none';
    //alert($('#lcdnprestamo').html());
});


//FUNCIONES DE BOVEDA DE CAJA
//Muestra ventana de Habilitacion
$('#central').on('click','#bcbhabilitar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  if(data['abierto']=='SI'){
     $('#lacbhidboveda').text($('#lacbidboveda').text());
     $('#lacbhidcaja').text(data['idcaja']);
     //$('#acccrdetalle').val(''); 
     //$('#acccrmonto').val('');
     //$('#acccrnumero').val('');
     //$('#acccrobservaciones').val('');
     document.getElementById('dmodbohabilitacion').style.display='block';
   }else{
     alert('LA CAJA SE ENCUENTRA CERRADA. NO SE PUEDEN REALIZAR MOVIMIENTOS');
   }
});


//Registramos la Habilitacion
$('#central').on('click','#bmodcbhaceptar',function(evento){ 
 var blanco= ($('#acbhmonto').val()).length; // * ($('#acaminicial').val()).length;
 //alert($('#acacajero').val());
    if(blanco>0) {
       var datos='tipo=HABI'+'&idboveda='+$('#lacbhidboveda').text()+'&idcaja='+$('#lacbhidcaja').text()+'&tipomov='+$('#acbhtipomov').val()+'&monto='+$('#acbhmonto').val();
       $.ajax({
          url: "../phps/databoveda.php",
          type: "POST",
          data: datos,
          success: function(valor) {
             alert(valor);
             document.getElementById('dmodbohabilitacion').style.display='none';
             //if(valor=='NO'){
             //   alert('Ud. No puede Aperturar Caja. Porque ya tiene una Caja Abierta');
             //   $('#acaminicial').val('');
             //}else{
             //   $('#acaminicial').val(valor);
             //}
          }
       });
    }else{
      alert("Existen campo en blanco");
   }
});



//Cerrramos ventana de habilitacion
$('#central').on('click','#bmodcbhcerrar',function(evento){ 
    document.getElementById('dmodbohabilitacion').style.display='none';
    //alert($('#lcdnprestamo').html());
});


//Visualizar los movimientos de Boveda
$('#central').on('click','#bcbovhistorial',function(evento){ 
  var datos='tipo=MOVS'+'&idcajachica='+$('#lacbhidboveda').text();
      $.ajax({
        url: "../phps/databoveda.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dbovedamov').html(valor);
          document.getElementById('dmodbovedamov').style.display='block';
        }
      });
});


//Imprimir movimientos de Boveda
$('#central').on('click','#bcbovmovimprimir',function(evento){ 
    var ficha = document.getElementById('dcbmovcontenido');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});

//Cerramos la Ventana de Movimientos de Boveda
$('#central').on('click','#bcbovmovcerrar',function(evento){ 
    document.getElementById('dmodbovedamov').style.display='none';
});


//FUNCIONES DE APERTURA DE CAJA
//Muestra la pestaña para aperturar una nueva caja
$('#central').on('change','#cafilfapertura',function(evento){ 
   var filtrado=$('#cafilfapertura').val();  
   $.post('cajaapertura.php',function(data){
      $('#paginas').html(data);
      capertura(filtrado);
      cargardata();
  });
});


$('#central').on('click','#bcanuevo',function(evento){
    $('#acaminicial').val(''); 
    document.getElementById('dmodcajapertura').style.display='block';
});


//Muestra la fecha y monto de apertura
$('#central').on('change','#acacajero',function(evento){ 
var datos='tipo=MOCA'+'&idcajero='+$('#acacajero').val()+'&fapertura='+$('#acafapertura').val();
   $.ajax({
      url: "../phps/datacaja.php",
      type: "POST",
      data: datos,
      success: function(valor) {
         if(valor=='NO'){
            alert('Ud. No puede Aperturar Caja. Porque ya tiene una Caja Abierta');
            $('#acaminicial').val('');
         }else{
            $('#acaminicial').val(valor);
         }
      }
   });
});


$('#central').on('click','#bmodcaguardar',function(evento){ 
 var blanco= ($('#acafapertura').val()).length * ($('#acaminicial').val()).length;
 //alert($('#acacajero').val());
    if(blanco>0) {
      var datos='tipo=INS'+'&idcajero='+$('#acacajero').val()+'&fapertura='+$('#acafapertura').val()+'&minicial='+$('#acaminicial').val();
      $.ajax({
        url: "../phps/datacaja.php",
        type: "POST",
        data: datos,
        success: function(valor) {
            alert(valor);
            document.getElementById('dmodcajapertura').style.display='none';
            capertura('VS');
            cargardata();
        }
      });
    }else{
      alert("Existen campo en blanco");
   }
});


$('#central').on('click','#bmodcacerrar',function(evento){ 
    $('#acaminicial').val(''); 
    $('#acafapertura').val('');
    document.getElementById('dmodcajapertura').style.display='none';
});


//Visualizar los movimientos realizados por la Caja
$('#central').on('click','#bcamovimientos',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=MOVS'+'&idcaja='+data['n'];
      $.ajax({
        url: "../phps/datacaja.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcajamov').html(valor);
          document.getElementById('dmodcajamov').style.display='block';
        }
      });
});


//Imprime los movimientos del flujo de Caja
$('#central').on('click','#bcamovimprimir',function(evento){ 
    var ficha = document.getElementById('dcamovcontenido');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});


// Cierra la ventana de los movimientos de Flujo de Caja
$('#central').on('click','#bcamovcerrar',function(evento){ 
    document.getElementById('dmodcajamov').style.display='none';
});


//Muestra mensaje de Alerta de quienes no recaudaron
$('#central').on('click','#bcacerrar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  if(data['abierto']=='SI'){
  var datos='tipo=NORE'+'&idcaja='+data['n']+'&minicial='+data['minicial']+'&abierto='+data['abierto'];
      $.ajax({
        url: "../phps/datacaja.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcajacerrar').html(valor);
          document.getElementById('dmodcajacerrar').style.display='block';
        }
      });
  }else{
    alert('La Caja se Encuentra Cerrada');
  }
});


$('#central').on('click','#bcacecancelar',function(evento){ 
    document.getElementById('dmodcajacerrar').style.display='none';
});


//Funciones para Cerrar Caja
$('#central').on('click','#bcaceaceptar',function(evento){ 
  var data = $('#lcaceidcaja').text(); //dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=CERR'+'&idcaja='+$('#lcaceidcaja').text()+'&minicial='+$('#lcaceminicial').text()+'&abierto='+$('#lcaceestado').text();
      $.ajax({
        url: "../phps/datacaja.php",
        type: "POST",
        data: datos,
        success: function(valor) {
            document.getElementById('dmodcajacerrar').style.display='none';
            alert(valor);
            capertura();
            cargardata();
        }
      });
});


//INICIO FUNCIONES BILLETAJE
// Combo para seleccionar billetare de una semana, mes o todo
$('#central').on('change','#cbfilfbilletaje',function(evento){ 
   var filtrado=$('#cbfilfbilletaje').val();  
   $.post('cajabilletaje.php',function(data){
      $('#paginas').html(data);
      cbilletaje(filtrado);
      cargardata();
  });
});


// Muestra Ventana Modal para registrar Billetaje
$('#central').on('click','#bcbregistrar',function(evento){ 

  if(($('#ltipotrabajador').text()==5) || ($('#ltipotrabajador').text()==1) ){
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;

    $('#acbfbilletaje').val(today);
    $('#bstipo200').val('0');
    $('#bstipo100').val('0');
    $('#bstipo50').val('0');
    $('#bstipo20').val('0');
    $('#bstipo10').val('0');
    $('#bstipo5').val('0');
    $('#bstipo2').val('0');
    $('#bstipo1').val('0');
    $('#bstipo050').val('0');
    $('#bstipo020').val('0');
    $('#bstipo010').val('0');
    $('#lbstipo200').val('0');
    $('#lbstipo100').val('0');
    $('#lbstipo50').val('0');
    $('#lbstipo20').val('0');
    $('#lbstipo10').val('0');
    $('#lbstipo5').val('0');
    $('#lbstipo2').val('0');
    $('#lbstipo1').val('0');
    $('#lbstipo050').val('0');
    $('#lbstipo020').val('0');
    $('#lbstipo010').val('0');
    $('#bstotal').val('0');
    document.getElementById('dmodcajabilletajes').style.display='block';
  }else{
    swal('UD. NO ES UN USUARIO CON FACULTADES PARA REGISTRAR BILLETAJES');
  }

});


//Calculamos los valores totales por moneda
$('#central').on('change','#bstipo200',function(evento){
   var stotal= $('#lbstipo200').text() * $('#bstipo200').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal200').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo100',function(evento){
   var stotal= $('#lbstipo100').text() * $('#bstipo100').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal100').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo50',function(evento){
   var stotal= $('#lbstipo50').text() * $('#bstipo50').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal50').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo20',function(evento){
   var stotal= $('#lbstipo20').text() * $('#bstipo20').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal20').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo10',function(evento){
   var stotal= $('#lbstipo10').text() * $('#bstipo10').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal10').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo5',function(evento){
   var stotal= $('#lbstipo5').text() * $('#bstipo5').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal5').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo2',function(evento){
   var stotal= $('#lbstipo2').text() * $('#bstipo2').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal2').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo1',function(evento){
   var stotal= $('#lbstipo1').text() * $('#bstipo1').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal1').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo050',function(evento){
   var stotal= $('#lbstipo050').text() * $('#bstipo050').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal050').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo020',function(evento){
   var stotal= $('#lbstipo020').text() * $('#bstipo020').val();
   //stotal = new Intl.NumberFormat().format(stotal);
   stotal=stotal.toFixed(2);
   $('#bstotal020').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


$('#central').on('change','#bstipo010',function(evento){
   var stotal= $('#lbstipo010').text() * $('#bstipo010').val();
   stotal=stotal.toFixed(2);
   $('#bstotal010').text(stotal);
   var total = parseFloat($('#bstotal200').text()) + parseFloat($('#bstotal100').text()) + parseFloat($('#bstotal50').text()) + parseFloat($('#bstotal20').text()) + parseFloat($('#bstotal10').text()) + parseFloat($('#bstotal5').text()) + parseFloat($('#bstotal2').text()) + parseFloat($('#bstotal1').text()) + parseFloat($('#bstotal050').text()) + parseFloat($('#bstotal020').text()) + parseFloat($('#bstotal010').text());
   total=total.toFixed(2);
   $('#bstotal').text(total);
});


// Boton Guarda el Monto de Billetaje
$('#central').on('click','#bmodcbsguardar',function(evento){ 

    var datos='tipo=GUAB'+'&idtrabajador='+$('#acbidtrabajador').val()+'&fbilletaje='+$('#acbfbilletaje').val()+'&s200='+$('#bstipo200').val()+'&s100='+$('#bstipo100').val()+'&s50='+$('#bstipo50').val()+'&s20='+$('#bstipo20').val()+'&s10='+$('#bstipo10').val()+'&s5='+$('#bstipo5').val()+'&s2='+$('#bstipo2').val()+'&s1='+$('#bstipo1').val()+'&s050='+$('#bstipo050').val()+'&s020='+$('#bstipo020').val()+'&s010='+$('#bstipo010').val()+'&stotal='+$('#bstotal').text()+'&bobservaciones='+$('#bsobservacion').val();
      $.ajax({
        url: "../phps/datacaja.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          //$('#dcontenidopagocuota').html(valor);
          document.getElementById('dmodcajabilletajes').style.display='none';
          cbilletaje('VS');
          cargardata();
          swal(valor);
        }
      });
});


// Boton Cierra Ventana Modal Billetaje
$('#central').on('click','#bmodcbscerrar',function(evento){ 
  //var vfecha=$('#afxrfecha').val();
  document.getElementById('dmodcajabilletajes').style.display='none';
});


//INICION FUNCIONES PAGO DE CUOTA
// Muestra Ventna modal con las Cuotas para Pagar
$('#central').on('click','#bcpgdetalles',function(evento){ 
    var data = dtable.row( $(this).parents("tr") ).data();
    var datos='tipo=MPCU'+'&nprestamo='+data['cuenta'];
      $.ajax({
        url: "../phps/mostrarcuota.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcontenidopagocuota').html(valor);
          document.getElementById('dmodpagocuota').style.display='block';
        }
      });
});


$('#central').on('click','#bcpgpagar',function(evento){ 
    //alert($('#tcuotas').find("tr").eq('1').find("td").eq(8).html());
    var ncuota=$('#tcuotas').find("tr").eq('1').find("td").eq(0).html();
    var fechaprog=$('#tcuotas').find("tr").eq('1').find("td").eq(1).html();
    var dmora=$('#tcuotas').find("tr").eq('1').find("td").eq(2).html();
    var vmora=$('#tcuotas').find("tr").eq('1').find("td").eq(3).html();
    var vdescuento=$('#tcuotas').find("tr").eq('1').find("td").eq(8).html();
    var vcuota=$('#tcuotas').find("tr").eq('1').find("td").eq(9).html();
    var datos='tipo=PGC'+'&idsocio='+$('#lpcidsocio').text()+'&nprestamo='+$('#lpcnprestamo').text()+'&descripcion='+$('#lpcdescripcion').text()+'&ncuota='+ncuota+'&fechaprog='+fechaprog+'&dmora='+dmora+'&vmora='+vmora+'&vdescuento='+vdescuento+'&vcuota='+vcuota+'&monto='+$('#apcmonto').val();
    $.ajax({
      url: "../phps/datapagocuota.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            swal('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmodpagocuota').style.display='none';
          }else{
            if(valor=='1'){
              swal('NO SE APERTURO CAJA PARA REALIZAR COBROS');
              document.getElementById('dmodpagocuota').style.display='none';
            }else{
              var arreglo = JSON.parse(valor);
              var mensaje = arreglo[0];
              var vnmovimiento = arreglo[1];
              var vtipomov = arreglo[2];
              swal(mensaje);
              document.getElementById('dmodpagocuota').style.display='none';
              cpagocuota();
              cargardata();
              $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
              $('#dcticketcuota').html(data);
              document.getElementById('dticketcuota').style.display='block';
              });
            }
          }
      }
    });
});


$('#central').on('click','#bcpgcerrar',function(evento){ 
    document.getElementById('dmodpagocuota').style.display='none';
});


//calcula la suma de cuotas
$('#central').on('change','#lpcncutoas',function(evento){ 
  var tcuota=0;
  for(var i = 0; i < $('#lpcncutoas').val(); i++){
    tcuota=parseFloat(tcuota)+parseFloat($('#tcuotas').find("tr").eq(i).find("td").eq('8').html());
  }
  $('#lpctotal').text(String(tcuota));
});  

// Realizar Deposito
$('#central').on('click','#bcdmostrar',function(evento){ 
    var data = dtable.row( $(this).parents("tr") ).data();
    //var datos='nprestamo='+data['cuenta'];
    $('#lcdcuenta').text(data['cuenta']);
    $('#lcdsocio').text(data['socio']);
    $('#lcdidsocio').text(data['idsocio']);
    $('#lcdahorro').text(data['ahorro']);
    $('#lcdplazo').text(data['plazo']);
    $('#lcdmoneda').text(data['moneda']);
    $('#lcdfapertura').text(data['fapertura']);
    $('#lcdfvencimiento').text(data['fvencimiento']);
    $('#acdmonto').val('');
    document.getElementById('dmoddepositar').style.display='block';
});


$('#central').on('click','#bcddepositar',function(evento){ 
    var datos='tipo=DEP'+'&idsocio='+$('#lcdidsocio').text()+'&cuenta='+$('#lcdcuenta').text()+'&monto='+$('#acdmonto').val()+'&tahorro='+$('#lcdahorro').text(); 
    $.ajax({
      url: "../phps/dataahorro.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmoddepositar').style.display='none';
          }else{
            if(valor=='1'){
              alert('NO APERTURO CAJA PARA REALIZAR COBROS');
              document.getElementById('dmoddepositar').style.display='none';
            }else{
              var arreglo = JSON.parse(valor); // ok
              var mensaje = arreglo[0];
              var vnmovimiento = arreglo[1];
              var vtipomov = arreglo[2];
              alert(mensaje);
              document.getElementById('dmoddepositar').style.display='none';
              adeposito();
              cargardata();
              $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
              $('#dcticketdeposito').html(data);
              document.getElementById('dticketdepo').style.display='block';
              });
            }
          }
      }
    });
});


$('#central').on('click','#bcdcerrar',function(evento){ 
    $('#acdmonto').val('');
    document.getElementById('dmoddepositar').style.display='none';
});


//Realiar Retiro
$('#central').on('click','#bcrmostrar',function(evento){ 
   var data = dtable.row( $(this).parents("tr") ).data();

   if(data['estado']=='VIGENTE'){
      $('#lcrcuenta').text(data['cuenta']);
      $('#lcrsocio').text(data['socio']);
      $('#lcridsocio').text(data['idsocio']);
      $('#lcrahorro').text(data['ahorro']);
      $('#lcrplazo').text(data['plazo']);
      $('#lcrmoneda').text(data['moneda']);
      $('#lcrfapertura').text(data['fapertura']);
      $('#lcrfvencimiento').text(data['fvencimiento']);
      $('#lcrestado').text(data['estado']);
      var saldo=parseFloat(data['saldo']);
      $('#lcrsaldo').text('S/. '+saldo.toFixed(2));
      $('#acrmonto').val('');
      document.getElementById('dmodretirar').style.display='block';
   }else{
      alert('NO SE PUEDE REALIZAR RETIROS PORQUE LA CUENTA SE ENCUENTRA BLOQUEADA');
   }
});


$('#central').on('click','#bcrretirar',function(evento){ 
    var datos='tipo=RET'+'&idsocio='+$('#lcridsocio').text()+'&cuenta='+$('#lcrcuenta').text()+'&saldo='+$('#lcrsaldo').text()+'&monto='+$('#acrmonto').val()+'&tahorro='+$('#lcrahorro').text(); 
    $.ajax({
      url: "../phps/dataahorro.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmodretirar').style.display='none';
          }else{
            if(valor=='1'){
              alert('NO APERTURO CAJA PARA REALIZAR COBROS');
              document.getElementById('dmodretirar').style.display='none';
            }else{
              var arreglo = JSON.parse(valor); // ok
              var mensaje = arreglo[0];
              var vnmovimiento = arreglo[1];
              var vtipomov = arreglo[2];
              alert(mensaje);
              document.getElementById('dmodretirar').style.display='none';
              aretiro();
              cargardata();
              $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
              $('#dcticketdretiro').html(data);
              document.getElementById('dticketretiro').style.display='block';
              });
            }
          }
      }
    });
});


$('#central').on('click','#bcrcerrar',function(evento){ 
    $('#acrmonto').val('');
    document.getElementById('dmodretirar').style.display='none';
});


//Iniciamos Recaudacion
$('#central').on('click','#bcaremostrar',function(evento){ 
var blanco= ($('#acrfecha').val()).length;
//alert('Funciona');
if(blanco>0) {
  var vfecha=$('#acrfecha').val();
  var vidpromotor=$('#acrpromotor').val();
  var vpromotor=$('#acrpromotor option:selected').text();
  $.post('cajarecaudar.php',{fecha:vfecha, idpromotor:vidpromotor,promotor:vpromotor},function(data){
    $('#paginas').html(data);
    document.getElementById('dcuotas').style.display='block'; 
  });
}else{
  alert('No ha seleccionado ninguna fecha');
}
});


$('#central').on('click','#bcarerecaudar',function(evento){ 
 var datos='tipo=REC'+'&idpromotor='+$('#lcareidpromotor').text()+'&promotor='+$('#lcarepromotor').text()+'&fecha='+$('#lcarefecha').text()+'&total='+$('#lcaretotal').text(); 
 var total=$('#lcaretotal').text();
 if(total!=0)
 {
    $.ajax({
      url: "../phps/datacaja.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmodretirar').style.display='none';
          }else{
            if(valor=='1'){
              alert('NO APERTURO CAJA PARA REALIZAR COBROS');
              document.getElementById('dmodretirar').style.display='none';
            }else{
              alert(valor);
              document.getElementById('dcuotas').style.display='none'; 
            }
          }
      }
    });
 }else{
  alert('No Existe datos para la recaudación');
 }
});


//CAJA CHICA
//Muestra Ventana modal para crear nuevos periodos de caja chica
$('#central').on('click','#bcccnuevo',function(evento){
    $('#acccmonto').val(''); 
    $('#acccdetalle').val('');
    document.getElementById('dmodnuevocajachica').style.display='block';
});


// Boton Guarda Nuevo Periodo Caja Chica
$('#central').on('click','#bmodcccnguardar',function(evento){ 
   var blanco= ($('#acccmonto').val()).length * ($('#acccmes').val()).length * ($('#acccano').val()).length;

   if(blanco>0) {
      var datos='tipo=NOVO'+'&mes='+$('#acccmes').val()+'&ano='+$('#acccano').val()+'&monto='+$('#acccmonto').val()+'&detalle='+$('#acccdetalle').val();
      alert(datos);
      $.ajax({
         url: "../phps/datacajachica.php",
         type: "POST",
         data: datos,
         success: function(valor) {
            if(valor=='2'){
               alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
               document.getElementById('dmodnuevocajachica').style.display='none';
            }else{
               //var arreglo = JSON.parse(valor); // ok
               //var mensaje = arreglo[0];
               //var vnmovimiento = arreglo[1];
               //var vtipomov = arreglo[2];
               alert(valor);
               document.getElementById('dmodnuevocajachica').style.display='none';
               ccajachica();
               cargardata();
            }
         }
      });
   }else{
      alert('Existen Datos en Blanco');
   }
});


// Boton Cierra Nuevo Periodo Caja Chica
$('#central').on('click','#bmodcccncerrar',function(evento){ 
  document.getElementById('dmodnuevocajachica').style.display='none';
});


// Muestra Ventana Modal para agregar Nuevo Registro Caja Chica
$('#central').on('click','#bcccregistro',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  
  if(data['estado']=='ABIERTO'){
     $('#larccperiodo').text(data['periodo']);
     $('#larccidcaja').text(data['idcajachica']);
     $('#acccrdetalle').val(''); 
     $('#acccrmonto').val('');
     $('#acccrnumero').val('');
     $('#acccrobservaciones').val('');
     document.getElementById('dmodregcajachica').style.display='block';
   }else{
     alert('LA CAJA CHICA NO SE ENCUENTRA ABIERTO. NO SE PUEDEN AGREGAR MOVIMIENTOS');
   }
});


// Boton Guarda Nuevo Registro Caja Chica
$('#central').on('click','#bmodcccrguardar',function(evento){ 
   var blanco= ($('#acccrdetalle').val()).length * ($('#acccrmonto').val()).length * ($('#acccrfechamov').val()).length;

   if(blanco>0) {
      var datos='tipo=INSE'+'&idcajachica='+$('#larccidcaja').text()+'&trabajador='+$('#acccrtrabajador').val()+'&detalle='+$('#acccrdetalle').val()+'&tipomov='+$('#acccrtipomov').val()+'&moneda='+$('#acccrmoneda').val()+'&monto='+$('#acccrmonto').val()+'&documento='+$('#acccrdocumento').val()+'&numero='+$('#acccrnumero').val()+'&fechamov='+$('#acccrfechamov').val()+'&observaciones='+$('#acccrobservaciones').val();
      alert(datos);
      $.ajax({
         url: "../phps/datacajachica.php",
         type: "POST",
         data: datos,
         success: function(valor) {
            if(valor=='2'){
               alert('HUBO UN ERROR AL INGRESAR EL MOVIMIENTO');
               document.getElementById('dmodregcajachica').style.display='none';
            }else{
               alert(valor);
               document.getElementById('dmodregcajachica').style.display='none';
               ccajachica();
               cargardata();
            }
         }
      });
   }else{
      alert('Existen Datos en Blanco');
   }
});


// Boton Cierra Nuevo Registro de Mov Caja Chica
$('#central').on('click','#bmodcccrcerrar',function(evento){ 
  document.getElementById('dmodregcajachica').style.display='none';
});


//Visualizar los movimientos de Caja Chica
$('#central').on('click','#bcccmovimientos',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  var datos='tipo=MOVS'+'&idcajachica='+data['idcajachica']+'&periodo='+data['periodo'];
      $.ajax({
        url: "../phps/datacajachica.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcajachicamov').html(valor);
          document.getElementById('dmodcajachicamov').style.display='block';
        }
      });
});


//Imprimir flujo x recaudador
$('#central').on('click','#bcccmovimprimir',function(evento){ 
    var ficha = document.getElementById('dcccmovcontenido');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});


// Boton Cierra Ventana de Movimientos Caja Chica
$('#central').on('click','#bcccmovcerrar',function(evento){ 
  document.getElementById('dmodcajachicamov').style.display='none';
});


//CAJA INGRESOS
//Muestra Ventana Modal para agregar nuevos ingrsos 
$('#central').on('click','#bcicnuevo',function(evento){ 
    document.getElementById('dmodingresos').style.display='block';
}); 

// Boton para guardar el ingreso
$('#central').on('click','#bmodcicguardar',function(evento){ 
   var blanco= ($('#acicdetalle').val()).length * ($('#acicmonto').val()).length * ($('#acicnumero').val()).length * ($('#acicfechaineg').val()).length;

   if(blanco>0) {
      var datos='tipo=INGC'+'&detalle='+$('#acicdetalle').val()+'&trabajador='+$('#acictrabajador').val()+'&moneda='+$('#acicmoneda').val()+'&monto='+$('#acicmonto').val()+'&documento='+$('#acicdocumento').val()+'&numero='+$('#acicnumero').val()+'&fechaineg='+$('#acicfechaineg').val()+'&observaciones='+$('#acicobservaciones').val();
      $.ajax({
         url: "../phps/dataineg.php",
         type: "POST",
         data: datos,
         success: function(valor) {
            if(valor=='2'){
               alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
               document.getElementById('dmodingresos').style.display='none';
            }else{
               if(valor=='1'){
                  alert('NO APERTURO CAJA PARA REALIZAR COBROS');
                  document.getElementById('dmodingresos').style.display='none';
               }else{
                  var arreglo = JSON.parse(valor); // ok
                  var mensaje = arreglo[0];
                  var vnmovimiento = arreglo[1];
                  var vtipomov = arreglo[2];
                  alert(mensaje);
                  document.getElementById('dmodingresos').style.display='none';
                  var tipomov='I';
                  cineg(tipomov);
                  cargardata();
                  $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
                     $('#dcticketdingreso').html(data);
                     document.getElementById('dticketingreso').style.display='block';
                  });
               }
            }
         }
      });
   }else{
      alert('Existen Datos en Blanco');
   }
});

// Boton para cerrar ventana modal para agregar ingresos
$('#central').on('click','#bmodciccerrar',function(evento){ 
  document.getElementById('dmodingresos').style.display='none';
});


//CAJA EGRESOS
//Muestra Ventana Modal para agregar nuevos egresos
$('#central').on('click','#bcecnuevo',function(evento){ 
    document.getElementById('dmodegresos').style.display='block';
}); 


// Boton para guardar el egreso
$('#central').on('click','#bmodcecguardar',function(evento){ 
   var blanco= ($('#acecdetalle').val()).length * ($('#acecmonto').val()).length * ($('#acecnumero').val()).length * ($('#acecfechaineg').val()).length;


   if(blanco>0) {
      var datos='tipo=EGRC'+'&detalle='+$('#acecdetalle').val()+'&trabajador='+$('#acectrabajador').val()+'&moneda='+$('#acecmoneda').val()+'&monto='+$('#acecmonto').val()+'&documento='+$('#acecdocumento').val()+'&numero='+$('#acecnumero').val()+'&fechaineg='+$('#acecfechaineg').val()+'&observaciones='+$('#acecobservaciones').val(); 
      $.ajax({
         url: "../phps/dataineg.php",
         type: "POST",
         data: datos,
         success: function(valor) {
            if(valor=='2'){
               alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
               document.getElementById('dmodegresos').style.display='none';
            }else{
               if(valor=='1'){
                  alert('NO APERTURO CAJA PARA REALIZAR COBROS');
                  document.getElementById('dmodegresos').style.display='none';
               }else{
                  var arreglo = JSON.parse(valor); // ok
                  var mensaje = arreglo[0];
                  var vnmovimiento = arreglo[1];
                  var vtipomov = arreglo[2];
                  alert(mensaje);
                  document.getElementById('dmodegresos').style.display='none';
                  var tipomov='E';
                  cineg(tipomov);
                  cargardata();
                  $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
                     $('#dcticketdegreso').html(data);
                     document.getElementById('dticketegreso').style.display='block';
                  });
               }
            }
         }
      });
   }else{
      alert('Existen Datos en Blanco');
   }
  //document.getElementById('dmodegresos').style.display='none';
});

// Boton para cerrar ventana modal para agergar egresos
$('#central').on('click','#bmodceccerrar',function(evento){ 
  document.getElementById('dmodegresos').style.display='none';
});


// Detalles de Flujo x Recaudador
$('#central').on('click','#bfxrmostrar',function(evento){ 
var blanco= ($('#afxrfecha').val()).length;
if(blanco>0) {
  var vfecha=$('#afxrfecha').val();
  $.post('cajafxrecaudador.php',{fecha:vfecha},function(data){
    $('#paginas').html(data);
    document.getElementById('dfxrdetalle').style.display='block'; 
  });
}else{
  alert('No ha seleccionado ninguna fecha');
}
});


//Imprimir flujo x recaudador
$('#central').on('click','#bfxrimprimir',function(evento){ 
    var ficha = document.getElementById('dfxrdetalle');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});


//Flujo x Cajeros
$('#central').on('click','#bfxcmostrar',function(evento){ 
var blanco= ($('#afxcfecha').val()).length;
if(blanco>0) {
  var vfecha=$('#afxcfecha').val();
  $.post('cajafxcajeros.php',{fecha:vfecha},function(data){
    $('#paginas').html(data);
    document.getElementById('dfxcdetalle').style.display='block'; 
  });
}else{
  alert('No ha seleccionado ninguna fecha');
}
});


//Imprimir flujo x Cajeros
$('#central').on('click','#bfxcimprimir',function(evento){ 
    var ficha = document.getElementById('dfxcdetalle');
    var ventimp = window.open(' ', 'popimpr');
    //ventimp.document.write('<link rel="stylesheet" href="../css/general.css">');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    //var css = ventimp.document.createElement("link");
    //css.setAttribute("href", "../css/general.css");
    //css.setAttribute("rel", "stylesheet");
    //css.setAttribute("type", "text/css");
    //ventimp.document.head.appendChild(css);
    ventimp.print( );
    ventimp.close();
});


//Flujo x Detallado
$('#central').on('click','#bfxdmostrar',function(evento){ 
var blanco= ($('#afxdfecha').val()).length;
if(blanco>0) {
  var vfecha=$('#afxdfecha').val();
  $.post('cajafxdetallado.php',{fecha:vfecha},function(data){
    $('#paginas').html(data);
    document.getElementById('dfxddetalle').style.display='block'; 
  });
}else{
  alert('No ha seleccionado ninguna fecha');
}
});

//Imprimir flujo x Cajeros
$('#central').on('click','#bfxdimprimir',function(evento){ 
    var ficha = document.getElementById('dfxddetalle');
    var ventimp = window.open(' ', 'popimpr');
    //ventimp.document.write('<link rel="stylesheet" href="../css/general.css">');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    //var css = ventimp.document.createElement("link");
    //css.setAttribute("href", "../css/general.css");
    //css.setAttribute("rel", "stylesheet");
    //css.setAttribute("type", "text/css");
    //ventimp.document.head.appendChild(css);
    ventimp.print( );
    ventimp.close();
});


//PAGO DE INTERES POR CUENTA
//Previsualizar el pago de interes por cuenta.
$('#central').on('click','#bcpimostrar',function(evento){ 
var blanco= ($('#acpipagomes').val()).length;
if(blanco>0) {
  var vdescripcion=$('#acpidescripcion').val();
  var vmespago=$('#acpipagomes').val();
  var date = new Date();
  var ultimoDia = new Date(date.getFullYear(), vmespago, 0);
  if(date>ultimoDia){
    $.post('cajapagointeres.php',{descripcion:vdescripcion,mespago:vmespago},function(data){
      $('#paginas').html(data);
      document.getElementById('dpagointeres').style.display='block'; 
      $("#acpipagomes").val(vmespago);
      $("#acpidescripcion").val(vdescripcion);
    });
  }else{
    alert('No se puede pagar interes porque el Mes no finalizo');
    alert(ultimoDia);
  }
}else{
  alert('No ha seleccionado ningun periodo de pago');
}
});


$('#central').on('click','#bcpipagar',function(evento){ 
  var vdescripcion=$('#acpidescripcion').val();
  var vmespago=$('#acpipagomes').val();
  var datos='tipo=INT'+'&descripcion='+$('#acpidescripcion').val()+'&mespago='+$('#acpipagomes').val();
    alert(datos);
    $.ajax({
      url: "../phps/dataahorro.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor==2){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmoddepositar').style.display='none';
          }else{
              var arreglo = JSON.parse(valor); // ok
              var mensaje = arreglo[0];
              var vtipomov = arreglo[1];
              alert(mensaje);
              //document.getElementById('dmoddepositar').style.display='none';
          
          }
      }
    });
});


//PAGO TOTAL DE PRESTAMO
//Mostramos los detalles del Pago Total
$('#central').on('click','#bcpgtodetalles',function(evento){ 
var data = dtable.row( $(this).parents("tr") ).data();
    var datos='tipo=MPTO'+'&nprestamo='+data['cuenta'];
      $.ajax({
        url: "../phps/mostrarcuota.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcontenidopagocuota').html(valor);
          document.getElementById('dmodpagototal').style.display='block';
        }
      });
});


//Se realiza el Pago Total del Pretamo
$('#central').on('click','#bcpgtopagar',function(evento){ 
    var ncuota=$('#tcuotas').find("tr").eq('1').find("td").eq(0).html();
    var fechaprog=$('#tcuotas').find("tr").eq('1').find("td").eq(1).html();
    var dmora=$('#tcuotas').find("tr").eq('1').find("td").eq(2).html();
    var vmora=$('#tcuotas').find("tr").eq('1').find("td").eq(3).html();
    var vdescuento=$('#tcuotas').find("tr").eq('1').find("td").eq(8).html();
    var vcuota=$('#tcuotas').find("tr").eq('1').find("td").eq(9).html();
    var datos='tipo=PGTO'+'&idsocio='+$('#lpcidsocio').text()+'&nprestamo='+$('#lpcnprestamo').text()+'&descripcion='+$('#lpcdescripcion').text()+'&ncuota='+ncuota+'&fechaprog='+fechaprog+'&dmora='+dmora+'&vmora='+vmora+'&vcuota='+vcuota+'&vdescuento='+vdescuento+'&monto='+$('#apcmonto').val()+'&mtotal='+$('#lpttotal').text();
    $.ajax({
      url: "../phps/datapagocuota.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            alert('UD NO ES UN USUARIO CON FACULTADES PARA REALIZAR COBROS');
            document.getElementById('dmodpagocuota').style.display='none';
          }else{
            if(valor=='1'){
              alert('NO APERTURO CAJA PARA REALIZAR COBROS');
              document.getElementById('dmodpagocuota').style.display='none';
            }else{
              if(valor=='3'){
                 alert('EXISTEN CUOTAS VENCIDAS QUE SE DEBEN DE REGULARIZAR ANTES DEL PAGO TOTAL');
                 document.getElementById('dmodpagocuota').style.display='none';
              }else{
                 var arreglo = JSON.parse(valor); // ok
                 var mensaje = arreglo[0];
                 var vnmovimiento = arreglo[1];
                 var vtipomov = arreglo[2];
                 var vncuotas = arreglo[3];
                 alert(mensaje);
                 document.getElementById('dmodpagototal').style.display='none';
                 $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento,ncuotas:vncuotas},function(data){
                 $('#dcticketpcuota').html(data);
                 document.getElementById('dticketpcuota').style.display='block';
                 });  
              }
            }
          }
      }
    });
});


//Cerramos modal detalles pago total
$('#central').on('click','#bcpgtocerrar',function(evento){ 
    document.getElementById('dmodpagototal').style.display='none';
});


//DUPLICADO DE OPERACIONES
// Mostrar Duplicados de Operaciones
$('#central').on('click','#bcdopemostrar',function(evento){ 
var blanco= ($('#acdopefecha').val()).length;
if(blanco>0) {
  var vfecha=$('#acdopefecha').val();
  var vmovimiento=$('#acdopemovimiento').val();
   $.post('cajaduplicado.php',{fecha:vfecha},function(data){
      $('#paginas').html(data);
      cduplicado(vfecha,vmovimiento);
      cargardata();
   });
}else{
  alert('No ha seleccionado ninguna fecha');
}
});

$('#central').on('click','#bcdreimprimir',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  //var datos='nprestamo='+data['cuenta'];
  var vnmovimiento = data['numeromov'];
  var vtipomov = data['tipomov'];
   $.post('../phps/dticket.php',{tipomov:vtipomov,nmovimiento:vnmovimiento},function(data){
   $('#dcticketduplicado').html(data);
   document.getElementById('dticketduplicado').style.display='block';
   });
});

// ------------------ FIN FUNCIONES OPCIONES CAJA -------------------//
//-------------------------------------------------------------------//
// -------------- INICIO FUNCIONES OPCIONES REPORTES ----------------//

//Reporte Productividad
$('#central').on('click','#brprogenerar',function(evento){ 
var blanco= ($('#arprofinicio').val()).length * ($('#arproffin').val()).length;
if(blanco>0) {
  var vfinicio=$('#arprofinicio').val();
  var vffin=$('#arproffin').val();
  var vrecaudador=$('#arprorecaudador').val();
  var nrecaudador=$('#arprorecaudador option:selected').text();
  $.post('reporteproductividad.php',{finicio:vfinicio, ffin:vffin, idrecaudador:vrecaudador, recaudador:nrecaudador},function(data){
    $('#paginas').html(data);
    document.getElementById('drproproductividad').style.display='block'; 
  });
}else{
  alert('No ha seleccionado ninguna fecha');
}
});

//Imprimir Reporte Productividad
$('#central').on('click','#brpropimprimir',function(evento){ 
    var ficha = document.getElementById('drproproductividad');
    var ventimp = window.open(' ', 'popimpr');
    //ventimp.document.write('<link rel="stylesheet" href="../css/general.css">');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
});


//Reporte Recaudacion
$('#central').on('click','#brrecmostrar',function(evento){ 

var blanco= ($('#arrecperiodo').val()).length * ($('#arrecano').val()).length;
if(blanco>0) {
  var vperiodo=$('#arrecperiodo').val();
  var vano=$('#arrecano').val();
  var vrecaudador=$('#arrecpromotor').val();
  var nrecaudador=$('#arrecpromotor option:selected').text();
  $.post('rptrecaudar.php',{periodo:vperiodo, ano:vano, idrecaudador:vrecaudador, recaudador:nrecaudador},function(data){
    $('#paginas').html(data);
    document.getElementById('drrecrecaudar').style.display='block';
  });
}else{
  alert('Faltan seleccionar datos');
}

});

//----------------- FIN FUNCIONES OPCIONES REPORTES -----------------//
//-------------------------------------------------------------------//
// ------------ INICIO FUNCIONES OPCIONES GESTION MORA --------------//

//GESTION MORA
// Botón para generar el reporte
$('#central').on('click','#bgmrmgenerar',function(evento){ 
  var vanalista=$('#agmrmanalista').val();
  var nanalista=$('#agmrmanalista option:selected').text();
  $.post('gmorarmora.php',{idanalista:vanalista, analista:nanalista},function(data){
    $('#paginas').html(data);
    document.getElementById('dgmrmora').style.display='block'; 
  });
});

//Boton para mostar extracto de Gestion Mora - reporte mora 
$('#central').on('click','#bgmrmextracto',function(evento){ 
  var ncuenta= $(this).text();
  var datos='tipo=EXTR'+'&nprestamo='+ncuenta;
      $.ajax({
        url: "../phps/dataprestamo.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dextractoprestamo').html(valor);
          document.getElementById('dmodextractoprestamo').style.display='block';
          //datosahorro();
        }
      });
  //alert('Estamos probando si funca'+ncuenta);
});


$('#central').on('click','#bgmrmimprimir',function(evento){ 
    var ficha = document.getElementById('dgmrmora');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print();
    ventimp.close();
});
//--------------- FIN FUNCIONES OPCIONES GESTION MORA ---------------//
//-------------------------------------------------------------------//
// ------------ INICIO FUNCIONES OPCIONES MANTENIMIENTO -------------//

//Funciones para Anular Operaciones
$('#central').on('click','#bmaopemostrar',function(evento){ 
   var blanco= ($('#amaopefecha').val()).length;
   if(blanco>0) {
      var vfecha=$('#amaopefecha').val();
      var vmovimiento=$('#amaopemovimiento').val();
      $.post('manteanulacion.php',{fecha:vfecha},function(data){
         $('#paginas').html(data);
         manulacion(vfecha,vmovimiento);
         cargardata();
      });
   }else{
      alert('No ha seleccionado ninguna fecha');
   }
});


//ELiminamos la Operacion
$('#central').on('click','#bmaoperacion',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  $('#lamaoperacion').text(data['operacion']);
  $('#lamaidmov').text(data['idmovimiento']);
  $('#lamatipomov').text(data['tipomov']);
  $('#lamamonto').text(data['monto']);
  document.getElementById('dmodanularope').style.display='block';
});


$('#central').on('click','#bmaopeanular',function(evento){ 
  var datos='tipo=ANUL'+'&idmov='+$('#lamaidmov').text()+'&tipomov='+$('#lamatipomov').text();
  $.ajax({
     url: "../phps/datamovimiento.php",
     type: "POST",
     data: datos,
     success: function(valor) {
          alert(valor);
          $.post('manteanulacion.php',function(data){
             $('#paginas').html(data);
             manulacion();
             cargardata();
          });
          document.getElementById('dmodanularope').style.display='none';
     }
  });
});


$('#central').on('click','#bmaopecancelar',function(evento){ 
  document.getElementById('dmodanularope').style.display='none';
});


// TRABAJADOR
$('#central').on('click','#brtnuevo',function(evento){ 
  document.getElementById('dmodtrabajador').style.display='block';
  $('#artdni').val('');
  $('#artapaterno').val('');
  $('#artamaterno').val('');
  $('#artnombres').val('');
  $('#artcelular').val('');
}); 


$('#central').on('click','#bmodrtcerrar',function(evento){ 
  document.getElementById('dmodtrabajador').style.display='none';
});

//GUARDA UN NUEVO TRABAJADOR
$('#central').on('click','#bmodrtguardar',function(evento){ 
  var blanco = ($('#artdni').val()).length * ($('#artapaterno').val()).length * ($('#artamaterno').val()).length * ($('#artnombres').val()).length * ($('#artcelular').val()).length;
  if(blanco>0) {
    //$('#arttipotrabajador option:selected').text()
    var datos='tipo=INS'+'&dni='+$('#artdni').val()+'&apaterno='+$('#artapaterno').val()+'&amaterno='+$('#artamaterno').val()+'&nombres='+$('#artnombres').val()+'&celular='+$('#artcelular').val()+'&tipotrabajador='+$('#arttipotrabajador').val()+'&sucursal='+$('#artsucursal').val();
     $.ajax({
      url: "../phps/datatrabajador.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          swal(valor);
          $.post('mantetrabajador.php',function(data){
            $('#paginas').html(data);
            mtrabajador();
            cargardata();
          });
          document.getElementById('dmodtrabajador').style.display='none';
      }
    });
  }else
  {
    alert("Existen campos en blanco");
  }
});

//Dar de Baja Trabajador
$('#central').on('click','#bmteliminar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  $('#labtnombre').text(data['trabajador']);
  $('#labtdni').text(data['dni']);
  $('#labtid').text(data['n']);
  document.getElementById('dmodbtrabajador').style.display='block';
});


$('#central').on('click','#bmodbtaceptar',function(evento){ 
    var datos='tipo=BAJA'+'&dni='+$('#labtdni').text()+'&idtrabajador='+$('#labtid').text();
    $.ajax({
      url: "../phps/datatrabajador.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          if(valor=='2'){
            alert('ESTE TRABAJADOR YA FUE DADO DE BAJA');
            document.getElementById('dmodbtrabajador').style.display='none';
          }else{
            if(valor=='1'){
            alert('UD NO CUENTA CON FACULTADES PARA DAR DE BAJA A ESTE USUARIO');
              document.getElementById('dmodbtrabajador').style.display='none';
            }else{
              swal(valor)
              document.getElementById('dmodbtrabajador').style.display='none';
              mtrabajador();
              cargardata();
            }
          }
      }
    });
});


$('#central').on('click','#bmodbtcerrar',function(evento){ 
    document.getElementById('dmodbtrabajador').style.display='none';
});



//MODIFICAR DATOS DEL TRABAJADOR
$('#central').on('click','#bmteditar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  //var dni = data['dni'];
  document.getElementById('dmodmtrabajador').style.display='block';
  $('#amtdni').val(data['dni']);
  $('#amtapaterno').val(data['apaterno']);
  $('#amtamaterno').val(data['amaterno']);
  $('#amtnombres').val(data['nombres']);
  $('#amtcelular').val(data['celular']);
  $("#amttipotrabajador").find('option:contains("'+data['descripcion']+'")').prop('selected', true);
  $("#amtsucursal").val(data['sucursal']);
  //$("#amtsucursal").find('option:contains("'+data['sucursal']+'")').prop('selected', true);          

});


$('#central').on('click','#bmodmmtguardar',function(evento){ 

  var datos='tipo=ACT'+'&dni='+$('#amtdni').val()+'&apaterno='+$('#amtapaterno').val()+'&amaterno='+$('#amtamaterno').val()+'&nombres='+$('#amtnombres').val()+'&celular='+$('#amtcelular').val()+'&tipotrabajador='+$('#amttipotrabajador').val()+'&sucursal='+$('#amtsucursal').val();
     $.ajax({
      url: "../phps/datatrabajador.php",
      type: "POST",
      data: datos,
      success: function(valor) {
          swal(valor);
          $.post('mantetrabajador.php',function(data){
            $('#paginas').html(data);
            mtrabajador();
            cargardata();
          });
          document.getElementById('dmodmtrabajador').style.display='none';
      }
    });
});


$('#central').on('click','#bmodmmtcerrar',function(evento){ 
  document.getElementById('dmodmtrabajador').style.display='none';
});



// USUARIO
$('#central').on('click','#brunuevo',function(evento){ 
  document.getElementById('dmodusuario').style.display='block';
  $('#aruusuario').val('');
  $('#arucontrasena').val('');
  $('#arurcontrasena').val('');
}); 


$('#central').on('click','#bmodruguardar',function(evento){ 
var blanco = ($('#aruusuario').val()).length * ($('#arucontrasena').val()).length * ($('#arurcontrasena').val()).length;

  var validar = $('#arucontrasena').val();
  var vcontrasena = /^(?=(?:.*\d){2})(?=(?:.*[A-Z]){2})(?=(?:.*[a-z]){2})\S{6,10}$/i        
  
  if(blanco>0) {
    //$('#arttipotrabajador option:selected').text()
    if($('#arucontrasena').val()==$('#arurcontrasena').val()){ 
      if (vcontrasena.test(validar)) {
        var datos='tipo=INS'+'&usuario='+$('#aruusuario').val()+'&contrasena='+$('#arucontrasena').val()+'&idtrabajador='+$('#arutrabajador').val();
        $.ajax({
        url: "../phps/datausuario.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          alert(valor);
          $.post('manteusuario.php',function(data){
            $('#paginas').html(data);
              musuario();
              cargardata();
          });
          document.getElementById('dmodusuario').style.display='none';
        }
       });
      } else {
      alert('Contraseña no cumple con lo requisitos necesarios');
      }
    }else{
      alert("La contraseña que escribiste no coincide");
    }
  }else{
    alert("Existen campos en blanco");
  }
});


$('#central').on('click','#bmodrucerrar',function(evento){ 
  document.getElementById('dmodusuario').style.display='none';
});


$('#central').on('click','#bmuresetpass',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
   //var datos1 = data['n']+'-'+data['idtrabajador'];
  var datos='tipo=RES'+'&usuario='+data['n']+'&idtrabajador='+data['idtrabajador'];
  alert("Se Actualizara la Contraseña");
        $.ajax({
        url: "../phps/datausuario.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          alert(valor);
        }
       });
});

// TIPO PRESTAMO
$('#central').on('click','#brtpnuevo',function(evento){ 
  document.getElementById('dmodtipoprestamo').style.display='block';
  //alert("Registrar Nuevo Tipo de Prestamo");
  $('#artpdescripcion').val('');
  $('#artpplazo').val('');
  $('#artptem').val('');
  $('#artpcomision').val('');
  $('#artpmora').val('');
  $('#artpmontomin').val('');
  $('#artpmontomax').val('');
}); 


$('#central').on('click','#bmodrtpguardar',function(evento){ 
var blanco = ($('#artpdescripcion').val()).length * ($('#artpplazo').val()).length * ($('#artptem').val()).length * ($('#artpcomision').val()).length * ($('#artpmora').val()).length * ($('#artpmontomin').val()).length * ($('#artpmontomax').val()).length;  
if(blanco>0) {
    var datos='tipo=INS'+'&descripcion='+$('#artpdescripcion').val()+'&plazo='+$('#artpplazo').val()+'&tem='+$('#artptem').val()+'&comision='+$('#artpcomision').val()+'&mora='+$('#artpmora').val()+'&moneda='+$('#artpmoneda').val()+'&montomin='+$('#artpmontomin').val()+'&montomax='+$('#artpmontomax').val();
    $.ajax({
      url: "../phps/datatipoprestamo.php",
      type: "POST",
      data: datos,
      success: function(valor) {
        alert(valor);
        $.post('mantetipoprestamo.php',function(data){
          $('#paginas').html(data);
            mtipoprestamo();
            cargardata();
        });
        document.getElementById('dmodtipoprestamo').style.display='none';
      }
    });
  }else{
    alert("Existen campos en blanco");
  }
});


$('#central').on('click','#bmodrtpcerrar',function(evento){ 
  document.getElementById('dmodtipoprestamo').style.display='none';
});



//editar datos tipo prestamo
$('#central').on('click','#btpeditar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  $('#lmtpid').text(data['n']);
  $('#amtpdescripcion').val(data['descripcion']);
  $('#amtpplazo').val(data['plazo']);
  $('#amtptem').val(data['tem']);
  $('#amtpcomision').val(data['comision']);
  $('#amtpmora').val(data['mora']);
  $('#amtpmoneda').val(data['moneda']);
  $('#amtpmontomin').val(data['montomin']);
  $('#amtpmontomax').val(data['montomax']);
  document.getElementById('dmodmtipoprestamo').style.display='block';
});


$('#central').on('click','#bmodmtpguardar',function(evento){ 
    var datos='tipo=ACT'+'&id='+$('#lmtpid').text()+'&descripcion='+$('#amtpdescripcion').val()+'&plazo='+$('#amtpplazo').val()+'&tem='+$('#amtptem').val()+'&comision='+$('#amtpcomision').val()+'&mora='+$('#amtpmora').val()+'&moneda='+$('#amtpmoneda').val()+'&montomin='+$('#amtpmontomin').val()+'&montomax='+$('#amtpmontomax').val();
    $.ajax({
      url: "../phps/datatipoprestamo.php",
      type: "POST",
      data: datos,
      success: function(valor) {
        alert(valor);
        $.post('mantetipoprestamo.php',function(data){
          $('#paginas').html(data);
          mtipoprestamo();
          cargardata();
        });
        document.getElementById('dmodmtipoprestamo').style.display='none';
      }
    });
});


$('#central').on('click','#bmodmtpcerrar',function(evento){ 
  document.getElementById('dmodmtipoprestamo').style.display='none';
});


//     FUNCIONES NUEVO TIPO AHORRO     //
$('#central').on('click','#brtanuevo',function(evento){ 
  document.getElementById('dmodtipoahorro').style.display='block';
  //alert("Registrar Nuevo Tipo de Prestamo");
  $('#artadescripcion').val('');
  $('#artaplazo').val('');
  $('#artatem').val('');
  $('#artamontomin').val('');
  $('#artamontomax').val('');
}); 


$('#central').on('click','#bmodtaguardar',function(evento){ 
var blanco = ($('#artadescripcion').val()).length * ($('#artaplazo').val()).length * ($('#artatem').val()).length  * ($('#artamontomin').val()).length * ($('#artamontomax').val()).length;  
if(blanco>0) {
    var datos='tipo=INS'+'&descripcion='+$('#artadescripcion').val()+'&plazo='+$('#artaplazo').val()+'&tem='+$('#artatem').val()+'&moneda='+$('#artamoneda').val()+'&montomin='+$('#artamontomin').val()+'&montomax='+$('#artamontomax').val();
    $.ajax({
      url: "../phps/datatipoahorro.php",
      type: "POST",
      data: datos,
      success: function(valor) {
        alert(valor);
        $.post('mantetipoahorro.php',function(data){
          $('#paginas').html(data);
           mtipoahorro();
           cargardata();
        });
        document.getElementById('dmodtipoahorro').style.display='none';
      }
    });
  }else{
    alert("Existen campos en blanco");
  }
});


$('#central').on('click','#bmodtacerrar',function(evento){ 
  document.getElementById('dmodtipoahorro').style.display='none';
});


//editar datos tipo ahorro
$('#central').on('click','#btaeditar',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  $('#lmtaid').text(data['n']);
  $('#amtadescripcion').val(data['descripcion']);
  $('#amtaplazo').val(data['plazo']);
  $('#amtatem').val(data['tem']);
  $('#amtamoneda').val(data['moneda']);
  $('#amtamontomin').val(data['montomin']);
  $('#amtamontomax').val(data['montomax']);
  document.getElementById('dmodmtipoahorro').style.display='block';
});


$('#central').on('click','#bmodmtaguardar',function(evento){ 
    var datos='tipo=ACT'+'&id='+$('#lmtaid').text()+'&descripcion='+$('#amtadescripcion').val()+'&plazo='+$('#amtaplazo').val()+'&tem='+$('#amtatem').val()+'&moneda='+$('#amtamoneda').val()+'&montomin='+$('#amtamontomin').val()+'&montomax='+$('#amtamontomax').val();
    $.ajax({
      url: "../phps/datatipoahorro.php",
      type: "POST",
      data: datos,
      success: function(valor) {
        alert(valor);
        $.post('mantetipoahorro.php',function(data){
           $('#paginas').html(data);
           mtipoahorro();
           cargardata();
        });
        document.getElementById('dmodmtipoahorro').style.display='none';
      }
    });
});


$('#central').on('click','#bmodmtacerrar',function(evento){ 
  document.getElementById('dmodmtipoahorro').style.display='none';
});


//--- INICIO FUNCIONES DE CAMBIO DE CARTERA---//
$('#central').on('click','#bmccartera',function(evento){ 
   var data = dtable.row( $(this).parents("tr") ).data();
   $('#lmccidprestamo').text(data['idprestamo']);
   $('#lmccsocio').text(data['socio']);
   $('#lmccidsocio').text(data['idsocio']);
   $('#lmccidpromotor').text(data['analista']);
   $('#amccpromotor').val(data['nanalista']);
   document.getElementById('dmodccartera').style.display='block';
}); 


$('#central').on('click','#bmcccambiar',function(evento){ 
   var datos='tipo=UPCAR'+'&idprestamo='+$('#lmccidprestamo').text()+'&idanalista='+$('#smccanalista').val();
   $.ajax({
      url: "../phps/dataprestamo.php",
      type: "POST",
      data: datos,
      success: function(valor) {
         swal(valor);
         $.post('manteccartera.php',function(data){
         $('#paginas').html(data);
            mccartera();
            cargardata();
         });   
      document.getElementById('dmodccartera').style.display='none';
      }
   });
});


$('#central').on('click','#bmcccancelar',function(evento){ 
    document.getElementById('dmodccartera').style.display='none';
}); 
//---  FIN FUNCIONES DE CAMBIO DE CARTERA  ---//


// FUNCIONES FERIADO
$('#central').on('click','#bmfnuevo',function(evento){ 
  document.getElementById('dmodferiado').style.display='block';
  //alert("Registrar Nuevo Tipo de Prestamo");
  $('#amfdescripcion').val('');
}); 


$('#central').on('click','#bmodmfguardar',function(evento){ 
var blanco = ($('#amfdescripcion').val()).length * ($('#amffecha').val()).length;
if(blanco>0) {
    var datos='tipo=INS'+'&descripcion='+$('#amfdescripcion').val()+'&fecha='+$('#amffecha').val();
    $.ajax({
      url: "../phps/dataferiado.php",
      type: "POST",
      data: datos,
      success: function(valor) {
        alert(valor);
        $.post('manteferiado.php',function(data){
          $('#paginas').html(data);
          datosferiado();
        });
        document.getElementById('dmodferiado').style.display='none';
      }
    });
  }else{
    alert("Existen campos en blanco");
  }
});


$('#central').on('click','#bmodmfcerrar',function(evento){ 
  document.getElementById('dmodferiado').style.display='none';
});


//Funciones Bloqueo de Ahorro

$('#central').on('click','#bmbahorro',function(evento){ 
  var data = dtable.row( $(this).parents("tr") ).data();
  $('#labacuenta').text(data['cuenta']);
  $('#labaid').text(data['n']);
  $('#labasaldo').text(data['saldo']);
  document.getElementById('dmodbloahorro').style.display='block';
});


$('#central').on('click','#bbabloquear',function(evento){ 
  var datos='tipo=BLOQ'+'&id='+$('#labaid').text()+'&ncuenta='+$('#labacuenta').text();
  $.ajax({
     url: "../phps/dataahorro.php",
     type: "POST",
     data: datos,
     success: function(valor) {
          alert(valor);
          $.post('mantebahorro.php',function(data){
             $('#paginas').html(data);
             mbahorro();
             cargardata();
          });
          document.getElementById('dmodbloahorro').style.display='none';
     }
  });
});


$('#central').on('click','#bbacancelar',function(evento){ 
  document.getElementById('dmodbloahorro').style.display='none';
});


// INICIO FUNCIONES DESCUENTO MORA
// Muestra Ventana Modal con las cuotas para generar descuentos
$('#central').on('click','#bmdescuento',function(evento){ 
    var data = dtable.row( $(this).parents("tr") ).data();
    var datos='tipo=MPDM'+'&nprestamo='+data['cuenta'];
      $.ajax({
        url: "../phps/mostrarcuota.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#dcontenidopagocuota').html(valor);
          document.getElementById('dmodpagocuota').style.display='block';
        }
      });
});


// Guarda los descuentos generados de las cuotas.
$('#central').on('click','#bcdesmguardar',function(evento){ 

   var dtotal=parseFloat($('#amdmmora').val())+parseFloat($('#amdmcomision').val())+parseFloat($('#amdminteres').val());
   var dtotal=dtotal.toPrecision(2);
   var mora=$('#tcuotas').find("tr").eq(row_num).find("td").eq(3).html();
   var comision=$('#tcuotas').find("tr").eq(row_num).find("td").eq(4).html();
   var ahorro=$('#tcuotas').find("tr").eq(row_num).find("td").eq(5).html();
   var interes=$('#tcuotas').find("tr").eq(row_num).find("td").eq(6).html();
   var capital=$('#tcuotas').find("tr").eq(row_num).find("td").eq(7).html();
   var total=(parseFloat(mora)+parseFloat(comision)+parseFloat(ahorro)+parseFloat(interes)+parseFloat(capital))-parseFloat(dtotal);
   $('#ldmtotal').text(dtotal);
   $('#tcuotas').find("tr").eq(row_num).find("td").eq(8).html(dtotal);
   var total=total.toPrecision(3);
   $('#tcuotas').find("tr").eq(row_num).find("td").eq(9).html(total);

   var datos='tipo=DMCU'+'&nprestamo='+$('#lpcnprestamo').text()+'&ncuota='+$('#ldmncuota').text()+'&descuentom='+$('#amdmmora').val()+'&descuentoc='+$('#amdmcomision').val()+'&descuentoi='+$('#amdminteres').val();
   $.ajax({
     url: "../phps/datapagocuota.php",
     type: "POST",
     data: datos,
     success: function(valor) {
          alert(valor);
     }
   });


});


$('#central').on('click','#tcuotas td',function(evento){ 

//    var fechaprog=$('#tcuotas').find("tr").eq('1').find("td").eq(1).html();
//    var dmora=$('#tcuotas').find("tr").eq('1').find("td").eq(2).html();
//    var vmora=$('#tcuotas').find("tr").eq('1').find("td").eq(3).html();
//    var vdescuento=$('#tcuotas').find("tr").eq('1').find("td").eq(8).html();
//   var vcuota=$('#tcuotas').find("tr").eq('1').find("td").eq(9).html();
//    var datos='tipo=PGC'+'&idsocio='+$('#lpcidsocio').text()+'&nprestamo='+$('#lpcnprestamo').text()+'&descripcion='+$('#lpcdescripcion').text()+'&ncuota='+ncuota+'&fechaprog='+fechaprog+'&dmora='+dmora+'&vmora='+vmora+'&vdescuento='+vdescuento+'&vcuota='+vcuota+'&monto='+$('#apcmonto').val();
   var registros = $("#tcuotas tr").length;
   row_num = parseInt( $(this).parent().index() ); 
   //var column_num = parseInt( $(this).index() );
   var ncuota=$('#tcuotas').find("tr").eq(row_num).find("td").eq(0).html();
   
   for (var i=1; i<registros; i++) {
      if(row_num!=i){
      //$('#tcuotas').find("tr").eq(i).css('display','none');
      $('#tcuotas').find("tr").eq(i).toggle();
       }
   }
   $('#ldmncuota').text(ncuota);
   $('#amdmmora').val('0');
   $('#amdmcomision').val('0');
   $('#amdminteres').val('0');
   $('#ldmtotal').text('0.00');

});


// Cierra Ventana Modal de las cuotas para generar descuentos
$('#central').on('click','#bcdesmcerrar',function(evento){ 
    document.getElementById('dmodpagocuota').style.display='none';
});

// -------------- FIN FUNCIONES OPCION MANTENIMIENTO ----------------//
//-------------------------------------------------------------------//
// ---------------- INICIO FUNCIONES OPCION SIMULAR -----------------//

// Funciones Simular Tipo Ahorro
$('#central').on('click','#bsasimular',function(evento){ 
  ///document.getElementById('dmodtipoprestamo').style.display='block';
   var blanco = ($('#asamonto').val()).length;
   if(blanco>0) {
      var datos='monto='+$('#asamonto').val();
      $.ajax({
      url: "../phps/calcularahorros.php",
      type: "POST",
      data: datos,
        success: function(valor) {
        //alert(valor);
        //$.post('mantetipoahorro.php',function(data){
          $('#dcalcular').html(valor);
          document.getElementById('dcalcular').style.display='block';
          //datosahorro();
        //});
        }
      });

    }else{
      alert("No ingreso ningun monto a simular");
   }
}); 

// Funciones Simular Credito
$('#central').on('click','#aselcredito',function(evento){ 
  var data;
    data=$(this).parents("tr").find("td").eq(3).html();
    data = data.substring(0,data.length-1);
    $('#asctem').val(data);
    data=$(this).parents("tr").find("td").eq(1).html();
    $('#ascprestamo').val(data);
    data=$(this).parents("tr").find("td").eq(2).html();
    $('#ascplazo').val(data);
    data=$(this).parents("tr").find("td").eq(5).html();
    //data = data.substring(4,data.length); Comsion en soles
    data = data.substring(0,data.length-1);
    $('#asccomision').val(data);
    data=$(this).parents("tr").find("td").eq(6).html();
    data = data.substring(0,data.length-1);
    $('#ascmora').val(data);
    switch($('#ascfpago').val()){
      case '1':
        $('#ascaporte').val('0.40');
        break;
      case '2':
        $('#ascaporte').val('0.40');
        break;
      case '3':
        $('#ascaporte').val('2.50');
        break;
      case '4':
        $('#ascaporte').val('5.00');
        break;
      case '5':
        $('#ascaporte').val('10.00');
        break;
    }
}); 

/*
$('#central').on('click','#bdemos',function(evento){ 
var rowCount = $('#tablasc >tbody >tr').length;
var dato=$('#tablasc >tbody').find("tr").eq(1).find("td").eq(1).html();
var dato1=$('#tablasc >tbody >tr').eq(1).find("td").eq(2).html();
var dato2=$('#tablasc >tbody >tr').eq(1).find("td").eq(3).html();
alert('obtener data de la cela'+rowCount+dato+dato1+dato2);
}); 
*/

$('#central').on('change','#ascfpago',function(evento){ 
    switch($('#ascfpago').val()){
      case '1':
        $('#ascaporte').val('0.40');
        break;
      case '2':
        $('#ascaporte').val('0.40');
        break;
      case '3':
        $('#ascaporte').val('2.50');
        break;
      case '4':
        $('#ascaporte').val('5.00');
        break;
      case '5':
        $('#ascaporte').val('10.00');
        break;
    }
});

$('#central').on('click','#bscsimular',function(evento){ 
var blanco = ($('#ascmonto').val()).length * ($('#asctem').val()).length * ($('#ascaporte').val()).length;

if($("input[name=sccredito]:checked").val()) {  
   if(blanco>0) {
    var datos='tprestamo='+$('input:radio[name=sccredito]:checked').val()+'&monto='+$('#ascmonto').val()+'&tem='+$('#asctem').val()+'&prestamo='+$('#ascprestamo').val()+'&plazo='+$('#ascplazo').val()+'&comision='+$('#asccomision').val()+'&mora='+$('#ascmora').val()+'&fpago='+$('#ascfpago').val()+'&descfpago='+$('#ascfpago option:selected').text()+'&aporte='+$('#ascaporte').val();
      $.ajax({
        url: "../phps/simularcredito.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          $('#paginas').html(valor);
        }
      });
    }else{
      alert("No ingreso ningun monto a simular");
   } 
} else {  
  alert("No Seleccionado ningun tipo de Prestamo");  
} 
});

//Imprimir Cronograma Simulado
$('#central').on('click','#bscimprimir',function(evento){ 
    var ficha = document.getElementById('dsimcronograma');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
});

// -------------- FIN FUNCIONES OPCIONES SIMULAR --------------------//
//-------------------------------------------------------------------//
// -------------- INICIO FUNCIONES OPCIONES USUARIO -----------------//
$('#central').on('click','#bcccambiar',function(evento){ 
   //alert('cambia contraseña'+$('#acctrabajador').val());
   var blanco = ($('#accusuario').val()).length * ($('#acccontrasena').val()).length * ($('#accrcontrasena').val()).length;

   var validar = $('#acccontrasena').val();
   var vcontrasena = /^(?=(?:.*\d){2})(?=(?:.*[A-Z]){2})(?=(?:.*[a-z]){2})\S{6,10}$/i        
  
  if(blanco>0) {
    if($('#acccontrasena').val()==$('#accrcontrasena').val()){ 
      if (vcontrasena.test(validar)) {
        
        var datos='tipo=ACT'+'&usuario='+$('#accusuario').val()+'&contrasena='+$('#acccontrasena').val()+'&idtrabajador='+$('#acctrabajador').val();
        $.ajax({
        url: "../phps/datausuario.php",
        type: "POST",
        data: datos,
        success: function(valor) {
          alert(valor);
        }
       }); 
      
      } else {
      alert('Contraseña no cumple con lo requisitos necesarios');
      }
    }else{
      alert("La contraseña que escribiste no coincide");
    }
  }else{
    alert("Existen campos en blanco");
  }
});
// -------------- FIN FUNCIONES OPCIONES USUARIO --------------------//


$('#central').on('click','#bdticketimprimir',function(evento){ 
    var ficha = document.getElementById('dticketcontenido');
    var ventimp = window.open(' ', 'popimpr');
    ventimp.document.write( ficha.innerHTML );
    ventimp.document.close();
    ventimp.print( );
    ventimp.close();
   document.getElementById('dticketcuota').style.display='none';
});

$('#central').on('click','#bdticketcerrar',function(evento){ 
    $(this).parents('.dmodalfondo').css("display","none");

});


}); //Final del Documento JS