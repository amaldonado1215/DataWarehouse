	ALTER VIEW AGENTS AS 
/* This view determines which agents and agent activity appears in the Agent Activity Report
*/
SELECT DISTINCT cuser_name AS agent, changed_by AS id
FROM          dbo.history_3300
WHERE        (changed_by IN (6381,  1490, 6457, 5905, 6558, 6979, 6559, 6711, 6862, 6382, 5755, 6629, 6631, 6012, 2946, 6076, 6670, 6825, 3287, 
                         6593, 6535, 6968, 6757, 6875, 6575, 6518, 5807, 5450, 5890, 7042, 7043,6458, 2918, 7205, 6611,  5980, 7022, 
						 7206, 7040, 7229, 7039,7308,7313,7307,7311,7306,7312,7309, 7317, 7319, 7318, 7481, 7318, 7317, 7219, 6457, 7040,7039, 5905,
						 7358, 7668, 7632, 7633, 7631, 7360, 7632,7311, 7308, 7306, 7633, 7631, 7312, 7360, 7358, 7219, 6457, 7039, 7668, 
						 7768, 7767, 7766, 7765, 7874, 7768, 7305, 7871, 7870, 7956, 7957, 7955, 8060, 8063, 8062, 8061, 8010, 8011, 8012, 8013, 8149,
						 8143,8137,8136,8283,8284,8285,8286,8287,8290,8289,8198,8199,8347,8082,8148,8298,8304,8346,8394, 8395, 8462, 8282,8291, 8461,
						 8576,8615, 8616, 8463, 7873, 7452, 8699, 8698, 8700, 8701,8722,8724,8087,8481,8815,8998,8999, 9081, 9187, 9189, 9243, 9262, 9263, 9337, 9338))


/*

select * from history_3300 where
Jessie Torres
Crystal Robles (IOM Collector)
Amelia Ridout (IOM Collector)
Kasey Rodriguez	7481

Latasha McFagdon
Diana Alba 7318
Elsa Aldana 7317
Melinda Patillo
Kasey Rodriguez
Christina Swary 7219 

Christine Guerrero 6457
Teresa Swinhart 7040
Lisa Weldon 7039
Cynthia Yanez 5905
*/

/*order by agent


SELECT DISTINCT cuser_name AS agent, changed_by AS id
FROM          dbo.history_3300 
where cuser_name like '%Ridout%'
order by agent

select * from agents
select * from users_3300 where last_name like '%Ridout%'

*/


select * from tblagenthistory2 where agent like '%Grisham%'
select * from agenthistory2 where agent like '%Grisham%'

select * from dbo.notes_3300_recent where web_id = 7957
select * from agents where id = 7957

--ticket 1874 lauren
select * from agents where id in (8060,8063,8062,8061)
--add these agents Candace Stephens	8060, Starla Williams	8063, Lisa Garcia	8062, Virginia Wingate	8061

--ticket 1883 lauren
select * from agents where id in (8010,8011,8012)
--add these agents William Carter	8010, Keisha Mitchell	8011, Delores Robison	8012

--ticket 1910 lauren 
select * from agents where id = 8013
select * from dbo.notes_3300 where web_id = 8013
--add agent Bridget Thomas	8013

select top 100 * from dbo.notes_3300 where initialdate > '2017-05-25'

--ticket 1939 lauren 
select * from agents where id = 8149
select * from dbo.notes_3300 where web_id = 8149
--add agent Bridgett Thomas 8149

--ticket 1943 lauren
select * from agents where id in (8143,8137,8136)
select * from dbo.notes_3300 where web_id = 8136
--add these agents Nina McCauley 8143, suzanne day	8137, cheryl butke	8136

--ticket 1983 lauren
select * from agents where id in (8283,8284,8285)
select * from dbo.notes_3300 where web_id in (8283,8284,8285)
--add these agents Mary Griffin	8284, Eskalethia Boyd	8285, Kaylana Hall	8283

--ticket 1983 lauren
select * from agents where id in (8286,8287,8290,8289)
select * from dbo.notes_3300 where web_id in (8286,8287,8290,8289)
--add these agents Amy Valadez	8286, Estevan Guzman	8287, Victoria Ford	8290, Frances McNeel	8289


--ticket 1989 lauren
select * from agents where id in (8198, 8199)
select * from dbo.notes_3300 where web_id in (8198, 8199)
--add these agents Margaret Griffin	8199, Ernest Mitchell	8198

--ticket 2011 lauren 
select * from agents where id = 8347
select * from dbo.notes_3300 where web_id = 8347
--add agent Jennifer Alvarado	8347

----ticket 2069 naz
select * from agents where id in (8082,8148,8298,8304,8346)
select * from dbo.notes_3300 where web_id = 8082
--add these agents Shareece Williams 8082, Queen Vorachitch 8148, Sonya Hughes 8298, Mary Duke 8304, Kristy Alva 8346

--ticket 2108 naz and lauren
select * from agents where id in (8394, 8395, 8462)
select * from dbo.notes_3300 where web_id = 8462
--add these agents Lorraine Jimenez 8394, Rosalia Rodriguez 8395, Lori Armstrong 8462

--ticket 2165  lauren
select * from agents where id = 8282
select * from dbo.notes_3300 where web_id = 8282
--add Shareece Williams	8282

--ticket 2174  lauren
select * from agents where id = 8291
select * from dbo.notes_3300 where web_id = 8291
--add agent Kasandra Marin 8291

--ticket 2175 lauren
select * from agents where id = 8461
select * from dbo.notes_3300 where web_id = 8461
--Add agent Debra Miller; id# 8461 

--ticket 2228 naz
select * from agents where id = 8576
select * from dbo.notes_3300 where web_id = 8576
--add agent Sonia Olvera 8576 

--ticket 2287 lauren
select * from agents where id in (8615, 8616)

--ticket 2317 naz
select * from agents where id in (8463, 7873, 7452)
select * from dbo.notes_3300 where web_id in (8463, 7873, 7452)
--add these agents Kimberly Brown 8463, Josue Hernandez 7873, Christine Lloyd 7452

--ticket 2348 naz
select * from agents where id in (8699, 8698, 8700, 8701)
select * from dbo.notes_3300 where web_id in (8699, 8698, 8700, 8701)
--add these agents Jennifer Baker-Kyrish 8699, Valarie Poore 8698, Leann Araiza 8700, Raynette 8701

--ticket 2370 naz
select * from agents where id = 8722
select * from dbo.notes_3300 where web_id = 8722
--add these agents Andra Lang 8722

<<<<<<< HEAD
--add Christopher Barraza 9189

--add Marisa Gleason-Montez, Diana Lafuente, Theresa Saucedo amm
=======
--ticket #54 kta
select * from agents where id in (9187,9081)
select * from dbo.notes_3300 where web_id in (9187,9081)
-- add 9187,9081
>>>>>>> ad9952adf2b8134959d2ee4e64a3a1e11baeb889

--add Joann Turnbull and Veronica Espinoza amm
