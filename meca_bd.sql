create database `mecabd`
default character set utf8
default collate utf8_general_ci;

use `mecabd`

CREATE TABLE `mecanico` (
  `mec_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `mec_nome` varchar(80) NOT NULL,
  `mec_email` varchar(80) NOT NULL,
  `mec_senha` varchar(8) NOT NULL,
  `mec_cpfcnpj` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cliente` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `cli_nome` varchar(60) NOT NULL,
  `cli_celular` varchar(45) DEFAULT NULL,
  `cli_cpfcnpj` varchar(45) DEFAULT NULL,
  `cli_endereco` varchar(60) DEFAULT NULL,
  `mec_id` int(11) NOT NULL,
  INDEX `fk_Cliente_mecanico1` (`mec_id`),
  CONSTRAINT `fk_Cliente_mecanico1` FOREIGN KEY (`mec_id`) REFERENCES `mecanico` (`mec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `peca` (
  `pec_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `pec_nome` varchar(45) DEFAULT NULL,
  `pec_preco` int(11) DEFAULT NULL,
  `pec_qtd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `veiculo` (
  `vei_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `vei_placa` varchar(45) NOT NULL,
  `vei_marca` varchar(45) DEFAULT NULL,
  `vei_modelo` varchar(45) DEFAULT NULL,
  `vei_ano` varchar(45) DEFAULT NULL,
  `cli_id` int(11) NOT NULL,
  INDEX `fk_veiculo_Cliente` (`cli_id`),
  CONSTRAINT `fk_veiculo_Cliente` FOREIGN KEY (`cli_id`) REFERENCES `cliente` (`cli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `registro` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `reg_data` date DEFAULT NULL,
  `reg_precototal` double DEFAULT NULL,
  `reg_descricao` varchar(100) DEFAULT NULL,
  `reg_pago` enum('S','N') NOT NULL DEFAULT 'N',
  `vei_id` int(11) NOT NULL,
  `mec_id` int(11) NOT NULL,
  `reg_excluido` enum('S','N') NOT NULL DEFAULT 'N',
  `reg_observacoes` varchar(5000) DEFAULT NULL,
  INDEX `fk_registro_veiculo1` (`vei_id`),
  INDEX `fk_registro_mecanico1` (`mec_id`),
  CONSTRAINT `fk_registro_mecanico1` FOREIGN KEY (`mec_id`) REFERENCES `mecanico` (`mec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_veiculo1` FOREIGN KEY (`vei_id`) REFERENCES `veiculo` (`vei_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `registroservicopeca` (
  `rsp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `ser_id` int(11) NOT NULL,
  `pec_id` int(11) DEFAULT NULL,
  `reg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `servico` (
  `ser_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `ser_nome` varchar(45) DEFAULT NULL,
  `ser_hora` date DEFAULT NULL,
  `ser_preco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
