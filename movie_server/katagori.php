<?php
/*
	SWAPER, 20201017 Imam Andrias
*/
include "config.php";
mysqli_set_charset($connect, 'utf8');
$query = mysqli_query($connect, 'SELECT *FROM tb_katagori');
while($row = mysqli_fetch_assoc($query)) {
	$data[] = $row;
}
			
$json = json_encode($data);
echo $json;
?>