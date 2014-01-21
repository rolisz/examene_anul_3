<?php
session_start();
$host = "localhost"; //acc bd 
$utilizator = "root";
$parola = "";
$numebd = "pregatire";

//Conectare baza de date
$conn = mysql_connect($host, $utilizator, $parola);
if (!$conn) {
  echo 'Conectare nereusita la MySQL';
  exit;
}
//Selectare baza de date
if (!mysql_select_db($numebd, $conn)) {
  echo 'Baza de date nu a putut fi selectata deoarece : '. mysql_error();
  exit;
}


$sql = "SET NAMES 'utf8'";
mysql_query($sql, $conn);

?>