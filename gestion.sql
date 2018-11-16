-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-11-2018 a las 07:12:51
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `idemp` int(3) NOT NULL AUTO_INCREMENT,
  `nomemp` varchar(20) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `ruc` varchar(10) NOT NULL,
  PRIMARY KEY (`idemp`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idemp`, `nomemp`, `direccion`, `ruc`) VALUES
(100, 'Apple.Inc', 'Washintong and Delawer', '1234567890'),
(101, 'IBM', 'el planeta tierra', '1111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
CREATE TABLE IF NOT EXISTS `mantenimiento` (
  `idmant` int(5) NOT NULL AUTO_INCREMENT,
  `coduser` int(100) NOT NULL,
  `codreg` int(5) NOT NULL,
  `coda` int(4) NOT NULL,
  `noma` varchar(200) NOT NULL,
  `cost` float(9,2) NOT NULL,
  `obs` varchar(600) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `imgqr2` varchar(255) NOT NULL,
  PRIMARY KEY (`idmant`),
  KEY `codreg` (`codreg`),
  KEY `coda` (`coda`),
  KEY `coduser` (`coduser`)
) ENGINE=InnoDB AUTO_INCREMENT=80030 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mantenimiento`
--

INSERT INTO `mantenimiento` (`idmant`, `coduser`, `codreg`, `coda`, `noma`, `cost`, `obs`, `estado`, `imgqr2`) VALUES
(80023, 1001, 10029, 7000, 'Estantes de Acero', 164.00, 'Estan oxidados y llenos de moho', '1', '06362910029-7000'),
(80024, 1001, 10029, 7000, 'Estantes de Acero', 0.00, 'No hay espacio en las oficinas, por lo tanto se llevaran al almacen', '4', '06392810029-7000'),
(80027, 1001, 10029, 7000, 'Estantes de Acero', 80.00, 'se reemplazarán por unos nuevos estantes de acero inoxidable', '5', '06470910029-7000'),
(80028, 1000, 10031, 7002, 'Computadora HP', 0.00, 'no tiene fallas que reportar', '3', '06512110031-7002'),
(80029, 1000, 10031, 7002, 'Computadora HP', 2000.00, 'Exploto en plena jornada laboral', '2', '06551210031-7002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `idreg` int(5) NOT NULL AUTO_INCREMENT,
  `iduser` int(100) NOT NULL,
  `idemp` int(3) NOT NULL,
  `coda` int(4) DEFAULT NULL,
  `noma` varchar(100) DEFAULT NULL,
  `fabrica` varchar(200) DEFAULT NULL,
  `prec` float(9,2) DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `imgqr` varchar(10) NOT NULL,
  PRIMARY KEY (`idreg`),
  KEY `iduser` (`iduser`),
  KEY `idemp` (`idemp`),
  KEY `coda` (`coda`)
) ENGINE=InnoDB AUTO_INCREMENT=10033 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`idreg`, `iduser`, `idemp`, `coda`, `noma`, `fabrica`, `prec`, `estado`, `imgqr`) VALUES
(10029, 1001, 101, 7000, 'Estantes de Acero', 'Herrerias Nidavelier S.A.', 1500.00, '5', '1811167000'),
(10030, 1001, 101, 7001, 'Silla de madera nordica', 'Bosques de Narnia S.A.C', 250.00, '0', '1811167001'),
(10031, 1000, 100, 7002, 'Computadora HP', 'HP S.A.', 2500.00, '2', '1811167002'),
(10032, 1000, 100, 7003, 'Impresoras Cannon ', 'Cannon S.A.', 1800.00, '0', '1811167003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `iduser` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cargo` varchar(40) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `codemp` int(3) NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `codemp` (`codemp`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`iduser`, `nombre`, `apellido`, `cargo`, `user`, `clave`, `codemp`) VALUES
(1000, 'Pepe', 'Diaz', 'Gerente', 'pdiaz', '81dc9bdb52d04dc20036dbd8313ed055', 100),
(1001, 'Leonardo', 'Sihuay', 'Analista', 'lsihuay', 'b59c67bf196a4758191e42f76670ceba', 101);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`codreg`) REFERENCES `registro` (`idreg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mantenimiento_ibfk_2` FOREIGN KEY (`coda`) REFERENCES `registro` (`coda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mantenimiento_ibfk_3` FOREIGN KEY (`coduser`) REFERENCES `usuarios` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`idemp`) REFERENCES `empresa` (`idemp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `usuarios` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`codemp`) REFERENCES `empresa` (`idemp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
