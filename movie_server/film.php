<?php
/*
	SWAPER, 20201017 Imam Andrias
*/
include "config.php";
mysqli_set_charset($connect, 'utf8');
$query = mysqli_query($connect, 'SELECT tb_movie.*, tb_katagori.nama_katagori 
FROM tb_movie, tb_katagori
WHERE tb_movie.id_katagori = tb_katagori.id_katagori');
while($row = mysqli_fetch_assoc($query)) {
	$data[] = $row;
}
			
$json = json_encode($data);
echo $json;
?>