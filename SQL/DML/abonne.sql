/*
fichier createTablesMYSQL.sql
Numero 21509841, Dautheribes, Jérémie
Numero 21505680, Soussi, Wissem
*/

--ajouter une voiture
insert into voiture (immatriculation, marque, modele, annee, couleur, nbPlaces, emailProprietaire)
values ("value", "value", "value", "value", "value", "value", "value");

-- proposer un trajet
insert into trajet
  (prix, date_dep, adr_rdv, adr_ar, conducteur, vehiculeImm, nbPlaceDispo, villeDepX, villeDepY, villeArrX, villeArrY)
  VALUES
  ("value", "value", "value", "value", "value", "value", "value", "value", "value", "value", "value");

-- participer à un trajet
INSERT INTO participer (numT, emailCovoitureur)
VALUES ("value", "value");

--annuler une participation à un trajet
DELETE FROM participer WHERE numT = "value" emailCovoitureur = "value";

-- donner un avis
INSERT INTO AVIS(numT, numDonneur, numReceveur, nbEtoile, commentaire)
VALUES ( "value", "value", "value", "value", "value");

-- afficher tous les trajets avec les places disponibles par date croissante (dateDep > curdate())
SELECT *, calcul_distance(trajet.villeDepX, trajet.villeDepY, trajet.villeArrX, trajet.villeArrY)
FROM trajet, inscrit, ville vd, ville va
WHERE trajet.conducteur = inscrit.email AND
      trajet.villeDepX = vd.coordX AND
      trajet.villeDepY = vd.coordY AND
      trajet.villeArrX = va.coordX AND
      trajet.villeArrY = va.coordY
      AND date_dep > curdate()
      AND villeDepX = "value" AND villeDepY = "value"
      AND villeArrX = "value" AND villeArrY = "value"
      AND date_dep < DATE_ADD( "value", INTERVAL 5 DAY) AND date_dep >= (maxDate (DATE_SUB("velue", INTERVAL 5 DAY),curdate()))
      AND trajet.nbPlaceDispo > (SELECT count(*)
                                  FROM participer
                                  WHERE participer.numT = trajet.numT)
ORDER BY date_dep ASC;
