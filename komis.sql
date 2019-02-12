-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Lis 2018, 21:12
-- Wersja serwera: 10.1.35-MariaDB
-- Wersja PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `komis`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `auto`
--

CREATE TABLE `auto` (
  `id_auto` int(10) UNSIGNED NOT NULL,
  `WLASCICIEL_id_wlasciciel` int(10) UNSIGNED NOT NULL,
  `marka` varchar(15) DEFAULT NULL,
  `model` varchar(15) DEFAULT NULL,
  `VIN` char(17) DEFAULT NULL,
  `rok` year(4) DEFAULT NULL,
  `kolor` varchar(10) DEFAULT NULL,
  `metalic` tinyint(1) DEFAULT NULL,
  `opis` text,
  `FK_wlasciciel` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `auto`
--

INSERT INTO `auto` (`id_auto`, `WLASCICIEL_id_wlasciciel`, `marka`, `model`, `VIN`, `rok`, `kolor`, `metalic`, `opis`, `FK_wlasciciel`) VALUES
(1, 1, 'opel', 'omega', '156', 1996, 'czerwony', 1, 'sprawny', 1),
(2, 2, 'peugeot', '206', '127', 2000, 'szary', 0, 'uszkodzony', 2),
(3, 3, 'Renault', 'Megane', '421', 1997, 'niebieski', 0, 'sprawny', 3),
(4, 4, 'fiat', '126p', '621', 1987, 'bialy', 0, 'sprawny', 4),
(5, 5, 'opel', 'corsa', '712', 1997, 'czarny', 0, 'sprawny', 5),
(6, 6, 'vw', 'golf', '241', 1995, 'srebrny', 0, 'sprawny', 6),
(7, 7, 'renault', 'clio', '753', 2006, 'czerwony', 0, 'uszkodzony', 7),
(8, 8, 'fiat', 'seicento', '561', 1998, 'srebrny', 0, 'uszkodzony', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktury`
--

CREATE TABLE `faktury` (
  `idfaktury` int(10) UNSIGNED NOT NULL,
  `SPRZEDARZ_KLIENT_id_klient` int(10) UNSIGNED NOT NULL,
  `SPRZEDARZ_id_SPRZEDARZ` int(10) UNSIGNED NOT NULL,
  `nr_faktura` int(10) UNSIGNED DEFAULT NULL,
  `kwota_faktura` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `faktury`
--

INSERT INTO `faktury` (`idfaktury`, `SPRZEDARZ_KLIENT_id_klient`, `SPRZEDARZ_id_SPRZEDARZ`, `nr_faktura`, `kwota_faktura`) VALUES
(1, 1, 1, 1, 5000),
(2, 2, 2, 2, 9300),
(3, 3, 3, 3, 6500),
(4, 4, 4, 4, 800),
(5, 5, 5, 5, 3500),
(6, 6, 6, 6, 4500),
(7, 7, 7, 7, 15000),
(8, 8, 8, 8, 5000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `id_klient` int(10) UNSIGNED NOT NULL,
  `Nazwisko` varchar(20) DEFAULT NULL,
  `Imie` varchar(15) DEFAULT NULL,
  `PESEL` int(10) UNSIGNED DEFAULT NULL,
  `Miejscowosc` varchar(15) DEFAULT NULL,
  `Ulica` varchar(25) DEFAULT NULL,
  `nr_dom` int(10) UNSIGNED DEFAULT NULL,
  `nr_lokal` int(10) UNSIGNED DEFAULT NULL,
  `kod_pocztowy` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`id_klient`, `Nazwisko`, `Imie`, `PESEL`, `Miejscowosc`, `Ulica`, `nr_dom`, `nr_lokal`, `kod_pocztowy`) VALUES
(1, 'wojciechowski', 'rafal', 1010101011, 'stara obra', 'witosa', 55, 0, 63),
(2, 'swidurski', 'piotr', 4294967295, 'boguszyn', 'jakas', 11, 11, 63),
(4, 'szczerban', 'michal', 4294967295, 'zalesie', 'hhh', 66, 7, 63),
(5, 'dolata', 'michal', 4294967295, 'galew', 'jakas', 45, 5, 63),
(6, 'reslinski', 'zbyszek', 4294967295, 'witaszyce', 'glowna', 55, 1, 63),
(7, 'swidurski', 'lukasz', 4294967295, 'siedlemin', 'glowna', 3, 1, 63),
(8, 'trawinski', 'robert', 4294967295, 'kozmin wlkp.', 'weckiego', 33, 2, 63);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedaz`
--

CREATE TABLE `sprzedaz` (
  `id_sprzedaz` int(11) NOT NULL DEFAULT '0',
  `KLIENT_id_klient` int(10) UNSIGNED NOT NULL,
  `AUTO_WLASCICIEL_id_wlasciciel` int(10) UNSIGNED NOT NULL,
  `AUTO_id_auto` int(10) UNSIGNED NOT NULL,
  `data_2` int(10) UNSIGNED DEFAULT NULL,
  `wartosc` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sprzedaz`
--

INSERT INTO `sprzedaz` (`id_sprzedaz`, `KLIENT_id_klient`, `AUTO_WLASCICIEL_id_wlasciciel`, `AUTO_id_auto`, `data_2`, `wartosc`) VALUES
(1, 1, 1, 1, 10, 5000),
(2, 2, 2, 2, 1, 9300),
(3, 3, 3, 3, 6, 6500),
(4, 4, 4, 4, 5, 800),
(5, 5, 5, 5, 4, 3500),
(6, 6, 6, 6, 18, 4500),
(7, 7, 7, 7, 14, 15000),
(8, 8, 8, 8, 22, 5000);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlasciciel`
--

CREATE TABLE `wlasciciel` (
  `id_wlasciciel` int(10) UNSIGNED NOT NULL,
  `Nazwisko` varchar(20) DEFAULT NULL,
  `Imie` varchar(15) DEFAULT NULL,
  `PESEL` int(10) UNSIGNED DEFAULT NULL,
  `Miejscowosc` varchar(15) DEFAULT NULL,
  `Ulica` varchar(25) DEFAULT NULL,
  `nr_dom` int(10) UNSIGNED DEFAULT NULL,
  `nr_lokal` int(10) UNSIGNED DEFAULT NULL,
  `kod_pocztowy` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wlasciciel`
--

INSERT INTO `wlasciciel` (`id_wlasciciel`, `Nazwisko`, `Imie`, `PESEL`, `Miejscowosc`, `Ulica`, `nr_dom`, `nr_lokal`, `kod_pocztowy`) VALUES
(1, 'wojciechowski', 'rafal', 1010101011, 'stara obra', 'witosa', 55, 0, 63),
(2, 'swidurski', 'piotr', 4294967295, 'boguszyn', 'jakas', 11, 11, 63),
(3, 'zdunek', 'slawek', 4294967295, 'jarocin', 'leszczyce', 31, 1, 63),
(4, 'szczerban', 'michal', 4294967295, 'zalesie', 'hhh', 66, 7, 63),
(5, 'dolata', 'michal', 4294967295, 'galew', 'jakas', 45, 5, 63),
(6, 'reslinski', 'zbyszek', 4294967295, 'witaszyce', 'glowna', 55, 1, 63),
(7, 'swidurski', 'lukasz', 4294967295, 'siedlemin', 'glowna', 3, 1, 63),
(8, 'trawinski', 'robert', 4294967295, 'kozmin wlkp.', 'weckiego', 33, 2, 63);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id_auto`,`WLASCICIEL_id_wlasciciel`),
  ADD KEY `AUTO_FKIndex1` (`WLASCICIEL_id_wlasciciel`);

--
-- Indeksy dla tabeli `faktury`
--
ALTER TABLE `faktury`
  ADD PRIMARY KEY (`idfaktury`,`SPRZEDARZ_KLIENT_id_klient`,`SPRZEDARZ_id_SPRZEDARZ`),
  ADD KEY `faktury_FKIndex1` (`SPRZEDARZ_id_SPRZEDARZ`,`SPRZEDARZ_KLIENT_id_klient`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`id_klient`);

--
-- Indeksy dla tabeli `sprzedaz`
--
ALTER TABLE `sprzedaz`
  ADD PRIMARY KEY (`id_sprzedaz`,`KLIENT_id_klient`),
  ADD KEY `SPRZEDARZ_FKIndex1` (`KLIENT_id_klient`),
  ADD KEY `SPRZEDARZ_FKIndex2` (`AUTO_id_auto`,`AUTO_WLASCICIEL_id_wlasciciel`);

--
-- Indeksy dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  ADD PRIMARY KEY (`id_wlasciciel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `auto`
--
ALTER TABLE `auto`
  MODIFY `id_auto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `faktury`
--
ALTER TABLE `faktury`
  MODIFY `idfaktury` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `id_klient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  MODIFY `id_wlasciciel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
