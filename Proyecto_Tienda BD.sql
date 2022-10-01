-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-09-2022 a las 02:59:02
-- Versión del servidor: 5.6.35
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--
CREATE DATABASE IF NOT EXISTS `facturacion` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `facturacion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `identificacion` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_has_factura`
--

DROP TABLE IF EXISTS `clientes_has_factura`;
CREATE TABLE `clientes_has_factura` (
  `cliente_identificacion` int(10) NOT NULL,
  `factura_num_factura` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `num_factura` int(2) NOT NULL,
  `fecha` date NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `precio_final` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `id_producto` int(2) NOT NULL,
  `cantiadad` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_has_factura`
--

DROP TABLE IF EXISTS `inventario_has_factura`;
CREATE TABLE `inventario_has_factura` (
  `inventario_id_producto` int(2) NOT NULL,
  `f_num_factura` int(2) NOT NULL,
  `cantidad_comprada` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `clientes_has_factura`
--
ALTER TABLE `clientes_has_factura`
  ADD KEY `fk_identificacion_cliente` (`cliente_identificacion`),
  ADD KEY `fk_num_factura` (`factura_num_factura`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`num_factura`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `inventario_has_factura`
--
ALTER TABLE `inventario_has_factura`
  ADD KEY `fk_id_producto` (`inventario_id_producto`),
  ADD KEY `fk_num_fac` (`f_num_factura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `num_factura` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_producto` int(2) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes_has_factura`
--
ALTER TABLE `clientes_has_factura`
  ADD CONSTRAINT `fk_identificacion_cliente` FOREIGN KEY (`cliente_identificacion`) REFERENCES `cliente` (`identificacion`),
  ADD CONSTRAINT `fk_num_factura` FOREIGN KEY (`factura_num_factura`) REFERENCES `factura` (`num_factura`);

--
-- Filtros para la tabla `inventario_has_factura`
--
ALTER TABLE `inventario_has_factura`
  ADD CONSTRAINT `fk_id_producto` FOREIGN KEY (`inventario_id_producto`) REFERENCES `inventario` (`id_producto`),
  ADD CONSTRAINT `fk_num_fac` FOREIGN KEY (`f_num_factura`) REFERENCES `factura` (`num_factura`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
