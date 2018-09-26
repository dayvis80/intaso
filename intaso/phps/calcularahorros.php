<?php 
include('configuracion.php');
$conn = pg_connect("host=".$host." port=".$puerto." user=".$usuario." dbname=".$dbname." password=".$password." ");

$tahorro='PLAZO FIJO';
$monto=$_POST['monto'];

//select * from ttipoahorro where descripcion='PLAZO FIJO';
echo "<br><hr><br>";
echo "MONTO DE AHORRO: " . $monto . "<br>";
?>
<table border="1">
<tr>
<th colspan="4">AHORRO A PLAZO FIJO</th>
</tr>
<tr><td>PLAZO</td>
	<td>MONEDA</td>
	<td>TASA EFECTIVA</td>
	<td>TOTAL</td>
</tr>

<?php 
	$query = pg_query("select plazo, moneda, tem from ttipoahorro where descripcion='PLAZO FIJO'");

	$tregistros = pg_numrows($query);
	for($i=1;$i<=$tregistros; $i++){
    $registros = pg_fetch_array($query, null, PGSQL_ASSOC);
    $total=(($registros[tem]/100)*$monto)+$monto;
    echo '<tr>';
		echo "<td align=right>".$registros[plazo]."</td>";
		echo "<td align=right>".$registros[moneda]."</td>";
		echo "<td align=right>".number_format($registros[tem], 2, '.', ' ').'%'."</td>";
		echo "<td align=right>".number_format($total, 2, '.', ' ')."</td>";	
    echo '</tr>';
	}	

?>

</table>
