<?php
	// Titre de votre page
	$titre_page = "Magasin";

	// Description de votre page
	$description_page = "Page d'accueil du magasin de l'application";

	// Variable Smarty pour le HTML
	// Conversion de la balise $titre_page et $description_page
	// Au format HTML afin de ne pas avoir de PHP dans notre page
	$smarty->assign('TITLE_PAGE', $titre_page);
	$smarty->assign('DESCRIPTION', $description_page);
	
	// Savoir si notre page à une titre
	// Si la page à un titre, alors on ajoute un tiret
	// Dans le cas contaire, on n'ajoute aucun tiret
	if ($titre_page != "")
	{
		$smarty->assign('TIRET', "&nbsp;-&nbsp;");
	}
	else
	{
		$smarty->assign('TIRET', "");
	}

	// On appel et on afficge nos variables Smarty
	// Dans la vue HTML que va établir Smarty
	$smarty->display('templates/magasin/index.html');
?>