-- Wiktor Szychowski 164171
-- Zapytania 2
USE test_zespoly
-- pomocnicze
SELECT * FROM PRACOWNICY;


--1
SELECT NAZWISKO, LEN(NAZWISKO) AS DLUGOSC
FROM PRACOWNICY;
--2
SELECT SUBSTRING(Etat, 1, 2) + '_' + CAST(Id_Prac AS VARCHAR) AS Kod
FROM PRACOWNICY;
--3 
SELECT Nazwisko
FROM PRACOWNICY
WHERE CHARINDEX('L', LEFT(Nazwisko, LEN(Nazwisko)/2)) > 0;
--4 
SELECT Nazwisko, ROUND(Placa_Pod * 1.15, 0) AS Nowa_Placa
FROM PRACOWNICY;
--5 
SELECT Nazwisko, DATEDIFF(YEAR, Zatrudniony, '2023-01-01') AS Staz_Lat
FROM PRACOWNICY;
--6
SELECT CAST(GETDATE() AS DATE) AS Dzis;

--7
SELECT DATENAME(WEEKDAY, GETDATE()) AS Dzien_Tygodnia;

--8 
SELECT *, 
       CASE 
           WHEN ADRES LIKE '%Piotrkowska%' THEN 'Œródmieœcie'
           WHEN ADRES LIKE '%Fabryczna%' THEN 'Widzew'
           ELSE 'Inna'
       END AS Dzielnica
FROM ZESPOLY;

--9
SELECT Nazwisko, Placa_Pod,
       CASE 
           WHEN Placa_Pod < 5100 THEN 'MNIEJSZA'
           WHEN Placa_Pod = 5100 THEN 'RÓWNA'
           ELSE 'WIÊKSZA'
       END AS Status_Placy
FROM PRACOWNICY;

--10
SELECT MIN(Placa_Pod) AS Min_Placa,
       MAX(Placa_Pod) AS Max_Placa,
       MAX(Placa_Pod) - MIN(Placa_Pod) AS Roznica
FROM PRACOWNICY;

--11
SELECT YEAR(Zatrudniony) AS Rok, COUNT(*) AS Liczba
FROM PRACOWNICY
GROUP BY YEAR(Zatrudniony)
ORDER BY Rok;

--12
SELECT Etat, AVG(Placa_Pod) AS Srednia
FROM PRACOWNICY
GROUP BY Etat
ORDER BY Srednia DESC;

--13
SELECT COUNT(*) AS Liczba_Kierownikow
FROM PRACOWNICY
WHERE Etat = 'Kierownik';

--14
SELECT Id_Zesp, SUM(Placa_Pod + ISNULL(Placa_Dod, 0)) AS Suma_Plac
FROM PRACOWNICY
GROUP BY Id_Zesp;

--15
SELECT Id_Zesp, COUNT(*) AS Liczba
FROM PRACOWNICY
GROUP BY Id_Zesp
ORDER BY Liczba DESC;

--16
SELECT Id_Zesp, COUNT(*) AS Liczba
FROM PRACOWNICY
GROUP BY Id_Zesp
HAVING COUNT(*) > 3
ORDER BY Liczba DESC;

--17
SELECT Etat, AVG(Placa_Pod) AS Srednia, COUNT(*) AS Liczba
FROM PRACOWNICY
WHERE Zatrudniony < '2018-01-01'
GROUP BY Etat;

--18
SELECT LEN(Nazwisko) AS Dlugosc, COUNT(*) AS Liczba
FROM PRACOWNICY
GROUP BY LEN(Nazwisko)
ORDER BY Dlugosc;

--19
SELECT COUNT(*) AS Liczba
FROM PRACOWNICY
WHERE Nazwisko LIKE '%a%' OR Nazwisko LIKE '%A%';

