<?php
include "connect.php";
$ora = date('G');
$query = "SELECT * FROM `autogara` WHERE ora_plecare >=$ora";
$plecari = array();
$result = mysql_query($query);
while($row = mysql_fetch_assoc($result)){ //iterator
	$plecari[] = $row;
}
echo json_encode($plecari);
?>