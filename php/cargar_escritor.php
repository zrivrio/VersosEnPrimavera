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


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $fecha_nacimiento = $_POST['fecha_nacimiento'];
    $nacionalidad = $_POST['nacionalidad'];
    $fotografia = $_POST['fotografia'];



    // Llamar al procedimiento almacenado
    $sql = "CALL insertar_autor(?, ?, ?, ?,?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $nombre, $apellido, $fecha_nacimiento, $nacionalidad, $fotografia);

    if ($stmt->execute()) {
        // La salida debe ser después del encabezado de redirección
        header("Location: ../inicio.html");
        exit(); // Asegura que el script termine después de la redirección
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
} else {
    echo "Error: No se han recibido datos mediante el método POST.";
}

