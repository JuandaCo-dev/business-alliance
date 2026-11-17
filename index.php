<?php
// index.php: CONTROLADOR. Recibe la petición, le pide datos al modelo
// y le pasa el resultado a la vista.
require 'modelo/modelo.php';   // <-- aquí entra el MODELO

// 1. POST: crear, actualizar o eliminar una solicitud
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $accion = $_POST['accion'];

    if ($accion === 'crear') {
        crearSolicitud($conexion, $_POST);
        header('Location: index.php?pagina=gracias&tipo=creado');
        exit;
    }
    if ($accion === 'actualizar') {
        actualizarSolicitud($conexion, $_POST);
        header('Location: index.php?pagina=gracias&tipo=actualizado');
        exit;
    }
    if ($accion === 'eliminar') {
        eliminarSolicitud($conexion, $_POST['id']);
        header('Location: index.php?pagina=solicitudes');
        exit;
    }
}

$pagina     = $_GET['pagina'] ?? 'inicio';
$categorias = listarCategorias($conexion);

// 2. GET: página de gracias después de enviar el formulario
if ($pagina === 'gracias') {
    $tipo = $_GET['tipo'] ?? 'creado';
    require 'vistas/gracias.php';   // <-- aquí entra la VISTA
    exit;
}

// 3. GET: panel de solicitudes (listar, editar y eliminar)
if ($pagina === 'solicitudes') {
    $solicitudes = listarSolicitudes($conexion);
    $editando    = isset($_GET['editar']) ? buscarSolicitud($conexion, $_GET['editar']) : null;
    require 'vistas/solicitudes.php';
    exit;
}

// 4. GET: página de inicio, con filtro de propiedades por categoría
$categoria   = $_GET['categoria'] ?? null;
$propiedades = listarPropiedades($conexion, $categoria);

require 'vistas/inicio.php';
