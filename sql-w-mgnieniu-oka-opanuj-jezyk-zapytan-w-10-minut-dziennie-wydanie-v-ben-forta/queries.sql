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

-- ****************************************
--   Rozdział 9 Funkcje agregujące 
-- ****************************************

-- 1. Napisz SQL-u instrukcję,aby ustalić łączną liczbę sprzedanych produktów (użyj kolumny ilosc z tabeli ElementyZamowienia).
SELECT SUM(ilosc) AS zamowione_produkty
FROM ElementyZamowienia;
-- 2. Zmodyfikuj instrukcję z zadania 1, aby ustalić łączną liczbę sprzedanych produktów (prod_id) BR01.
SELECT SUM(ilosc) AS zamowione_produkty
FROM ElementyZamowienia
 WHERE prod_id = 'BR01';
-- 3. Napisz SQL-u instrukcję,aby ustalić cenę (prod_cena) najdroższego produktu z tabeli Produkty, który kosztuje nie więcej niż 10.
-- Obliczone pole nazwij cena_max.
SELECT MAX(prod_cena) AS cena_max
FROM Produkty
WHERE prod_cena <= 10;

-- ****************************************
--   Rozdział 10 Grupowanie danych  
-- ****************************************

-- 1. Napisz SQL-u instrukcję, która zwraca liczbę pozycji (jako pole zam_pozycje) dla każdego numeru zamówienia (zam_numer).
-- Posortuj wyniku według pola zam_pozycje.
SELECT zam_numer, COUNT(*) AS zam_pozycje
FROM ElementyZamowienia
GROUP BY zam_numer
ORDER BY zam_pozycje;
-- 2. Napisz SQL-u instrukcję, która zwraca pole o nazwie najtanszy_prod, zawierające najtańszy produkt od każdego producenta
-- (użyj pola prod_cena z tabeli Produkty). Posortuj produkty od najtańszego do najdroższego.
SELECT dost_id, MIN(prod_cena) AS najtanszy_prod
FROM Produkty
GROUP BY dost_id
ORDER BY najtanszy_prod;
-- 3. Napisz SQL-u instrukcję, która zwraca numery (zam_numer z tabeli ElementyZamowienia) wszystkich zamówień obejmujących
-- przynajmniej 100 elementów.
SELECT zam_numer
FROM ElementyZamowienia
GROUP BY zam_numer
HAVING SUM(ilosc) >= 100
ORDER BY zam_num;
-- 4. Napisz SQL-u instrukcję, która zwraca numery (zam_numer z tabeli ElementyZamowienia) wszystkich zamówień, w których łączna
-- cena wyniosła przynajmniej 1000. Posortuj według numerów zamówień.
SELECT zam_numer, SUM(cena_elem * ilosc) AS cena_w_sumie
FROM ElementyZamowienia
GROUP BY zam_numer
HAVING SUM(cena_elem * ilosc) >= 1000
ORDER BY zam_numer;
-- 5. Jaki błąd znajduje się w poniższej instrukcji SQL?
     /*     SELECT zam_numer, COUNT(*) AS elementy
            FROM ElementyZamowienia
            GROUP BY elementy
            HAVING COUNT(*) >= 3
            ORDER BY elementy, zam_muner;     */
-- Klauzula GROUP BY elementy jest nieprawidłowa. W klauzuli GROUP BY trzeba użyć zwykłej kolumny, a nie kolumny używanej w agregacji.

-- ****************************************
--   Rozdział 11 Zapytania zagnieżdżone  
-- ****************************************

-- 1. Używając zapytania zagnieżdżonego, zwróć listę klientów, którzy kupili produkty o cenie 10 lub wyższej. Użyj tabeli ElementyZamowienia
-- aby znaleźć odpowiednie numery zamówień (zam_numer), a następnie tabeli Zamowienia, by pobrać identyfikatory klientów (kl_id).
SELECT kl_id
FROM Zamowienia
WHERE zam_numer IN (SELECT zam_numer
                    FROM ElementyZamowienia
                    WHERE pcena_elem >= 10);
-- 2. Napisz intrukcję z zapytaniem zagnieżdżonym, aby określić, w których zamówieniach (z tabeli ElementyZamowienia) znalazły się 
-- elementy o identyfikatorze (prod_id) BR01. Następnie zwróć identyfikator klienta (kl_id) i datę zamówienia (zam_data) dla każdego
-- takiego zamówienia  z tabeli Zamówienia. Wynik posortuj według daty zamówienia.
SELECT kl_id, zam_data
FROM Zamowienia
WHERE zam_numer IN (SELECT zam_numer
                    FROM ElementyZamowienia
                    WHERE prod_id = 'BR01')
ORDER BY zam_data;
-- 3. Zmień poprzednie zadanie tak ,aby instrukcja zwracała e-maile (kl_email z tabeli Klienci) wszystkich klientów, którzy zakupili produkty
-- o identyfikatorze (prod_id) BR01.
SELECT kl_email
FROM Klienci
WHERE kl_id IN (SELECT kl_id
               FROM Zamowienia
               WHERE zam_numer IN (SELECT zam_numer
                              FROM ElementyZamowienia
                              WHERE prod_id = 'BR01'));
