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
    $titulo_libro = $_POST['libro'];
    $nombre_edicion = $_POST['nombre_edicion'];
    $anno_edicion = $_POST['anno_edicion'];
    $formato = $_POST['formato'];
    $precio = $_POST['precio'];
    $id_editorial = $_POST['id_editorial'];
    $portada = $_POST['portada'];

    // Llamar al procedimiento almacenado
    $sql = "CALL insertar_edicion(?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssisdis", $titulo_libro, $nombre_edicion, $anno_edicion, $formato, $precio, $id_editorial, $portada);

    if ($stmt->execute()) {
        // La salida debe ser después del encabezado de redirección
        header("Location: ../inicio.html");
        exit(); // Asegura que el script termine después de la redirección
    } else {
        echo "Error al añadir la edición: " . $stmt->error;
    }

    $stmt->close();
} else {
    echo "El formulario no fue enviado correctamente.";
}

// Cerrar conexión
$conn->close();
