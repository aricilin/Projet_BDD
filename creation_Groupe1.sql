#Kaan Egemen SEN 21611799
#Ari ÇILINGIROGLU 21508927
#Fanny GOUPIL 21811054
#Fabien CABALLERO 22009817

#création des tables
create table Equipement(
    idEquipement int AUTO_INCREMENT,
    rarete  varchar(50) check (rarete in ("normal","rare","épique","légendaire")),
    niveauRequis numeric(3,0) default 0,
    typeEquipement varchar(30),
    constraint pk_equipement primary key (idEquipement)
);

create table Armure(
    idArmure int,
    ptsDefense numeric(2,0) default 1,
    constraint pk_Armure primary key (idArmure),
    constraint fk_idEquipement_Equipement_Armure foreign key (idArmure) references Equipement(idEquipement)


);
create table Arme(
    idArme int,
    ptsAttaque numeric(2,0) default 1,
    constraint pk_Arme primary key (idArme),
    constraint fk_idEquipement_Equipement_Arme foreign key (idArme) references Equipement(idEquipement)

);
create table Personnage(
    numPersonnage int AUTO_INCREMENT,
    nom varchar(50),
    niveau numeric(3,0) default 0,
    race varchar(50) check (race in ("Goblin","Elfe","Troll","Humain")),
    pointsDeVie numeric(2,0) default 99,
    idArmure int not null, 
    idArme int not null,
    constraint pk_personnage primary key (numPersonnage),
    constraint fk_idArmure_Armure foreign key (idArmure) references Armure(idArmure),
    constraint fk_idArme_Arme foreign key (idArme) references Arme(idArme)

);



create table Coffre (
    idcoffre int AUTO_INCREMENT,
    nom varchar(50),
    Equipement1 int,
    Equipement2 int,
    constraint pk_coffre primary key (idcoffre),
    constraint fk_Equipement1_Equipement foreign key (Equipement1) references Equipement(idEquipement),
    constraint fk_Equipement2_Equipement foreign key (Equipement2) references Equipement(idEquipement)
);

create table Map(
    idMap int AUTO_INCREMENT,
    nbEnnemis numeric(2,0),
    typezone varchar(50),
    difficulte numeric(1,0) default 1,
    idcoffre int,
    constraint pk_map primary key (idMap),
    constraint fk_idcoffre_coffre foreign key (idcoffre) references Coffre(idcoffre)
);

create table Tentative (
    idTentative int AUTO_INCREMENT,
    ScoreObtenu numeric(3,0) default 0,
    idPersonnage int not null,
    idMap int not null,
    constraint pk_tentative primary key (idTentative) ,
    constraint fk_idPersonnage foreign key (idPersonnage) references Personnage(numPersonnage),
    constraint fk_idMap foreign key (idMap) references Map(idMap)

);

create table Combat(
    idJoueur int not null,
    idEnnemi int not null,
    idTentative int not null,
    nomGagnant varchar(6) check (nomGagnant in ('Joueur','Ennemi')),
    constraint pk_combat primary key (idJoueur,idEnnemi,idTentative),
    constraint fk_idJoueur_Personnage foreign key (idJoueur) references Personnage(numPersonnage),
    constraint fk_idEnnemi_Personnage foreign key (idEnnemi) references Personnage(numPersonnage),
    constraint fk_idTentative_Tentative foreign key (idTentative) references Tentative(idTentative)
);

 #création des équpements (armes)
INSERT INTO Equipement VALUES (1,'normal',0,'baton');
INSERT INTO Equipement VALUES (2,'normal',3,'cuitochette');
INSERT INTO Equipement VALUES (3,'normal',1,'brosse à dents');
INSERT INTO Equipement VALUES (4,'normal',4,'parapluie');

INSERT INTO Equipement VALUES (5,'rare',16,'épée');
INSERT INTO Equipement VALUES (6,'rare',22,'massue');
INSERT INTO Equipement VALUES (7,'rare',30,'seringue');


INSERT INTO Equipement VALUES (8,'épique',42,'épée de feu');
INSERT INTO Equipement VALUES (9,'épique',50,'arc de glace');

INSERT INTO Equipement VALUES (10,'légendaire',70,'fouet électrique');

 #création des équipements (armures)

INSERT INTO Equipement VALUES (11,'normal',7,'habits en cuir');
INSERT INTO Equipement VALUES (12,'normal',2,'habits déchirés');
INSERT INTO Equipement VALUES (13,'normal',5,'tunique');
INSERT INTO Equipement VALUES (14,'normal',0,'sous-vêtements');

