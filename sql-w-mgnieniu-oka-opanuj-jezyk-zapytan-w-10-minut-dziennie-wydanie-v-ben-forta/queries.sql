-- MySQL

-- ****************************************
--   Rozdział 2 Pobieranie danych    
-- ****************************************

-- 1. Napisz SQL-u instrukcję, która pobiera identyfikatory wszystkich klientów (kl_id) z tabeli Klienci
SELECT kl_id
FROM Klienci;

-- 2. Tabela ElementyZamowienia zawiera wszystkie zamówione produkty (niektóre wieloktortnie). Napisz w SQL-u instrukcję. która pobiera
--     listę zamówionych produktów (prod_id). Instrukcja ma zwracać tylko listę unikatowych produktów.
SELECT DISTINCT prod_id
FROM ElementyZamowienia;

-- 3. Napisz w SQL-u instrukcję pobierającą wszystkie kolumny z tabeli Klienci i inną instrukcję SELECT, która pobiera tylko identyfikatory klientów.
--     Ukryj w komentarzu jedną z instrukcji SELECT, aby móc uruchomić drugą.
SELECT *
-- SELECT kl_id
FROM Klienci;

-- ****************************************
-- Rozdział 3 Sortowanie pobranych danych  
-- ****************************************
-- 1. Napisz SQL-u instrukcję, która pobiera nazwy wszystkich klientów (kl_nazwa) z tabeli Klienci. Wyświetl wyniki posortowane od Z do A.
SELECT kl_nazwa
FROM Klienci
ORDER BY kl_nazwa DESC;
-- 2. Napisz SQL-u instrukcję, która pobiera identyfikator klienta (kl_id) i numer zamówienia (zam_numer)  tabeli Zamowienia oraz sortuje wyniki 
--  najpierw według identyfikatora klientów, a następnie według ddaty zamówienia w odwrotnej kolejności chronologicznej (czyli od najnowszych).
SELECT kl_id, zam_numer
FROM Zamowienia
ORDER BY kl_id, zam_data DESC;
-- 3. Napisz SQL-u instrukcję, która wyświetla liczbę sztuk i cenę jednostkową (prod_cena) x tabeli ElementyZamowienia. Wyniki mają być posortowane 
-- od największej liczby sztuk i najwyższych cen.
SELECT ilosc, prod_cena
FROM ElementyZamowienia
ORDER BY ilosc DESC, prod_cena DESC;
--4. Jaki błąd znajduje się w poniższej instrukcji w SQL?
     /*  SELECT dost)nazwa,
         FROM Dostawcy
         Order dost_nazwa DESC;  */
-- Po nazwie dost_nazwa nie powinno być przecinka. Ponadto po ORDER brakuje słowa BY.

-- ****************************************
-- Rozdział 4 Filtrowanie danych 
-- ****************************************
-- 1. Napisz SQL-u instrukcję, która pobiera identyfikator (prod_id) i nazwę produktu (prod_name) z tabeli Produkty oraz zwraca tylko produkty
--    o cenie równej 12.99.
SELECT prod_id, prod_nazwa
FROM Produkty
WHERE prod_cena = 12.99;
-- 2. Napisz SQL-u instrukcję, która pobiera identyfikator (prod_id) i nazwę produktu (prod_name) z tabeli Produkty oraz zwraca tylko produkty
--    o cenie równej 15 lub większej.
SELECT prod_id, prod_nazwa
FROM Produkty
WHERE prod_cena >= 15;
-- 3. Napisz SQL-u instrukcję, która pobiera z tabeli ElementyZamowienia unikatową listę numerów zamówień (za_numer) obejmujących przynajmniej 
--    100 sztuk dowolnego produktu.
SELECT DISTINCT zam_numer
FROM ElementyZamowienia
WHERE ilosc >= 100;
-- 4. Napisz SQL-u instrukcję, która pobiera z tabeli Produkty nazwę (prod_nazwa) i cenę (prod_cena) wszystkich produktów o cenie z przedziału
--    od 20 do 40. Posortuj wyniki według ceny.
SELECT prod_nazwa, prod_cena
FROM Produkty
WHERE prod_cena BETWEEN 20 AND 40
ORDER BY prod_cena;

