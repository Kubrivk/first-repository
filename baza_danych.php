<html>
<head>
<style>
body
{
background-image: url("porsche.jpg");	
}
#lewy
{
	background-color:silver;
	opacity:0.9;
	position:absolute;
	left:5%;
	right:70%;
	top:10%;
	border:4px solid black;
	}
#prawy
{
	background-color:silver;
	opacity:0.9;
	position:absolute;
	left:35%;
	right:5%;
	top:10%;
	text-align: center;
	border:4px solid black;
}
#srodek
{
background-color:silver;
position absolute;
left: 25%;
right: 55%;

}

#font
{
font-family:Times New Roman, times, serif;
font-size:25;
text-align:left;
}

#tab {
	font-size:20;
	border:3px solid grey;
	text-align:center;
	align:center;
	margin:0 auto;
	}
#td
{
	border-right-style: solid;
    border-left-style: solid;
	
	}
#tab1
{

font-size:25px;
text-align:left;
margin:0 auto;
}
#sel
{
width:120px;
margin-left:25%;
}
#sub
{
width:120px;
}
tr:nth-child(even) { background-color:lightblue; }
tr:nth-child(odd) { background-color:DeepSkyBlue; }
#margin
{
	margin-left:30%;
}
	
</style>
<body>
<h1  align="center">KOMIS SAMOCHODOWY</h1>
<div id="lewy">
<p id="font">


<form method="post" action="baza_danych.php">
<p id="font">

<?php
$local="localhost";
$user="root";
$pass="";

$conn = mysqli_connect($local,$user,$pass);
if($conn) echo "<h1 align='center'>Połączono z bazą danych</h1>" . "<br />";

$bd="komis";
$res = mysqli_select_db($conn,$bd);

if($res) echo "<h1 align='center'>Połączono z bazą komisu</h1>" . "<br />";

?>


<?php
$sqlmarka = mysqli_query($conn,'SELECT DISTINCT marka FROM `auto`');

echo "<p id='font'>marka: <br />";

echo "<select name='marka'  id='sel'  >";


while($row1 = mysqli_fetch_row($sqlmarka))


echo '<option>' . $row1[0] . '</option>';
echo '</select><br />';
echo "<input id='sel' type='submit' value='sprawdz modele' id='sub'>";


?>
</form>
<form method="post" action="baza_danych.php">
<?php
$cookiemarka="marka";

@ $marka=$_POST["marka"];

setcookie($cookiemarka,$marka);
?>

<?php
$zapytmarka = "SELECT model FROM `auto` WHERE marka LIKE '$marka' ";

$sqlmodel = mysqli_query($conn,$zapytmarka);

echo "<p id='font'> model: <br /> ";


echo "<select name='model' id='sel'>";
while($row2 = mysqli_fetch_row($sqlmodel))
  echo '<option>' . $row2[0] . '</option>';
echo '</select>';

?>

<p id='font'>rocznik: <br />


 <input id ='sel' type="number" name="rmin" placeholder="1950" min="1950">
<input id='sel' type="number" name="rmax" placeholder="2006" max="2006"> 



<p id='font'>metalic: <br />

<input id='margin' type="radio" name="metalic" value="1">tak 
<input type="radio" name="metalic" value="0" checked="checked">nie


<p id='font'>color: <br />


<input type="checkbox" name="color[]" value="bialy"> biały 
<input type="checkbox" name="color[]" value="szary"> szary <br />
<input type="checkbox" name="color[]" value="czerwony"> czerwony 
<input type="checkbox" name="color[]" value="czarny"> czarny <br />
<input type="checkbox" name="color[]" value="srebrny"> srebrny
<input type="checkbox" name="color[]" value="niebieski"> niebieski  <br />
<input id='sub' type="submit" value="wyslij">
<input id='sub' name="res" type="submit" value="reset">
</form>



 
 </p>
</div>


<?php 
@ $markac = $_COOKIE['marka'];

@ $markap = $_POST['marka'];

@ $model = $_POST['model'];

@ $rmin = $_POST['rmin'];
 
@ $rmax = $_POST['rmax'];

@ $metalic = $_POST['metalic'];




if(isset($_POST["color"]))
{
	if(!empty($_POST["color"]))
	{
		foreach($_POST["color"] as $zaznaczone)
		{	
		 
		
	


$kolor=$zaznaczone;


$sql  =  "SELECT * FROM `auto` WHERE marka LIKE '$markac'
		  AND model LIKE '$model'
		  AND rok BETWEEN $rmin AND $rmax
		  AND metalic LIKE $metalic
		  AND kolor LIKE '$kolor' " ;
}
}
}

else{


$sql  =  "SELECT * FROM `auto` WHERE marka LIKE '$markac'
		  AND model LIKE '$model'
		  AND rok BETWEEN $rmin AND $rmax
		  AND metalic LIKE $metalic " ;

}




if(empty($_POST['rmin']) && empty($_POST['rmax']))
{ 
$sql = "SELECT * FROM `auto`
		WHERE marka LIKE '$markap' ";
}



if(empty($_POST['rmin']) && empty($_POST['rmax']) && isset($_POST['model']))
{ 
$sql = "SELECT * FROM `auto`
		WHERE marka LIKE '$markac'
		AND	model LIKE '$model'	";
}


if(@ $_POST['res'] == "reset")
{
	$sql = "SELECT * FROM `auto` ";
}

?>
 <div id="prawy">
<p id="font">


<table id='tab'>
<tr>
	<td id='td'>id_auto<td id='td'>
	wlascicel_id<td id='td'>
	marka<td id='td'>
	model<td id='td'>
	VIN<td id='td'>
	rok<td id='td'>
	kolor<td id='td'>
	metalic<td id='td'>
	opis<td id='td'>
	FK_wlasciciel</td>
	</tr>
	
 <?php

$wynik = mysqli_query($conn,$sql);	
		
while(@ $row = mysqli_fetch_row($wynik))
   {
	    echo "<TR>";
	    foreach ($row as $col) 
          echo "<TD id='td'> $col </TD>";
	    echo "</TR>\n";
}

	


mysqli_close($conn);
echo "</table>";

?>
</p>
</div>
</body>


</html>