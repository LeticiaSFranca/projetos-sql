-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18-Out-2022 às 17:35
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `atv_hotelaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'chave primária',
  `nome` varchar(80) NOT NULL,
  `cpf` int(14) NOT NULL,
  `Tipo_convenio` varchar(40) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod`, `nome`, `cpf`, `Tipo_convenio`) VALUES
(1, 'Cliente 1', 221583651, 'Particular'),
(2, 'Cliente 2', 221583652, 'Público'),
(3, 'Cliente 3', 221583653, 'Público');

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospede`
--

DROP TABLE IF EXISTS `hospede`;
CREATE TABLE IF NOT EXISTS `hospede` (
  `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'chave primária',
  `nome` varchar(80) NOT NULL,
  `telefone` char(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `hospede`
--

INSERT INTO `hospede` (`cod`, `nome`, `telefone`, `email`) VALUES
(1, 'Hospede 1', '31912345678', 'hospede1@gmail.com'),
(2, 'Hospede 2', '31912345679', 'hospede2@gmail.com'),
(3, 'Hospede 3', '31912345670', 'hospede3@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

DROP TABLE IF EXISTS `quarto`;
CREATE TABLE IF NOT EXISTS `quarto` (
  `cod` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `andar` int(11) NOT NULL,
  `classificacao` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`cod`, `numero`, `andar`, `classificacao`) VALUES
(0, 1, 3, 'Muito Bom'),
(0, 2, 4, 'Muito Ruim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `cod` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `quarto` int(11) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`cod`, `dataInicio`, `dataFim`, `quarto`, `valor`) VALUES
(1, '2022-10-19', '2022-10-20', 1, 0),
(2, '2022-10-10', '2022-10-11', 2, 0),
(3, '2022-10-24', '2022-10-25', 3, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

DROP TABLE IF EXISTS `servicos`;
CREATE TABLE IF NOT EXISTS `servicos` (
  `cod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'chave primária',
  `itens` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `observacao` varchar(100) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`cod`, `itens`, `tipo`, `observacao`) VALUES
(1, 'Item 1', 'Tipo 1', 'Obs 1'),
(2, 'Item 2', 'Tipo 2', 'Obs 2'),
(3, 'Item 3', 'Tipo 3', 'Obs 3'),
(4, 'Item 4', 'Tipo 4', 'Obs 4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_copa`
--

DROP TABLE IF EXISTS `servico_copa`;
CREATE TABLE IF NOT EXISTS `servico_copa` (
  `cod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'chave primária',
  `registro` varchar(100) NOT NULL,
  `tipo_servico` varchar(40) NOT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `servico_copa`
--

INSERT INTO `servico_copa` (`cod`, `registro`, `tipo_servico`) VALUES
(1, 'Registro 1', 'Tipo 1'),
(2, 'Registro 2', 'Tipo 2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
