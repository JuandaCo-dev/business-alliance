# Business Alliance

Réplica de un diseño de Pinterest: sitio de una inmobiliaria de inmuebles comerciales.
Proyecto de Desarrollo web y móvil.

## Tecnologías
- PHP 8 con patrón MVC y PDO
- MariaDB / phpMyAdmin
- Bootstrap 5
- Swiper (carrusel) y AOS (animaciones)

## Estructura
```
business-alliance/
├── index.php            controlador
├── conexion.php         datos de la base de datos
├── modelo/modelo.php    modelo (consultas SQL)
├── vistas/              vistas (HTML)
├── css/  js/  img/
├── libs/aos/            librería AOS instalada
└── base_datos/business_alliance.sql
```

## Cómo correrlo en XAMPP
1. Copiar la carpeta `business-alliance` dentro de `C:\xampp\htdocs`.
2. En phpMyAdmin crear la base de datos `business_alliance` (utf8mb4_general_ci).
3. Pestaña Importar → elegir `base_datos/business_alliance.sql` → Importar.
4. Abrir `http://localhost/business-alliance`.
