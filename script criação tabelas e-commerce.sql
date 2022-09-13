create database ecommerce;
use ecommerce;

CREATE TABLE `Vendedor` (
`idVendedor` INT NOT NULL,
`RazaoSocial` VARCHAR(45) NULL,
`Local` VARCHAR(45) NULL,
`CNPJ` VARCHAR(45) NULL,
PRIMARY KEY (`idVendedor`));

CREATE TABLE `Fornecedor` (
`idFornecedor` INT NOT NULL,
`RazaoSocial` VARCHAR(45) NULL,
`CNPJ` VARCHAR(45) NULL,
PRIMARY KEY (`idFornecedor`));

CREATE TABLE `Estoque` (
`idEstoque` INT NOT NULL,
`Local` VARCHAR(45) NULL,
PRIMARY KEY (`idEstoque`));

CREATE TABLE `VendedorProduto` (
`Vendedor_idVendedor` INT NOT NULL,
`Produto_idProduto` INT NOT NULL,
`Quantidade` INT NULL,
PRIMARY KEY (`Vendedor_idVendedor`, `Produto_idProduto`),
INDEX `fk_Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC),
INDEX `fk_Vendedor_has_Produto_Vendedor1_idx` (`Vendedor_idVendedor` ASC),
CONSTRAINT `fk_Vendedor_has_Produto_Vendedor1` FOREIGN KEY (`Vendedor_idVendedor`) REFERENCES `Vendedor` (`idVendedor`),
CONSTRAINT `fk_Vendedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`));

CREATE TABLE `Cotacao` (
`Produto_idProduto` INT NOT NULL,
`Fornecedor_idFornecedor` INT NOT NULL,
PRIMARY KEY (`Produto_idProduto`, `Fornecedor_idFornecedor`),
INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC),
INDEX `fk_Produto_has_Fornecedor_Produto_idx` (`Produto_idProduto` ASC),
CONSTRAINT `fk_Produto_has_Fornecedor_Produto` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`),
CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `Fornecedor` (`idFornecedor`));

CREATE TABLE `ProdutoEmEstoque` (
`Produto_idProduto` INT NOT NULL,
`Estoque_idEstoque` INT NOT NULL,
`Quantidade` INT NULL,
PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC),
INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC),
CONSTRAINT `fk_Produto_has_Estoque_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`),
CONSTRAINT `fk_Produto_has_Estoque_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `Estoque` (`idEstoque`));

CREATE TABLE `Produto` (
`idProduto` INT NOT NULL,
`Categoria` VARCHAR(45) NULL,
`Descricao` VARCHAR(45) NULL,
`Valor` DECIMAL(10) NULL,
PRIMARY KEY (`idProduto`));

CREATE TABLE `ProdutoPedido` (
`Produto_idProduto` INT NOT NULL,
`Pedido_idPedido` INT NOT NULL,
`Quantidade` INT NULL,
PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC),
INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC),
CONSTRAINT `fk_Produto_has_Pedido_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`),
CONSTRAINT `fk_Produto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`));

CREATE TABLE `Pedido` (
`idPedido` INT NOT NULL,
`StatusPedido` VARCHAR(45) NULL,
`Descricao` VARCHAR(45) NULL,
`Cliente_idCliente` INT NOT NULL,
`Frete` DECIMAL(5) NULL,
`Status` VARCHAR(45) NULL,
`CodigoRastreio` VARCHAR(45) NULL,
PRIMARY KEY (`idPedido`, `Cliente_idCliente`),
INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC),
CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`));

CREATE TABLE `Cliente` (
`idCliente` INT NOT NULL,
`Nome` VARCHAR(45) NULL,
`CPF` VARCHAR(45) NULL,
`Telefone` VARCHAR(45) NULL,
PRIMARY KEY (`idCliente`));

CREATE TABLE `TipoCliente` (
`idTipoCliente` INT NOT NULL,
`JuridicaCNPJ` CHAR(1) NULL,
`FisicaCPF` CHAR(1) NULL,
PRIMARY KEY (`idTipoCliente`));

CREATE TABLE `TipoPagamento` (
`idTipoPagamento` INT NOT NULL,
`Debito` VARCHAR(45) NULL,
`Credito` VARCHAR(45) NULL,
`Pix` VARCHAR(45) NULL,
`Boleto` VARCHAR(45) NULL,
PRIMARY KEY (`idTipoPagamento`));






















