<?php
include "connect.php";
//var_dump($_GET);
//var_dump($_POST);
if (isset($_POST['user']) && isset($_POST['pass'])) {
	$user = mysql_real_escape_string($_POST['user']);
	$pass = mysql_real_escape_string($_POST['pass']);
	$query = "SELECT * FROM `users` WHERE username='$user' AND password='$pass'"; //acc app
	$result = mysql_query($query);
	if (mysql_error()) {
		echo "S-a intamplat o eroare: ".mysql_error();
	}
    $row = mysql_fetch_array($result);
    if ($row) {
		$_SESSION['username'] = $user;
		include "adaugare.php"; //redirect or whatever
	} else {
		echo "Username si/sau parola incorecte!";
	}	
} else {
	echo "Trimiteti userul si parola!";
}
?>