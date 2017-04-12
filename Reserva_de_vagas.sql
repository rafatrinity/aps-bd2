-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 12-Abr-2017 às 18:29
-- Versão do servidor: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.13-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Reserva de vagas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `Nome` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Sobrenome` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Nacionalidade` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'Brasil',
  `Nascimento` date NOT NULL,
  `Sexo` enum('M','F') COLLATE latin1_general_ci DEFAULT NULL,
  `Doc tipo` enum('RG','PASSPORT') COLLATE latin1_general_ci NOT NULL DEFAULT 'RG',
  `Doc` varchar(10) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Hoteis`
--

CREATE TABLE `Hoteis` (
  `id` int(4) NOT NULL,
  `Pais` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'Brasil',
  `Estado` varchar(2) COLLATE latin1_general_ci NOT NULL DEFAULT 'RJ',
  `Cidade` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Rio de Janeiro',
  `Classificação` enum('1','2','3','4','5') COLLATE latin1_general_ci NOT NULL COMMENT 'Estrelas',
  `Local` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Quarto`
--

CREATE TABLE `Quarto` (
  `Numero` int(4) NOT NULL,
  `Tipo` enum('Casal','Grupo') COLLATE latin1_general_ci NOT NULL DEFAULT 'Casal',
  `Lotação` int(2) NOT NULL,
  `Diaria` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Doc` (`Doc`);

--
-- Indexes for table `Hoteis`
--
ALTER TABLE `Hoteis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Local` (`Local`(25));

--
-- Indexes for table `Quarto`
--
ALTER TABLE `Quarto`
  ADD PRIMARY KEY (`Numero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Hoteis`
--
ALTER TABLE `Hoteis`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
