-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Jun-2022 às 14:31
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `healthfuldb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nomeCategoria` varchar(20) NOT NULL,
  `statusCategoria` varchar(15) NOT NULL,
  `dataInsert` varchar(10) NOT NULL,
  `dataMod` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_postagem`
--

CREATE TABLE `categoria_postagem` (
  `idCategoriaFK` int(11) DEFAULT NULL,
  `idPostagemFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `idComent` int(11) NOT NULL,
  `textoComent` int(11) NOT NULL,
  `statusComent` varchar(15) NOT NULL,
  `dataInsert` varchar(10) NOT NULL,
  `dataMod` varchar(10) NOT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL,
  `idPostagemFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fichausuario`
--

CREATE TABLE `fichausuario` (
  `idFicha` int(11) NOT NULL,
  `idadeUsuario` int(2) NOT NULL,
  `alturaUsuario` int(3) NOT NULL,
  `pesoUsuario` decimal(5,2) NOT NULL,
  `sexoUsuario` varchar(15) NOT NULL,
  `statusFicha` varchar(15) NOT NULL,
  `dataInsert` varchar(10) NOT NULL,
  `dataMod` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagina`
--

CREATE TABLE `pagina` (
  `idPagina` int(11) NOT NULL,
  `nomePagina` varchar(20) NOT NULL,
  `statusPagina` varchar(15) NOT NULL,
  `dataInsert` varchar(10) NOT NULL,
  `dataMod` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagina_postagem`
--

CREATE TABLE `pagina_postagem` (
  `idPaginaFK` int(11) DEFAULT NULL,
  `idPostagemFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagem`
--

CREATE TABLE `postagem` (
  `idPostagem` int(11) NOT NULL,
  `nomePost` int(40) NOT NULL,
  `textoPost` int(11) NOT NULL,
  `statusPost` varchar(15) NOT NULL,
  `dataInsert` varchar(10) NOT NULL,
  `dataMod` varchar(10) NOT NULL,
  `idUsuarioFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomeUsuario` varchar(50) NOT NULL,
  `emailUsuario` varchar(40) NOT NULL,
  `senhaUsuario` varchar(20) NOT NULL,
  `statusUsuario` varchar(15) NOT NULL,
  `nivelUsuario` int(3) NOT NULL,
  `dataInsert` varchar(10) NOT NULL,
  `dataMod` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Índices para tabela `categoria_postagem`
--
ALTER TABLE `categoria_postagem`
  ADD KEY `idCategoriaFK` (`idCategoriaFK`),
  ADD KEY `idPostagemFK` (`idPostagemFK`);

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`idComent`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`),
  ADD KEY `idPostagemFK` (`idPostagemFK`);

--
-- Índices para tabela `fichausuario`
--
ALTER TABLE `fichausuario`
  ADD PRIMARY KEY (`idFicha`);

--
-- Índices para tabela `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`idPagina`);

--
-- Índices para tabela `pagina_postagem`
--
ALTER TABLE `pagina_postagem`
  ADD KEY `idPaginaFK` (`idPaginaFK`),
  ADD KEY `idPostagemFK` (`idPostagemFK`);

--
-- Índices para tabela `postagem`
--
ALTER TABLE `postagem`
  ADD PRIMARY KEY (`idPostagem`),
  ADD KEY `idUsuarioFK` (`idUsuarioFK`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `idComent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fichausuario`
--
ALTER TABLE `fichausuario`
  MODIFY `idFicha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagina`
--
ALTER TABLE `pagina`
  MODIFY `idPagina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `postagem`
--
ALTER TABLE `postagem`
  MODIFY `idPostagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categoria_postagem`
--
ALTER TABLE `categoria_postagem`
  ADD CONSTRAINT `categoria_postagem_ibfk_1` FOREIGN KEY (`idCategoriaFK`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `categoria_postagem_ibfk_2` FOREIGN KEY (`idPostagemFK`) REFERENCES `postagem` (`idPostagem`);

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`idPostagemFK`) REFERENCES `postagem` (`idPostagem`);

--
-- Limitadores para a tabela `pagina_postagem`
--
ALTER TABLE `pagina_postagem`
  ADD CONSTRAINT `pagina_postagem_ibfk_1` FOREIGN KEY (`idPaginaFK`) REFERENCES `pagina` (`idPagina`),
  ADD CONSTRAINT `pagina_postagem_ibfk_2` FOREIGN KEY (`idPostagemFK`) REFERENCES `postagem` (`idPostagem`);

--
-- Limitadores para a tabela `postagem`
--
ALTER TABLE `postagem`
  ADD CONSTRAINT `postagem_ibfk_1` FOREIGN KEY (`idUsuarioFK`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
