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