-- *******************************************
-- Rozdział 5 Zaawansowane filtrowanie danych
-- *******************************************
-- 1. Napisz SQL-u instrukcję, która pobiera z tabeli Dostawcy nazwę dostawcy (dost_nazwa) i zwraca tylko dostawców z województwa mazowieckiego.
-- Wymaga to filtrowania danych zarówno według państwa jak i województwa MAZ.
SELECT dost_nazwa
FROM DOstawcy
WHERE dost_kraj = 'Polska' AND dost_woj = 'MAZ';
-- 2. Napisz SQL-u instrukcję, która znajduje wszystkie zamówienia obejmujące przynajmniej 100 sztuk produktu BR01, BR02 lun BR03. 
-- Należy zwrócić numer zamówienia (zam_numer), idektyfikator produktu (prod_id) i liczbę sztuk (ilosc) w tabeli ElementyZamowienia.
SELECT zam_numer, prod_id, ilosc
FROM ElementyZamowienia
WHERE prod_id IN (BR01, BR02, BR03) AND ilosc >= 100;
-- rozwiazanie 2
SELECT zam_numer, prod_id, ilosc
FROM ElementyZamowienia
WHERE (prod_id = 'BR01' OR prod_id = 'BR02' OR prod_id = 'BR03') AND ilosc >= 100;
-- 3. Napisz SQL-u instrukcję, która pobiera z tabeli Produkty nazwę (prod_nazwa) i cenę (prod_cena) wszystkich produktów o cenie z przedziału
-- od 20 do 40. Użyj operatora AND i posortuj wyniki według ceny.
SELECT prod_nazwa, prod_cena
FROM Produkty
WHERE prod_cena >= 20 AND prod_cena <= 40
ORDER BY prod_cena;
-- 4. Jaki błąd znajduje się w poniższej intrukcji?
     /* SELECT dost_nazwa
        FROM Dostawcy
        ORDER BY dost_nazwa
        WHERE dost_kraj = 'Polska' AND dost_woj = 'MAZ'; */
-- Klauzula ORDER BY musi znajdować się po klauzuli WHERE.

-- *******************************************************
-- Rozdział 6 Filtrowanie za pomocą znaków wieloznacznych
-- *******************************************************
-- 1. Napisz SQL-u instrukcję, która pobiera nazwę (prod_nazwa) i opis (prod_opis) z tabeli Produkty oraz zwraca tylko te produkty, w których 
--  opisie występuje słowo 'szmacianka'.
SELECT prod_nazwa, prod_opis
FROM Produkty
WHERE prod_opis LIKE '%szmacianka%';
-- 2. Napisz SQL-u instrukcję, która pobiera nazwę (prod_nazwa) i opis (prod_opis) z tabeli Produkty oraz zwraca tylko te produkty, w których 
--  opisie nie występuje słowo 'szmacianka'. Posortuj wyniki według nazw produktów.
SELECT prod_nazwa, prod_opis
FROM Produkty
WHERE NOT prod_opis LIKE '%szmacianka%'
ORDER BY prod_nazwa;
-- 3. Napisz SQL-u instrukcję, która pobiera nazwę (prod_nazwa) i opis (prod_opis) z tabeli Produkty oraz zwraca tylko te produkty, w których 
--  opisie występują jednocześnie słowa 'szmacianka' i 'Rybka'. Zastosuj operator AND i dwa porówniania LIKE.
SELECT prod_nazwa, prod_opis
FROM Produkty
WHERE prod_opis LIKE '%szmacianka%' AND prod_opis LIKE '%Rybka%';
-- 4. Napisz SQL-u instrukcję, która pobiera nazwę (prod_nazwa) i opis (prod_opis) z tabeli Produkty oraz zwraca tylko te produkty, w których 
--  opisie występują słowa 'Rybka' i 'szmacianka' w takiej właśnie kolejności.
SELECT prod_nazwa, prod_opis
FROM Produkty
WHERE prod_opis LIKE '%Rybka%szmacianka%';

-- ****************************************
--   Rozdział 7 Tworzenie pól obliczanych   
-- ****************************************

-- 1. Napisz SQL-u instrukcję, która pobiera z tabeli Dostawcy pola dost_id, dost_nazwa, dost_adres i dost_miasto. Nazwę pola dost_nazwa zmień
-- na dnazwa, dost_masto na dmiasto, a dost_adres na dadres. Posortuj według nazw dostawcóœ.
SELECT dost_id, dost_nazwa AS dnazwa, dost_adres AS dadres, dost_miasto AS dmiasto
FROM Dostawcy
ORDER BY dnazwa;
-- 2. Napisz SQL-u instrukcję, która zwraca pola prod_id, prod_cena i cena_wyprz z tabeli Produkty. Pole cena_wyprz jest polem obliczanym zawierającym
-- cenę wyprzzzedażową (rabat 10%).
SELECT prod_id, prod_cena, prod_cena * 0.9 AS cena_wyprz
FROM Produkty;

-- ***************************************************
--   Rozdział 8 Modyfikacja danych za pomocą funkcji 
-- ***************************************************

-- 1. Napisz SQL-u instrukcję, która zwraca identyfikator klienta (kl_id), nazwę klienta (kl_nazwa) i login (uxyt_login). Login ma składać się z wielkich
-- liter i zawierać dwa pierwsze znaki danych kontaktowych klienta (kl_kontakt) i trzy pierwsze znaki miasta (kl_miasto).
SELECT kl_id, kl_nazwa, CONCAT(UPPER(LEFT(Kl_kontakt, 2)), UPPER(LEFT(Kl_miasto, 3))) AS uzyt_login
FROM Klienci;
-- 2. Napisz SQL-u instrukcję, która zwraca numer (zam_numer) i datę (zam_data) wszystkich zamówień złożonych w styczniu 2020 roku.
-- Dane mają być posortowane według daty zamówienia.
SELECT zam_numer, zam_data
FROM Zamowienia
WHERE YEAR(zam_data) = 2020 AND MONTH(zam_data) = 1
ORDER BY zam_data;
