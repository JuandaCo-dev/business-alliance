-- Base de datos del proyecto Business Alliance (inmobiliaria comercial)
-- 1. En phpMyAdmin crea la base de datos "business_alliance" con cotejamiento utf8mb4_general_ci
-- 2. Selecciónala, entra a la pestaña Importar y elige este archivo

CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  imagen VARCHAR(255) NOT NULL
);

CREATE TABLE propiedades (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  ciudad VARCHAR(60) NOT NULL,
  area INT NOT NULL,
  precio DECIMAL(14,2) NOT NULL,
  operacion ENUM('Sale','Rent') NOT NULL,
  imagen VARCHAR(255) NOT NULL,
  categoria_id INT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE solicitudes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  empresa VARCHAR(80) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  categoria_id INT NOT NULL,
  mensaje TEXT NOT NULL,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Datos de prueba
INSERT INTO categorias (nombre, imagen) VALUES
('Office spaces', 'https://al-zawiyaksa.com/wp-content/uploads/2026/04/Z1111.jpg'),
('Warehouse spaces', 'https://images.adsttc.com/media/images/5012/9d59/28ba/0d67/1700/0945/slideshow/stringio.jpg?1361332347'),
('Land plots', 'img/land-plots.jpg');

INSERT INTO propiedades (titulo, ciudad, area, precio, operacion, imagen, categoria_id) VALUES
('Corporate office, 12th floor', 'Bogotá', 320, 18500000, 'Rent', 'https://al-zawiyaksa.com/wp-content/uploads/2026/04/Z1111.jpg', 1),
('Office building on 100th Street', 'Bogotá', 2400, 9800000000, 'Sale', 'https://al-zawiyaksa.com/wp-content/uploads/2026/04/Z1111.jpg', 1),
('Logistics warehouse in Free Trade Zone', 'Bogotá', 1800, 42000000, 'Rent', 'https://images.adsttc.com/media/images/5012/9d59/28ba/0d67/1700/0945/slideshow/stringio.jpg?1361332347', 2),
('Distribution center', 'Medellín', 5200, 12500000000, 'Sale', 'https://images.adsttc.com/media/images/5012/9d59/28ba/0d67/1700/0945/slideshow/stringio.jpg?1361332347', 2),
('Industrial land plot in Funza', 'Funza', 10000, 6200000000, 'Sale', 'img/land-plots.jpg', 3),
('Land plot on main road', 'Cali', 4500, 3100000000, 'Sale', 'img/land-plots.jpg', 3);

INSERT INTO solicitudes (nombre, empresa, correo, telefono, categoria_id, mensaje) VALUES
('Carlos Rojas', 'Rojas Logistics', 'carlos@rojaslogistica.com', '3104567890', 2, 'We are looking for a 1,500 m² warehouse near 13th Street.'),
('María Gómez', 'Studio MG', 'maria@studiomg.co', '3209876543', 1, 'We need an office for 30 people in north Bogotá.');
