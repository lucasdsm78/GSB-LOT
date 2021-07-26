<?php
	// Titre de votre page
	$titre_page = "";

	// Description de votre page
	$description_page = "Page d'accueil de l'application";

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

	// On récupère la méthode POST
	// On cherche l'utilisation et on le connecte
	// Sinon, on lui qu'il y a une erreur dans la saisie
	if (isset($_REQUEST['submit']))
	{
		// Tableau qui affiche des messages
		// Utile pour la gestion des modèles HTML
		$table = array();

		// On récupère les données d'envoi
		// Alors on prend " email " et " password "
		$email = $_REQUEST['email'];
		$password = $_REQUEST['password'];
		
		// On cherche également à savoir si le autologin est bien coché
		// Dans le cas contraire, on ne créé aucun variable PHP
		// Sinon risque d'erreur d'index inexistant
		if (isset($_REQUEST['autologin']))
		{
			$cookie = $_REQUEST['autologin'];
		}

		// Je veux savoir si mon mail a bien été saisi
		if ($email != "")
		{
			// Je veux savoir si mon mot de passe a bien été saisi
			if ($password != "")
			{
				// Ainsi nous effectuons une recherche en base de données
				// Si la recherche est valide et est sur trouve, alors l'utilisateur va être connecté
				// Dans le cas contraire, il sera refusé et les sessions non activé
				$trouveUtilisateur = getConnexion($email, $password);

				if ($trouveUtilisateur)
				{
					// Si la connexion automatique est coché
					// Alors on donne un cookie au navigateur pour une connexion automatique
					// Qui sera effective à la prochaine navigation
					if (isset($cookie))
				    {
			        	if ($cookie == true)
					    {
				        	setcookie('login', $_SESSION['id'], time() + (60*60*24*30), '', '', true);
				        	session_destroy();
					    }
				    }

					// Alors on affiche un message de validation
					// Celui-ci informe que l'utilisateur a bien été trouvé
					// Donc on met en place un message qui dit connecté et qu'une redirection est en cours
					array_push($table, array(
						'valide'		=> true,
						'texte'			=> 'Vous êtes connecté<br>Actualisation dans 5 secondes'
					));
				}
				else
				{
					// Malheureusement, le message indique que le compte n'existe pas
					// On lui affiche donc le message d'erreur avec les champs à vide
					array_push($table, array(
						'valide'		=> false,
						'texte'			=> 'Compte introuvable'
					));
				}
			}
			else
			{
				// Sinon on affiche un message d'erreur
				// Valide est donc faux et affiche une erreur
				// On saisi et on dit l'erreur dans une phrase
				array_push($table, array(
					'valide'		=> false,
					'texte'			=> 'Le mot de passe est obligatoire'
				));
			}
		}
		else
		{
			// Sinon on affiche un message d'erreur
			// Valide est donc faux et affiche une erreur
			// On saisi et on dit l'erreur dans une phrase
			array_push($table, array(
				'valide'		=> false,
				'texte'			=> 'Le mot de passe est obligatoire'
			));
		}

		// Va envoyer le " $table " dans une variable SMARTY
		// Un foreach méthode SMARTY est obligatoire à faire sur la page
		$smarty->assign('VALIDATION', $table);
	}

	// On appel et on afficge nos variables Smarty
	// Dans la vue HTML que va établir Smarty
	$smarty->display('templates/connexion.html');
?>