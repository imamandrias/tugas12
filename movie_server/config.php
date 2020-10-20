<?php
    define('DB_HOST', 'localhost');
    define('DB_USER', 'root');
    define('DB_PASSWORD', '');
    define('DB_DATABASE', 'db_movie');	
	//Koneksi ke mysql_server
	$connect = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_DATABASE);
	if(!$connect) {
	//	die('Tidak Bisa Konek ke Server ' . mysql_error());
	}	
	//Select database
	//$db = mysql_select_db(DB_DATABASE);
	//if(!$db) {
		//die("Tidak Bisa Memilih Database");
	//}
?>
