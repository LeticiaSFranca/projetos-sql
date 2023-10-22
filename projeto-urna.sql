-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 27-Set-2022 às 17:27
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
-- Banco de dados: `urna_29`
-- Letícia França 2E1

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `endereco` varchar(120) NOT NULL,
  `partido_id_fk` int(11) NOT NULL,
  `cargo_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partido_id_fk` (`partido_id_fk`),
  KEY `cargo_id_fk` (`cargo_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`id`, `nome`, `endereco`, `partido_id_fk`, `cargo_id_fk`) VALUES
(11, 'Gabi', 'Rua machado de assis', 3, 2),
(12, 'gabriel', 'rua olivia', 3, 2),
(13, 'palominha', 'rua nova', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`id`, `nome`, `descricao`) VALUES
(1, 'paula', 'deputada'),
(2, 'gabriel', 'presidente'),
(3, 'osvaldo', 'senador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eleitor`
--

DROP TABLE IF EXISTS `eleitor`;
CREATE TABLE IF NOT EXISTS `eleitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `endereco` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `eleitor`
--

INSERT INTO `eleitor` (`id`, `nome`, `endereco`) VALUES
(1, 'patinhas', 'rua lama'),
(2, 'luna', 'rua apetrechos'),
(3, 'larissa', 'rua luna');

-- --------------------------------------------------------

--
-- Estrutura da tabela `partido`
--

DROP TABLE IF EXISTS `partido`;
CREATE TABLE IF NOT EXISTS `partido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `sigla` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `partido`
--

INSERT INTO `partido` (`id`, `nome`, `sigla`) VALUES
(1, 'partido estrela', 'PE'),
(2, 'partido trabalhista', 'PT'),
(3, 'partido da lua', 'PL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto`
--

DROP TABLE IF EXISTS `voto`;
CREATE TABLE IF NOT EXISTS `voto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `quantidade` int(11) NOT NULL,
  `eleitor_id_fk` int(11) NOT NULL,
  `cargo_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eleitor_id_fk` (`eleitor_id_fk`),
  KEY `cargo_fk_id` (`cargo_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `voto`
--

INSERT INTO `voto` (`id`, `data`, `quantidade`, `eleitor_id_fk`, `cargo_id_fk`) VALUES
(2, '2022-09-04', 12, 1, 3),
(3, '2022-09-09', 55, 3, 1),
(4, '2022-09-09', 50, 2, 2);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `cargo_id_fk` FOREIGN KEY (`cargo_id_fk`) REFERENCES `cargo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `partido_id_fk` FOREIGN KEY (`partido_id_fk`) REFERENCES `partido` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `cargo_fk_id` FOREIGN KEY (`cargo_id_fk`) REFERENCES `cargo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `eleitor_id_fk` FOREIGN KEY (`eleitor_id_fk`) REFERENCES `eleitor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- a) INSERT INTO `candidato` (`id`, `nome`, `endereco`, `partido_id_fk`, `cargo_id_fk`) VALUES
--(11, 'Gabi', 'Rua machado de assis', 3, 2),
--(12, 'gabriel', 'rua olivia', 3, 2),
--(13, 'palominha', 'rua nova', 1, 3); 
--INSERT INTO `cargo` (`id`, `nome`, `descricao`) VALUES 
--(1, 'paula', 'deputada') 
--(2, 'gabriel', 'presidente'), 
--(3, 'osvaldo', 'senador'); 
--INSERT INTO `eleitor` (`id`, `nome`, `endereco`) VALUES
--(1, 'patinhas', 'rua lama'),
--(2, 'luna', 'rua apetrechos'),
--(3, 'larissa', 'rua luna');
--INSERT INTO `partido` (`id`, `nome`, `sigla`) VALUES
--(1, 'partido estrela', 'PE'),
--(2, 'partido trabalhista', 'PT'),
--(3, 'partido da lua', 'PL');
--INSERT INTO `partido` (`id`, `nome`, `sigla`) VALUES
--(1, 'partido estrela', 'PE'),
--(2, 'partido trabalhista', 'PT'),
--(3, 'partido da lua', 'PL');
--INSERT INTO `voto` (`id`, `data`, `quantidade`, `eleitor_id_fk`, `cargo_id_fk`) VALUES
--(2, '2022-09-04', 12, 1, 3),
--(3, '2022-09-09', 55, 3, 1),
--(4, '2022-09-09', 50, 2, 2);

--b) select * from 'voto' where 3 >=10

