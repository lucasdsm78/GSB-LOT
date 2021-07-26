<?php
	// On déclare et on demande une date
	// Celle-ci sera la date du jour de notre hébergement
	// La date est au format anglais et non en français
	function getDateNouveau()
    {
        $date = new DateTime();
        return $date->format('Y-m-d');
    }

	// On tranforme une date anglaise en française
	// On retrouvera une date de "2020-01-01" en "01/01/2020"
	// La fonction retour le paramètre une fois traitée
	function getDateFormat($laDate)
    {
        return strftime('%d/%m/%Y',strtotime($laDate));
    }
?>