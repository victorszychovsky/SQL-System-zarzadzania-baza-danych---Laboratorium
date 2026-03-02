--Wiktor Szychowski 164171 D2
--1. Wyświetl nazwiska i etaty pracowników pracujących w tym samym zespole co pracownik o nazwisku Bilewicz. 
SELECT nazwisko, etat
FROM pracownicy
WHERE id_zesp = (
    SELECT id_zesp
    FROM pracownicy
    WHERE nazwisko = 'BILEWICZ'
);

--2. Wyświetl dane (nazwisko, etat, datę zatrudnienia)  o najdłużej zatrudnionym kierowniku. 
SELECT nazwisko, etat, zatrudniony
FROM pracownicy
WHERE etat = 'KIEROWNIK'
ORDER BY zatrudniony
LIMIT 1;

--3. Wyświetl najkrócej pracujących pracowników każdego zespołu. Uszereguj wyniki zgodnie z kolejnością zatrudnienia. 
SELECT p.id_zesp, p.nazwisko, p.zatrudniony
FROM pracownicy p
WHERE zatrudniony = (
    SELECT MIN(zatrudniony)
    FROM pracownicy
    WHERE id_zesp = p.id_zesp
)
ORDER BY zatrudniony;

--4. Wyświetl zespoły, które nie zatrudniają pracowników. 
SELECT z.id_zesp, z.nazwa
FROM zespoly z
WHERE NOT EXISTS (
    SELECT 1 FROM pracownicy p WHERE p.id_zesp = z.id_zesp
);

--5. Wyświetl pełną informacje o pracownikach zarabiających więcej niż średnia pensja dla ich etatu. 
SELECT *
FROM pracownicy p
WHERE placa_pod::numeric > (
    SELECT AVG(placa_pod::numeric)
    FROM pracownicy
    WHERE etat = p.etat
);


--6. Wyświetl nazwiska i pensje pracowników którzy zarabiają co najmniej 75% pensji swojego szefa. 
SELECT p.nazwisko, p.placa_pod
FROM pracownicy p
JOIN pracownicy szef ON p.id_szefa = szef.id_prac
WHERE p.placa_pod >= 0.75 * szef.placa_pod;

--7. Wyświetl nazwiska tych kierowników, którzy wśród swoich podwładnych nie mają żadnych stażystów. 
SELECT DISTINCT p.nazwisko
FROM pracownicy p
WHERE p.etat = 'KIEROWNIK'
  AND NOT EXISTS (
      SELECT 1
      FROM pracownicy pod
      WHERE pod.id_szefa = p.id_prac AND pod.etat = 'STAZYSTA'
  );

--8. Znajdź pracowników, którzy zarabiają więcej od każdego pracownika z działu 20. 
SELECT nazwisko
FROM pracownicy
WHERE placa_pod > ALL (
    SELECT placa_pod
    FROM pracownicy
    WHERE id_zesp = 20
);

--9. Wyświetl numer zespołu wypłacającego miesięcznie swoim pracownikom najwięcej pieniędzy. 
SELECT id_zesp
FROM pracownicy
GROUP BY id_zesp
ORDER BY SUM(placa_pod) DESC
LIMIT 1;

--10. Dla każdego pracownika wyświetl jego nazwisko oraz nazwę zespołu w którym pracuje dany pracownik. Posłuż się podzapytaniem w klauzuli SELECT. 
SELECT nazwisko,
       (SELECT nazwa FROM zespoly z WHERE z.id_zesp = p.id_zesp) AS nazwa_zespolu
FROM pracownicy p;

--11. Wyświetl nazwiska kierowników i liczbę ich podwładnych. Wyświetl tylko kierowników  zatrudnionych na Fabrycznej.
SELECT k.nazwisko, COUNT(p.id_prac) AS liczba_podwladnych
FROM pracownicy k
JOIN zespoly z ON k.id_zesp = z.id_zesp
LEFT JOIN pracownicy p ON p.id_szefa = k.id_prac
WHERE k.etat = 'KIEROWNIK'
  AND z.adres = 'FABRYCZNA 14'
GROUP BY k.nazwisko;

