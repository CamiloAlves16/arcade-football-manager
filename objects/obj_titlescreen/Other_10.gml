/// @description DATABASE SETUP

global.week = 1;
global.year = 2026;
global.max_weeks = 10;
global.min_wage = 5000;
global.max_wage = 150000;
global.min_tickets = 10000;
global.max_tickets = 300000;
global.min_tv = 10000;
global.max_tv = 750000;

global.events = [];

global.team_list = [];
global.coach_list = [];
global.coach_freeagent = [];
global.player_list = [];
global.player_freeagent = [];
global.player_loans = [];
global.player_transfers = [];

global.l8te_money = 8000000;
global.nobet_money = 10000000;
global.zola_money = 7000000;
global.gulp_money = 3000000;
global.feel_money = 2000000;
global.afm_money = 200000;

global.league_list = ["l02","l03","l04","l06", "l12", "l13", "l14", "l16"];

global.l00_name = "CHAMPIONS CUP";
global.l00_abrv = "CC";
global.l00_reputation = 5;

global.l01_name = "EUROPE CUP";
global.l01_abrv = "EC";
global.l01_reputation = 4;

global.l02_name = "ENGLAND 1";
global.l02_abrv = "E1";
global.l02_country = "ENGLAND";
global.l02_reputation = 5;
global.l02_class = [];

global.l03_name = "SPAIN 1";
global.l03_abrv = "S1";
global.l03_country = "SPAIN";
global.l03_reputation = 5;
global.l03_class = [];

global.l04_name = "ITALY 1";
global.l04_abrv = "I1";
global.l04_country = "ITALY";
global.l04_reputation = 5;
global.l04_class = [];

global.l06_name = "PORTUGAL 1";
global.l06_abrv = "P1";
global.l06_country = "PORTUGAL";
global.l06_reputation = 4;
global.l06_class = [];

global.l12_name = "ENGLAND 2";
global.l12_abrv = "E2";
global.l12_country = "ENGLAND";
global.l12_reputation = 4;
global.l12_class = [];

global.l13_name = "SPAIN 2";
global.l13_abrv = "S2";
global.l13_country = "SPAIN";
global.l13_reputation = 3;
global.l13_class = [];

global.l14_name = "ITALY 2";
global.l14_abrv = "I2";
global.l14_country = "ITALY";
global.l14_reputation = 3;
global.l14_class = [];

global.l16_name = "PORTUGAL 2";
global.l16_abrv = "P2";
global.l16_country = "PORTUGAL";
global.l16_reputation = 2;
global.l16_class = [];

