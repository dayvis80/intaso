<?php 
session_start();
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$tipo=$_POST['tipo'];

if($tipo=='CON'){

  //select idferiado as n, dia, fecha from tferiado order by fecha;
  $query = pg_query("select idferiado as n, dia, fecha from tferiado order by fecha;");
  $tregistros = pg_numrows($query);

    for($i=1;$i<=$tregistros; $i++){
      $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
      $data["data"][]=$registros;
    }
  echo json_encode($data);
}


if($tipo=='INS'){

  $descripcion=strtoupper($_POST['descripcion']);
  $fecha= trim($_POST['fecha']);

  $query = "insert into tferiado (dia, fecha) values ('".$descripcion."','".$fecha."');";
  pg_query($query);
  echo "EL FERIADO SE REGISTRO CORRECTAMENTE";
}

pg_free_result($query);
pg_close($BD_conexion);
?>