-- 4. Napisz instrukcję, która zwraca identyfikator klienta (kl_id z tabeli Zamowienia) i wartość wartosc_zam. Użyj zapytania zagnieżdżonego
-- aby zwrócić sumę wartości zamówień każdego klienta. Posortuj wyniki według wydatków poszczególnych klientów (od najwyższych do najniższych).
SELECT kl_id, 
     (SELECT SUM(cena_elem*ilosc) FROM ElementyZamowienia 
     WHERE Zamowienia.zam_numer = ElementyZamowienia.zam_numer) AS wartosc_zam
FROM Zamowienia
ORDER BY wartosc_zam DESC;
-- 5. Napisz instrukcję, która pobiera z tabeli Produkty wszystkie nazwy produktów (prod_nazwa), a także obliczoną kolumnę o nazwie sprzedano_sztuk
-- zawierającą łączną liczbę sprzedanych sztuk każdego produktu. Tę liczbę pobierz za pomocą zapytania zagnieżdżonego i funkcji SUM(ilosc) z tabeli
-- ElementyZamowienia.
SELECT prod_nazwa,
     (SELECT SUM(ilosc) FROM ElementyZamowienia
     WHERE Produkty.prod_id = ElementyZamowienia.prod_id) AS sprzedano_sztuk
FROM Produkty;

-- ****************************************
--   Rozdział 12 Złączanie tabel  
-- ****************************************

-- 1. Napisz instrukcję, która zwraca nazwę klienta (kl_nazwa) z tabeli Klienci i numery powiązanych zamówień (zam_numer) z tabeli Zamowienia.
-- Wyniki posortuj najpierw według nazw klientów, a następnie według numerów zamówień. Wykonaj to zadanie dwuktrotnie - raz z użyciem prostej
-- składni złączeń wewnętrznyvh i raz za pomocą składni INNER JOIN.
SELECT kl_nazwa, zam_numer
FROM Klienci, Zamowienia
WHERE Klieci.kl_id = Zamowienia.kl_id
ORDER BY kl_nazwa, zam_numer;
-- drugie rozwiazanie
SELECT kl_nazwa, zam_numer
FROM Klienci
INNER JOIN Zamowienia ON Klieci.kl_id = Zamowienia.kl_id
ORDER BY kl_nazwa, zam_numer;
-- 2. Do zadania pierwszego dodaj trzecią kolumnę, wartosc_zam, zawierającą łączną wartość każdego zamówienia.
SELECT kl_nazwa, 
     zam_numer,
     (SELECT SUM(cena_elem*ilosc) FROM ElementyZamowienia WHERE Zamowienia.zam_numer = ElementyZamowienia.zam_numer) AS wartosc_zam
FROM Klienci, Zamowienia
WHERE Klieci.kl_id = Zamowienia.kl_id
ORDER BY kl_nazwa, zam_numer;
-- drugie rozwiazanie
SELECT kl_nazwa, 
     Zamowienia.zam_numer, 
     SUM(cena_elem*ilosc) AS wartosc_zam
FROM Klienci, Zamowienia, ElementyZamowienia
WHERE Klieci.kl_id = Zamowienia.kl_id 
     AND Zamowienia.zam_numer = ElementyZamowienia.zam_numer
GROUP BY kl_nazwa, Zamowienia.zam_numer
ORDER BY kl_nazwa, Zamowienia.zam_numer;
-- 3. Napisz instrukcję, która pobiera daty zamówienia produktu BR01 oraz zwracaidentyfikator klienta (kl_id). Użyj złączenia i prostej składni 
-- złączeń wewnętrznych.
SELECT kl_id, zam_data
FROM Zamowienia, ElementyZamowienia
WHERE Zamowienia.zam_numer = ElementyZamowienia.zam_numer
     AND prod_id ='BR01'
ORDER BY zam_data;
-- 4. Napisz instrukcje zwracającą e-maile (kl_email z tabeli Klienci) wszystkich klientów, którzy zakupili produkty o identyfikatorze 
-- (prod_id) BR01. Użyj składni ANSI INNER JOIN.
SELECT kl_email
FROM Klienci
INNER JOIN Zamowienia ON Zamowienia.kl_id = Klienci.kl_id
INNER JOIN ElementyZamowienia ON Zamowienia.zam_numer = ElementyZamowienia.zam_numer
WHERE prod_id = 'BR01';
-- 5. Napisz instrukcję, która za pomocą złączeń zwraca nazwy klientów (kl_nazwa) z tabeli Klienci i wartości ich zamówień z tabeli
-- ElementyZamowienia, dla zamówień o wartości równej 1000 lub więcej.
SELECT kl_nazwa, SUM(cena_elem*ilosc) AS wydatki_razem
FROM Klinci, Zamowienia, ElementyZamowienia
WHERE Klieci.kl_id = Zamowienia.kl_id 
     AND Zamowienia.zam_numer = ElementyZamowienia.zam_numer
GROUP BY kl_nazwa
HAVING  SUM(cena_elem*ilosc) >= 1000
ORDER BY kl_nazwa;
-- drugie rozwiazanie
SELECT kl_nazwa, SUM(cena_elem*ilosc) AS wydatki_razem
FROM Klinci
INNER JOIN Zamowienia ON Klieci.kl_id = Zamowienia.kl_id 
INNER JOIN ElementyZamowienia ON Zamowienia.zam_numer = ElementyZamowienia.zam_numer
GROUP BY kl_nazwa
HAVING  SUM(cena_elem*ilosc) >= 1000
ORDER BY kl_nazwa;
