#Kaan Egemen SEN 21611799
#Ari ÇILINGIROGLU 21508927
#Fanny GOUPIL 21811054
#Fabien CABALLERO 22009817

DROP TRIGGER IF EXISTS NiveauRequisEquipement;
DROP TRIGGER IF EXISTS ReinitialisationPtsVie;

DROP TABLE IF EXISTS Combat,Tentative,Map,Coffre,Personnage,Armure,Arme,Equipement;

DROP PROCEDURE IF EXISTS classementScores;
DROP FUNCTION IF EXISTS combattre;