INSERT INTO Equipement VALUES (15,'rare',15,'côtes de maille');
INSERT INTO Equipement VALUES (16,'rare',31,'costume latex');
INSERT INTO Equipement VALUES (17,'rare',40,'déguisement mascotte pizza');

INSERT INTO Equipement VALUES (18,'épique',47,'armure en fer');
INSERT INTO Equipement VALUES (19,'épique',42,'armure viking');

INSERT INTO Equipement VALUES (20,'légendaire',80,'armure iron man');


 #création armes
INSERT INTO Arme VALUES (1,12);
INSERT INTO Arme VALUES (2,17);
INSERT INTO Arme VALUES (3,8);
INSERT INTO Arme VALUES (4,23);

INSERT INTO Arme VALUES (5,36);
INSERT INTO Arme VALUES (6,45);
INSERT INTO Arme VALUES (7,59);

INSERT INTO Arme VALUES (8,75);
INSERT INTO Arme VALUES (9,80);

INSERT INTO Arme VALUES (10,85);

 #création armures
INSERT INTO Armure VALUES (11,15);
INSERT INTO Armure VALUES (12,13);
INSERT INTO Armure VALUES (13,17);
INSERT INTO Armure VALUES (14,10);

INSERT INTO Armure VALUES (15,31);
INSERT INTO Armure VALUES (16,41);
INSERT INTO Armure VALUES (17,53);

INSERT INTO Armure VALUES (18,60);
INSERT INTO Armure VALUES (19,70);

INSERT INTO Armure VALUES (20,83);

 #création Personnages
#                                       niveau     ptsdeVie      idarmure    idArme
INSERT INTO Personnage VALUES (1,'Drakan',5,'Goblin',20,        14,          1);#armure 10 arme 12
INSERT INTO Personnage VALUES (2,'Slime',50,'Goblin',80,18,8);#armure 60 arme 75
INSERT INTO Personnage VALUES (3,'Gobby',35,'Goblin',90,16,6);#armure 41 arme 45
INSERT INTO Personnage VALUES (4,'Trolly',35,'Troll',75,16,6);#armure 41 arme 45
INSERT INTO Personnage VALUES (5,'Trotro',5,'Troll',20,14,1);#armure 10 arme 12
INSERT INTO Personnage VALUES (6,'Influenceur',20,'Troll',70,15,5);#armure 31 arme 35
INSERT INTO Personnage VALUES (7,'healthy',10,'Elfe',45,11,4);#armure 15 arme 23
INSERT INTO Personnage VALUES (8,'Legolas',20,'Elfe',50,15,5);#armure 31 pts arme 35
INSERT INTO Personnage VALUES (9,'Zufem',50,'Humain',82,18,8);#Avec armure 60 pts de defence arme 75
INSERT INTO Personnage VALUES (10,'Zulbaljin',50,'Humain',84,18,8);#Avec armure 60 pts de defence arme 75

 # création Coffres 

INSERT INTO Coffre VALUES (1,"Normale",1,11);
INSERT INTO Coffre VALUES (2,"Normale",2,13);
INSERT INTO Coffre VALUES (3,"Normale",3,14);
INSERT INTO Coffre VALUES (4,"Normale",4,16);
INSERT INTO Coffre VALUES (5,"Normale",6,15);
INSERT INTO Coffre VALUES (6,"Rare",6,3);
INSERT INTO Coffre VALUES (7,"Rare",7,12);
INSERT INTO Coffre VALUES (8,"Rare",13,3);
INSERT INTO Coffre VALUES (9,"Rare",8,17);
INSERT INTO Coffre VALUES (10,"Epique",9,18);
INSERT INTO Coffre VALUES (11,"Epique",1,10);
INSERT INTO Coffre VALUES (12,"Epique",4,8);
INSERT INTO Coffre VALUES (13,"Suprise",3,13);
INSERT INTO Coffre VALUES (14,"Epique",2,10);
INSERT INTO Coffre VALUES (15,"OMG",10,20);

 # création Map
                       #   nbEnnemis    typezone     difficulte   idcoffre
