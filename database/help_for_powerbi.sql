
SELECT DISTINCT
    player_sid,
    club_sid,
    FIRST_VALUE(market_value) OVER (
        PARTITION BY player_sid, club_sid 
        ORDER BY date_sid ASC) AS Prva_cena,
    FIRST_VALUE(market_value) OVER (
        PARTITION BY player_sid, club_sid 
        ORDER BY date_sid DESC) AS Poslednja_cena,
    (FIRST_VALUE(market_value) OVER (PARTITION BY player_sid, club_sid ORDER BY date_sid DESC) - 
     FIRST_VALUE(market_value) OVER (PARTITION BY player_sid, club_sid ORDER BY date_sid ASC)) AS Pravi_skok
FROM Fact_Valuations
WHERE club_sid IS NOT NULL AND club_sid <> 1

SELECT 
    DISTINCT CAST(current_club_id AS INT) AS current_club_id   
FROM player_valuations 
ORDER BY CAST(current_club_id AS INT) ASC;


SELECT 
    CAST(club_id AS INT) AS club_id
FROM clubs
ORDER BY CAST(club_id AS INT) ASC;



SELECT DISTINCT
    player_sid,
    FIRST_VALUE(market_value) OVER (PARTITION BY player_sid ORDER BY date_sid DESC) AS Trenutna_cena,
    FIRST_VALUE(market_value_change) OVER (PARTITION BY player_sid ORDER BY date_sid DESC) AS Zadnja_promena
FROM Fact_Valuations;


SELECT * FROM Dim_Competition where country_sid = 14




SELECT DISTINCT
    f.player_sid,
    f.club_sid,
    Dim_Competition.competition_sid, 
    FIRST_VALUE(f.market_value) OVER (
        PARTITION BY f.player_sid, f.club_sid 
        ORDER BY f.date_sid ASC) AS Prva_cena,
    FIRST_VALUE(f.market_value) OVER (
        PARTITION BY f.player_sid, f.club_sid 
        ORDER BY f.date_sid DESC) AS Poslednja_cena,
    (FIRST_VALUE(f.market_value) OVER (PARTITION BY f.player_sid, f.club_sid ORDER BY f.date_sid DESC) - 
     FIRST_VALUE(f.market_value) OVER (PARTITION BY f.player_sid, f.club_sid ORDER BY f.date_sid ASC)) AS Pravi_skok
FROM Fact_Valuations f
	JOIN Dim_Club dc ON f.club_sid = dc.club_sid
	JOIN Dim_Country ON dc.country_sid = Dim_Country.country_sid
	JOIN Dim_Competition ON Dim_Country.country_sid = Dim_Competition.country_sid
	WHERE f.club_sid IS NOT NULL AND f.club_sid <> 1











SELECT DISTINCT 
    dp.player_sid,
    FIRST_VALUE(fa.competition_sid) OVER (
    PARTITION BY dp.player_sid ORDER BY fa.date_sid DESC) AS trenutna_liga_sid,
	FIRST_VALUE(dcm.name) OVER (              
        PARTITION BY dp.player_sid 
        ORDER BY fa.date_sid DESC
    ) AS trenutna_liga_ime
FROM Dim_Player dp
JOIN Fact_Appearances fa ON dp.player_sid = fa.player_sid
JOIN Dim_Competition dcm ON fa.competition_sid = dcm.competition_sid
WHERE dcm.type = 'domestic_league' 
ORDER BY dp.player_sid ASC


SELECT DISTINCT 
    dp.player_sid,
    FIRST_VALUE(fa.club_sid) OVER (
    PARTITION BY dp.player_sid ORDER BY fa.date_sid DESC) AS trenutni_klub,
	FIRST_VALUE(dc.name) OVER (              
        PARTITION BY dp.player_sid 
        ORDER BY fa.date_sid DESC
    ) AS trenutni_klub_ime
FROM Dim_Player dp
JOIN Fact_Appearances fa ON dp.player_sid = fa.player_sid
JOIN Dim_Club dc ON fa.club_sid = dc.club_sid
ORDER BY dp.player_sid ASC