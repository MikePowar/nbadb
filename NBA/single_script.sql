create table Season 
(startDate date,
 endDate date,
 seasonType CHAR(20),
 PRIMARY KEY (startDate, endDate));

create table Team 
(logo longblob,
 title char(25) PRIMARY KEY,
 founded int,
 arena char(30),
 division char(15),
 conference char(15));

create table TeamSeasons
(tname char(25),
 startDate date,
 PRIMARY KEY (tname,startDate),
 FOREIGN KEY (startDate) REFERENCES Season (startDate),
 FOREIGN KEY (tname) REFERENCES Team (title));

create table Player
(playerID int PRIMARY KEY,
 name char(25),
 age int,
 height DOUBLE(3, 2),
 dob date,
 weight int);

create table EndorsementDeal
(eID int PRIMARY KEY,
company char(20),
product char(20),
value int, 
playerID int, 
FOREIGN KEY (playerID) REFERENCES Player(playerID));


create table PlayerTeams 
(playerID int,
 tname char(25),
 startDate date,
 endDate date,
 salary double(4,2),
 position char(3),
 number int,
 PRIMARY KEY(playerID,tname),
 FOREIGN KEY (playerID) REFERENCES Player(playerID) ON DELETE CASCADE,
 FOREIGN KEY (startDate) REFERENCES Season(startDate),
 FOREIGN KEY (tname) REFERENCES Team(title)); 


create table Staff 
(staffID int PRIMARY KEY,
 name char(25),
 tname char(25),
 FOREIGN KEY(tname) REFERENCES Team(title));

create table Owner
(staffID int PRIMARY KEY,
 net_worth double(3,2),
 FOREIGN KEY (staffID) REFERENCES Staff(staffID));

create table Coach
(staffID int PRIMARY KEY,
 wins int,
 losses int,
 position char(25),
 FOREIGN KEY (staffID) REFERENCES Staff(staffID));

create table Game
(mDate date,
 homeTeamName char(25),
 awayTeamName char(25),
 homePTS int NOT NULL,
 awayPTS int NOT NULL,
 located char(30) NOT NULL,
 PRIMARY KEY (mDate,homeTeamName),
 FOREIGN KEY(homeTeamName) REFERENCES Team(title),
 FOREIGN KEY(awayTeamName) REFERENCES Team(title));

create table TeamStatistic
(tDate date,
 tname char(25),
 games_played int, 
 wins int, 
 losses int, 
 points int, 
 FT_attempted int, 
 FT_made int, 
 FT_percent double(4, 1), 
 FG_attempted int, 
 FG_made int, 
 FG_percent double(4, 1),
 Threes_attempted int,
 Threes_made int, 
 Threes_percent double(4, 1),
 total_rebounds int, 
 offensive_rebounds int, 
 defensive_rebounds int, 
 assist int, 
 steals int, 
 personal_fouls int, 
 turnovers int, 
 blocks int, 
 PRIMARY KEY (tDate, tname),
 FOREIGN KEY (tDate) REFERENCES Game(mDate));


create table PlayerStatistic 
(pDate date, 
pname char(25), 
minutes_played time(0), 
points int, 
FT_attempted int, 
FT_made int, 
FT_percent double(4,1),
FG_attempted int, 
FG_made int, 
FG_percent double(4,1),
Threes_attempted int,
Threes_made int, 
Threes_percent double(4,1), 
total_rebounds int, 
offensive_rebounds int, 
defensive_rebounds int, 
assists int, 
steals int, 
personal_fouls int, 
turnovers int, 
blocks int, 
plus_minus int, 
PRIMARY KEY(pDate, pname),
FOREIGN KEY (pDate) REFERENCES Game(mDate));

INSERT INTO Season VALUES ('2018-10-16','2019-04-10','regular');
INSERT INTO Season VALUES ('2017-10-17','2019-04-11','regular');
INSERT INTO Season VALUES ('2017-04-15','2018-05-25','playoffs');
INSERT INTO Season VALUES ('2015-10-27','2016-04-13','regular');
INSERT INTO Season VALUES ('2014-10-04','2014-10-24','preseason');

INSERT INTO Team VALUES (LOAD_FILE('/Applications/XAMPP/xamppfiles/htdocs/raptors.png'),'Toronto Raptors',1995,'Scotiabank Arena','ATLANTIC','EASTERN');
INSERT INTO Team VALUES (LOAD_FILE('/Applications/XAMPP/xamppfiles/htdocs/lakers.png'), 'Los Angeles Lakers',1960,'Staples Center','PACIFIC','WESTERN');
INSERT INTO Team VALUES (LOAD_FILE('/Applications/XAMPP/xamppfiles/htdocs/cavs.png'), 'Cleveland Cavaliers',1970,'Rocket Mortgage FieldHouse','CENTRAL','EASTERN');
INSERT INTO Team VALUES (LOAD_FILE('/Applications/XAMPP/xamppfiles/htdocs/bucks.png'), 'Milwaukee Bucks',1968,'Fiserv Forum','CENTRAL','EASTERN');
INSERT INTO Team VALUES (LOAD_FILE('/Applications/XAMPP/xamppfiles/htdocs/76ers.png'), 'Philadelphia 76ers',1963,'Wells Fargo Center','ATLANTIC','EASTERN');

INSERT INTO TeamSeasons VALUES ('Toronto Raptors','2018-10-16');
INSERT INTO TeamSeasons VALUES ('Los Angeles Lakers','2018-10-16');
INSERT INTO TeamSeasons VALUES ('Cleveland Cavaliers','2018-10-16');
INSERT INTO TeamSeasons VALUES ('Milwaukee Bucks','2018-10-16');
INSERT INTO TeamSeasons VALUES ('Philadelphia 76ers','2018-10-16');

