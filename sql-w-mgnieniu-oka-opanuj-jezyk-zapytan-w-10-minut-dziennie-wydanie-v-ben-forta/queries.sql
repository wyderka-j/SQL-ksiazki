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

