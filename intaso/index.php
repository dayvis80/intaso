<?php
session_start();
	if(isset($_SESSION['login'])==true){
    	header('Location: paginas/principal.php');
	} else {
		header('Location: paginas/login.php');
	}
?>