INSERT INTO Player VALUES (2456,'Kyle Lowry',32,6.00,'1986-03-25',205);
INSERT INTO Player VALUES (184,'Lonzo Ball',21,6.06,'1997-10-27',190);
INSERT INTO Player VALUES (1954,'Lebron James',34,6.08,'1984-12-30',250);
INSERT INTO Player VALUES (107,'Giannis Antetokounmpo',24,6.11,'1994-12-06',222);
INSERT INTO Player VALUES (1158,'Joel Embiid',24,7.00,'1994-03-16',250);
INSERT INTO Player VALUES (2451,'Kevin Love',24,6.10,'1988-09-07',251);

INSERT INTO PlayerTeams VALUES (2456,'Toronto Raptors','2018-10-16','2019-04-10',31.20,'G',7);
INSERT INTO PlayerTeams VALUES (184,'Los Angeles Lakers','2018-10-16','2019-04-10',7.46,'G',0);
INSERT INTO PlayerTeams VALUES(1954,'Los Angeles Lakers','2018-10-16','2019-04-10',35.65,'F-G',23);
INSERT INTO PlayerTeams VALUES(107,'Milwaukee Bucks','2018-10-16','2019-04-10',24.16,'F-G',34);
INSERT INTO PlayerTeams VALUES(1158,'Philadelphia 76ers','2018-10-16','2019-04-10',25.47,'C-F',24);
INSERT INTO PlayerTeams VALUES(2451,'Cleveland Cavaliers','2018-10-16','2019-04-10',24.12,'C-F',0);

INSERT INTO EndorsementDeal VALUES (3001,'Nike','shoe',10000000,107);
INSERT INTO EndorsementDeal VALUES (3002,'Nike','shoe',32000000,1954);
INSERT INTO EndorsementDeal VALUES (3003,'Coco-Cola','beverage',5000000,1954);
INSERT INTO EndorsementDeal VALUES (3004,'Under Armour','shoe',20000000,1158);
INSERT INTO EndorsementDeal VALUES (3005,'Big Baller Brand','shoe',1000000,184);

INSERT INTO Staff VALUES (1001,'Larry Tanenbaum','Toronto Raptors');
INSERT INTO Staff VALUES (1002,'Jeanie Buss','Los Angeles Lakers');
INSERT INTO Staff VALUES (1003,'Dan Gilbert','Cleveland Cavaliers');
INSERT INTO Staff VALUES (1004,'Marc Lasry','Milwaukee Bucks');
INSERT INTO Staff VALUES (1005,'Joshua Harris','Philadelphia 76ers');
INSERT INTO Staff VALUES (2001,'Nick Nurse','Toronto Raptors');
INSERT INTO Staff VALUES (2002,'Luke Walton','Los Angeles Lakers');
INSERT INTO Staff VALUES (2003,'Tyronn Lue','Cleveland Cavaliers');
INSERT INTO Staff VALUES (2004,'Mike Budenholzer','Milwaukee Bucks');
INSERT INTO Staff VALUES (2005,'Brett Brown','Philadelphia 76ers');
INSERT INTO Staff VALUES (2006,'Larry Drew','Cleveland Cavaliers');

INSERT INTO Owner VALUES (1001,1.5);
INSERT INTO Owner VALUES (1002,0.50);
INSERT INTO Owner VALUES (1003,7.1);
INSERT INTO Owner VALUES (1004,1.82);
INSERT INTO Owner VALUES (1005,2.7);

INSERT INTO Coach VALUES (2001,58,24,'Head Coach');
INSERT INTO Coach VALUES (2002,37,45,'Head Coach');
INSERT INTO Coach VALUES (2003,0,6,'Head Coach');
INSERT INTO Coach VALUES (2004,60,22,'Head Coach');
INSERT INTO Coach VALUES (2005,51,31,'Head Coach');
INSERT INTO Coach VALUES (2006,19,57,'Head Coach');

INSERT INTO Game VALUES ('2018-10-17','Toronto Raptors','Cleveland Cavaliers',116,104,'Scotiabank Arena');
INSERT INTO Game VALUES ('2018-10-29','Milwaukee Bucks','Toronto Raptors',124,109,'Fiserv Forum');
INSERT INTO Game VALUES ('2018-11-04','Los Angeles Lakers','Toronto Raptors',107,121,'Staples Center');
INSERT INTO Game VALUES ('2018-11-21','Cleveland Cavaliers','Los Angeles Lakers',105,109,'Rocket Mortgage FieldHouse');
INSERT INTO Game VALUES ('2018-12-22','Philadelphia 76ers','Toronto Raptors',126,101,'Wells Fargo Center');

