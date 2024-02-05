-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-02-2024 a las 17:06:53
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler_inmuebles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id_caracteristica`, `nombre`) VALUES
(1, 'Número de habitaciones'),
(2, 'Número de baños'),
(3, 'Tamaño'),
(4, 'Precio'),
(5, 'Amenidades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id_contrato` int NOT NULL,
  `id_propiedad` int DEFAULT NULL,
  `id_inquilino` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `duracion_meses` int DEFAULT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  `monto_abonado` decimal(10,2) DEFAULT NULL,
  `monto_restante` decimal(10,2) GENERATED ALWAYS AS ((`monto_total` - `monto_abonado`)) STORED,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id_contrato`, `id_propiedad`, `id_inquilino`, `fecha_inicio`, `duracion_meses`, `monto_total`, `monto_abonado`, `estado`) VALUES
(1, 1, 1, '2024-03-01', 12, 1500.00, 0.00, 'activo'),
(3, 4, 2, '2024-02-15', 18, 2000.00, 500.00, 'activo'),
(4, 3, 3, '2024-03-15', 12, 1200.00, 1200.00, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `id_inquilino` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inquilinos`
--

INSERT INTO `inquilinos` (`id_inquilino`, `nombre`, `apellido`, `email`, `telefono`) VALUES
(1, 'Maria', 'Gomez', 'maria.gomez@example.com', '+987654321'),
(2, 'Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', '+1122334455'),
(3, 'Ana', 'Lopez', 'ana.lopez@example.com', '+5566778899');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `id_propiedad` int NOT NULL,
  `tipo_propiedad` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `estado` varchar(20) NOT NULL DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`id_propiedad`, `tipo_propiedad`, `nombre`, `direccion`, `descripcion`, `estado`) VALUES
(1, 'Casa', 'Casa de Campo', '456 Calle Tranquila', 'Una encantadora casa de campo con jardín', 'reservado'),
(2, 'Edificio', 'Edificio de Oficinas', '789 Avenida Principal', 'Moderno edificio de oficinas con excelentes instalaciones', 'disponible'),
(3, 'Tienda', 'Tienda Céntrica', '321 Calle Comercial', 'Amplia tienda en el corazón de la ciudad', 'disponible'),
(4, 'Casa', 'Apartamento Moderno', '101 Calle Urbana', 'Apartamento moderno con todas las comodidades', 'ocupado'),
(5, 'Edificio', 'Complejo Residencial', '555 Avenida Residencial', 'Complejo residencial con piscina y áreas verdes', 'ocupado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades_caracteristicas`
--

CREATE TABLE `propiedades_caracteristicas` (
  `id_propiedad_caracteristica` int NOT NULL,
  `id_propiedad` int DEFAULT NULL,
  `id_caracteristica` int DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `propiedades_caracteristicas`
--

INSERT INTO `propiedades_caracteristicas` (`id_propiedad_caracteristica`, `id_propiedad`, `id_caracteristica`, `valor`) VALUES
(1, 1, 1, '3'),
(2, 1, 2, '2'),
(3, 1, 3, '200 m²'),
(4, 2, 4, '8000.00'),
(5, 3, 5, 'Piscina, Gimnasio'),
(6, 2, 2, '10'),
(7, 2, 3, '1000 m²'),
(8, 4, 1, '2'),
(9, 4, 2, '2'),
(10, 4, 4, '1500.00'),
(11, 5, 5, 'Piscina, Áreas verdes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id_caracteristica`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `id_propiedad` (`id_propiedad`),
  ADD KEY `id_inquilino` (`id_inquilino`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`id_inquilino`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`id_propiedad`);

--
-- Indices de la tabla `propiedades_caracteristicas`
--
ALTER TABLE `propiedades_caracteristicas`
  ADD PRIMARY KEY (`id_propiedad_caracteristica`),
  ADD KEY `id_propiedad` (`id_propiedad`),
  ADD KEY `id_caracteristica` (`id_caracteristica`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`id_propiedad`) REFERENCES `propiedades` (`id_propiedad`),
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`id_inquilino`) REFERENCES `inquilinos` (`id_inquilino`);

--
-- Filtros para la tabla `propiedades_caracteristicas`
--
ALTER TABLE `propiedades_caracteristicas`
  ADD CONSTRAINT `propiedades_caracteristicas_ibfk_1` FOREIGN KEY (`id_propiedad`) REFERENCES `propiedades` (`id_propiedad`),
  ADD CONSTRAINT `propiedades_caracteristicas_ibfk_2` FOREIGN KEY (`id_caracteristica`) REFERENCES `caracteristicas` (`id_caracteristica`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