teamcode = "freeagent";
db_coach_push("CAMILO", "ALVES", 26, global.c_whiteskin, "PORTUGAL",teamcode, 1, "balanced");
reputation = 5;
db_coach_push("XABIER", "HERNANDEZ", 45, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
db_coach_push("ERLIN", "TEN HAG", 55, global.c_whiteskin, "NETHERLANDS",teamcode, reputation, "balanced");
db_player_push("HOUSSIM", "ZIYECH", 32, global.c_lightskin, "MAROCCO", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 2, 3, 0, reputation);
reputation = 4;
db_coach_push("BERTO", "LAGE", 49, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "balanced");
db_player_push("VITALIS", "ABOUBAKAR", 33, global.c_darkskin, "CAMEROON", teamcode, "FORWARD", 10, 3, 1, 2, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("PAUL", "BAMFORD", 31, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 9, 2, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("MIRAM", "PLANIC", 35, global.c_whiteskin, "BOSNIA", teamcode, "MIDFIELDER", 10, 2, 2, 1, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("ALEX", "OX-TIMBERLAND", 32, global.c_lightskin, "ENGLAND", teamcode, "MIDFIELDER", 11, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("SAMUEL", "REGUILON", 28, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 14, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JOSE", "BERNAT", 32, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 17, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MIGUEL", "RUI", 34, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 6, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("RAFAEL", "PATRICIO", 37, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 1, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);
reputation = 3;
db_player_push("PABLO", "ALCACER", 32, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 9, 1, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
reputation = 2;
db_player_push("GUILHERME", "ASSUNCAO", 25, global.c_lightskin, "BRAZIL", teamcode, "MIDFIELDER", 16, 2, 2, 1, 1, 1, 1, 3, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("F.C. CATALAN", "F.C.C.", c_red, c_blue, c_black, "stripes", 0, "l03", 50000000, reputation);
db_coach_push("HELMUT", "FLICK", 45, global.c_whiteskin, "GERMANY",teamcode, reputation, "attacking");
db_player_push("MORITZ", "TER STEGEN", 33, global.c_whiteskin, "GERMANY", teamcode, "GOALKEEPER", 1, 2, 3, 2, 3, 3, 1, 1, 1, 0, reputation);
db_player_push("JULIEN", "KOUNDE", 26, global.c_lightskin, "FRANCE", teamcode, "DEFENDER", 23, 2, 3, 2, 2, 1, 3, 2, 1, 0, reputation);
db_player_push("RAFAEL", "ARAUJO", 26, global.c_lightskin, "URUGUAY", teamcode, "DEFENDER", 4, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("PASCUAL", "CUBARSI", 18, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 5, 2, 3, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("PEDRO", "GAVI", 21, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 6, 3, 2, 3, 3, 1, 1, 3, 2, 2, reputation);
db_player_push("PABLO", "GONZALEZ", 22, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 8, 3, 2, 3, 3, 1, 1, 3, 2, 2, reputation);
db_player_push("FLORIAN", "DE JONG", 28, global.c_whiteskin, "NETHERLANDS", teamcode, "MIDFIELDER", 21, 2, 2, 3, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("LUIS", "YAMAL", 18, global.c_darkskin, "SPAIN", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 2, 3, 2, reputation);
db_player_push("RENATINHO", "DIAS", 28, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 11, 3, 2, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("FABIAN", "TORRES", 25, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 7, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("ROMAN", "LEWANDOWSKI", 37, global.c_whiteskin, "POLAND", teamcode, "FORWARD", 9, 2, 2, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("WIESLAW", "SZCZESNY", 35, global.c_whiteskin, "POLAND", teamcode, "GOALKEEPER", 25, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("MADRID WHITE C.F.", "M.W.C.F.", c_white, c_white, c_dkgray, "shorts", 1, "l03", 80000000, reputation);
db_coach_push("XIOMAR", "ALONSO", 43, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
db_player_push("TOMASZ", "COURTOIS", 32, global.c_whiteskin, "BELGIUM", teamcode, "GOALKEEPER", 1, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("ELIAS", "MILITAO", 27, global.c_lightskin, "BRAZIL", teamcode, "DEFENDER", 3, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("DANIEL", "HUIJSEN", 20, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 24, 2, 2, 2, 3, 1, 3, 1, 1, 2, reputation);
db_player_push("TYLER", "ALEXANDER-ARNOLD", 26, global.c_lightskin, "ENGLAND", teamcode, "DEFENDER", 12, 3, 2, 2, 3, 1, 3, 3, 1, 0, reputation);
db_player_push("VITOR", "JUNIOR", 25, global.c_darkskin, "BRAZIL", teamcode, "FORWARD", 7, 3, 2, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("EVANDRO", "SOUSA", 19, global.c_darkskin, "BRAZIL", teamcode, "FORWARD", 9, 3, 1, 2, 3, 1, 1, 1, 3, 2, reputation);
db_player_push("KARIM", "MBAPPE", 26, global.c_lightskin, "FRANCE", teamcode, "FORWARD", 9, 3, 2, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("RAFAEL", "DE GOES", 24, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 11, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("JORDAN", "BELLINGHAM", 21, global.c_lightskin, "ENGLAND", teamcode, "MIDFIELDER", 5, 3, 2, 3, 3, 1, 1, 3, 3, 1, reputation);
db_player_push("FELIX", "VALVERDE", 27, global.c_whiteskin, "URUGUAY", teamcode, "MIDFIELDER", 8, 3, 3, 3, 3, 1, 2, 3, 3, 0, reputation);
db_player_push("ADRIEN", "TCHOUAMENI", 25, global.c_darkskin, "FRANCE", teamcode, "MIDFIELDER", 14, 3, 3, 2, 2, 1, 3, 3, 1, 2, reputation);
db_player_push("EMILE", "CAMAVINGA", 22, global.c_darkskin, "FRANCE", teamcode, "MIDFIELDER", 6, 3, 3, 2, 2, 1, 3, 3, 1, 2, reputation);
db_player_push("ALEKSEY", "LUNIN", 26, global.c_whiteskin, "UKRAINE", teamcode, "GOALKEEPER", 13, 1, 3, 3, 1, 3, 1, 1, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("C. MADRID RED", "C.M.R.", c_white, c_red, c_blue, "stripes and shorts", 0, "l03", 50000000, reputation);
db_coach_push("DOMINGO", "SIMEONE", 55, global.c_whiteskin, "ARGENTINA",teamcode, reputation, "defensive");
db_player_push("JURE", "OBLAK", 32, global.c_whiteskin, "SLOVENIA", teamcode, "GOALKEEPER", 13, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("RAUL", "LE NORMAND", 28, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 24, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JORGE", "GIMENEZ", 30, global.c_whiteskin, "URUGUAY", teamcode, "DEFENDER", 2, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MARIO", "LLORENTE", 30, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 14, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("CALLUM", "GALLAGHER", 25, global.c_whiteskin, "ENGLAND", teamcode, "MIDFIELDER", 4, 2, 3, 3, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("ADRIEN", "GRIEZMANN", 34, global.c_whiteskin, "FRANCE", teamcode, "FORWARD", 7, 2, 2, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("JUAN", "ALVAREZ", 25, global.c_whiteskin, "ARGENTINA", teamcode, "FORWARD", 19, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
reputation = 4;
db_player_push("DUSAN", "HANCKO", 27, global.c_whiteskin, "SLOVAKIA", teamcode, "DEFENDER", 17, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("PEDRO", "BARRIOS", 22, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 8, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("ALFREDO", "BAENA", 24, global.c_whiteskin, "ARGENTINA", teamcode, "FORWARD", 10, 3, 1, 2, 3, 1, 1, 2, 3, 1, reputation);
db_player_push("ANDERS", "SORLOTH", 29, global.c_whiteskin, "NORWAY", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("BILBAO CLUB", "B.C.", c_white, c_red, c_black, "stripes and shorts", 0, "l03", 40000000, reputation);
db_coach_push("ENRIQUE", "VALVERDE", 62, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
db_player_push("ULISES", "SIMON", 28, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 1, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("NOEL", "WILLIAMS", 22, global.c_darkskin, "SPAIN", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 2, 3, 2, reputation);
db_player_push("ALBERTO", "PAREDES", 25, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 4, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
reputation = 4;
db_player_push("DAVID", "VIVIAN", 26, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 3, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("ANDRES", "LAPORTE", 31, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 14, 1, 3, 2, 3, 1, 3, 1, 1, 0, reputation);
db_player_push("OSCAR", "SANSET", 25, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 20, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("BORJA", "PRADOS", 24, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 24, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("MANUEL", "VESGA", 32, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 6, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("ALVARO", "BERENGUER", 30, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("ISAAC", "WILLIAMS", 31, global.c_darkskin, "GHANA", teamcode, "FORWARD", 7, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("ALEJANDRO", "PADILLA", 22, global.c_whiteskin, "MEXICO", teamcode, "GOALKEEPER", 27, 1, 3, 2, 1, 3, 1, 1, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("SEBASTIAN C.F.", "S.C.F.", c_blue, c_white, c_black, "stripes", 1, "l03", 40000000, reputation);
db_coach_push("SALVADOR", "FRANCISCO", 46, global.c_whiteskin, "SPAIN",teamcode, reputation, "attacking");
db_player_push("ALVARO", "REMIRO", 30, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 1, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("SANTIAGO", "GOMEZ", 25, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 17, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("IVAN", "ZUBELDIA", 28, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 5, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("DOMINIK", "CALETA-CAR", 29, global.c_whiteskin, "CROATIA", teamcode, "DEFENDER", 16, 1, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("CARMELO", "SOLER", 28, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 18, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("BORJA", "TURRIENTES", 23, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 8, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("BRUNO", "MENDEZ", 28, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 23, 2, 2, 2, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("TARO", "KUBO", 24, global.c_whiteskin, "JAPAN", teamcode, "FORWARD", 14, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("MARCEL", "OYARZABAL", 28, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("GUSTAVO", "GUEDES", 28, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 11, 3, 1, 3, 2, 1, 1, 2, 3, 0, reputation);
db_player_push("OLAFUR", "OSKARSSON", 21, global.c_whiteskin, "ICELAND", teamcode, "FORWARD", 9, 2, 1, 3, 2, 1, 1, 1, 3, 1, reputation);
db_player_push("URBANO", "MARRERO", 23, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 13, 1, 2, 2, 1, 3, 1, 1, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("ANDALUSIA RED F.C.", "A.R.F.C.", c_white, c_white, c_maroon, "shorts", 0, "l03", 30000000, reputation);
db_coach_push("MARIO", "ALMEYDA", 51, global.c_whiteskin, "ARGENTINA",teamcode, reputation, "balanced");
db_player_push("ALEJANDRO", "FERNANDEZ", 27, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 1, 1, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("THIERRY", "NIANZOU", 23, global.c_darkskin, "FRANCE", teamcode, "DEFENDER", 23, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("KARLOS", "SALAS", 23, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 4, 2, 3, 2, 1, 1, 3, 1, 1, 2, reputation);
db_player_push("CARLOS", "AZPILICUETA", 36, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 3, 2, 2, 2, 2, 1, 3, 3, 1, 0, reputation);
db_player_push("LOUIS", "AGOUME", 23, global.c_darkskin, "FRANCE", teamcode, "MIDFIELDER", 18, 2, 3, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("NIKOLA", "GUDELJ", 33, global.c_whiteskin, "SERBIA", teamcode, "MIDFIELDER", 6, 2, 3, 2, 1, 1, 1, 3, 1, 0, reputation);
db_player_push("DJEMAL", "SOW", 28, global.c_darkskin, "SWITZERLAND", teamcode, "MIDFIELDER", 20, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("ADRIEN", "JANUZAJ", 30, global.c_whiteskin, "BELGIUM", teamcode, "FORWARD", 24, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("ISAIAH", "ROMERO", 25, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 7, 2, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("OLE", "NYLAND", 35, global.c_whiteskin, "NORWAY", teamcode, "GOALKEEPER", 13, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("NARANJA C.F.", "N.C.F.", c_white, c_black, make_color_rgb(255,99,25), "shorts", 0, "l13", 20000000, reputation);
db_coach_push("CARMELO", "CORBERAN", 42, global.c_whiteskin, "SPAIN",teamcode, reputation, "defensive");
db_player_push("STEVAN", "DIMITRIEVSKI", 31, global.c_whiteskin, "MACEDONIA", teamcode, "GOALKEEPER", 1, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("MOUSSA", "DIAKHABY", 28, global.c_darkskin, "GUINE", teamcode, "DEFENDER", 4, 1, 3, 3, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("JUAN", "GAYA", 30, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 14, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JULIAN", "VAZQUEZ", 22, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 21, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("ANTONIO", "ALMEIDA", 25, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 10, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("JAVIER", "PEPELU", 27, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 18, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("HERNAN", "DURO", 25, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 9, 2, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("JESUS", "GUERRA", 22, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 8, 2, 2, 2, 3, 1, 1, 3, 2, 2, reputation);
db_player_push("DOMINGO", "LOPEZ", 23, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 16, 3, 1, 2, 2, 1, 1, 2, 3, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("CASTELLON YELLOW C.F.", "C.Y.C.F.", c_yellow, c_yellow, c_navy, "shorts", 1, "l13", 30000000, reputation);
db_coach_push("MATEO", "GARCIA", 60, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
reputation = 5;
db_player_push("NESTOR", "PEPE", 30, global.c_darkskin, "IVORY COAST", teamcode, "FORWARD", 19, 3, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("THIERRY", "PARTEY", 32, global.c_darkskin, "GHANA", teamcode, "MIDFIELDER", 16, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
reputation = 4;
db_player_push("LEANDRO", "JUNIOR", 24, global.c_darkskin, "BRAZIL", teamcode, "GOALKEEPER", 1, 1, 3, 3, 1, 3, 1, 1, 1, 1, reputation);
db_player_push("DARIO", "CONDE", 26, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 13, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("RAFAEL", "VEIGA", 22, global.c_lightskin, "PORTUGAL", teamcode, "DEFENDER", 12, 2, 3, 1, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("JULIAN", "FOYTH", 27, global.c_whiteskin, "ARGENTINA", teamcode, "DEFENDER", 8, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("IBRAHIM", "AKHOMACH", 21, global.c_lightskin, "MARROCO", teamcode, "MIDFIELDER", 11, 3, 1, 2, 3, 1, 1, 3, 3, 1, reputation);
db_player_push("ALVARO", "MOLEIRO", 21, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 20, 3, 1, 2, 3, 1, 1, 3, 3, 2, reputation);
db_player_push("GUSTAVO", "MIKAUTADZE", 24, global.c_whiteskin, "GEORGIA", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 1, reputation);
db_player_push("GERMAN", "MORENO", 33, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 7, 2, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("DARIO", "PAREJO", 36, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 10, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("ANDALUSIA GREEN B.", "A.G.B.", c_green, c_white, c_black, "stripes and shorts", 1, "l13", 30000000, reputation);
reputation = 5;
db_coach_push("MARTIN", "PELLEGRINI", 71, global.c_whiteskin, "CHILE",teamcode, reputation, "defensive");
db_player_push("ADRIANO", "DOS SANTOS", 25, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("HUGO", "BELLERIN", 30, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 2, 2, 2, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MIGUEL", "BARTRA", 34, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 5, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
reputation = 4;
db_player_push("SAID", "AMRABAT", 29, global.c_lightskin, "MAROCCO", teamcode, "MIDFIELDER", 14, 2, 3, 2, 1, 1, 1, 3, 1, 0, reputation);
db_player_push("PASCAL", "FORNALS", 29, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 8, 2, 2, 2, 2, 1, 1, 3, 2, 0, reputation);
db_player_push("GASTON", "LO CELSO", 29, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 20, 2, 2, 1, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("IGNACIO", "SUAREZ", 33, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 22, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("ALEJANDRO", "VALLES", 28, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 1, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("PABLO", "LOPEZ", 30, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 25, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("JASON", "FIRPO", 29, global.c_darkskin, "DOMINICAN REP.", teamcode, "DEFENDER", 23, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("CARLOS", "HERNANDEZ", 26, global.c_lightskin, "COLOMBIA", teamcode, "FORWARD", 19, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("R.C. GALIZA", "R.C.G.", make_color_rgb(0,191,243), c_white, c_black, "shorts", 1, "l13", 20000000, reputation);
db_coach_push("CARLOS", "GIRALDEZ", 37, global.c_whiteskin, "SPAIN",teamcode, reputation, "defensive");
db_player_push("IONEL", "RADU", 28, global.c_whiteskin, "ROMANIA", teamcode, "GOALKEEPER", 13, 1, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("OSVALDO", "MINGUEZA", 26, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 3, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JULIAN", "RODRIGUEZ", 22, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 32, 2, 3, 1, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("IBRAHIM", "MORIBA", 22, global.c_darkskin, "GUINE", teamcode, "MIDFIELDER", 6, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("IGNACIO", "ASPAS", 38, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 10, 2, 1, 2, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("BRUNO", "IGLESIAS", 32, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("FERMIN", "JUTGLA", 26, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("IGNACIO", "VILLAR", 28, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 1, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("RED SUBMARINE F.C.", "R.S.F.C.", c_red, c_red, c_black, "shorts", 0, "l02", 100000000, reputation);
db_coach_push("ADRIAN", "SLOT", 46, global.c_whiteskin, "NETHERLANDS",teamcode, reputation, "attacking");
db_player_push("ADRIANO", "BECKER", 32, global.c_whiteskin, "BRAZIL", teamcode, "GOALKEEPER", 1, 3, 3, 3, 3, 3, 1, 1, 1, 0, reputation);
db_player_push("VICTOR", "VAN DIJK", 34, global.c_lightskin, "NETHERLANDS", teamcode, "DEFENDER", 4, 3, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("IGOR", "KONATE", 26, global.c_darkskin, "FRANCE", teamcode, "DEFENDER", 5, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JULIEN", "FRIMPONG", 24, global.c_darkskin, "NETHERLANDS", teamcode, "DEFENDER", 30, 3, 2, 3, 2, 1, 3, 2, 1, 1, reputation);
db_player_push("RYKER", "GRAVENBERCH", 23, global.c_darkskin, "NETHERLANDS", teamcode, "MIDFIELDER", 38, 2, 2, 3, 3, 1, 1, 3, 1, 2, reputation);
db_player_push("DAGOMER", "SZOBOSZLAI", 24, global.c_whiteskin, "HUNGARY", teamcode, "MIDFIELDER", 8, 2, 2, 3, 3, 1, 2, 3, 2, 3, reputation);
db_player_push("ALFREDO", "MAC ALLISTER", 26, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 10, 2, 3, 3, 3, 1, 2, 3, 2, 0, reputation);
db_player_push("FELIX", "WIRTZ", 22, global.c_whiteskin, "GERMANY", teamcode, "MIDFIELDER", 7, 3, 1, 3, 3, 1, 1, 3, 3, 2, reputation);
db_player_push("MAGDY", "SALAH", 33, global.c_lightskin, "EGYPT", teamcode, "FORWARD", 11, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("CAMILO", "GAKPO", 26, global.c_lightskin, "NETHERLANDS", teamcode, "FORWARD", 18, 3, 1, 2, 3, 1, 1, 1, 3, 1, reputation);
db_player_push("GIORDIO", "MAMARDASHVILI", 24, global.c_whiteskin, "GEORGIA", teamcode, "GOALKEEPER", 25, 1, 3, 3, 1, 3, 1, 1, 1, 2, reputation);
db_player_push("HENRI", "EKITIKE", 23, global.c_lightskin, "FRANCE", teamcode, "FORWARD", 22, 3, 1, 2, 3, 1, 1, 1, 3, 2, reputation);
db_player_push("ALBIN", "ISAK", 25, global.c_darkskin, "SWEDEN", teamcode, "FORWARD", 9, 3, 1, 3, 3, 1, 1, 1, 3, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("RED LONDON F.C.", "R.L.F.C.", c_red, c_white, c_black, "sleeves", 0, "l02", 100000000, reputation);
db_coach_push("MIGUEL", "ARTETA", 43, global.c_whiteskin, "SPAIN",teamcode, reputation, "defensive");
db_player_push("DARIO", "RAYA", 26, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 22, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("WALTER", "SALIBA", 23, global.c_lightskin, "FRANCE", teamcode, "DEFENDER", 2, 2, 3, 3, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("DEREK", "RICE", 22, global.c_whiteskin, "ENGLAND", teamcode, "MIDFIELDER", 41, 2, 3, 3, 3, 1, 1, 3, 1, 1, reputation);
db_player_push("BRYAN", "SAKA", 22, global.c_darkskin, "ENGLAND", teamcode, "FORWARD", 7, 3, 2, 3, 3, 1, 2, 2, 3, 0, reputation);
db_player_push("GUSTAVO", "MARTINELLI", 24, global.c_whiteskin, "BRAZIL", teamcode, "FORWARD", 11, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("RODRIGO", "CALAFIORI", 23, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 33, 3, 3, 2, 3, 1, 3, 1, 1, 0, reputation);
db_player_push("JONAS", "TIMBER", 22, global.c_darkskin, "NETHERLANDS", teamcode, "DEFENDER", 12, 3, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MATHIAS", "ODEGAARD", 25, global.c_whiteskin, "NORWAY", teamcode, "MIDFIELDER", 8, 3, 2, 3, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("VIGGO", "GYOKERES", 27, global.c_whiteskin, "SWEDEN", teamcode, "FORWARD", 12, 3, 2, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("NATHAN", "MADUEKE", 23, global.c_darkskin, "ENGLAND", teamcode, "FORWARD", 20, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("KARLOS", "ARRIZABALAGA", 30, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 13, 2, 2, 2, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("MICHAEL", "LEWIS-SKELLY", 18, global.c_darkskin, "ENGLAND", teamcode, "DEFENDER", 49, 2, 2, 2, 2, 1, 3, 1, 1, 4, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("BLUE TOWN F.C.", "B.T.F.C.", c_aqua, c_white, c_black, "shorts", 1, "l02", 100000000, reputation);
db_coach_push("PABLO", "GUARDIOLA", 54, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
db_player_push("GIACOMO", "DONNARUMA", 26, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 25, 2, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("RAFAEL", "DIAS", 28, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 3, 3, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JONAS", "GVARDIOL", 23, global.c_whiteskin, "CROATIA", teamcode, "DEFENDER", 24, 2, 3, 3, 2, 1, 3, 2, 1, 3, reputation);
db_player_push("ROBERTO", "HERNANDEZ", 29, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 16, 3, 3, 3, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("TARIQ", "REIJNDERS", 27, global.c_lightskin, "NETHERLANDS", teamcode, "MIDFIELDER", 4, 2, 3, 3, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("BRUNO", "SILVA", 31, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 20, 3, 3, 3, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("EMIL", "HAALAND", 25, global.c_whiteskin, "NORWAY", teamcode, "FORWARD", 9, 3, 2, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("PAUL", "FODEN", 25, global.c_whiteskin, "ENGLAND", teamcode, "MIDFIELDER", 47, 3, 1, 3, 3, 1, 1, 3, 3, 1, reputation);
db_player_push("RAHIM", "CHERKI", 22, global.c_lightskin, "FRANCE", teamcode, "MIDFIELDER", 10, 3, 1, 3, 3, 1, 1, 3, 3, 1, reputation);
db_player_push("JADEN", "DOKU", 23, global.c_darkskin, "BELGIUM", teamcode, "FORWARD", 11, 3, 2, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("NATHAN", "O'REILLY", 20, global.c_lightskin, "ENGLAND", teamcode, "DEFENDER", 33, 2, 2, 2, 2, 1, 3, 3, 1, 2, reputation);
db_player_push("JORDAN", "TRAFFORD", 22, global.c_whiteskin, "ENGLAND", teamcode, "GOALKEEPER", 1, 2, 3, 2, 1, 3, 1, 1, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("RED TOWN F.C.", "R.T.F.C.", c_red, c_white, c_blue, "shorts", 1, "l02", 80000000, reputation);
db_coach_push("RAFAEL", "AMORIM", 40, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "defensive");
db_player_push("ALPER", "BAYINDIR", 27, global.c_lightskin, "TURKEY", teamcode, "GOALKEEPER", 1, 1, 3, 2, 2, 3, 1, 1, 1, 1, reputation);
db_player_push("MARCUS", "DE LIGT", 26, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 4, 2, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("HAROLD", "MAGUIRE", 31, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 5, 1, 3, 2, 3, 1, 3, 1, 1, 0, reputation);
db_player_push("LEON", "YORO", 19, global.c_darkskin, "FRANCE", teamcode, "DEFENDER", 15, 2, 3, 2, 1, 1, 3, 1, 1, 2, reputation);
db_player_push("BERNARDO", "FERNANDES", 30, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 8, 2, 2, 3, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("BARRY", "MBUEMO", 26, global.c_lightskin, "CAMEROON", teamcode, "FORWARD", 19, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("MARIO", "CUNHA", 26, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("BOGDAN", "SESKO", 22, global.c_whiteskin, "SLOVENIA", teamcode, "FORWARD", 30, 2, 1, 3, 2, 1, 1, 1, 3, 2, reputation);
db_player_push("LUIS", "MARTINEZ", 26, global.c_whiteskin, "ARGENTINA", teamcode, "DEFENDER", 6, 2, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MICHAEL", "MOUNT", 25, global.c_whiteskin, "ENGLAND", teamcode, "MIDFIELDER", 7, 2, 2, 3, 2, 1, 1, 3, 3, 0, reputation);
db_player_push("MIGUEL", "UGARTE", 24, global.c_whiteskin, "URUGUAY", teamcode, "MIDFIELDER", 25, 2, 3, 2, 1, 1, 1, 3, 1, 1, reputation);
db_player_push("JASON", "ZIRKZEE", 23, global.c_darkskin, "NETHERLANDS", teamcode, "FORWARD", 11, 2, 1, 3, 2, 1, 1, 1, 3, 2, reputation);
db_player_push("SAMUEL", "LAMMENS", 23, global.c_whiteskin, "BELGIUM", teamcode, "GOALKEEPER", 31, 1, 3, 2, 1, 3, 1, 1, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("BLUE LONDON F.C.", "B.L.F.C.", c_blue, c_blue, c_white, "shorts", 1, "l02", 100000000, reputation);
db_coach_push("ENRICO", "MARESCA", 45, global.c_whiteskin, "ITALY",teamcode, reputation, "balanced");
db_player_push("RAFAEL", "SANCHEZ", 27, global.c_lightskin, "SPAIN", teamcode, "GOALKEEPER", 1, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("LEON", "COLWILL", 21, global.c_lightskin, "ENGLAND", teamcode, "DEFENDER", 6, 1, 3, 2, 2, 1, 3, 1, 1, 3, reputation);
db_player_push("MAURO", "GUSTO", 22, global.c_lightskin, "FRANCE", teamcode, "DEFENDER", 27, 3, 2, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("CORY", "PALMER", 23, global.c_whiteskin, "ENGLAND", teamcode, "MIDFIELDER", 10, 3, 1, 3, 3, 1, 1, 3, 2, 2, reputation);
db_player_push("EMILIO", "FERNANDEZ", 24, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 8, 2, 2, 3, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("MATEO", "CAICEDO", 23, global.c_darkskin, "ECUADOR", teamcode, "MIDFIELDER", 25, 3, 3, 3, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("LEON", "DELAP", 22, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 2, reputation);
db_player_push("ESTEBAN", "GONCALVES", 18, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 41, 3, 1, 2, 3, 1, 1, 2, 3, 2, reputation);
db_player_push("PAULO", "NETO", 25, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 7, 3, 2, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("JULIANO", "PEDRO", 23, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 20, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("GUSTAVO", "QUENDA", 18, global.c_darkskin, "PORTUGAL", teamcode, "MIDFIELDER", 7, 3, 2, 2, 3, 1, 2, 3, 2, 4, reputation);
db_player_push("FREI", "JORGENSEN", 23, global.c_whiteskin, "DENMARK", teamcode, "GOALKEEPER", 12, 1, 3, 2, 1, 3, 1, 1, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("LONDON WHITE F.C.", "L.W.F.C.", c_white, c_navy, c_silver, "shorts", 1, "l02", 60000000, reputation);
db_coach_push("TIM", "FRANK", 51, global.c_whiteskin, "DENMARK",teamcode, reputation, "balanced");
db_player_push("GIACOMO", "VICARIO", 28, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 1, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("CARLOS", "ROMERO", 27, global.c_whiteskin, "ARGENTINA", teamcode, "DEFENDER", 17, 2, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MARTIN", "VAN DE VEN", 24, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 37, 2, 3, 3, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("PABLO", "PORRO", 25, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 23, 3, 2, 3, 3, 1, 3, 2, 1, 0, reputation);
db_player_push("XANDER", "SIMONS", 22, global.c_lightskin, "NETHERLANDS", teamcode, "MIDFIELDER", 7, 3, 2, 2, 3, 1, 1, 3, 2, 2, reputation);
db_player_push("DAVID", "KULUSEVSKI", 25, global.c_whiteskin, "SWEDEN", teamcode, "MIDFIELDER", 21, 3, 1, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("RAFAEL", "DE ANDRADE", 28, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 9, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("DEREK", "SOLANKE", 28, global.c_lightskin, "ENGLAND", teamcode, "FORWARD", 19, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("MOISE", "KUDUS", 25, global.c_darkskin, "GHANA", teamcode, "FORWARD", 20, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("JONATHAN", "MADDISON", 28, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("ARTUR", "KINSKY", 22, global.c_whiteskin, "CZECHIA", teamcode, "GOALKEEPER", 31, 1, 3, 2, 1, 3, 1, 1, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("TYNE PARK F.C.", "T.P.F.C.", c_white, c_black, c_green, "stripes", 0, "l12", 100000000, reputation);
reputation = 5;
db_coach_push("EWAN", "HOWE", 47, global.c_whiteskin, "ENGLAND", teamcode, reputation, "defensive");
db_player_push("NATHAN", "POPE", 33, global.c_whiteskin, "ENGLAND", teamcode, "GOALKEEPER", 1, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("SIMON", "BOTMAN", 25, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 4, 1, 3, 3, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("DOMINIC", "BURN", 33, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 33, 1, 3, 3, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("THEO", "LIVRAMENTO", 22, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 21, 3, 2, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("KAI", "TRIPPIER", 34, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 2, 2, 2, 2, 3, 1, 3, 2, 1, 0, reputation);
db_player_push("BERTO", "GUIMARAES", 27, global.c_lightskin, "BRAZIL", teamcode, "MIDFIELDER", 39, 2, 3, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("STEFANO", "TONALI", 25, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 8, 2, 3, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("ALFIE", "GORDON", 24, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("ANDREAS", "ELANGA", 23, global.c_darkskin, "SWEDEN", teamcode, "FORWARD", 20, 3, 1, 3, 2, 1, 1, 2, 3, 1, reputation);
db_player_push("ARTHUR", "RAMSDALE", 27, global.c_whiteskin, "ENGLAND", teamcode, "GOALKEEPER", 32, 2, 3, 1, 2, 3, 1, 1, 1, 0, reputation);
reputation = 4;
db_player_push("NIKLAS", "WOLTEMADE", 23, global.c_whiteskin, "GERMANY", teamcode, "FORWARD", 27, 2, 1, 2, 3, 1, 1, 1, 3, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("CLARET ASTON F.C.", "C.A.F.C.", c_maroon, c_aqua, c_white, "sleeves and shorts", 0, "l12", 40000000, reputation);
reputation = 5;
db_coach_push("UGO", "EMERY", 53, global.c_whiteskin, "SPAIN", teamcode, reputation, "defensive");
db_player_push("EMANUEL", "MARTINEZ", 33, global.c_whiteskin, "ARGENTINA", teamcode, "GOALKEEPER", 23, 3, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("PEDRO", "TORRES", 28, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 14, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("VINCENT", "LINDELOF", 31, global.c_whiteskin, "SWEDEN", teamcode, "DEFENDER", 3, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MICHAEL", "CASH", 28, global.c_whiteskin, "POLAND", teamcode, "DEFENDER", 2, 3, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("YANNICK", "TIELEMANS", 28, global.c_darkskin, "BELGIUM", teamcode, "MIDFIELDER", 8, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("BASTIEN", "KAMARA", 25, global.c_darkskin, "FRANCE", teamcode, "MIDFIELDER", 44, 2, 3, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("EMRE", "BUENDIA", 28, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 10, 3, 1, 3, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("OLIVIER", "WATKINS", 29, global.c_darkskin, "ENGLAND", teamcode, "FORWARD", 11, 3, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("DOMINIC", "MALEN", 26, global.c_lightskin, "NETHERLANDS", teamcode, "FORWARD", 17, 3, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
reputation = 4;
db_player_push("MARK", "BIZOT", 34, global.c_whiteskin, "NETHERLANDS", teamcode, "GOALKEEPER", 40, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("ETHAN", "KONSA", 27, global.c_lightskin, "ENGLAND", teamcode, "DEFENDER", 4, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("BLUE SUBMARINE F.C.", "B.S.F.C.", c_blue, c_white, c_black, "shorts", 0, "l12", 40000000, reputation);
db_coach_push("DEAN", "MOYES", 62, global.c_whiteskin, "ENGLAND",teamcode, reputation, "defensive");
db_player_push("JAMES", "PICKFORD", 31, global.c_whiteskin, "ENGLAND", teamcode, "GOALKEEPER", 1, 3, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("JASPER", "BRANTHWAITE", 23, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 32, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("VLAD", "MYKOLENKO", 26, global.c_whiteskin, "UKRAINE", teamcode, "DEFENDER", 16, 2, 2, 2, 3, 1, 3, 2, 1, 1, reputation);
db_player_push("JIM", "TARKOWSKI", 32, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 6, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("NIGEL", "PATTERSON", 23, global.c_whiteskin, "SCOTLAND", teamcode, "DEFENDER", 2, 2, 2, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("SEAN", "COLEMAN", 36, global.c_whiteskin, "IRELAND", teamcode, "DEFENDER", 23, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JOSH", "GREALISH", 30, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 18, 3, 1, 3, 3, 1, 1, 3, 3, 0, reputation);
reputation = 4;
db_player_push("TYSON", "DIBLING", 19, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 20, 3, 1, 2, 3, 1, 1, 2, 3, 1, reputation);
db_player_push("BRUNO", "GOMES", 27, global.c_darkskin, "GUINE BISSAU", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("CLARET LONDON F.C.", "C.L.F.C.", c_maroon, c_aqua, c_white, "sleeves and shorts", 0, "l12", 40000000, reputation);
reputation = 5;
db_coach_push("NELSON", "ESPIRITO-SANTO", 51, global.c_lightskin, "PORTUGAL",teamcode, reputation, "defensive");
db_player_push("ALBERT", "AREOLA", 32, global.c_darkskin, "FRANCE", teamcode, "GOALKEEPER", 23, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("AUBREY", "WAN-BISSAKA", 27, global.c_darkskin, "CONGO", teamcode, "DEFENDER", 29, 3, 3, 3, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("MAXWELL", "KILMAN", 28, global.c_whiteskin, "ENGLAND", teamcode, "DEFENDER", 3, 1, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("JULES", "TODIBO", 25, global.c_lightskin, "FRANCE", teamcode, "DEFENDER", 25, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("LEONARDO", "PAQUETA", 28, global.c_lightskin, "BRAZIL", teamcode, "MIDFIELDER", 10, 2, 2, 2, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("TIEM", "SOUCEK", 30, global.c_whiteskin, "CZECHIA", teamcode, "MIDFIELDER", 28, 2, 3, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("JAYDEN", "BOWEN", 28, global.c_whiteskin, "ENGLAND", teamcode, "FORWARD", 20, 3, 1, 3, 3, 1, 1, 3, 3, 0, reputation);
reputation = 4;
db_player_push("MAURICIO", "FERNANDES", 21, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 18, 2, 2, 2, 2, 1, 1, 3, 1, 2, reputation);
db_player_push("CRISTIANO", "SUMMERVILLE", 23, global.c_darkskin, "NETHERLANDS", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 1, 3, 1, reputation);
db_player_push("MAGNUS", "HERMANSEN", 25, global.c_whiteskin, "DENMARK", teamcode, "GOALKEEPER", 1, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("F.C. MILANO BLUE", "F.C.M.B.", c_blue, c_black, c_white, "stripes", 1, "l04", 50000000, reputation);
db_coach_push("CONSTANTIN", "CHIVU", 44, global.c_whiteskin, "ROMENIA",teamcode, reputation, "balanced");
db_player_push("YVES", "SOMMER", 31, global.c_whiteskin, "SWITZERLAND", teamcode, "GOALKEEPER", 1, 3, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("ANTONIO", "BASTONI", 28, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 95, 1, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("SVEN", "DE VRIJ", 33, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 6, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("DIRK", "DUMFRIES", 29, global.c_darkskin, "NETHERLANDS", teamcode, "DEFENDER", 3, 2, 3, 2, 2, 1, 3, 2, 1, 0, reputation);
db_player_push("FRANCESCO", "DIMARCO", 29, global.c_darkskin, "ITALY", teamcode, "DEFENDER", 32, 2, 3, 3, 2, 1, 3, 2, 1, 0, reputation);
db_player_push("NERIO", "BARELLA", 25, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 23, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("HARUN", "CALHANOGLU", 31, global.c_whiteskin, "TURKEY", teamcode, "MIDFIELDER", 20, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("LUIS", "MARTINEZ", 27, global.c_lightskin, "ARGENTINA", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("MATHIEU", "THURAM", 28, global.c_darkskin, "FRANCE", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("JUAN", "MARTINEZ", 27, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 13, 1, 3, 3, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("A.C. MILANO RED", "A.C.M.R.", c_red, c_black, c_white, "stripes", 1, "l04", 50000000, reputation);
db_coach_push("MAURIZIO", "ALLEGRI", 58, global.c_whiteskin, "ITALY",teamcode, reputation, "defensive");
db_player_push("MAXIME", "MAIGNAN", 30, global.c_darkskin, "FRANCE", teamcode, "GOALKEEPER", 16, 2, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("FRANK", "TOMORI", 27, global.c_darkskin, "ENGLAND", teamcode, "DEFENDER", 23, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("LOVRO", "MODRIC", 40, global.c_whiteskin, "CROATIA", teamcode, "MIDFIELDER", 14, 2, 3, 1, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("PABLO", "ESTUPINAN", 29, global.c_darkskin, "ECUADOR", teamcode, "DEFENDER", 2, 2, 2, 2, 2, 1, 3, 2, 1, 0, reputation);
db_player_push("ALBERT", "RABIOT", 30, global.c_whiteskin, "FRANCE", teamcode, "MIDFIELDER", 12, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("ADRIAN", "JASHARI", 23, global.c_whiteskin, "SWITZERLAND", teamcode, "MIDFIELDER", 30, 2, 3, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("RICARDO", "LEAO", 26, global.c_darkskin, "PORTUGAL", teamcode, "FORWARD", 10, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("CORENTIN", "NKUNKU", 27, global.c_darkskin, "FRANCE", teamcode, "FORWARD", 18, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("CHRISTOPHER", "PULISIC", 26, global.c_whiteskin, "USA", teamcode, "FORWARD", 11, 3, 1, 2, 3, 1, 1, 2, 3, 0, reputation);
reputation = 4;
db_player_push("FEDERICO", "CAMARDA", 17, global.c_whiteskin, "ITALY", teamcode, "FORWARD", 22, 2, 1, 2, 2, 1, 1, 1, 3, 3, reputation);
db_player_push("PAOLO", "TERRACCIANO", 35, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 1, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("S.S.C. CAMPANIA", "S.S.C.C.", c_aqua, c_white, c_black, "shorts", 1, "l04", 50000000, reputation);
db_coach_push("ANGELO", "CONTE", 56, global.c_whiteskin, "ITALY",teamcode, reputation, "defensive");
db_player_push("ALESSIO", "MERET", 28, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 1, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("ANGELO", "BUONGIORNO", 26, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 4, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("SEAN", "BEUKEMA", 26, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 31, 1, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("LORENZO", "SPINAZZOLA", 32, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 37, 2, 2, 2, 2, 1, 3, 2, 1, 0, reputation);
db_player_push("FREDDIE", "ANGUISSA", 29, global.c_darkskin, "CAMEROON", teamcode, "MIDFIELDER", 99, 2, 2, 3, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("STUART", "MCTOMINAY", 28, global.c_whiteskin, "SCOTLAND", teamcode, "MIDFIELDER", 8, 3, 3, 3, 2, 1, 2, 3, 2, 0, reputation);
db_player_push("KARL", "DE BRUYNE", 34, global.c_whiteskin, "BELGIUM", teamcode, "MIDFIELDER", 11, 2, 2, 2, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("RAGNUS", "HOJLUND", 21, global.c_whiteskin, "DENMARK", teamcode, "FORWARD", 19, 3, 1, 3, 1, 1, 1, 1, 3, 3, reputation);
db_player_push("RUBEN", "LUKAKU", 32, global.c_darkskin, "BELGIUM", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("DIEGO", "NERES", 28, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("VLADAN", "MILINKOVIC-SAVIC", 28, global.c_whiteskin, "SERBIA", teamcode, "GOALKEEPER", 1, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 5;
db_team_push("TURIN ZEBRA F.C.", "T.Z.F.C.", c_white, c_black, c_navy, "stripes", 0, "l04", 50000000, reputation);
db_coach_push("IVAN", "TUDOR", 47, global.c_whiteskin, "CROATIA", teamcode, reputation, "balanced");
db_player_push("MARIO", "DI GREGORIO", 28, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 16, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("GIOVANNI", "BREMER", 28, global.c_lightskin, "BRAZIL", teamcode, "DEFENDER", 3, 2, 3, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("PAUL", "KALULU", 25, global.c_lightskin, "FRANCE", teamcode, "DEFENDER", 15, 2, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MATTEO", "LOCATELLI", 27, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 5, 2, 2, 2, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("KILLIAN", "THURAM", 24, global.c_darkskin, "FRANCE", teamcode, "MIDFIELDER", 19, 2, 2, 3, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("VLADAN", "VLAHOVIC", 25, global.c_whiteskin, "SERBIA", teamcode, "FORWARD", 9, 3, 1, 3, 3, 1, 1, 1, 3, 1, reputation);
db_player_push("KEREM", "YILDIZ", 20, global.c_whiteskin, "TURKEY", teamcode, "FORWARD", 10, 3, 1, 2, 3, 1, 1, 2, 3, 3, reputation);
db_player_push("JUSTIN", "DAVID", 25, global.c_darkskin, "CANADA", teamcode, "FORWARD", 30, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
reputation = 4;
db_player_push("MARCELLO", "PERIN", 32, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 1, 1, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("JORGE", "MARIO", 25, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 25, 2, 2, 2, 2, 1, 3, 3, 1, 0, reputation);
db_player_push("FELIPE", "CONCEICAO", 22, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 2, 3, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("ROMA BLUE F.C.", "R.M.F.C.", c_aqua, c_white, c_black, "shorts", 0, "l04", 40000000, reputation);
db_coach_push("MATTEO", "SARRI", 66, global.c_whiteskin, "ITALY", teamcode, reputation, "balanced");
db_player_push("IGNAZIO", "PROVEDEL", 31, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 94, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("ALBERTO", "ROMAGNOLI", 30, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 13, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("NADIALE", "ROVELLA", 23, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 6, 2, 3, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("MAXIME", "GUENDOUZI", 26, global.c_whiteskin, "FRANCE", teamcode, "MIDFIELDER", 8, 2, 3, 3, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("NICOLAU", "TAVARES", 25, global.c_darkskin, "PORTUGAL", teamcode, "DEFENDER", 17, 3, 1, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("PABLO", "RODRIGUEZ", 38, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 9, 3, 1, 1, 3, 1, 1, 2, 3, 0, reputation);
db_player_push("TOMAS", "CASTELLANOS", 26, global.c_whiteskin, "ARGENTINA", teamcode, "FORWARD", 11, 3, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("CHRISTIAN", "MANDAS", 24, global.c_whiteskin, "GREECE", teamcode, "GOALKEEPER", 35, 1, 2, 2, 1, 3, 1, 1, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("A.S. CARMINE", "A.S.C.", c_maroon, c_maroon, c_white, "shorts", 0, "l04", 40000000, reputation);
db_coach_push("GIACOMO", "GASPERINI", 67, global.c_whiteskin, "ITALY", teamcode, reputation, "balanced");
db_player_push("MARKO", "SVILAR", 26, global.c_whiteskin, "SERBIA", teamcode, "GOALKEEPER", 99, 1, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("WILLIAN", "LIMA", 22, global.c_lightskin, "BRAZIL", teamcode, "DEFENDER", 43, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("SIMONE", "EL SHAARAWY", 32, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 92, 3, 1, 2, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("MATHIS", "KONE", 24, global.c_darkskin, "FRANCE", teamcode, "MIDFIELDER", 17, 2, 2, 3, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("LUIGI", "PELLEGRINI", 29, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 7, 3, 1, 2, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("ELIE", "N'DICKA", 26, global.c_darkskin, "IVORY COAST", teamcode, "DEFENDER", 5, 2, 3, 2, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("PIETRO", "DYBALA", 31, global.c_whiteskin, "ARGENTINA", teamcode, "FORWARD", 21, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("ANDRIY", "DOVBYK", 28, global.c_whiteskin, "UKRAINE", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("LEONEL", "BAILEY", 28, global.c_darkskin, "JAMAICA", teamcode, "FORWARD", 31, 3, 1, 3, 3, 1, 1, 2, 3, 0, reputation)

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("A.C.F. VIOLA", "A.C.F.V.", c_purple, c_purple, c_white, "shorts", 0, "l14", 30000000, reputation);
db_coach_push("SIMONE", "PIOLI", 59, global.c_whiteskin, "ITALY", teamcode, reputation, "balanced");
reputation = 5;
db_player_push("DIEGO", "DE GEA", 34, global.c_whiteskin, "SPAIN", teamcode, "GOALKEEPER", 43, 2, 3, 3, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("EDVARD", "DZEKO", 39, global.c_whiteskin, "BOSNIA", teamcode, "FORWARD", 9, 2, 1, 1, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("MARIO", "KEAN", 25, global.c_darkskin, "ITALY", teamcode, "FORWARD", 20, 3, 1, 3, 2, 1, 1, 1, 3, 1, reputation);
reputation = 4;
db_player_push("DIEGO", "DOS SANTOS", 26, global.c_lightskin, "BRAZIL", teamcode, "DEFENDER", 2, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("RUPERT", "GOSENS", 31, global.c_whiteskin, "GERMANY", teamcode, "DEFENDER", 21, 2, 2, 3, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("PAOLO", "COMUZZO", 20, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 15, 2, 3, 1, 1, 1, 3, 1, 1, 3, reputation);
db_player_push("NADIALE", "FAGIOLI", 24, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 44, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("CESARE", "NDOUR", 21, global.c_lightskin, "ITALY", teamcode, "MIDFIELDER", 27, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("TORO F.C.", "T.F.C.", c_maroon, c_maroon, c_white, "shorts", 0, "l14", 20000000, reputation);
db_coach_push("MARIO", "BARONI", 62, global.c_whiteskin, "ITALY", teamcode, reputation, "balanced");
db_player_push("FELIPE", "ISRAEL", 25, global.c_whiteskin, "URUGUAY", teamcode, "GOALKEEPER", 81, 1, 3, 3, 1, 3, 1, 1, 1, 1, reputation);
db_player_push("SALVADOR", "COCO", 26, global.c_lightskin, "EQUATORIAL GUINEA", teamcode, "DEFENDER", 23, 2, 3, 2, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("PIM", "SCHUURS", 25, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 3, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("DARIO", "ZAPATA", 34, global.c_darkskin, "COLOMBIA", teamcode, "FORWARD", 91, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("CALLUM", "ADAMS", 29, global.c_lightskin, "SCOTLAND", teamcode, "FORWARD", 19, 3, 1, 3, 2, 1, 1, 2, 3, 0, reputation);
db_player_push("CLAUDIO", "CASADEI", 22, global.c_whiteskin, "ITALY", teamcode, "MIDFIELDER", 22, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("ISTVAN", "ILIC", 24, global.c_whiteskin, "SERBIA", teamcode, "MIDFIELDER", 8, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("MARIAN", "POPA", 24, global.c_whiteskin, "ROMANIA", teamcode, "GOALKEEPER", 71, 1, 2, 2, 1, 3, 1, 1, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("LOMBARDIA B.C.", "L.B.C.", c_blue, c_black, c_white, "stripes", 1, "l14", 30000000, reputation);
db_coach_push("IGOR", "JURIC", 50, global.c_whiteskin, "CROATIA",teamcode, reputation, "balanced");
db_player_push("MATTIA", "CARNESECCHI", 25, global.c_whiteskin, "ITALY", teamcode, "GOALKEEPER", 29, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("GIANNI", "SCALVINI", 21, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 42, 2, 3, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("ISMAEL", "HIEN", 26, global.c_darkskin, "SWEDEN", teamcode, "DEFENDER", 4, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("SANDRO", "KOLASINAC", 32, global.c_whiteskin, "BIH", teamcode, "DEFENDER", 23, 2, 2, 2, 3, 1, 3, 2, 1, 0, reputation);
db_player_push("MATEO", "PASALIC", 30, global.c_whiteskin, "CROATIA", teamcode, "MIDFIELDER", 8, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("YAHYA", "MUSAH", 22, global.c_darkskin, "USA", teamcode, "MIDFIELDER", 6, 2, 2, 3, 2, 1, 2, 3, 2, 0, reputation);
db_player_push("CHRIS", "DE KETELAERE", 24, global.c_whiteskin, "BELGIUM", teamcode, "MIDFIELDER", 17, 2, 2, 2, 3, 1, 1, 3, 3, 1, reputation);
db_player_push("AMINU", "LOOKMAN", 27, global.c_darkskin, "NIGERIA", teamcode, "FORWARD", 7, 3, 1, 3, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("GIACOMO", "SCAMACCA", 26, global.c_whiteskin, "ITALY", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("EMILIA CALCIO", "E.C.", c_yellow, c_blue, c_white, "bars and shorts", 0, "l14", 10000000, reputation);
db_coach_push("CESAR", "CUESTA", 30, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
db_player_push("ZENZO", "SUZUKI", 23, global.c_darkskin, "JAPAN", teamcode, "GOALKEEPER", 31, 1, 3, 2, 2, 3, 1, 1, 1, 1, reputation);
db_player_push("ALFREDO", "CIRCATI", 21, global.c_whiteskin, "AUSTRALIA", teamcode, "DEFENDER", 39, 1, 3, 2, 1, 1, 3, 1, 1, 1, reputation);
db_player_push("EMILIO", "DELPRATO", 25, global.c_whiteskin, "ITALY", teamcode, "DEFENDER", 15, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("MARTIN", "KEITA", 23, global.c_darkskin, "BELGIUM", teamcode, "MIDFIELDER", 16, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("ALVARO", "BERNABE", 24, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 10, 2, 2, 2, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("PAOLO", "CUTRONE", 27, global.c_whiteskin, "ITALY", teamcode, "FORWARD", 32, 2, 1, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("MARCO", "PELLEGRINO", 23, global.c_whiteskin, "ITALY", teamcode, "FORWARD", 9, 2, 1, 3, 2, 1, 1, 1, 3, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("LIONS C.P.", "L.C.P.", c_white, c_green, c_black, "bars and shorts", 0, "l06", 20000000, reputation);
db_coach_push("ROGERIO", "BORGES", 44, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "balanced");
db_player_push("RODRIGO", "SILVA", 31, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 1, 1, 3, 3, 2, 3, 1, 1, 1, 0, reputation);
db_player_push("OMAR", "DIOMANDE", 21, global.c_darkskin, "IVORY COAST", teamcode, "DEFENDER", 26, 3, 2, 2, 2, 1, 3, 1, 1, 3, reputation);
db_player_push("GUSTAVO", "INACIO", 23, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 25, 2, 2, 2, 2, 1, 3, 1, 1, 3, reputation);
db_player_push("EUGENIO", "QUARESMA", 23, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 72, 2, 2, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("ZACHARIE", "DEBAST", 21, global.c_whiteskin, "BELGIUM", teamcode, "DEFENDER", 6, 2, 2, 2, 3, 1, 3, 3, 1, 1, reputation);
db_player_push("MADS", "HJULMAND", 26, global.c_whiteskin, "DENMARK", teamcode, "MIDFIELDER", 42, 2, 3, 3, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("GRIGIO", "KOCHORASHVILI", 26, global.c_whiteskin, "GEORGIA", teamcode, "MIDFIELDER", 14, 2, 2, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("FERNANDO", "TRINCAO", 25, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 17, 3, 1, 2, 3, 1, 1, 2, 3, 1, reputation);
db_player_push("PAULO", "GONCALVES", 27, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 8, 2, 2, 3, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("LIMA", "SUAREZ", 27, global.c_lightskin, "COLOMBIA", teamcode, "FORWARD", 97, 2, 1, 3, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("JOSE", "VIRGINIA", 25, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 12, 1, 2, 2, 1, 3, 1, 1, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("S.L. EAGLES", "S.L.E.", c_red, c_white, c_black, "shorts", 1, "l06", 20000000, reputation);
reputation = 5;
db_coach_push("JORGE", "MOURINHO", 62, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "defensive");
reputation = 4;
db_player_push("ANTON", "TRUBIN", 24, global.c_whiteskin, "UKRAINE", teamcode, "GOALKEEPER", 1, 2, 3, 3, 1, 3, 1, 1, 1, 1, reputation);
db_player_push("NESTOR", "OTAMENDI", 37, global.c_whiteskin, "ARGENTINA", teamcode, "DEFENDER", 30, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("ALBERTO", "SILVA", 21, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 4, 1, 3, 2, 1, 1, 3, 1, 1, 3, reputation);
db_player_push("TIAGO", "ARAUJO", 23, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 44, 2, 3, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("RODOLFO", "RIOS", 25, global.c_lightskin, "COLOMBIA", teamcode, "MIDFIELDER", 20, 2, 1, 2, 3, 1, 1, 3, 1, 2, reputation);
db_player_push("EMILIO", "BARRENECHEA", 24, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 5, 2, 2, 2, 2, 1, 1, 3, 1, 2, reputation);
db_player_push("DINO", "LUKEBAKIO", 27, global.c_darkskin, "BELGIUM", teamcode, "FORWARD", 7, 3, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("VANIS", "PAVLIDIS", 26, global.c_lightskin, "GREECE", teamcode, "FORWARD", 14, 2, 2, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("FINN", "AURSNES", 29, global.c_whiteskin, "NORWAY", teamcode, "MIDFIELDER", 8, 2, 3, 3, 2, 1, 3, 3, 2, 0, reputation);
db_player_push("SIMAO", "SOARES", 23, global.c_darkskin, "PORTUGAL", teamcode, "GOALKEEPER", 24, 1, 2, 2, 2, 3, 1, 1, 1, 1, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("F.C. DRAGONS", "F.C.D.", c_white, c_blue, c_orange, "stripes", 1, "l06", 20000000, reputation);
db_coach_push("FILIPPO", "FARIOLI", 36, global.c_whiteskin, "ITALY",teamcode, reputation, "attacking");
db_player_push("DIEGO", "COSTA", 24, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 99, 3, 3, 3, 3, 3, 1, 1, 1, 0, reputation);
db_player_push("NICOLAS", "PEREZ", 26, global.c_whiteskin, "ARGENTINA", teamcode, "DEFENDER", 24, 2, 2, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("RUI", "MORA", 17, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 86, 2, 1, 1, 3, 1, 1, 3, 3, 4, reputation);
db_player_push("VIDAR", "FROHOLDT", 19, global.c_whiteskin, "DENMARK", teamcode, "MIDFIELDER", 8, 2, 2, 2, 2, 1, 1, 3, 1, 3, reputation);
db_player_push("ALMA", "VARELA", 24, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 22, 2, 3, 2, 1, 1, 1, 3, 1, 2, reputation);
db_player_push("SAUL", "AGHEHOWA", 21, global.c_darkskin, "SPAIN", teamcode, "FORWARD", 9, 3, 1, 3, 2, 1, 1, 1, 3, 1, reputation);
db_player_push("LOUIS", "DE JONG", 35, global.c_whiteskin, "NETHERLANDS", teamcode, "FORWARD", 26, 1, 2, 3, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("JACEK", "BEDNAREK", 29, global.c_whiteskin, "POLAND", teamcode, "DEFENDER", 5, 1, 3, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("BENITO", "SAINZ", 24, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 17, 3, 1, 2, 3, 1, 1, 2, 3, 1, reputation);
db_player_push("ESTEVAO", "PEPE", 28, global.c_whiteskin, "BRAZIL", teamcode, "MIDFIELDER", 11, 3, 2, 2, 3, 1, 2, 3, 3, 1, reputation);
db_player_push("MATEUS", "FERNANDES", 19, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 52, 2, 2, 2, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("CARLOS", "RAMOS", 33, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 14, 1, 3, 2, 2, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 3;
db_team_push("S.C. WARRIORS", "S.C.W.", c_red, c_white, c_black, "sleeves", 0, "l06", 12500000, reputation);
db_coach_push("CLAUDIO", "VICENS", 42, global.c_whiteskin, "SPAIN",teamcode, reputation, "balanced");
db_player_push("LIBOR", "HORNICEK", 23, global.c_whiteskin, "CZECHIA", teamcode, "GOALKEEPER", 1, 1, 2, 2, 2, 3, 1, 1, 1, 2, reputation);
db_player_push("SEYDOU", "NIAKATE", 26, global.c_darkskin, "FRANCE", teamcode, "DEFENDER", 4, 1, 3, 2, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("RICARDO", "ZALAZAR", 26, global.c_whiteskin, "URUGUAY", teamcode, "MIDFIELDER", 10, 2, 2, 2, 3, 1, 1, 3, 2, 0, reputation);
db_player_push("ROGERIO", "HORTA", 30, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 21, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("FERNANDO", "NAVARRO", 27, global.c_whiteskin, "SPAIN", teamcode, "FORWARD", 39, 2, 1, 2, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("SAMI", "BANZA", 29, global.c_lightskin, "CONGO", teamcode, "FORWARD", 23, 2, 1, 2, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("JOSE", "MOUTINHO", 38, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 8, 2, 2, 1, 3, 1, 1, 3, 1, 0, reputation);
db_player_push("LOURENCO", "LELO", 25, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 5, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("VICENTE", "GOMEZ", 25, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 2, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("TOME", "SA", 30, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 12, 1, 2, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 3;
db_team_push("VICTORY S.C.", "V.S.C.", c_white, c_white, c_black, "shorts", 0, "l06", 5000000, reputation);
db_coach_push("LEONARDO", "PINTO", 36, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "balanced");
db_player_push("CLAUDIO", "DA SILVA", 31, global.c_lightskin, "BRAZIL", teamcode, "GOALKEEPER", 27, 1, 2, 2, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("NUNO", "OLIVEIRA", 34, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 7, 1, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("JORGE", "MENDES", 25, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 13, 2, 2, 2, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("MANUEL", "MAGA", 22, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 2, 2, 2, 1, 2, 1, 3, 1, 1, 2, reputation);
db_player_push("TOMAS", "ARCANJO", 24, global.c_darkskin, "CAPE VERDE", teamcode, "FORWARD", 18, 3, 1, 2, 2, 1, 1, 1, 3, 0, reputation);
db_player_push("JOSE", "CASTILLO", 22, global.c_lightskin, "COLOMBIA", teamcode, "GOALKEEPER", 25, 1, 2, 2, 1, 3, 1, 1, 1, 2, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 2;
db_team_push("F.C. NEW VILLA", "F.C.N.V.", c_white, c_white, c_navy, "shorts", 0, "l06", 4000000, reputation);
db_coach_push("HELIO", "OLIVEIRA", 46, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "balanced");
db_player_push("LIZAK", "CAREVIC", 26, global.c_whiteskin, "MONTENEGRO", teamcode, "GOALKEEPER", 25, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);
db_player_push("RICARDO", "PINHEIRO", 23, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 17, 2, 2, 1, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("JULIAN", "DE HAAS", 25, global.c_whiteskin, "NETHERLANDS", teamcode, "DEFENDER", 16, 2, 2, 1, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("GONCALO", "SA", 20, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 20, 2, 1, 2, 3, 1, 1, 3, 3, 2, reputation);
db_player_push("GUILHERME", "DIAS", 28, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 23, 3, 1, 2, 2, 1, 1, 2, 3, 0, reputation);
db_player_push("MAURO", "SORRISO", 24, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 7, 2, 1, 1, 3, 1, 1, 1, 3, 1, reputation);
db_player_push("ILUN", "ZLOBIN", 28, global.c_whiteskin, "RUSSIA", teamcode, "GOALKEEPER", 1, 1, 3, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 2;
db_team_push("NORTHERN WOLF F.C.", "N.W.F.C.", c_yellow, c_blue, c_navy, "shorts", 1, "l16", 2000000, reputation);
db_coach_push("VITOR", "SEABRA", 42, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "balanced");
reputation = 3;
db_player_push("NIELSEN", "MANTL", 25, global.c_whiteskin, "GERMANY", teamcode, "GOALKEEPER", 58, 1, 3, 2, 1, 3, 1, 1, 1, 1, reputation);
reputation = 2;
db_player_push("JUAN", "FONTAN", 25, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 3, 1, 2, 1, 2, 1, 3, 1, 1, 1, reputation);
db_player_push("TELMO", "ESGAIO", 30, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 28, 2, 2, 1, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("DIOGO", "SIMAO", 35, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 8, 2, 2, 1, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("PATRICIO", "SANTOS", 24, global.c_whiteskin, "PORTUGAL", teamcode, "MIDFIELDER", 89, 2, 1, 1, 2, 1, 1, 3, 1, 1, reputation);
db_player_push("JULIO", "VALIDO", 25, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 1, 1, 2, 2, 1, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 2;
db_team_push("PANTHERS F.C.", "P.F.C.", c_white, c_black, make_color_rgb(255,99,25), "checkers", 0, "l16", 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 2;
db_team_push("C.D. AZORES RED", "C.D.A.R.", c_red, c_white, c_black, "shorts", 0, "l16", 2000000, reputation);
db_coach_push("VICTOR", "MATOS", 44, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "defensive");
db_player_push("GUSTAVO", "BATISTA", 27, global.c_darkskin, "BRAZIL", teamcode, "GOALKEEPER", 1, 1, 3, 2, 1, 3, 1, 1, 1, 1, reputation);
db_player_push("SILVIO", "LIMA", 28, global.c_lightskin, "BRAZIL", teamcode, "DEFENDER", 23, 2, 2, 2, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("MATIAS", "FAGUNDES", 24, global.c_lightskin, "BRAZIL", teamcode, "DEFENDER", 32, 2, 1, 2, 2, 1, 3, 1, 1, 0, reputation);
db_player_push("ALBERTO", "FIRMINO", 25, global.c_lightskin, "BRAZIL", teamcode, "MIDFIELDER", 6, 2, 2, 2, 1, 1, 1, 3, 1, 0, reputation);
db_player_push("GUILHERME", "SILVA", 23, global.c_lightskin, "BRAZIL", teamcode, "MIDFIELDER", 10, 2, 1, 2, 2, 1, 1, 3, 3, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 2;
db_team_push("C.S. MADEIRA", "C.S.M.", c_red, c_green, c_white, "stripes and shorts", 1, "l16", 1000000, reputation);
db_coach_push("VALDO", "MATOS", 37, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "attacking");
db_player_push("GUILHERME", "TABUACO", 24, global.c_whiteskin, "PORTUGAL", teamcode, "GOALKEEPER", 1, 1, 2, 2, 1, 3, 1, 1, 1, 1, reputation);
db_player_push("ROMAIN", "CORREIA", 26, global.c_whiteskin, "PORTUGAL", teamcode, "DEFENDER", 44, 1, 2, 2, 1, 1, 3, 1, 1, 0, reputation);
db_player_push("VLAKO", "DANILOVIC", 26, global.c_whiteskin, "BIH", teamcode, "MIDFIELDER", 6, 1, 2, 2, 1, 1, 1, 3, 1, 0, reputation);
db_player_push("MIGUEL", "TEJON", 21, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 10, 1, 1, 1, 3, 1, 1, 3, 2, 1, reputation);
db_player_push("ADRIAN", "ELLIS", 29, global.c_darkskin, "HONDURAS", teamcode, "FORWARD", 9, 2, 1, 2, 1, 1, 1, 1, 3, 0, reputation);
db_player_push("MANUEL", "TAVARES", 21, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 79, 1, 1, 1, 2, 1, 1, 1, 3, 2, reputation);

/*
TURKEY
db_player_push("EMILSON", "MORAES", 32, global.c_whiteskin, "BRAZIL", teamcode, "GOALKEEPER", 31, 2, 3, 2, 3, 3, 1, 1, 1, 0, reputation);
db_player_push("ANTONIO", "ONANA", 28, global.c_darkskin, "CAMEROON", teamcode, "GOALKEEPER", 24, 2, 2, 2, 3, 3, 1, 1, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 3;
db_team_push("AL-NASSR F.C.", "A.F.C", c_yellow, c_blue, c_black, "sleeves", 1, "l99", 200000000, reputation);
db_coach_push("JORGE", "JESUS", 71, global.c_whiteskin, "PORTUGAL",teamcode, reputation, "balanced");
reputation = 5;
db_player_push("CRISTIANO", "RONALDO", 40, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 7, 3, 1, 3, 2, 1, 1, 2, 3, 0, reputation);
db_player_push("JOAO", "FELIX", 25, global.c_whiteskin, "PORTUGAL", teamcode, "FORWARD", 79, 3, 1, 2, 3, 1, 1, 2, 3, 1, reputation);
db_player_push("SADIO", "MANE", 33, global.c_darkskin, "SENEGAL", teamcode, "FORWARD", 10, 3, 1, 2, 3, 1, 1, 3, 3, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 3;
db_team_push("INTER MIAMI C.F.", "I.M.C.F.", make_color_rgb(241,110,170), c_black, c_aqua, "shorts", 1, "l99", 50000000, reputation);
reputation = 5;
db_coach_push("JAVIER", "MASCHERANO", 41, global.c_whiteskin, "ARGENTINA",teamcode, reputation, "balanced");
db_player_push("LIONEL", "MESSI", 38, global.c_whiteskin, "ARGENTINA", teamcode, "FORWARD", 10, 3, 3, 1, 3, 1, 1, 3, 3, 0, reputation);
db_player_push("LUIS", "SUAREZ", 38, global.c_whiteskin, "URUGUAY", teamcode, "FORWARD", 9, 2, 1, 2, 3, 1, 1, 1, 3, 0, reputation);
db_player_push("RODRIGO", "DE PAUL", 31, global.c_whiteskin, "ARGENTINA", teamcode, "MIDFIELDER", 7, 2, 3, 2, 2, 1, 1, 3, 1, 0, reputation);
db_player_push("SERGIO", "BUSQUETS", 37, global.c_whiteskin, "SPAIN", teamcode, "MIDFIELDER", 5, 1, 3, 2, 3, 1, 2, 3, 1, 0, reputation);
db_player_push("JORDI", "ALBA", 36, global.c_whiteskin, "SPAIN", teamcode, "DEFENDER", 18, 2, 2, 1, 3, 1, 3, 2, 1, 0, reputation);

idnumber = 10 + array_length(global.team_list);
teamcode = "t" + string(idnumber);
reputation = 4;
db_team_push("SANTOS F.C.", "S.F.C.", c_white, c_white, c_black, "shorts", 0, "l99", 20000000, reputation);
reputation = 5;
db_player_push("NEYMAR", "JUNIOR", 33, global.c_lightskin, "BRAZIL", teamcode, "FORWARD", 10, 3, 2, 1, 3, 1, 1, 3, 3, 0, reputation);
*/

for (var i = 0; i < array_length(global.player_list); ++i) {
	calculate_value(global.player_list[i]);
}

for (var i = 0; i < array_length(global.league_list); ++i) {
	
	teams = [];
	array_copy(teams, 0, variable_global_get(string(global.league_list[i]) + "_class"), 0, array_length(variable_global_get(string(global.league_list[i]) + "_class")));
	
	if (array_length(teams) mod 2 != 0) {
		array_push(teams, "BYE");
	}
	
	n2 = array_length(teams);
	n3 = array_length(teams)/2;
	
	for (var w_i = 0; w_i < 5; ++w_i) {
		
		w = w_i + 3;
	
		array_insert(teams,1,"");
		teams[1] = teams[n2];
		array_delete(teams,n2,1);
	
		for (var g_i = 0; g_i < n3; ++g_i) {
		
			if (teams[0+g_i] == "BYE" || teams[(n2-1)-g_i] == "BYE") {
				// BYE WEEK FOR THIS TEAM
			} else {
				game_push(w,global.league_list[i],"REGULAR SEASON",teams[0+g_i],teams[(n2-1)-g_i]);
			}
		
		}

	}
			
}

game_push(8,"l00","SEMIFINAL",global.l02_class[0],global.l06_class[0]);
game_push(8,"l00","SEMIFINAL",global.l03_class[0],global.l04_class[0]);
game_push(9,"l00","FINAL","TBD","TBD");

game_push(8,"l01","SEMIFINAL",global.l02_class[1],global.l06_class[1]);
game_push(8,"l01","SEMIFINAL",global.l03_class[1],global.l04_class[1]);
game_push(9,"l01","FINAL","TBD","TBD");