INSERT INTO TeamStatistic VALUES ('2018-10-17','Cleveland Cavaliers',1,0,1,104,39,29,0.744,85,34,0.400,19,7,0.368,49,14,35,17,4,25,16,0);
INSERT INTO TeamStatistic VALUES ('2018-10-17','Toronto Raptors',1,1,0,116,20,12,0.600,92,45,0.489,33,14,0.489,43,8,35,21,6,29,9,7);
INSERT INTO TeamStatistic VALUES ('2018-10-29','Milwaukee Bucks',7,7,0,124,19,15,0.789,92,45,0.489,45,19,0.422,57,8,49,28,5,21,17,4);
INSERT INTO TeamStatistic VALUES ('2018-10-29','Toronto Raptors',7,6,1,109,28,22,0.786,103,39,0.379,45,9,0.200,51,15,36,25,9,19,10,7);
INSERT INTO TeamStatistic VALUES ('2018-11-04','Los Angeles Lakers',10,4,6,107,29,23,0.793,85,39,0.459,24,6,0.250,38,6,32,25,6,18,16,4);
INSERT INTO TeamStatistic VALUES ('2018-11-04','Toronto Raptors',10,9,1,121,14,13,0.929,98,49,0.500,35,10,0.286,49,13,36,32,9,24,12,4);
INSERT INTO TeamStatistic VALUES ('2018-11-21','Cleveland Cavaliers',16,2,14,105,15,14,0.933,102,39,0.382,34,13,0.382,46,15,31,18,3,22,3,2);
INSERT INTO TeamStatistic VALUES ('2018-11-21','Los Angeles Lakers',17,10,7,109,28,20,0.714,78,40,0.513,25,9,0.360,51,7,44,23,2,20,15,9);
INSERT INTO TeamStatistic VALUES ('2018-12-22','Philadelphia 76ers',34,22,12,126,35,26,0.743,85,46,0.541,24,8,0.333,53,4,49,33,10,21,11,7);
INSERT INTO TeamStatistic VALUES ('2018-12-22','Toronto Raptors',35,25,10,101,19,17,0.895,95,37,0.389,40,10,0.250,41,8,33,17,5,24,15,2);

INSERT INTO PlayerStatistic VALUES ('2018-10-17','Kyle Lowry','35:35:00',27,3,2,0.667,12,10,0.833,6,5,0.833,1,0,1,8,1,1,3,1,12);
INSERT INTO PlayerStatistic VALUES ('2018-10-29','Kyle Lowry','34:09',9,5,3,0.600,14,3,0.214,9,0,0.000,6,2,4,15,2,3,4,1,-10);
INSERT INTO PlayerStatistic VALUES ('2018-11-04','Kyle Lowry','33:22',21,2,2,1.000,19,8,0.421,7,3,0.429,6,1,5,15,2,1,1,1,+26);
INSERT INTO PlayerStatistic VALUES ('2018-11-04','Lebron James','28:17',18,7,4,0.571,12,6,0.500,3,2,0.667,2,0,2,6,0,3,3,1,-16);
INSERT INTO PlayerStatistic VALUES ('2018-12-22','Kyle Lowry','30:57',20,6,6,1.000,16,6,0.375,9,2,0.222,6,0,6,5,1,2,2,1,-8);
INSERT INTO PlayerStatistic VALUES ('2018-12-22','Joel Embiid','30:38',27,9,7,0.778,15,10,0.667,0,0,NULL,11,1,10,1,1,3,3,1,+15);

INSERT INTO PlayerStatistic VALUES('2018-10-17','Kevin Love','34:05:00',21,14,10,0.714,18,5,0.278,4,1,0.25,7,2,5,2,0,5,3,0,-3);
INSERT INTO PlayerStatistic VALUES ('2018-10-29','Giannis Antetokounmpo','30:38',27,9,7,0.778,15,10,0.667,1,2,0.500,11,1,10,1,1,3,3,1,+15);
INSERT INTO PlayerStatistic VALUES ('2018-11-21','Kevin Love','30:38',27,9,7,0.778,15,10,0.667,1,2,0.500,11,1,10,1,1,3,3,1,+15);

