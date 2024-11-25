<?php
// Datos de conexión a la base de datos
$servername = "localhost:3309";
$username = "insetar_eliminar";
$password = "insetar_eliminar";
$dbname = "versos_en_primavera";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si se envió el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $titulo = $_POST['titulo'];
    $nombre_autor = $_POST['nombre_autor'];
    $fecha_publicacion = $_POST['fecha_publicacion'];
    $numero_paginas = $_POST['numero_paginas'];
    $idioma = $_POST['idioma'];
    $genero = $_POST['genero'];
    $resumen = $_POST['resumen'];
    $precio = $_POST['precio'];
    $id_editorial = $_POST['id_editorial'];
    $portada = $_POST['portada'];

    // Llamar al procedimiento almacenado
    $sql = "CALL insertar_libro(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssisdsdis", $titulo, $nombre_autor, $fecha_publicacion, $numero_paginas, $idioma, $genero, $resumen, $precio, $id_editorial, $portada);

    if ($stmt->execute()) {
        // La salida debe ser después del encabezado de redirección
        header("Location: ../inicio.html");
        exit(); // Asegura que el script termine después de la redirección
    } else {
        echo "Error al añadir el libro: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "El formulario no fue enviado correctamente.";
}

// Cerrar conexión
$conn->close();
