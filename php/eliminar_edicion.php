<?php
// Datos de conexión
$servername = "localhost:3309";
$username = "insetar_eliminar";
$password = "insetar_eliminar";
$dbname = "versos_en_primavera";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titulo_libro = $_POST["titulo_libro"];
    $nombre_edicion = $_POST["nombre_edicion"];

    // Preparar y vincular
    $stmt = $conn->prepare("CALL eliminar_edicion(?, ?)");
    if ($stmt === false) {
        die("Error al preparar la consulta: " . $conn->error);
    }

    $stmt->bind_param("ss", $titulo_libro, $nombre_edicion);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        // La salida debe ser después del encabezado de redirección
        header("Location: ../inicio.html");
        exit(); // Asegura que el script termine después de la redirección
    } else {
        echo "Error al eliminar la edición: " . $stmt->error;
    }

    // Cerrar la declaración
    $stmt->close();
}

// Cerrar conexión
$conn->close();