INSERT INTO Player VALUES (6000,'OG Anunoby',24,6.06,'1997-07-17',232);
INSERT INTO Player VALUES (6001,'Chris Boucher',24,6.06,'1993-01-11',200);
INSERT INTO Player VALUES (6002,'Lorenzo Brown',24,6.06,'1997-07-17',189);
INSERT INTO Player VALUES (6003,'Marc Gasol',24,6.06,'1997-07-17',255);
INSERT INTO Player VALUES (6004,'Danny Green',24,6.06,'1997-07-17',215);
INSERT INTO Player VALUES (6005,'Serge Ibaka',24,6.06,'1997-07-17',235);
INSERT INTO Player VALUES (6006,'Kawhi Leonard',24,6.06,'1997-07-17',230);
INSERT INTO Player VALUES (6007,'Jeremy Lin',24,6.06,'1997-07-17',200);
INSERT INTO Player VALUES (6009,'Jordan Loyd',24,6.06,'1997-07-17',210);
INSERT INTO Player VALUES (6010,'Patrick McCaw',24,6.06,'1997-07-17',185);
INSERT INTO Player VALUES (6011,'Jodie Meeks',24,6.06,'1997-07-17',210);
INSERT INTO Player VALUES (6012,'C.J. Miles',24,6.06,'1997-07-17',220);
INSERT INTO Player VALUES (6013,'Malcolm Miller',24,6.06,'1997-07-17',210);
INSERT INTO Player VALUES (6014,'Greg Monroe',24,6.06,'1997-07-17',265);
INSERT INTO Player VALUES (6015,'Eric Moreland',24,6.06,'1997-07-17',238);
INSERT INTO Player VALUES (6016,'Norman Powell',24,6.06,'1997-07-17',215);
INSERT INTO Player VALUES (6017,'Malachi Richardson',24,6.06,'1997-07-17',205);
INSERT INTO Player VALUES (6018,'Pascal Siakam',24,6.06,'1997-07-17',230);
INSERT INTO Player VALUES (6019,'Jonas Valančiūnas',24,6.06,'1997-07-17',265);
INSERT INTO Player VALUES (6020,'Fred VanVleet',24,6.06,'1997-07-17',195);
INSERT INTO Player VALUES (6021,'Delon Wright',24,6.06,'1997-07-17',183);
INSERT INTO Player VALUES (7081,'Deng Adel',24,6.06,'1997-07-17',200);
INSERT INTO Player VALUES (7030,'Jaron Blossomgame',24,6.06,'1997-07-17',220);
INSERT INTO Player VALUES (7058,'Alec Burks',24,6.06,'1997-07-17',214);
INSERT INTO Player VALUES (7038,'Marquese Chriss',24,6.06,'1997-07-17',240);
INSERT INTO Player VALUES (7078,'Jordan Clarkson',24,6.06,'1997-07-17',194);
INSERT INTO Player VALUES (7015,'Sam Dekker',24,6.06,'1997-07-17',230);
INSERT INTO Player VALUES (7065,'Matthew Dellavedova',24,6.06,'1997-07-17',200);
INSERT INTO Player VALUES (7034,'Channing Frye',24,6.06,'1997-07-17',255);
INSERT INTO Player VALUES (7063,'Andrew Harrison',24,6.06,'1997-07-17',213);
INSERT INTO Player VALUES (7097,'George Hill',24,6.06,'1997-07-17',188);
INSERT INTO Player VALUES (7072,'John Holland',24,6.06,'1997-07-17',205);
INSERT INTO Player VALUES (7007,'Rodney Hood',24,6.06,'1997-07-17',208);
INSERT INTO Player VALUES (7061,'Jalen Jones',24,6.06,'1997-07-17',220);
INSERT INTO Player VALUES (7043,'Brandon Knight',24,6.06,'1997-07-17',195);
INSERT INTO Player VALUES (7027,'Kyle Korver',24,6.06,'1997-07-17',212);
INSERT INTO Player VALUES (7056,'Kevin Love',24,6.06,'1997-07-17',251);
INSERT INTO Player VALUES (7073,'Patrick McCaw',24,6.06,'1997-07-17',185);
INSERT INTO Player VALUES (7010,'Larry Nance',24,6.06,'1997-07-17',230);
INSERT INTO Player VALUES (7023,'David Nwaba',24,6.06,'1997-07-17',219);
INSERT INTO Player VALUES (7042,'Cedi Osman',24,6.06,'1997-07-17',215);
INSERT INTO Player VALUES (7009,'Cameron Payne',24,6.06,'1997-07-17',190);
INSERT INTO Player VALUES (7031,'Collin Sexton',24,6.06,'1997-07-17',190);
INSERT INTO Player VALUES (7019,'Kobi Simmons',24,6.06,'1997-07-17',166);
INSERT INTO Player VALUES (7004,'J.R. Smith',24,6.06,'1997-07-17',225);
INSERT INTO Player VALUES (7018,'Nik Stauskas',24,6.06,'1997-07-17',205);
INSERT INTO Player VALUES (7029,'Tristan Thompson',24,6.06,'1997-07-17',238);
INSERT INTO Player VALUES (7039,'Ante Žižić',24,6.06,'1997-07-17',254);

INSERT INTO Player VALUES (7117,'Eric Bledsoe',22,6.05,'1990-01-01',205);
INSERT INTO Player VALUES (7134,'Malcolm Brogdon',22,6.05,'1990-01-01',229);
INSERT INTO Player VALUES (7125,'Sterling Brown',22,6.05,'1990-01-01',232);
INSERT INTO Player VALUES (7105,'Isaiah Canaan',22,6.05,'1990-01-01',201);
INSERT INTO Player VALUES (7137,'Bonzie Colson',22,6.05,'1990-01-01',224);
INSERT INTO Player VALUES (7141,'Pat Connaughton',22,6.05,'1990-01-01',209);
INSERT INTO Player VALUES (7102,'Matthew Dellavedova',22,6.05,'1990-01-01',200);
INSERT INTO Player VALUES (7112,'Donte DiVincenzo',22,6.05,'1990-01-01',203);
INSERT INTO Player VALUES (7135,'Trevon Duval',22,6.05,'1990-01-01',189);
INSERT INTO Player VALUES (7138,'Tim Frazier',22,6.05,'1990-01-01',170);
INSERT INTO Player VALUES (7122,'Pau Gasol',22,6.05,'1990-01-01',250);
INSERT INTO Player VALUES (7149,'John Henson',22,6.05,'1990-01-01',219);
INSERT INTO Player VALUES (7106,'George Hill',22,6.05,'1990-01-01',188);
INSERT INTO Player VALUES (7114,'Ersan İlyasova',22,6.05,'1990-01-01',235);
INSERT INTO Player VALUES (7140,'Brook Lopez',22,6.05,'1990-01-01',270);
INSERT INTO Player VALUES (7129,'Thon Maker',22,6.05,'1990-01-01',221);
INSERT INTO Player VALUES (7121,'Khris Middleton',22,6.05,'1990-01-01',222);
INSERT INTO Player VALUES (7127,'Nikola Mirotić',22,6.05,'1990-01-01',250);
INSERT INTO Player VALUES (7123,'Jaylen Morris',22,6.05,'1990-01-01',185);
INSERT INTO Player VALUES (7115,'Jason Smith',22,6.05,'1990-01-01',240);
INSERT INTO Player VALUES (7109,'Tony Snell',22,6.05,'1990-01-01',213);
INSERT INTO Player VALUES (7101,'D.J. Wilson',22,6.05,'1990-01-01',231);
INSERT INTO Player VALUES (7111,'Christian Wood',22,6.05,'1990-01-01',214);

