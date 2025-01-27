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
