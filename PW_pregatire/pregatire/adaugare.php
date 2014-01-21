<?php 
include_once "connect.php";
if (!isset($_SESSION['username'])) {
	echo "Trebuie sa fiti logati!";
	exit ;
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>Adaugare curse autocar!</title>
</head>
<body>
	<form action="adauga.php" method="post"> <!-- get vs post: get prin url, post altfel (prin headere http) -->
		<ul>
			<li><label for="loc_plec">Localitate plecare:</label><input type="text" name="loc_plec" id="loc_plec"></li> <!--labelul ii ca sa fie dreptunghi corespunzator scrisului-->
			<li><label for="loc_sosire">Localitate sosire:</label><input type="text" name="loc_sosire" id="loc_sosire"></li>
			<li><label for="ora_plec">Ora plecare:</label><input type="text" name="ora_plec" id="ora_plec"></li>
			<li><label for="minut_plecare">Minut plecare:</label><input type="text" name="minut_plecare" id="minut_plecare"></li>
			<li><label for="ora_sosire">Ora sosire:</label><input type="text" name="ora_sosire" id="ora_sosire"></li>
			<li><label for="minut_sosire">Minut sosire:</label><input type="text" name="minut_sosire" id="minut_sosire"></li>
			<li><input type="submit" value="Submit"></li>
		</ul>
	</form>
</body>
</html>