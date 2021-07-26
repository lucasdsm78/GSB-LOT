<?php
    function getLesMedecins()
    {
        require "connexion.php" ;
        $sql = "select numeroMedecin, nomMedecin, prenomMedecin "
                . "from gsblot_medecin ";
        $exec = $db->prepare($sql);
        $exec->execute();
        $curseur = $exec->fetchAll();
        return $curseur;
    }

    function getLesMedicaments()
    {
        require "connexion.php" ;
        $sql = "select numeroMedicament, nomMedicament, prixUnitaire "
                . "from gsblot_medicament " ;
        $exec = $db->prepare($sql) ;
        $exec->execute() ;
        $curseur = $exec->fetchAll();
        return $curseur;
    }

    function getEchantillonsDisponibles($numeroMedicament)
    {
        require "connexion.php" ;
        $sql = "select numLot, numEchantillon "
                . "from gsblot_echantillon ";
        $exec = $db->prepare($sql);
        $exec->execute();
        $ligne = $exec->fetch();
        return $ligne;
    }
    
    function getConnexion($email, $password)
    {
        require "connexion.php";

        $sql = "select * from gsblot_utilisateur";
        $exec = $db->prepare($sql);
        $exec->execute();

        $trouve = false;
        $fin = false;

        while (!$trouve && !$fin)
        {
            if ($ligne = $exec->fetch())
            {
                if ($ligne['emailUtilisateur'] == $email && password_verify($password, $ligne['mdpUtilisateur']))
                {
                    $trouve = true;
                    $_SESSION['id'] = $ligne['idUtilisateur'];
                }
            }
            else
            {
                $fin = true;
            }
        }

        return $trouve;
    }

    function getConnexionRecherche($id)
    {
        require "connexion.php";

        $sql = "select * from gsblot_utilisateur";
        $exec = $db->prepare($sql);
        $exec->execute();

        $trouve = false;
        $fin = false;

        while (!$trouve && !$fin)
        {
            if ($ligne = $exec->fetch())
            {
                if ($ligne['idUtilisateur'] == $id)
                {
                    $trouve = true;
                }
            }
            else
            {
                $fin = true;
            }
        }

        if ($trouve)
        {
            return $ligne;
        }
        else
        {
            return $trouve;
        }
    }
?>