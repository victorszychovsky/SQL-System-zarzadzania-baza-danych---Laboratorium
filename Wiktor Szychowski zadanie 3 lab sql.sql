-- 1. Wyœwietl nazwiska, etaty, numery zespo³ów i nazwy zespo³ów wszystkich pracowników.
SELECT p.NAZWISKO, p.ETAT, p.ID_ZESP, z.NAZWA AS NAZWA_ZESPOLU
FROM PRACOWNICY p
JOIN ZESPOLY z ON p.ID_ZESP = z.ID_ZESP;

-- 2. Wyœwietl wszystkich pracowników z ul. Piotrkowskiej. Uporz¹dkuj wyniki wed³ug nazwisk.
SELECT p.*
FROM PRACOWNICY p
JOIN ZESPOLY z ON p.ID_ZESP = z.ID_ZESP
WHERE z.ADRES LIKE '%Piotrkowska%'
ORDER BY p.NAZWISKO;

-- 3. Wyœwietl nazwiska, miejsca pracy oraz nazwy zespo³ów pracowników z pensj¹ powy¿ej 5500.
SELECT p.NAZWISKO, z.ADRES AS MIEJSCE_PRACY, z.NAZWA AS NAZWA_ZESPOLU
FROM PRACOWNICY p
JOIN ZESPOLY z ON p.ID_ZESP = z.ID_ZESP
WHERE p.PLACA_POD > 5500;

-- 4. Dla ka¿dego pracownika wyœwietl jego p³acê i wide³ki p³acowe.
SELECT p.NAZWISKO, p.PLACA_POD, e.PLACA_MIN, e.PLACA_MAX
FROM PRACOWNICY p
JOIN ETATY e ON p.ETAT = e.NAZWA;

-- 5. Wyœwietl nazwiska i stanowiska pracowników z p³ac¹ równ¹ minimum na danym etacie.
SELECT p.NAZWISKO, p.ETAT
FROM PRACOWNICY p
JOIN ETATY e ON p.ETAT = e.NAZWA
WHERE p.PLACA_POD = e.PLACA_MIN;

-- 6. Wyœwietl nazwiska i numery pracowników oraz ich szefów.
SELECT p.NAZWISKO AS PRACOWNIK, p.ID_PRAC, s.ID_PRAC AS ID_SZEFA, s.NAZWISKO AS SZEF
FROM PRACOWNICY p
LEFT JOIN PRACOWNICY s ON p.ID_SZEFA = s.ID_PRAC;

-- 7. Wyœwietl tak¿e pracownika bez szefa (ju¿ uwzglêdnione w zapytaniu 6 poprzez LEFT JOIN).

-- 8. Dla ka¿dego dzia³u wyœwietl liczbê pracowników i œredni¹ p³acê.
SELECT ID_ZESP, COUNT(*) AS LICZBA_PRACOWNIKOW, AVG(PLACA_POD) AS SREDNIA_PLACA
FROM PRACOWNICY
GROUP BY ID_ZESP;

-- 9. Liczba podw³adnych dla ka¿dego pracownika z podw³adnymi.
SELECT s.NAZWISKO AS SZEFL, COUNT(p.ID_PRAC) AS LICZBA_PODWLADNYCH
FROM PRACOWNICY s
JOIN PRACOWNICY p ON p.ID_SZEFA = s.ID_PRAC
GROUP BY s.NAZWISKO
ORDER BY LICZBA_PODWLADNYCH DESC;

-- 10. Zespó³, który nie zatrudnia ¿adnych pracowników.
SELECT z.*
FROM ZESPOLY z
LEFT JOIN PRACOWNICY p ON z.ID_ZESP = p.ID_ZESP
WHERE p.ID_PRAC IS NULL;

-- 11. Pracownik nieprzypisany do zespo³u.
SELECT *
FROM PRACOWNICY
WHERE ID_ZESP IS NULL;

-- 12. Wszystkie dane z tabeli pracownicy i zespo³y (FULL OUTER JOIN).
SELECT *
FROM PRACOWNICY
FULL OUTER JOIN ZESPOLY ON PRACOWNICY.ID_ZESP = ZESPOLY.ID_ZESP;
