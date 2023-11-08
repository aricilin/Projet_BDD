#Kaan Egemen SEN 21611799
#Ari ÇILINGIROGLU 21508927
#Fanny GOUPIL 21811054
#Fabien CABALLERO 22009817

#requete group by
#récupère le nombre de personnages au sein d'une même race ayant le même équipement

SELECT typeEquipement,race, COUNT(P.numPersonnage) as nbPersosDeCetteRaceAyantCetteArme FROM Personnage P, Equipement E WHERE P.idArme=E.idEquipement GROUP BY typeEquipement,race;



#requete division: Un personnage est sélectionné s'il n'existe aucun coffre pour lequel il y a À l'intérieur l'arme de ce personnage
#les personnages dont leur arme n'est pas issue d'un coffre
SELECT * 
FROM Personnage 
WHERE NOT EXISTS (SELECT * 
                FROM Coffre 
                WHERE NOT EXISTS (SELECT * 
                                FROM Arme 
                                WHERE Coffre.Equipement1!=Arme.idArme 
                                        AND Coffre.Equipement2!=Arme.idArme 
                                        AND Personnage.idArme=Arme.idArme ));

#requete avec sous requete
#Liste des personnes qui ont leur armure de rareté "rare"
SELECT * FROM Personnage
WHERE idArmure IN (SELECT idArmure FROM Equipement,Armure
                    WHERE Equipement.idEquipement=Armure.idArmure AND Equipement.rarete="rare");


#requete avec sous requete corrélative
#les personnages qui n'ont jamais combattu en tant que joueur
SELECT * FROM Personnage
WHERE NOT EXISTS( SELECT * FROM Combat 
                    WHERE Combat.idJoueur=Personnage.numPersonnage);

#test procedure classementScores
CALL classementScores();

#test fonction combattre
SELECT combattre(10,5,1);

#trigger points de vie
#Etant donné que le combat est fini les deux opposants sont régénérés grâce au trigger
SELECT numPersonnage,pointsDeVie FROM Personnage WHERE numPersonnage=5 OR numPersonnage=10 ;

#trigger niveau requis
UPDATE Personnage SET idArmure=18 WHERE numPersonnage=1;