INSERT INTO Player VALUES (7180,'Tobias Harris',26,6.09,'1990-01-01',235);
INSERT INTO Player VALUES (7170,'Furkan Korkmaz',26,6.09,'1990-01-01',190);
INSERT INTO Player VALUES (7181,'Mike Scott',26,6.09,'1990-01-01',237);
INSERT INTO Player VALUES (7160,'Al Horford',26,6.09,'1990-01-01',245);
INSERT INTO Player VALUES (7197,'Matisse Thybulle',26,6.09,'1990-01-01',200);
INSERT INTO Player VALUES (7179,'Ben Simmons',26,6.09,'1990-01-01',230);
INSERT INTO Player VALUES (7187,'Raul Neto',26,6.09,'1990-01-01',179);
INSERT INTO Player VALUES (7166,'Josh Richardson',26,6.09,'1990-01-01',200);
INSERT INTO Player VALUES (7183,'Shake Milton',26,6.09,'1990-01-01',207);
INSERT INTO Player VALUES (7174,'Kyle O''Quinn',26,6.09,'1990-01-01',250);
INSERT INTO Player VALUES (7186,'Norvel Pelle',26,6.09,'1990-01-01',216);
INSERT INTO Player VALUES (7199,'Glenn Robinson III',26,6.09,'1990-01-01',222);
INSERT INTO Player VALUES (7196,'Alec Burks',26,6.09,'1990-01-01',214);
INSERT INTO Player VALUES (7184,'Zhaire Smith',26,6.09,'1990-01-01',199);
INSERT INTO Player VALUES (7177,'Marial Shayok(TW)',26,6.09,'1990-01-01',196);
INSERT INTO Player VALUES (7169,'Lonzo Ball',27,4.00,'1990-01-11',205);
INSERT INTO Player VALUES (7182,'Michael Beasley',27,4.00,'1990-01-11',265);
INSERT INTO Player VALUES (7164,'Isaac Bonga',27,4.00,'1990-01-11',215);
INSERT INTO Player VALUES (7190,'Reggie Bullock',27,4.00,'1990-01-11',270);
INSERT INTO Player VALUES (7172,'Kentavious Caldwell-Pope',27,4.00,'1990-01-11',186);
INSERT INTO Player VALUES (7194,'Alex Caruso',27,4.00,'1990-01-11',253);
INSERT INTO Player VALUES (7191,'Tyson Chandler',27,4.00,'1990-01-11',220);
INSERT INTO Player VALUES (7189,'Josh Hart',27,4.00,'1990-01-11',180);
INSERT INTO Player VALUES (7192,'Andre Ingram',27,4.00,'1990-01-11',186);
INSERT INTO Player VALUES (7165,'Brandon Ingram',27,4.00,'1990-01-11',237);
INSERT INTO Player VALUES (7162,'Jemerrio Jones',27,4.00,'1990-01-11',179);
INSERT INTO Player VALUES (7198,'Kyle Kuzma',27,4.00,'1990-01-11',245);
INSERT INTO Player VALUES (7176,'Scott Machado',27,4.00,'1990-01-11',200);
INSERT INTO Player VALUES (7168,'JaVale McGee',27,4.00,'1990-01-11',235);
INSERT INTO Player VALUES (7152,'Mike Muscala',27,4.00,'1990-01-11',220);
INSERT INTO Player VALUES (7156,'Sviatoslav Mykhailiuk',27,4.00,'1990-01-11',180);
INSERT INTO Player VALUES (7161,'Rajon Rondo',27,4.00,'1990-01-11',186);
INSERT INTO Player VALUES (7154,'Lance Stephenson',27,4.00,'1990-01-11',237);
INSERT INTO Player VALUES (7163,'Moritz Wagner',27,4.00,'1990-01-11',179);
INSERT INTO Player VALUES (7159,'Johnathan Williams',27,4.00,'1990-01-11',245);
INSERT INTO Player VALUES (7167,'Ivica Zubac',27,4.00,'1990-01-11',200);

