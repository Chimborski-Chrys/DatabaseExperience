create database mecanica;
use mecanica;

CREATE TABLE `Cliente` (
`idCliente` INT NOT NULL,
`Nome` VARCHAR(45) NULL,
`CPF` VARCHAR(45) NULL,
`Telefone` VARCHAR(45) NULL,
PRIMARY KEY (`idCliente`));


CREATE TABLE `Veiculo` (
`idVeiculo` INT NOT NULL,
`Placa` VARCHAR(45) NULL,
`Marca` VARCHAR(45) NULL,
`Modelo` VARCHAR(45) NULL,
`Cor` VARCHAR(45) NULL,
`Ano` VARCHAR(45) NULL,
`Cliente_idCliente` INT NOT NULL,
PRIMARY KEY (`idVeiculo`, `Cliente_idCliente`),
INDEX `fk_Veiculo_Cliente1_idx` (`Cliente_idCliente` ASC) ,
CONSTRAINT `fk_Veiculo_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `mydb`.`Cliente` (`idCliente`));

CREATE TABLE `VeiculoOrdemServico` (
`Veiculo_idVeiculo` INT NOT NULL,
`Veiculo_Cliente_idCliente` INT NOT NULL,
`OrdemServico_idOrdemServico` INT NOT NULL,
PRIMARY KEY (`Veiculo_idVeiculo`, `Veiculo_Cliente_idCliente`, `OrdemServico_idOrdemServico`),
INDEX `fk_Veiculo_has_OrdemServico_OrdemServico1_idx` (`OrdemServico_idOrdemServico` ASC),
INDEX `fk_Veiculo_has_OrdemServico_Veiculo1_idx` (`Veiculo_idVeiculo` ASC, `Veiculo_Cliente_idCliente` ASC),
CONSTRAINT `fk_Veiculo_has_OrdemServico_Veiculo1` FOREIGN KEY (`Veiculo_idVeiculo` , `Veiculo_Cliente_idCliente`) REFERENCES `mydb`.`Veiculo` (`idVeiculo` , `Cliente_idCliente`),
CONSTRAINT `fk_Veiculo_has_OrdemServico_OrdemServico1` FOREIGN KEY (`OrdemServico_idOrdemServico`) REFERENCES `mydb`.`OrdemServico` (`idOrdemServico`));

CREATE TABLE `OrdemServico` (
`idOrdemServico` INT NOT NULL,
`DataEntrada` DATETIME NULL,
`DataSaida` DATETIME NULL,
`Status` VARCHAR(45) NULL,
`Valor` DECIMAL(10) NULL,
`Mecanico_idMecanico` INT NOT NULL,
`Pecas_idPecas` INT NOT NULL,
`Valor` DECIMAL(10) NULL,
PRIMARY KEY (`idOrdemServico`, `Mecanico_idMecanico`, `Pecas_idPecas`),
INDEX `fk_OrdemServico_Mecanico1_idx` (`Mecanico_idMecanico` ASC),
INDEX `fk_OrdemServico_Pecas1_idx` (`Pecas_idPecas` ASC),
CONSTRAINT `fk_OrdemServico_Mecanico1` FOREIGN KEY (`Mecanico_idMecanico`) REFERENCES `mydb`.`Mecanico` (`idMecanico`),
CONSTRAINT `fk_OrdemServico_Pecas1` FOREIGN KEY (`Pecas_idPecas`) REFERENCES `mydb`.`Pecas` (`idPecas`));

CREATE TABLE `Pecas` (
`idPecas` INT NOT NULL,
`Descricao` VARCHAR(45) NULL,
`Valor` DECIMAL(10) NULL,
PRIMARY KEY (`idPecas`));


CREATE TABLE `Mecanico` (
`idMecanico` INT NOT NULL,
`Nome` VARCHAR(45) NULL,
`Especialidade` VARCHAR(45) NULL,
`Especialidade_idEspecialidade` INT NOT NULL,
PRIMARY KEY (`idMecanico`, `Especialidade_idEspecialidade`),
INDEX `fk_Mecanico_Especialidade1_idx` (`Especialidade_idEspecialidade` ASC),
CONSTRAINT `fk_Mecanico_Especialidade1` FOREIGN KEY (`Especialidade_idEspecialidade`) REFERENCES `mydb`.`Especialidade` (`idEspecialidade`));

CREATE TABLE `Especialidade` (
`idEspecialidade` INT NOT NULL,
`Descricao` VARCHAR(45) NULL,
PRIMARY KEY (`idEspecialidade`));




