-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 21-Abr-2017 às 21:46
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aps-bd2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acompanhante`
--

CREATE TABLE `acompanhante` (
  `id_ac` int(3) NOT NULL,
  `id_pessoa` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `acompanhante`
--

INSERT INTO `acompanhante` (`id_ac`, `id_pessoa`) VALUES
(1, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(3) NOT NULL,
  `entrada` date DEFAULT NULL,
  `saida` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `entrada`, `saida`) VALUES
(1, '2017-04-01', '2017-04-04'),
(2, '2017-04-12', '2017-04-16'),
(3, '2017-04-11', '2017-04-13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contato`
--

CREATE TABLE `contato` (
  `id_cont` int(3) NOT NULL,
  `tel` varchar(13) COLLATE latin1_general_ci DEFAULT '(00)0000-0000',
  `Email` varchar(25) COLLATE latin1_general_ci DEFAULT NULL,
  `cel` varchar(14) COLLATE latin1_general_ci DEFAULT '(00)90000-0000',
  `id_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `contato`
--

INSERT INTO `contato` (`id_cont`, `tel`, `Email`, `cel`, `id_cliente`) VALUES
(1, '(35)2456-8765', 'amanda225@gmail.com', '(35)98245-8765', 1),
(2, '(24)3274-5456', 'brunosan12@gmail.com', '(24)99876-5456', 2),
(3, '(13)2478-5500', 'contato@santosfc.com', NULL, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE `empresa` (
  `id_emp` int(3) NOT NULL,
  `Nome` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `porte` enum('pequeno','médio','grande') COLLATE latin1_general_ci NOT NULL,
  `CNPJ` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `id_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id_emp`, `Nome`, `porte`, `CNPJ`, `id_cliente`) VALUES
(1, 'Santos FC', 'grande', '123.456-78', 3);

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
  `id_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `endereço`
--

INSERT INTO `endereço` (`id-end`, `Pais`, `Estado`, `Cidade`, `Cep`, `id_cliente`) VALUES
(1, 'Brasil', 'MG', 'Belo Horizonte', '12.654-741', 1),
(2, 'Brasil', 'RJ', 'Petropolis', '21.753-951', 2),
(3, 'Brasil', 'SP', 'Samtos', '12.105-241', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_fun` int(3) NOT NULL,
  `id_pessoa` int(3) NOT NULL,
  `id_emp` int(3) NOT NULL
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

--
-- Extraindo dados da tabela `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `Classificação`, `estado`, `cidade`, `Email`, `tel`, `pais`, `Qt_quartos`) VALUES
(1, '4 estrelas', 'RJ', 'Rio de Janeiro', 'apoio@park_hostel.com', '(21)3354-9492', 'Brasil', 10);

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
  `id_pessoa` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `identificação`
--

INSERT INTO `identificação` (`id_id`, `Nome`, `Sobrenome`, `passaporte`, `RG`, `id_pessoa`) VALUES
(1, 'Amanda', 'Miranda', NULL, '28.032.787-4', 1),
(2, 'Bruno', 'Santos', '1452.3654.75', '18.798.452-0', 2),
(3, 'Alice', 'Miranda', NULL, '29.478.824-3', 3),
(4, 'Clarissa', 'Santos', '1455.679.246', '27.737.952-1', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id_pessoa` int(3) NOT NULL,
  `id_cliente` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id_pessoa`, `id_cliente`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `id_quarto` int(3) NOT NULL,
  `Diaria` decimal(5,2) DEFAULT NULL,
  `NumQuarto` int(4) NOT NULL,
  `Andar` smallint(3) DEFAULT NULL,
  `id_cliente` int(3) DEFAULT NULL,
  `id_hotel` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`id_quarto`, `Diaria`, `NumQuarto`, `Andar`, `id_cliente`, `id_hotel`) VALUES
(1, '223.00', 101, 1, 1, 1),
(2, '223.00', 102, 1, NULL, 1),
(3, '254.00', 201, 2, NULL, 1),
(4, '254.00', 202, 2, NULL, 1),
(5, '285.00', 301, 3, NULL, 1),
(6, '285.00', 302, 3, NULL, 1),
(7, '305.00', 401, 4, 2, 1),
(8, '305.00', 402, 4, NULL, 1),
(9, '315.00', 501, 5, NULL, 1),
(10, '315.00', 502, 5, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acompanhante`
--
ALTER TABLE `acompanhante`
  ADD PRIMARY KEY (`id_ac`),
  ADD KEY `id_pessoa` (`id_pessoa`);

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
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_emp`),
  ADD UNIQUE KEY `CNPJ` (`CNPJ`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `endereço`
--
ALTER TABLE `endereço`
  ADD PRIMARY KEY (`id-end`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_fun`),
  ADD KEY `id_emp` (`id_emp`),
  ADD KEY `id_pessoa` (`id_pessoa`);

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
  ADD KEY `id_pessoa` (`id_pessoa`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id_pessoa`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`id_quarto`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acompanhante`
--
ALTER TABLE `acompanhante`
  MODIFY `id_ac` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contato`
--
ALTER TABLE `contato`
  MODIFY `id_cont` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_emp` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `endereço`
--
ALTER TABLE `endereço`
  MODIFY `id-end` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_fun` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `identificação`
--
ALTER TABLE `identificação`
  MODIFY `id_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id_pessoa` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `quarto`
--
ALTER TABLE `quarto`
  MODIFY `id_quarto` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
