-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14-Abr-2017 às 05:56
-- Versão do servidor: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reserva de vagas`
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

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `Nome`, `Sobrenome`, `Nacionalidade`, `Nascimento`, `Sexo`, `Doc tipo`, `Doc`) VALUES
(1, 'Rafael', 'Trindade', 'Brasil', '1995-07-25', 'M', 'RG', '280178328');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hoteis`
--

CREATE TABLE `hoteis` (
  `id` int(4) NOT NULL,
  `Pais` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'Brasil',
  `Estado` varchar(2) COLLATE latin1_general_ci NOT NULL DEFAULT 'RJ',
  `Cidade` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Rio de Janeiro',
  `Classificação` enum('1','2','3','4','5') COLLATE latin1_general_ci NOT NULL COMMENT 'Estrelas',
  `Local` point NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
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
-- Indexes for table `hoteis`
--
ALTER TABLE `hoteis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Local` (`Local`(25));

--
-- Indexes for table `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`Numero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hoteis`
--
ALTER TABLE `hoteis`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