INSERT INTO PlayerTeams VALUES (6000,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6001,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6002,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6003,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6004,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6005,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6006,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6007,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6009,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6010,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6011,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6012,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6013,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6014,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6015,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6016,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6017,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6018,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6019,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6020,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (6021,'Toronto Raptors','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7081,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7030,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7058,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7038,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7078,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7015,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7065,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7034,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7063,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7097,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7072,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7007,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7061,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7043,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7027,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7056,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7073,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7010,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7023,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7042,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7009,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7031,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7019,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7004,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7018,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7029,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);
INSERT INTO PlayerTeams VALUES (7039,'Cleveland Cavaliers','2018-10-16','2019-04-10',22.00,'G',4);

INSERT INTO PlayerTeams VALUES (7180,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7170,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7181,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7160,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7197,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7179,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7187,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7166,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7183,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7174,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7186,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7199,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7196,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7184,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7177,'Philadelphia 76ers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7169,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7182,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7164,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7190,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7172,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7194,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7191,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7189,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7192,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7165,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7162,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7198,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7176,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7168,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7152,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7156,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7161,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7154,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7163,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7159,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7167,'Los Angeles Lakers','2018-10-16','2019-04-10',15.00,'F',3);

INSERT INTO PlayerTeams VALUES (7117,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7134,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7125,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7105,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7137,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7141,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7102,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7112,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7135,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7138,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7122,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7149,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7106,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7114,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7140,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7129,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7121,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7127,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7123,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7115,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7109,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7101,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);
INSERT INTO PlayerTeams VALUES (7111,'Milwaukee Bucks','2018-10-16','2019-04-10',15.00,'F',3);

INSERT INTO PlayerStatistic VALUES('2018-10-17','Cedi Osman','33:05:00',17,6,5,0.833,10,5,0.5,2,2,1,10,3,7,4,2,1,3,0,-21);
INSERT INTO PlayerStatistic VALUES('2018-10-17','George Hill','31:27:00',15,4,3,0.75,11,5,0.455,3,2,0.667,2,1,1,7,0,3,1,0,-10);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Tristan Thompson','27:05:00',3,2,1,0.5,5,1,0.2,0,0,NULL,13,5,8,1,0,2,4,0,-20);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Rodney Hood','26:19:00',12,2,2,1,13,5,0.385,2,0,0,2,1,1,1,1,3,0,0,-12);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Jordan Clarkson','23:09',15,0,0,NULL,15,7,0.467,4,1,0.25,3,0,3,0,0,3,0,0,-8);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Collin Sexton','17:43',9,5,5,1,7,2,0.286,1,0,0,3,1,2,0,0,4,4,0,0);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Sam Dekker','16:16',4,4,2,0.5,2,1,0.5,1,0,0,6,1,5,0,1,1,1,0,-10);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Ante Žižić','14:24',5,2,1,0.5,2,2,1,0,0,NULL,3,0,3,2,0,2,0,0,11);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Kyle Korver','14:01',3,0,0,NULL,2,1,0.5,2,1,0.5,0,0,0,0,0,1,0,0,13);
INSERT INTO PlayerStatistic VALUES('2018-10-17','David Nwaba','1:42',0,0,0,NULL,0,0,NULL,0,0,NULL,0,0,0,0,0,0,0,0,-1);
INSERT INTO PlayerStatistic VALUES('2018-10-17','John Holland','0:44',0,0,0,NULL,0,0,NULL,0,0,NULL,0,0,0,0,0,0,0,0,1);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Kawhi Leonard','37:15:00',24,6,5,0.833,22,9,0.409,3,1,0.333,12,1,11,2,0,0,2,3,13);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Danny Green','32:45:00',11,0,0,NULL,9,4,0.444,7,3,0.429,5,1,4,0,2,2,0,3,15);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Jonas Valančiūnas','20:24',6,0,0,NULL,8,3,0.375,2,0,0,12,2,10,3,0,0,0,2,13);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Pascal Siakam','19:57',13,0,0,NULL,8,6,0.75,1,1,1,2,0,2,2,0,1,0,2,11);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Serge Ibaka','27:11:00',9,6,4,0.667,10,2,0.2,3,1,0.333,7,4,3,1,2,3,2,6,-1);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Fred VanVleet','25:24:00',14,3,1,0.333,14,6,0.429,5,1,0.2,2,0,2,5,0,0,1,4,-4);
INSERT INTO PlayerStatistic VALUES('2018-10-17','OG Anunoby','17:32',4,0,0,NULL,3,2,0.667,1,0,0,0,0,0,0,1,0,1,1,-2);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Norman Powell','12:25',5,0,0,NULL,3,2,0.667,2,1,0.5,0,0,0,0,0,0,0,4,0);
INSERT INTO PlayerStatistic VALUES('2018-10-17','C.J. Miles','10:23',3,2,0,0,3,1,0.333,3,1,0.333,1,0,1,0,0,0,0,3,4);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Lorenzo Brown','0:44',0,0,0,NULL,0,0,NULL,0,0,NULL,1,0,1,0,0,0,0,0,-1);
INSERT INTO PlayerStatistic VALUES('2018-10-17','Malachi Richardson','0:25',0,0,0,NULL,0,0,NULL,0,0,NULL,0,0,0,0,0,0,0,0,0);

INSERT INTO PlayerStatistic VALUES('2018-10-29','Khris Middleton','31:15:00',14,11,4,0.364,3,2,0.667,9,4,0.444,4,0,4,8,4,2,3,0,18);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Brook Lopez','28:39:00',9,10,3,0.3,2,2,1,5,1,0.2,4,1,3,1,2,0,1,1,6);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Malcolm Brogdon','27:47:00',17,11,6,0.545,5,5,1,1,0,0,5,1,4,3,4,0,2,0,27);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Eric Bledsoe','25:56:00',17,12,7,0.583,1,1,1,5,2,0.4,2,0,2,8,2,0,3,1,-1);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Ersan İlyasova','23:30',19,12,8,0.667,0,0,NULL,6,3,0.5,10,2,8,2,1,0,1,0,9);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Thon Maker','23:13',11,7,4,0.571,2,1,0.5,4,2,0.5,7,0,7,2,1,0,2,1,6);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Donte DiVincenzo','22:47',12,9,4,0.444,2,2,1,5,2,0.4,8,0,8,2,0,0,1,0,7);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Pat Connaughton','16:25',8,8,3,0.375,2,0,0,4,2,0.5,8,2,6,0,1,1,1,0,-3);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Tony Snell','16:24',11,4,4,1,0,0,NULL,3,3,1,2,0,2,1,1,1,0,1,20);
INSERT INTO PlayerStatistic VALUES('2018-10-29','John Henson','10:39',4,4,2,0.5,0,0,NULL,1,0,0,5,2,3,1,2,1,2,0,14);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Matthew Dellavedova','4:29',0,2,0,0,0,0,NULL,1,0,0,0,0,0,0,2,0,1,0,-10);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Sterling Brown','4:29',0,0,0,NULL,0,0,NULL,0,0,NULL,1,0,1,0,0,0,0,0,-10);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Christian Wood','4:27',2,2,0,0,2,2,1,1,0,0,1,0,1,0,1,0,0,0,-8);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Pascal Siakam','33:19:00',22,16,10,0.625,3,2,0.667,4,0,0,8,2,6,2,2,4,2,1,-11);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Danny Green','29:42:00',8,6,3,0.5,0,0,NULL,3,2,0.667,5,1,4,1,0,1,1,0,-6);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Serge Ibaka','28:30:00',30,21,12,0.571,4,4,1,5,2,0.4,9,2,7,1,3,0,0,1,7);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Norman Powell','27:07:00',8,3,2,0.667,2,2,1,3,2,0.667,3,0,3,3,2,0,0,0,-12);
INSERT INTO PlayerStatistic VALUES('2018-10-29','C.J. Miles','19:29',4,7,1,0.143,2,1,0.5,7,1,0.143,1,0,1,0,1,0,1,1,-27);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Lorenzo Brown','19:07',5,9,2,0.222,0,0,NULL,5,1,0.2,4,1,3,2,3,1,1,2,-7);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Malachi Richardson','13:10',3,6,1,0.167,0,0,NULL,6,1,0.167,3,0,3,0,2,0,1,0,4);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Delon Wright','13:09',4,5,1,0.2,2,2,1,1,0,0,2,0,2,1,1,0,0,0,-15);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Jonas Valančiūnas','12:55',10,10,3,0.3,4,4,1,1,0,0,3,2,1,0,1,1,0,0,-21);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Greg Monroe','4:49',0,4,0,0,0,0,NULL,0,0,NULL,4,2,2,0,1,0,0,0,7);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Chris Boucher','2:17',6,2,1,0.5,6,4,0.667,1,0,0,2,2,0,0,0,0,0,1,8);
INSERT INTO PlayerStatistic VALUES('2018-10-29','Jordan Loyd','2:17',0,0,0,NULL,0,0,NULL,0,0,NULL,1,1,0,0,0,0,0,0,8);

