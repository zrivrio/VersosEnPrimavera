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
    $nombre_libro = $_POST['nombre_libro'];
    $nombre_cliente = $_POST['nombre_cliente'];

    // Llamar al procedimiento almacenado
    $sql = "CALL eliminar_venta(?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $nombre_libro, $nombre_cliente);

    if ($stmt->execute()) {
        // La salida debe ser después del encabezado de redirección
        header("Location: ../inicio.html");
        exit(); // Asegura que el script termine después de la redirección
    } else {
        echo "Error al eliminar la compra: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "El formulario no fue enviado correctamente.";
}

// Cerrar conexión
$conn->close();
