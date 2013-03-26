  
 
-- Création du TableSpace --
CREATE SMALLFILE TABLESPACE "TBS_FESTIVAL" 
DATAFILE 'C:\ORACLE\PRODUCT\10.2.0\ORADATA\BZSLAM13\DF_FESTIVAL.dbf'
SIZE 100M LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO 

-- Création de l'Utilisateur --
CREATE USER "FEST_ADMIN" PROFILE "DEFAULT" IDENTIFIED BY "*******" DEFAULT TABLESPACE "TBS_FESTIVAL" ACCOUNT UNLOCK
GRANT "CONNECT" TO "FEST_ADMIN"

-- Attribution des Rôles --

GRANT "RESOURCE" TO "FEST_ADMIN"
ALTER USER "FEST_ADMIN" DEFAULT ROLE ALL

-- Création de la Structure de la BDD --
Connect FEST_ADMIN/musiquefolk ;

create table Etablissement 
(id char(8) not null, 
nom varchar(45) not null,
adresseRue varchar(45) not null, 
codePostal char(5) not null, 
ville varchar(35) not null,
tel varchar(13) not null,
adresseElectronique varchar(70),
type integer not null,
civiliteResponsable varchar(12) not null,
nomResponsable varchar(25) not null,
prenomResponsable varchar(25),
constraint pk_Etablissement primary key(id))
;

create table TypeChambre
(id char(2) not null, 
libelle varchar(15) not null, 
constraint pk_TypeChambre primary key(id))
;

create table Offre
(idEtab char(8) not null, 
idTypeChambre char(2) not null, 
nombreChambres integer not null, 
constraint pk_Offre primary key(idEtab, idTypeChambre), 
constraint fk1_Offre foreign key(idEtab) references Etablissement(id) 
, 
constraint fk2_Offre foreign key(idTypeChambre) references TypeChambre(id)
)
;

create table Groupe
(id char(4) not null, 
nom varchar(40) not null, 
identiteResponsable varchar(40) default null,
adressePostale varchar(120) default null,
nombrePersonnes integer not null, 
nomPays varchar(40) not null, 
hebergement char(1) not null,
constraint pk_Groupe primary key(id))
;

create table Attribution
(idEtab char(8) not null, 
idTypeChambre char(2) not null, 
idGroupe char(4) not null, 
nombreChambres integer not null,
constraint pk_Attribution primary key(idEtab, idTypeChambre, idGroupe), 
constraint fk1_Attribution foreign key(idGroupe) references Groupe(id), 
constraint fk2_Attribution foreign key(idEtab, idTypeChambre) references Offre(idEtab, idTypeChambre) )
;

-- Insertion des Données --

-- les dirigeants du collège de Moka et de l'Institution St-Malo Providence sont fictifs
-- idem pour le prénom de Mme Lefort
insert into Etablissement values ('0350785N', 'Collège de Moka', '2 avenue Aristide Briand BP 6', '35401', 'Saint-Malo', '0299206990', null,1,'Monsieur','Dupont','Alain');
insert into Etablissement values ('0350773A', 'Collège Ste Jeanne d''Arc-Choisy', '3, avenue de la Borderie BP 32', '35404', 'Paramé', '0299560159', null, 1,'Madame','Lefort','Anne');  
insert into Etablissement values ('0352072M', 'Institution Saint-Malo Providence', '2 rue du collège BP 31863', '35418', 'Saint-Malo', '0299407474', null, 1,'Monsieur','Durand','Pierre');   
insert into Etablissement values ('1111111', 'Centre de rencontres internationales', '37 avenue du R.P. Umbricht BP 108', '35407', 'Saint-Malo', '0299000000', null, 0, 'Monsieur','Guenroc','Guy');

insert into TypeChambre values ('C1', '1 lit');
insert into TypeChambre values ('C2', '2 à 3 lits');
insert into TypeChambre values ('C3', '4 à 5 lits');
insert into TypeChambre values ('C4', '6 à 8 lits');
insert into TypeChambre values ('C5', '8 à 12 lits');
 
-- certains groupes sont incomplètement renseignés
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g001','Groupe folklorique du Bachkortostan',40,'Bachkirie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g002','Marina Prudencio Chavez',25,'Bolivie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g003','Nangola Bahia de Salvador',34,'Brésil','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g004','Bizone de Kawarma',38,'Bulgarie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g005','Groupe folklorique camerounais',22,'Cameroun','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g006','Syoung Yaru Mask Dance Group',29,'Corée du Sud','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g007','Pipe Band',19,'Ecosse','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g008','Aira da Pedra',5,'Espagne','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g009','The Jersey Caledonian Pipe Band',21,'Jersey','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g010','Groupe folklorique des Émirats',30,'Emirats arabes unis','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g011','Groupe folklorique mexicain',38,'Mexique','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g012','Groupe folklorique de Panama',22,'Panama','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g013','Groupe folklorique papou',13,'Papouasie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g014','Paraguay Ete',26,'Paraguay','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g015','La Tuque Bleue',8,'Québec','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g016','Ensemble Leissen de Oufa',40,'République de Bachkirie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g017','Groupe folklorique turc',40,'Turquie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g018','Groupe folklorique russe',43,'Russie','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g019','Ruhunu Ballet du village de Kosgoda',27,'Sri Lanka','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g020','L''Alen',34,'France - Provence','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g021','L''escolo Di Tourre',40,'France - Provence','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g022','Deloubes Kévin',1,'France - Bretagne','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g023','Daonie See',5,'France - Bretagne','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g024','Boxty',5,'France - Bretagne','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g025','Soeurs Chauvel',2,'France - Bretagne','O');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g026','Cercle Gwik Alet',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g027','Bagad Quic En Groigne',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g028','Penn Treuz',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g029','Savidan Launay',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g030','Cercle Boked Er Lann',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g031','Bagad Montfortais',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g032','Vent de Noroise',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g033','Cercle Strollad',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g034','Bagad An Hanternoz',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g035','Cercle Ar Vro Melenig',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g036','Cercle An Abadenn Nevez',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g037','Kerc''h Keltiek Roazhon',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g038','Bagad Plougastel',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g039','Bagad Nozeganed Bro Porh-Loeiz',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g040','Bagad Nozeganed Bro Porh-Loeiz',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g041','Jackie Molard Quartet',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g042','Deomp',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g043','Cercle Olivier de Clisson',0,'France - Bretagne','N');
insert into Groupe (id, nom, nombrepersonnes, nompays, hebergement) values ('g044','Kan Tri',0,'France - Bretagne','N');