INSERT INTO PlayerStatistic VALUES('2018-12-22','Ben Simmons','33:30:00',26,13,11,0.846,6,4,0.667,0,0,NULL,12,1,11,8,0,2,1,1,17);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Jimmy Butler','28:37:00',12,10,4,0.4,4,4,1,0,2,0,7,1,6,7,3,3,2,1,7);
INSERT INTO PlayerStatistic VALUES('2018-12-22','J.J. Redick','27:40:00',22,12,7,0.583,6,4,0.667,4,5,0.8,3,0,3,5,0,0,0,0,26);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Mike Muscala','17:37',4,3,1,0.333,2,1,0.5,1,3,0.333,4,0,4,1,0,2,0,0,10);
INSERT INTO PlayerStatistic VALUES('2018-12-22','T.J. McConnell','28:28:00',6,11,3,0.273,0,0,NULL,0,2,0,3,0,3,7,0,2,0,0,15);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Jonah Bolden','25:19:00',4,3,1,0.333,2,2,1,0,1,0,9,1,8,1,0,3,3,4,14);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Furkan Korkmaz','19:23',16,9,6,0.667,3,2,0.667,2,5,0.4,4,0,4,0,3,0,1,0,18);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Landry Shamet','16:06',3,5,1,0.2,1,1,1,0,4,0,0,0,0,1,0,4,1,0,-3);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Shake Milton','4:14',5,2,2,1,0,0,NULL,1,1,1,0,0,0,0,2,1,0,0,2);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Amir Johnson','4:14',1,1,0,0,2,1,0.5,0,1,0,0,0,0,0,1,0,0,0,2);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Demetrius Jackson','4:14',0,1,0,0,0,0,NULL,0,0,NULL,0,0,0,2,0,1,0,0,2);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Pascal Siakam','37:16:00',26,21,11,0.524,4,4,1,0,6,0,6,2,4,2,1,1,0,0,-21);
INSERT INTO PlayerStatistic VALUES('2018-12-22','OG Anunoby','26:29:00',5,4,2,0.5,0,0,NULL,1,2,0.5,5,0,5,1,0,5,2,0,-2);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Danny Green','24:37:00',9,12,3,0.25,2,2,1,1,5,0.2,3,0,3,0,0,3,3,0,-7);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Greg Monroe','21:53',6,7,3,0.429,0,0,NULL,0,0,NULL,8,4,4,1,0,4,1,0,-16);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Fred VanVleet','27:54:00',12,14,5,0.357,0,0,NULL,2,6,0.333,2,0,2,3,1,2,1,0,-18);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Norman Powell','25:14:00',13,8,4,0.5,3,3,1,2,4,0.5,3,0,3,1,1,1,1,0,-13);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Delon Wright','17:12',4,5,1,0.2,4,2,0.5,0,1,0,3,1,2,3,1,0,1,0,-18);
INSERT INTO PlayerStatistic VALUES('2018-12-22','C.J. Miles','12:18',3,4,1,0.25,0,0,NULL,1,4,0.25,1,0,1,0,0,2,1,0,-9);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Lorenzo Brown','6:09',0,2,0,0,0,0,NULL,0,1,0,2,1,1,1,0,0,1,0,-5);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Chris Boucher','5:47',0,1,0,0,0,0,NULL,0,1,0,2,0,2,0,0,4,2,1,-6);
INSERT INTO PlayerStatistic VALUES('2018-12-22','Malachi Richardson','4:14',3,1,1,1,0,0,NULL,1,1,1,0,0,0,0,0,0,0,0,-2);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Lonzo Ball','36:20:00',15,11,7,0.636,1,0,0,1,2,0.5,7,1,6,6,1,3,3,0,16);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Brandon Ingram','35:38:00',14,10,5,0.5,6,3,0.5,1,1,1,3,1,2,3,0,3,2,0,15);
INSERT INTO PlayerStatistic VALUES('2018-11-21','LeBron James','35:30:00',32,20,11,0.55,12,8,0.667,2,6,0.333,14,2,12,7,0,3,4,1,9);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Kyle Kuzma','28:41:00',12,9,4,0.444,2,2,1,2,5,0.4,5,0,5,0,0,3,2,2,13);
INSERT INTO PlayerStatistic VALUES('2018-11-21','JaVale McGee','24:46:00',12,6,6,1,0,0,NULL,0,0,NULL,5,1,4,2,0,3,2,3,7);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Kentavious Caldwell-Pope','24:31:00',13,8,3,0.375,4,4,1,3,6,0.5,5,0,5,1,1,3,1,0,-8);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Josh Hart','21:23',4,5,2,0.4,0,0,NULL,0,3,0,4,0,4,0,0,1,1,3,-9);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Tyson Chandler','19:19',4,3,1,0.333,2,2,1,0,0,NULL,6,2,4,1,0,1,0,0,-9);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Lance Stephenson','13:52',3,6,1,0.167,1,1,1,0,2,0,2,0,2,3,0,0,0,0,-14);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Cedi Osman','42:25:00',21,13,7,0.538,2,2,1,5,7,0.714,7,1,6,2,0,4,0,1,-12);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Collin Sexton','35:47:00',12,17,5,0.294,2,2,1,0,2,0,3,1,2,2,0,0,0,0,-6);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Rodney Hood','34:10:00',9,11,4,0.364,1,1,1,0,2,0,4,0,4,1,1,4,0,1,-4);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Tristan Thompson','29:54:00',14,17,7,0.412,0,0,NULL,0,0,NULL,15,10,5,0,0,3,0,0,-13);
INSERT INTO PlayerStatistic VALUES('2018-11-21','David Nwaba','23:36',7,7,2,0.286,3,2,0.667,1,6,0.167,3,1,2,1,1,5,1,0,-4);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Jordan Clarkson','26:30:00',20,18,6,0.333,4,4,1,4,8,0.5,2,1,1,5,0,4,1,0,4);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Larry Nance','17:58',7,8,3,0.375,1,1,1,0,1,0,9,1,8,5,1,1,1,0,10);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Kyle Korver','17:35',9,6,3,0.5,0,0,NULL,3,6,0.5,3,0,3,0,0,0,0,0,4);
INSERT INTO PlayerStatistic VALUES('2018-11-21','Andrew Harrison','12:05',6,5,2,0.4,2,2,1,0,2,0,0,0,0,2,0,1,0,0,1);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Pascal Siakam','34:38:00',16,14,8,0.571,0,0,NULL,1,0,0,13,5,8,3,1,0,2,2,25);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Serge Ibaka','29:07:00',34,17,15,0.882,3,3,1,1,1,1,10,3,7,2,2,0,1,4,32);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Danny Green','25:57:00',15,8,5,0.625,0,0,NULL,8,5,0.625,3,1,2,3,0,2,1,3,22);
INSERT INTO PlayerStatistic VALUES('2018-11-04','OG Anunoby','24:04:00',7,9,3,0.333,0,0,NULL,5,1,0.2,1,0,1,2,0,0,0,2,19);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Fred VanVleet','23:06',3,6,0,0,4,3,0.75,4,0,0,0,0,0,2,0,0,5,4,-10);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Delon Wright','21:34',11,8,5,0.625,1,1,1,2,0,0,2,2,0,2,0,0,0,1,-10);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Jonas Valančiūnas','17:04',14,9,5,0.556,4,4,1,1,0,0,8,0,8,1,2,1,0,3,-16);
INSERT INTO PlayerStatistic VALUES('2018-11-04','C.J. Miles','16:54',0,6,0,0,0,0,NULL,4,0,0,3,0,3,1,1,0,0,0,-7);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Norman Powell','14:14',0,2,0,0,0,0,NULL,2,0,0,3,1,2,1,1,0,2,4,-11);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Brandon Ingram','34:15:00',16,7,11,0.636,0,1,0,2,3,0.667,0,1,1,3,0,1,1,2,1);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Kyle Kuzma','31:41:00',24,10,16,0.625,0,4,0,4,5,0.8,0,5,5,2,0,0,3,3,-18);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Lonzo Ball','23:09',12,5,7,0.714,2,3,0.667,0,0,NULL,1,8,9,4,2,0,2,3,-1);
INSERT INTO PlayerStatistic VALUES('2018-11-04','JaVale McGee','17:14',8,1,6,0.167,0,0,NULL,6,6,1,3,3,6,2,0,2,2,1,-24);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Josh Hart','29:53:00',6,1,5,0.2,1,4,0.25,3,3,1,0,5,5,1,3,0,0,0,11);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Rajon Rondo','24:51:00',10,4,9,0.444,1,1,1,1,2,0.5,0,1,1,3,1,0,1,1,-13);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Kentavious Caldwell-Pope','16:58',2,1,5,0.2,0,4,0,0,0,NULL,0,2,2,0,0,0,1,0,-8);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Lance Stephenson','12:58',4,2,8,0.25,0,2,0,0,0,NULL,0,1,1,0,0,0,2,1,-10);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Ivica Zubac','11:12',5,1,3,0.333,0,0,NULL,3,3,1,2,4,6,1,0,0,1,4,1);
INSERT INTO PlayerStatistic VALUES('2018-11-04','Sviatoslav Mykhailiuk','9:32',2,1,3,0.333,0,2,0,0,0,NULL,0,0,0,3,0,0,0,0,7);