INSERT INTO Map VALUES (1,   4,         "Plage",         1,              1     );
INSERT INTO Map VALUES (2,6,"Enneigé",2,1);
INSERT INTO Map VALUES (3,10,"Montagne",3,2);
INSERT INTO Map VALUES (4,12,"Desert",4,3);
INSERT INTO Map VALUES (5,15,"Sous marin",5,4);
INSERT INTO Map VALUES (6,18,"Volcan",6,5);
INSERT INTO Map VALUES (7,20,"Fac des sciences",7,6);
INSERT INTO Map VALUES (8,16,"Jardin de fleurs",8,11);
INSERT INTO Map VALUES (9,10,"Jungle",5,12);
INSERT INTO Map VALUES (10,6,"Mars",4,13);
INSERT INTO Map VALUES (11,4,"Lune",6,14);
INSERT INTO Map VALUES (12,2,"Fabrique Tesla",9,15);

# création tentative
#                          idTentative     score   idPersonnage        idMap
INSERT INTO Tentative VALUES (1,           0,        10,                9);
INSERT INTO Tentative VALUES (2,           0,        9,                10);
INSERT INTO Tentative VALUES (3,           200,        3,                12);
INSERT INTO Tentative VALUES (4,           150,        2,                7);
INSERT INTO Tentative VALUES (5,           50,        6,                8);
INSERT INTO Tentative VALUES (6,           0,        6,                8);
INSERT INTO Tentative VALUES (7,           40,        1,                1);
INSERT INTO Tentative VALUES (8,           150,        2,                10);
INSERT INTO Tentative VALUES (9,           45,        4,                4);
INSERT INTO Tentative VALUES (10,           50,        4,                6);


# création combat
#                          idJoueur     idEnnemi   idTentative        nomGagnant

INSERT INTO Combat VALUES (9,           1,        2,                'Joueur');
INSERT INTO Combat VALUES (3,           9,        3,                'Joueur');
INSERT INTO Combat VALUES (3,           2,        3,               'Joueur');
INSERT INTO Combat VALUES (2,           8,        4,               'Joueur');
INSERT INTO Combat VALUES (2,           8,        8,               'Joueur');
INSERT INTO Combat VALUES (2,           4,        8,                'Joueur');
INSERT INTO Combat VALUES (6,           2,        5,               'Joueur');
INSERT INTO Combat VALUES (6,           5,        6,                'Ennemi');
INSERT INTO Combat VALUES (1,           7,        7,                'Joueur');
INSERT INTO Combat VALUES (1,           8,        7,                'Joueur');
INSERT INTO Combat VALUES (4,           9,        9,               'Joueur');
INSERT INTO Combat VALUES (4,           2,        10,                'Joueur');
INSERT INTO Combat VALUES (9,           5,        2,               'Joueur');









#procédure classement des scores par races
#si il n'y a pas de tentative score à 0
#Ex:
#Goblin 3000 1er (1er goblin 300 Tentative 1, 1er goblin 350 Tentative 2, ...)
#Troll 2900 2e
#Elfe 2000 3e
#Humain 600 4e

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `classementScores`(
)
BEGIN

SELECT race,sum(ScoreObtenu) as TotScore
FROM Tentative,Personnage
Where Tentative.idPersonnage=Personnage.numPersonnage
Group by race
Order by sum(ScoreObtenu) DESC;

END$$
DELIMITER ;






#fonction attaquer jusqu'a MORT !
# Le joueur attaque l'ennemi (voir rapport pour la gestion des dommages)
#L'ennemi attaque le joueur (same)
#et ça jusqu'a ce que l'un des deux meurt (ajouter nouveau combat avec le gagant (insert dans combat))
#  si c'est le joueur qui gagne le niveau de l'ennemi est ajouté à celui du joueur son score est incrémenté de "difficulté map"  pour cette tentative
#si le joueur perd son score est mis à 0 pour cette tentative

