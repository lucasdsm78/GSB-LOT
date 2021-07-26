<?php
	session_start();
	session_destroy();

	if (isset($_COOKIE['login']))
	{
		setcookie('login');
		unset($_COOKIE['login']);
	}
	
	header('Location: ./');
?>