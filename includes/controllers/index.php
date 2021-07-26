<?php
	// Controlleur principal
	// Il gère l'ensemble des controlleurs

	// Ici, on demande si l'URL possède un paramètre
	// Si elle ne possède aucun paramètre en URL
	// Alors, on lui donne une page
	if (!isset($_REQUEST['p']))
	{
		// Celui-ci met notre contrôleur sur index
		// C'est une façon automatiquement de mettre une page
		$page = 'index';
	}
	else
	{
		// Dans le cas contraire
		// Notre contrôleur va faire une analyse de notre switch
		// Si le switch trouve une donnée valide, alors il l'affiche
		// Sinon, on affiche une donnée valide par defaut comme étant une erreur 404
		$page = $_REQUEST['p'];
	}

	// Le switch gère notre contrôleur
	// Mais celui-ci fournir aussi des pages
	switch ($page)
	{
		// L'index est une page d'accueil
		// Celui-ci possède l'accueil du site si connecté
		// Sinon, on affiche une page de connexion si pas connecté
		case 'index':
		{
			if (isset($session))
			{
				include('includes/views/index.php');
			}
			else
			{
				include('includes/views/connexion.php');
			}

			break;
		}

		// L'index est une page du magasin
		// Celui-ci possède l'accueil du magasin si connecté
		// Accesible uniquement pour les connectés
		// Sinon redirection vers la page de connexion
		case 'magasin':
		{
			if (isset($session))
			{
				include('includes/views/magasin/index.php');
			}
			else
			{
				header('Location: ./');
			}

			break;
		}

		// Page de connexion
		// Elle supprime la session ou les cookies
		// Accesible uniquement pour les connectés
		// Sinon redirection vers la page de connexion
		case 'deconnexion':
		{
			if (isset($session))
			{
				include('includes/views/deconnexion.php');
			}
			else
			{
				header('Location: ./');
			}

			break;
		}

		default:
		{
			if (isset($session))
			{
				include('includes/views/erreur.php');
			}
			else
			{
				header('Location: ./');
			}

			break;
		}
	}
?>