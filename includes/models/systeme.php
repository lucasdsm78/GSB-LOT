<?php
	// Import de la bibliothèque de Smarty
	// Elle gère l'ensemble du framework Smarty
	// Son utilisation est importante
	include ('smarty/Smarty.class.php');

	// On déclare et on met en route Smarty
	// Sans, nous ne pouvons pas utiliser les ressources de Smarty
	$smarty = new Smarty;

	// Smarty permet la mise en cache des pages
	// Celle-ci rend la navigation plus rapide et précharge les pages
	// On peut également définir un temps de mise en cache avant suppression
	// Aussi, la dernière ligne en PHP de ce commentaire est une vérification des modèles HTML
	$smarty->caching = false;
	$smarty->cache_lifetime = 120;
	$smarty->compile_check = true;

	// Mise en place des dossiers de notre cache
	// Le lieu où sera placé le cache de notre template et des sources
	// Importante, Smarty fonctionne avec un système de cache
	$smarty->setCompileDir('caches/templates');
    $smarty->setCacheDir('caches/sources');

    // Balise Smarty qui son obligatoire
    // Nos deux valises sont importantes car c'est l'identité de l'application
    // On ajoute un nom et une biographie à notre application
    $smarty->assign('SITENAME', "GSB Lot");
	$smarty->assign('BIOGRAPHIE', "La biographie");

	// La connexion d'un utilisateur
	// On check pour savoir s'il existe ou non en BDD
	if (isset($_SESSION['id']) || isset($_COOKIE['login']))
    {
    	if (isset($_COOKIE['login']))
    	{
    		$rechercheSesssion = $_COOKIE['login'];
    	}
    	else
    	{
    		$rechercheSesssion = $_SESSION['id'];
    	}

    	$session = getConnexionRecherche($rechercheSesssion);
    	$smarty->assign('SESSION', $session);
    }
?>