DELIMITER $$
CREATE DEFINER=`admin`@`localhost` FUNCTION `combattre`(`idJoueur` INT, `idEnnemi` INT, `idT` INT) RETURNS varchar(6) CHARSET utf8mb4
    DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
    DECLARE
    pdvJ NUMERIC(2, 0); 
    DECLARE pdvE NUMERIC(2, 0);
    DECLARE nivE NUMERIC(3, 0);
    DECLARE ptsAt NUMERIC(2, 0);
    DECLARE ptsDef NUMERIC(2, 0);
    DECLARE ptsEnleve NUMERIC(3, 0); 
    DECLARE difficulteMap NUMERIC(1, 0);

    WHILE 1=1 DO

        #Joueur attaque Ennemi
        SELECT
            pointsDeVie,
            ptsDefense,
            niveau
        INTO pdvE, ptsDef, nivE
        FROM
            Personnage,
            Armure
        WHERE
            numPersonnage = idEnnemi AND Personnage.idArmure = Armure.idArmure;


        SELECT
            ptsAttaque
        INTO ptsAt
        FROM
            Personnage,
            Arme
        WHERE
            numPersonnage = idJoueur AND Personnage.idArme = Arme.idArme;


        IF ptsAt < ptsDef THEN

            SET
            ptsEnleve = ptsAt -(ptsDef - ptsAt);
        ELSE
            SET
                ptsEnleve = ptsAt;
        END IF;
        IF ptsEnleve <=0 THEN
                    SET ptsEnleve=0;
        END IF;



        UPDATE
            Personnage
        SET
            pointsDeVie = pdvE - ptsEnleve
        WHERE
            numPersonnage = idEnnemi; 

        IF pdvE - ptsEnleve <= 0 THEN  

            INSERT INTO Combat
            VALUES(
                idJoueur,
                idEnnemi,
                idT,
                'Joueur'
            );


            UPDATE
                Personnage
            SET
                niveau = niveau + nivE
            WHERE
                numPersonnage = idJoueur;

            SELECT
                difficulte
            INTO difficulteMap
            FROM
                Tentative,
                Map
            WHERE
                Tentative.idTentative = idT  AND 									Map.idMap=Tentative.idMap;


            UPDATE
                Tentative
            SET
                scoreObtenu = scoreObtenu + difficulteMap
            WHERE
                idTentative = idT; 

            RETURN 'Joueur';

        ELSE
                # Ennemi attaque Joueur
            SELECT
                pointsDeVie,
                ptsDefense

            INTO pdvJ, ptsDef
            FROM
                Personnage,
                Armure
            WHERE
                numPersonnage = idJoueur AND Personnage.idArmure = Armure.idArmure;


            SELECT
                ptsAttaque
            INTO ptsAt
            FROM
                Personnage,
                Arme
            WHERE
                numPersonnage = idEnnemi AND Personnage.idArme = Arme.idArme;



            IF ptsAt < ptsDef THEN
                SET ptsEnleve = ptsAt -(ptsDef - ptsAt); 


            ELSE
                SET ptsEnleve = ptsAt;

            END IF; 

            IF ptsEnleve <=0 THEN
                    SET ptsEnleve=0;
            END IF;


            UPDATE Personnage SET pointsDeVie = pdvJ - ptsEnleve WHERE numPersonnage = idJoueur;


            IF pdvJ - ptsEnleve <= 0 THEN
                INSERT INTO Combat
                VALUES(
                    idJoueur,
                    idEnnemi,
                    idT,
                    'Ennemi'
                );

                UPDATE
                    Tentative
                SET
                    scoreObtenu = 0
                WHERE
                    idTentative = idT;
                RETURN 'Ennemi';
            END IF;
        END IF; 
	END WHILE;
END$$
DELIMITER ;

#trigger niveau requis
#before update armure ou arme pour un personnage vérifier que le niveau du personnage est supérieur ou égal au niveau requis de l'équipement
DELIMITER $$
CREATE TRIGGER `NiveauRequisEquipement` BEFORE UPDATE ON `Personnage`
 FOR EACH ROW BEGIN
DECLARE 
v_nivRecq integer;
SELECT niveauRequis into v_nivRecq FROM Equipement WHERE Equipement.idEquipement=new.idArmure;

IF v_nivRecq >  new.niveau THEN
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'niveau pas assez haut ';
   
END IF;
END $$
DELIMITER ;


#trigger point de vie
#à chaque insert dans combat les points de vie des deux combattant sont restaurés ( remettre pts de vie à 99 )
#-ptv trigger

DELIMITER $$

CREATE TRIGGER `ReinitialisationPtsVie` BEFORE INSERT ON `Combat`
 FOR EACH ROW BEGIN
DECLARE v_ptvChar integer;
SELECT 
    pointsDeVie
INTO v_ptvChar FROM
    Personnage
WHERE
    numPersonnage = new.idJoueur;
IF(v_ptvChar < 99) THEN
update Personnage set pointsDeVie=99 WHERE numPersonnage = new.idJoueur;
END IF;
SELECT 
    pointsDeVie
INTO v_ptvChar FROM
    Personnage
WHERE
    numPersonnage = new.idEnnemi;
    IF(v_ptvChar < 99) THEN
update Personnage set pointsDeVie=99 WHERE numPersonnage = new.idEnnemi;
END IF;

END $$
DELIMITER ;







