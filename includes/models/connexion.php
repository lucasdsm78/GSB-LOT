<?php
	// On essaye d'établir une connexion
	// La connexion va être connectée à une base de donénes
	try
	{
		// On déclare une classe PDO qui permet la connexion
		// Cette classe demande l'hôte, la base de données, le nom d'ulisateur et le mot de passe
		// Ainsi dans l'excution de la demande de connexion, on encode la connexion en UTF8
	    $db = new PDO('mysql:host=localhost;dbname=bts_ppe_gsblot', 'root', '');
	    $db->exec("SET CHARACTER SET utf8");
	}
	
	// Si la connexion n'est pas établi
	// Alors, notre catch nous donne l'erreur en $e
	// Ainsi celui-ci affiche l'erreur et son numéro d'erreur
	catch(Exception $e)
	{
	        echo 'Erreur : '.$e->getMessage().'<br />';
	        echo 'No : '.$e->getCode();
	}
?>