CREATE TABLE UserLookup (
		UserLookupID int IDENTITY(1,1) PRIMARY KEY,
		Web_user_id int, 
		Payroll_ID int);

CREATE VIEW vwUsers_3300 as 
select users_3300.*, userlookup.Payroll_ID from users_3300
left outer join userlookup on userlookup.Web_user_id = users_3300.web_user_id;

INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6581,61125)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5900,61116)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7241,61161)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3250,61002)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8115,61222)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8114,61221)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8344,61238)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6409,61119)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6947,61145)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7593,61186)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8322,61226)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7449,61177)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6046,61007)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6665,61112)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6948,61150)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6929,61142)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6441,61121)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6628,61127)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1617,61009)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6582,61126)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7687,61197)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6047,61013)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3200,61015)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5909,61018)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5790,61019)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7590,61187)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7948,61211)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7589,61188)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3257,61103)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5981,61023)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7838,61207)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6993,61156)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7471,61183)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6440,61120)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7215,61166)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6940,61149)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (954,61117)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6931,61141)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6042,61031)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7949,61212)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3115,61104)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7363,61173)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (2886,61034)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7825,61172)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7690,61199)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3201,61036)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8372,61203)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (670,61105)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6953, 61108)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6348,61115)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7588,61189)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7951,61213)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7333,61171)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8343,61237)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (795,61040)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1174, 61043)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3202,61045)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8317,61227)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6724,61130)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8167,61225)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7947,61215)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7321,61115)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1120, 61114)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6946,61155)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6722,61131)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8111,61224)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7218,61167)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6886,61140)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6249,61113)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (493,61053)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6885,61139)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8398,61240)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5557,61056)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (372,61057)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8320,61228)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7688,61198)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8316,61229)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7837,61206)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (932,61059)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6144,61107)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8321,61235)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7176,61159)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7448,61180)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6773,61135)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8319,61230)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8051,61217)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6943,61153)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1840,61044)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6045,61068)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7754,61205)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7702,61202)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (783,61069)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3132,61070)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8112,61223)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6832,61106)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7753,61204)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8113,61219)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5791,61072)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7582,61184)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5446,61074)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6158,61105)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6935,61128)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6942,61152)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8083,61220)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6829,61136)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3203,61076)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7123,61157)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8314,61231)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8313,61232)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5812,61109)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (461,61080)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (494,61081)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6930,61143)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7382,61176)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6938,61146)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8324,61236)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7216,61168)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7586,61191)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1317,61088)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6048,61089)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6043,61090)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1836,61091)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7594,61192)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7364,61174)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7587,61193)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7592,61194)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1186,61112)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7518,61185)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7219,61164)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6910,61106)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7950,61214)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8396,61241)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8329,61216)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6944,61147)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7459,61138)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6748,61133)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8052,61218)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (5483,61100)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7456,61181)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8318,61233)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7577,61195)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (565, 61049)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8325,61234)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7689,61201)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7269,61170)

SELECT * From userlookup

--ticket 2185 lauren
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8538,61245)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (3071,61065)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (370,61003)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1558,61092)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1733,61083)
INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (7470,61182)
SELECT * From userlookup where web_user_id in (8538,3071,370,1558,1733,7470)

--ticket 2200 naz
 SELECT * from userlookup where web_user_id in (8537,6468)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8537,61246)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6468,61122)

--ticket 2207 naz
 SELECT * from userlookup where web_user_id = (8485)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8485,61242)

 --ticket 2249 lauren

 SELECT * from userlookup where web_user_id = 1777
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (1777,61051)

 --ticket 2260 naz
 SELECT * from userlookup where web_user_id = 8602
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8602,61249)

 --- ticket 2298 naz
 SELECT * from userlookup where web_user_id = 8486
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8486,61243)

 ---ticket 2315 naz
 SELECT * from userlookup where web_user_id = 8623
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8623,61250)

 ---ticket 2339 naz

 SELECT * from userlookup where web_user_id = 8691
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8691,61253)

 -- ticket 2345 kevin
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8693,61251)

  --ticket 2361 naz

 SELECT * from userlookup where web_user_id in (8588, 8692, 6945)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8588,61248)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8692,61252)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (6945,61154)

 --ticket 2389 lauren
 SELECT * from userlookup where web_user_id in (8774, 8772)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8774,61255)
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8772,61256)

  --ticket 2493 lauren
 SELECT * from userlookup where web_user_id = 8866
 INSERT INTO USERLOOKUP (web_user_id, payroll_ID) VALUES (8866,61260)

  --ticket 2499 lauren
 SELECT * from userlookup where web_user_id in (8318, 7753)

 insert into [dbo].[UserLookup] (web_user_id,Payroll_ID) -- #53 kta
 values (8906,	61258),
		(8979,	61270),
		(8305,	61500)
insert into [dbo].[UserLookup](Web_user_id, Payroll_ID) -- kta  add Jason Carolus 
values (6044,61010)
