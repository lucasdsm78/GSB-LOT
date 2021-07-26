-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 16 sep. 2020 à 13:51
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bts_ppe_gsblot`
--

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_droits`
--

CREATE TABLE `gsblot_droits` (
  `idDroit` int(11) NOT NULL,
  `libelleDroit` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `gsblot_droits`
--

INSERT INTO `gsblot_droits` (`idDroit`, `libelleDroit`) VALUES
(1, 'Production'),
(2, 'Visiteurs Médicaux'),
(3, 'Magasin');

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_echantillon`
--

CREATE TABLE `gsblot_echantillon` (
  `numEchantillon` int(11) NOT NULL,
  `numLot` int(11) NOT NULL,
  `dateSortiStock` date NOT NULL,
  `dateAttribution` date DEFAULT NULL,
  `numMedecin` int(11) DEFAULT NULL,
  `numMedicament` int(11) NOT NULL,
  `numVisiteur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_lot`
--

CREATE TABLE `gsblot_lot` (
  `numero` int(11) NOT NULL,
  `dateFabrication` date NOT NULL,
  `numeroMedicament` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gsblot_lot`
--

INSERT INTO `gsblot_lot` (`numero`, `dateFabrication`, `numeroMedicament`) VALUES
(1, '2020-01-01', 1),
(2, '2020-02-02', 8),
(3, '2020-01-01', 7),
(4, '2008-12-12', 1),
(5, '2000-12-09', 2),
(6, '2009-11-10', 4),
(7, '2001-04-09', 2),
(8, '2002-01-15', 4),
(9, '2014-10-17', 5),
(10, '2015-05-05', 6),
(11, '2016-05-18', 5),
(12, '2019-08-16', 6),
(13, '2019-08-19', 7),
(14, '2009-12-02', 8),
(15, '2008-07-14', 8),
(16, '2007-01-22', 9),
(17, '2006-02-28', 9);

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_medecin`
--

CREATE TABLE `gsblot_medecin` (
  `numeroMedecin` int(11) NOT NULL,
  `nomMedecin` varchar(100) NOT NULL,
  `prenomMedecin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gsblot_medecin`
--

INSERT INTO `gsblot_medecin` (`numeroMedecin`, `nomMedecin`, `prenomMedecin`) VALUES
(1, 'Brady', 'François'),
(2, 'Pitois', 'Nathalie'),
(3, 'Gaetan', 'Fontan'),
(4, 'Hellard', 'Marise'),
(5, 'Dallier', 'Sylvia'),
(6, 'Chapelain', 'Gael'),
(7, 'Carre', 'Arthur'),
(8, 'Lecomte', 'Bryan'),
(9, 'Da Silva Marques', 'Lucas'),
(10, 'Mbappé', 'Kylian');

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_medicament`
--

CREATE TABLE `gsblot_medicament` (
  `numeroMedicament` int(11) NOT NULL,
  `nomMedicament` varchar(100) NOT NULL,
  `prixUnitaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gsblot_medicament`
--

INSERT INTO `gsblot_medicament` (`numeroMedicament`, `nomMedicament`, `prixUnitaire`) VALUES
(1, 'Doliprane', 10),
(2, 'Dafalgan', 7),
(3, 'Efferalgan', 8),
(4, 'Levothyrox', 5),
(5, 'Clamoxyl', 11),
(6, 'Lamaline', 12),
(7, 'Plavix', 5),
(8, 'Kardegic', 7),
(9, 'Antarene', 10);

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_utilisateur`
--

CREATE TABLE `gsblot_utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `pseudoUtilisateur` varchar(255) NOT NULL,
  `mdpUtilisateur` text NOT NULL,
  `emailUtilisateur` varchar(255) NOT NULL,
  `droitUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gsblot_utilisateur`
--

INSERT INTO `gsblot_utilisateur` (`idUtilisateur`, `pseudoUtilisateur`, `mdpUtilisateur`, `emailUtilisateur`, `droitUtilisateur`) VALUES
(1, 'Gael', '$2y$10$HE8THMdzErSEU/t4MPCnceYe8k0EP.YEr39KTsze0H3t.36WOmd7O', 'gael@gsb.com', 1),
(2, 'Lucas', '$2y$10$HE8THMdzErSEU/t4MPCnceYe8k0EP.YEr39KTsze0H3t.36WOmd7O', 'lucas@gsb.com', 2),
(3, 'Bryan', '$2y$10$HE8THMdzErSEU/t4MPCnceYe8k0EP.YEr39KTsze0H3t.36WOmd7O', 'bryan@gsb.com', 3);

-- --------------------------------------------------------

--
-- Structure de la table `gsblot_visiteur`
--

CREATE TABLE `gsblot_visiteur` (
  `numVisiteur` int(11) NOT NULL,
  `nomVisiteur` varchar(100) NOT NULL,
  `prenomVisiteur` varchar(100) NOT NULL,
  `mailVisiteur` varchar(100) NOT NULL,
  `rueVisiteur` varchar(100) NOT NULL,
  `villeVisiteur` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gsblot_visiteur`
--

INSERT INTO `gsblot_visiteur` (`numVisiteur`, `nomVisiteur`, `prenomVisiteur`, `mailVisiteur`, `rueVisiteur`, `villeVisiteur`) VALUES
(1, 'Durand', 'Jean', 'jean@gmail.com', '22 rue de la chouette', 'Vernon'),
(2, 'Marques', 'Remi', 'remi@gmail.com', '18 rue du chantier', 'Freneuse'),
(3, 'Lotarie', 'Charlotte', 'charlotte@gmail.com', '15 rue du quartier', 'Bonnieres'),
(4, 'Clavier', 'Christan', 'christan@gmail.com', '17 chemin du verdier', 'Paris'),
(5, 'Pogba', 'Paul', 'paul@gmail.com', '20 rue du 10 mai 1945', 'Marseille'),
(6, 'Courageux', 'Jeanne', 'jeanne@gmail.com', '14 rue de Paul Dautier', 'Vernon'),
(7, 'Orange', 'Pommier', 'orange@gmail.com', '22 rue de la chouette', 'Vernon'),
(8, 'Propor', 'Jean', 'jean@gmail.com', '22 rue de la chouette', 'Vernon');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `gsblot_droits`
--
ALTER TABLE `gsblot_droits`
  ADD PRIMARY KEY (`idDroit`);

--
-- Index pour la table `gsblot_echantillon`
--
ALTER TABLE `gsblot_echantillon`
  ADD PRIMARY KEY (`numEchantillon`,`numLot`),
  ADD KEY `FK1` (`numLot`),
  ADD KEY `numMedecin` (`numMedecin`),
  ADD KEY `numVisiteur` (`numVisiteur`),
  ADD KEY `medoc` (`numMedicament`);

--
-- Index pour la table `gsblot_lot`
--
ALTER TABLE `gsblot_lot`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `medicament` (`numeroMedicament`);

--
-- Index pour la table `gsblot_medecin`
--
ALTER TABLE `gsblot_medecin`
  ADD PRIMARY KEY (`numeroMedecin`);

--
-- Index pour la table `gsblot_medicament`
--
ALTER TABLE `gsblot_medicament`
  ADD PRIMARY KEY (`numeroMedicament`);

--
-- Index pour la table `gsblot_utilisateur`
--
ALTER TABLE `gsblot_utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD KEY `droit` (`droitUtilisateur`);

--
-- Index pour la table `gsblot_visiteur`
--
ALTER TABLE `gsblot_visiteur`
  ADD PRIMARY KEY (`numVisiteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `gsblot_droits`
--
ALTER TABLE `gsblot_droits`
  MODIFY `idDroit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `gsblot_echantillon`
--
ALTER TABLE `gsblot_echantillon`
  MODIFY `numEchantillon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gsblot_lot`
--
ALTER TABLE `gsblot_lot`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `gsblot_medecin`
--
ALTER TABLE `gsblot_medecin`
  MODIFY `numeroMedecin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `gsblot_medicament`
--
ALTER TABLE `gsblot_medicament`
  MODIFY `numeroMedicament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `gsblot_utilisateur`
--
ALTER TABLE `gsblot_utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `gsblot_visiteur`
--
ALTER TABLE `gsblot_visiteur`
  MODIFY `numVisiteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gsblot_echantillon`
--
ALTER TABLE `gsblot_echantillon`
  ADD CONSTRAINT `lot` FOREIGN KEY (`numLot`) REFERENCES `gsblot_lot` (`numero`),
  ADD CONSTRAINT `medecin` FOREIGN KEY (`numMedecin`) REFERENCES `gsblot_medecin` (`numeroMedecin`),
  ADD CONSTRAINT `medoc` FOREIGN KEY (`numMedicament`) REFERENCES `gsblot_medicament` (`numeroMedicament`),
  ADD CONSTRAINT `visiteur` FOREIGN KEY (`numVisiteur`) REFERENCES `gsblot_visiteur` (`numVisiteur`);

--
-- Contraintes pour la table `gsblot_lot`
--
ALTER TABLE `gsblot_lot`
  ADD CONSTRAINT `medicament` FOREIGN KEY (`numeroMedicament`) REFERENCES `gsblot_medicament` (`numeroMedicament`);

--
-- Contraintes pour la table `gsblot_utilisateur`
--
ALTER TABLE `gsblot_utilisateur`
  ADD CONSTRAINT `droit` FOREIGN KEY (`droitUtilisateur`) REFERENCES `gsblot_droits` (`idDroit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
