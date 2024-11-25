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
    $fecha = $_POST['fecha'];
    $cantidad = $_POST['cantidad'];
    $metodo_pago = $_POST['metodo_pago'];

    // Separar el nombre y el apellido del cliente
    $nombre_array = explode(' ', $nombre_cliente, 2);
    $nombre_usuario = $nombre_array[0];
    $apellido_usuario = isset($nombre_array[1]) ? $nombre_array[1] : '';

    // Llamar al procedimiento almacenado
    $sql = "CALL insertar_venta(?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $nombre_libro, $nombre_usuario, $apellido_usuario, $fecha, $cantidad, $metodo_pago);

    if ($stmt->execute()) {
        // La salida debe ser después del encabezado de redirección
        header("Location: ../inicio.html");
        exit(); // Asegura que el script termine después de la redirección
    } else {
        echo "Error al añadir la compra: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "El formulario no fue enviado correctamente.";
}

// Cerrar conexión
$conn->close();
