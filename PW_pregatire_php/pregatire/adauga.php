<?php
include_once "connect.php";
if (!isset($_SESSION['username'])) {
	echo "Trebuie sa fiti logati!";
	exit ;
}
if (isset($_POST['loc_plec']) && 
	isset($_POST['loc_sosire']) && 
	isset($_POST['ora_plec']) &&  
	isset($_POST['minut_plecare']) && 
	isset($_POST['ora_sosire']) && 
	isset($_POST['minut_sosire'])) {
	
	$loc_plec = mysql_real_escape_string($_POST['loc_plec']);
	$loc_sosire = mysql_real_escape_string($_POST['loc_sosire']);
	$ora_plec = mysql_real_escape_string($_POST['ora_plec']);
	$minut_plecare = mysql_real_escape_string($_POST['minut_plecare']);
	$ora_sosire = mysql_real_escape_string($_POST['ora_sosire']);
	$minut_sosire = mysql_real_escape_string($_POST['minut_sosire']);
	
	$query = "INSERT INTO `autogara` (localitate_plecare, localitate_sosire, ora_plecare,minut_plecare, ora_sosire, minut_sosire) VALUES
				('$loc_plec', '$loc_sosire', '$ora_plec', '$minut_plecare', '$ora_sosire', '$minut_sosire')";
	$result = mysql_query($query);
	if ($result) {
		echo "Adaugare cu succes!";
		include "adaugare.php";
	} else {
		echo "Adaugarea a esuat!".mysql_error();
	}
} else {
	echo "Trebuie sa dati toate valorile!";
}

?>