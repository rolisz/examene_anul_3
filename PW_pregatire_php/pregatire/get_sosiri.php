<?php
include "connect.php";
$ora = date('G');
$query = "SELECT * FROM `autogara` WHERE ora_sosire >=$ora LIMIT 5";
$sosiri = array();
$result = mysql_query($query);
while($row = mysql_fetch_assoc($result)){ //iterator
	$sosiri[] = $row;
}
echo json_encode($sosiri); //returneaza in string reprezentare  valori din sosiri
?>