-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 11-Maio-2017 às 02:58
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "-03:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aps`
--
CREATE DATABASE IF NOT EXISTS `aps` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aps`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acompanhante`
--

CREATE TABLE `acompanhante` (
  `id_ac` int(3) NOT NULL,
  `acompanha_pessoa` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(3) NOT NULL,
  `entrada` date DEFAULT NULL,
  `saida` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id_cont` int(3) NOT NULL,
  `tel` varchar(13) COLLATE latin1_general_ci DEFAULT '(00)0000-0000',
  `Email` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `cel` varchar(14) COLLATE latin1_general_ci DEFAULT '(00)90000-0000',
  `contato_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id_emp` int(3) NOT NULL,
  `Nome` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `porte` enum('pequeno','médio','grande') COLLATE latin1_general_ci NOT NULL,
  `CNPJ` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `empresa_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereço`
--

CREATE TABLE `endereço` (
  `id-end` smallint(6) NOT NULL,
  `Pais` varchar(10) COLLATE latin1_general_ci DEFAULT 'Brasil',
  `Estado` varchar(3) COLLATE latin1_general_ci DEFAULT NULL,
  `Cidade` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Cep` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '00.000-000',
  `end_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_fun` int(3) NOT NULL,
  `fun_pessoa` int(3) NOT NULL,
  `fun_emp` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(3) NOT NULL,
  `Classificação` enum('1 estrela','2 estrelas','3 estrelas','4 estrelas','5 estrelas','6 estrelas') COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(3) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `Email` varchar(21) COLLATE latin1_general_ci DEFAULT 'apoio@park_hostel.com',
  `tel` varchar(13) COLLATE latin1_general_ci DEFAULT '(00)0000-0000',
  `pais` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `Qt_quartos` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `identificação`
--

CREATE TABLE `identificação` (
  `id_id` int(3) NOT NULL,
  `Nome` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `Sobrenome` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `passaporte` varchar(12) COLLATE latin1_general_ci DEFAULT NULL,
  `RG` varchar(12) COLLATE latin1_general_ci DEFAULT '00.000.000-0',
  `ident_pessoa` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id_pessoa` int(3) NOT NULL,
  `pessoa_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `id_quarto` int(3) NOT NULL,
  `Diaria` decimal(5,2) DEFAULT NULL,
  `NumQuarto` int(4) NOT NULL,
  `Andar` smallint(3) DEFAULT NULL,
  `quarto_cliente` int(3) DEFAULT NULL,
  `quarto_hotel` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acompanhante`
--
ALTER TABLE `acompanhante`
  ADD PRIMARY KEY (`id_ac`),
  ADD KEY `id_pessoa` (`acompanha_pessoa`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`id_cont`),
  ADD KEY `id_cliente` (`contato_cliente`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_emp`),
  ADD UNIQUE KEY `CNPJ` (`CNPJ`),
  ADD KEY `id_cliente` (`empresa_cliente`);

--
-- Indexes for table `endereço`
--
ALTER TABLE `endereço`
  ADD PRIMARY KEY (`id-end`),
  ADD KEY `id_cliente` (`end_cliente`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_fun`),
  ADD KEY `id_emp` (`fun_emp`),
  ADD KEY `id_pessoa` (`fun_pessoa`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indexes for table `identificação`
--
ALTER TABLE `identificação`
  ADD PRIMARY KEY (`id_id`),
  ADD UNIQUE KEY `RG` (`RG`),
  ADD UNIQUE KEY `passaporte` (`passaporte`),
  ADD KEY `id_pessoa` (`ident_pessoa`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD KEY `id_cliente` (`pessoa_cliente`);

--
-- Indexes for table `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`id_quarto`),
  ADD KEY `id_cliente` (`quarto_cliente`),
  ADD KEY `id_hotel` (`quarto_hotel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acompanhante`
--
ALTER TABLE `acompanhante`
  MODIFY `id_ac` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `contato`
--
ALTER TABLE `contato`
  MODIFY `id_cont` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_emp` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `endereço`
--
ALTER TABLE `endereço`
  MODIFY `id-end` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_fun` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `identificação`
--
ALTER TABLE `identificação`
  MODIFY `id_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id_pessoa` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `quarto`
--
ALTER TABLE `quarto`
  MODIFY `id_quarto` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
