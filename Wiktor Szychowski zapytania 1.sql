-- Wiktor Szychowski 164171 d2 zapytania 1
-- Zapytania 1
USE test_zespoly
-- 1.
Select * from PRACOWNICY;
-- 2.
Select * from PRACOWNICY order by Nazwisko ASC;
-- 3.
Select Nazwisko, Id_zesp from PRACOWNICY WHERE PLACA_DOD IS NULL;
-- 4.
Select Nazwisko,Placa_pod * 12 AS Roczne_dochody from PRACOWNICY;
-- 5.
Select Nazwisko,Etat, Placa_pod + COALESCE (PLACA_DOD, 0)  AS Miesiêczne_dochody 
from PRACOWNICY;
-- 6.
Select * from ZESPOLY Order By NAZWA DESC;
-- 7.
Select DISTINCT Etat from PRACOWNICY;
-- 8.
Select Nazwisko, Etat from PRACOWNICY Where Etat='Analityk';
-- 9.
Select Id_Prac, Nazwisko, Etat, Placa_Pod, PRACOWNICY.ID_ZESP from PRACOWNICY 
Where PRACOWNICY.ID_ZESP=30 or PRACOWNICY.ID_ZESP=40 Order by PLACA_POD DESC;
-- 10.
Select Nazwisko, Id_Zesp, Placa_Pod from PRACOWNICY Where PLACA_POD Between 3000 AND 5500;
-- 11.
Select * from PRACOWNICY Where PLACA_POD != 6000;
-- 12.
Select * from PRACOWNICY Where ETAT !='KIEROWNIK' AND ETAT !='DYREKTOR' AND PLACA_POD > 5000;
-- 13.
Select Nazwisko, Etat, Id_Zesp from PRACOWNICY Where Nazwisko LIKE '%SKI';
-- 14.
Select Id_Prac, Id_Szefa, Nazwisko, Placa_Pod from PRACOWNICY 
Where PLACA_POD > 5500 AND ID_SZEFA is NOT NULL;
-- 15.
Select Nazwisko, Etat from PRACOWNICY Where NAZWISKO LIKE '[k-n]%';
-- 16.
Select Nazwisko, Etat from PRACOWNICY Where NAZWISKO not LIKE '[k-n]%';
-- 17.
Select Nazwisko, Id_zesp from PRACOWNICY 
Where ID_ZESP=20 AND (NAZWISKO Like 'S%' or NAZWISKO Like '%EK');
-- 18.
Select Nazwisko, Etat, Placa_Pod, Placa_DOD from PRACOWNICY 
where (Placa_pod + COALESCE (PLACA_DOD, 0)) > 5000 Order by ETAT, NAZWISKO Asc;
-- 19.
Select CONCAT (Imie,' ', NAZWISKO,' zatrudniony od ', Zatrudniony,' zarabia ', PLACA_POD) AS kierownicy 
from Pracownicy Where ETAT='Kierownik' Order by PLACA_POD ASC;