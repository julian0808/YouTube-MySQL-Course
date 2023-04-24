-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 06, 2023 at 04:05 PM
-- Server version: 8.0.32-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RedesPlus2`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cliente`
--

CREATE TABLE `Cliente` (
  `dni` char(9) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL,
  `fechaNac` date NOT NULL,
  `tlfn` char(9) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci COMMENT='Información de los clientes de la Tienda';

-- --------------------------------------------------------

--
-- Table structure for table `Compras`
--

CREATE TABLE `Compras` (
  `dniCliente` char(9) COLLATE utf8mb3_spanish_ci NOT NULL,
  `codProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Producto`
--

CREATE TABLE `Producto` (
  `codigo` int NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `precio` float NOT NULL,
  `nifProveedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Proveedor`
--

CREATE TABLE `Proveedor` (
  `nif` int NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `Compras`
--
ALTER TABLE `Compras`
  ADD PRIMARY KEY (`dniCliente`,`codProducto`),
  ADD KEY `FK_codProducto` (`codProducto`);

--
-- Indexes for table `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `FK_nifProveedor` (`nifProveedor`);

--
-- Indexes for table `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`nif`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Compras`
--
ALTER TABLE `Compras`
  ADD CONSTRAINT `FK_codProducto` FOREIGN KEY (`codProducto`) REFERENCES `Producto` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_dniCliente` FOREIGN KEY (`dniCliente`) REFERENCES `Cliente` (`dni`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `FK_nifProveedor` FOREIGN KEY (`nifProveedor`) REFERENCES `Proveedor` (`nif`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
