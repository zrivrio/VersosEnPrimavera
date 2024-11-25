<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VERSOS EN PRIMAVERA</title>
    <link rel="stylesheet" href="inicio_productos.css" />
</head>

<body>
    <header>
        <div class="cabecera">
            <img class="logo" src="assets/logo_header.png" alt="logo_intoweb" />
            <img class="boton_cabecera" onclick="anadir()" src="assets/iconos/menu-hamburguesa.png" />
            <div class="container_cabecera">
                <div class="menu">
                    <a href="inicio.html">Inicio</a>
                    <a href="registrolibros.php">Libros</a>
                    <a href="registroescritores.php">Escritores</a>
                    <a href="registroediciones.php">Ediciones</a>
                </div>
                <div class="usuario">
                    <a href="iniciarsesion.html"><img src="assets/iconos/usuario.png" alt="" />
                        <p>Inicio sesion</p>
                    </a>
                    <a href="compra.html"><img src="assets/iconos/carrito-de-compras.png" alt="" />
                        <p>Comprar</p>
                    </a>

                    <a href="anadirproducto.html"><img src="assets/iconos/mas.png" alt="" />
                        <p>Añadir libro</p>
                    </a>
                </div>
            </div>
        </div>
    </header>
    <h1>LIBROS DE VERSOS EN PRIMAVERA</h1>
    <div class="buscador">
        <form action="registroediciones.php" method="get">
            <div class="container_buscador">
                <div>
                    <label for="nombre_edicion">Titulo</label>
                    <input type="text" name="nombre_edicion" id="nombre_edicion">
                    <label for="anno_edicion">Año</label>
                    <input type="number" name="anno_edicion" id="anno_edicion">
                </div>
                <div>
                    <label for="precio">Precio</label>
                    <input type="number" name="precio" id="precio">
                    <label for="id_editorial">Editorial</label>
                    <input type="number" name="id_editorial" id="id_editorial">
                </div>
                <div>
                    <label for="formato">Formato</label>
                    <select name="formato" id="formato">
                        <option value=""> </option>
                        <option value="Tapa dura">Tapa dura</option>
                        <option value="AudioLibro">AudioLibro</option>
                        <option value="Libro de bolsillo">Libro de bolsillo</option>
                    </select>
                </div>
            </div>
            <button type="submit">Buscar</button>
        </form>
    </div>
    
    <div class="container_items">
        <?php
        try {
            $pdo = new PDO("mysql:host=localhost;port=3309;dbname=versos_en_primavera", "root", "");
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Verificar si las claves existen en $_GET y establecer NULL si están vacías
            $nombre_edicion = isset($_GET['nombre_edicion']) ? $_GET['nombre_edicion'] : NULL;
            $anno_edicion = isset($_GET['anno_edicion']) ? $_GET['anno_edicion'] : NULL;
            $precio = isset($_GET['precio']) ? $_GET['precio'] : NULL;
            $formato = isset($_GET['formato']) ? $_GET['formato'] : NULL;
            $id_editorial = isset($_GET['id_editorial']) ? $_GET['id_editorial'] : NULL;

            // Preparar la consulta SQL
            $sql = "CALL mostra_ediciones(:nombre_edicion, :anno_edicion, :formato, :precio, :id_editorial)";

            // Preparar la sentencia
            $stmt = $pdo->prepare($sql);

            // Asignar parámetros
            $stmt->bindValue(':nombre_edicion', !empty($nombre_edicion) ? '%' . htmlspecialchars($nombre_edicion) . '%' : NULL);
            $stmt->bindValue(':anno_edicion', !empty($anno_edicion) ? htmlspecialchars($anno_edicion) : NULL);
            $stmt->bindValue(':precio', !empty($precio) ? htmlspecialchars($precio) : NULL);
            $stmt->bindValue(':formato', !empty($formato) ? htmlspecialchars($formato) : NULL);
            $stmt->bindValue(':id_editorial', !empty($id_editorial) ? htmlspecialchars($id_editorial) : NULL);

            // Ejecutar la consulta
            $stmt->execute();

            // Mostrar resultados
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<div class="item">';
                echo '<figure><img src="' . htmlspecialchars($row['portada']) . '" alt="producto"></figure>';
                echo '<div class="info_productos">';
                echo '<p class="titulo">' . htmlspecialchars($row['nombre_edicion']) . '</p>';
                echo '<div>';
                echo '<p class="subtitulo">' . htmlspecialchars($row['formato']) . '</p>';
                echo '<p class="subtitulo">' . htmlspecialchars($row['anno_edicion']) . '</p>';
                echo '</div>';
                echo '<div class=" precio_boton" >';
                echo '<p class="precio">' . htmlspecialchars($row['precio']) . '</p>';
                echo '<button class="añadir_carrito">Añadir al carrito</button>';
                echo '</div>';
                echo '</div>';
                echo '</div>';
            }
        } catch (PDOException $e) {
            die("Error: " . $e->getMessage());
        }
        ?>
    </div>

    <footer>
        <div class="contenedor_footer">
            <img src="assets/logo_footer.png" alt="">
            <div class="footer_menu">
                <h2>Menú</h2>
                <p>Sobre nosotros</p>
                <p>Colabora con nosotros</p>
                <p>Envia tu manuscrito</p>
                <p>Dondé comprar</p>
                <p>Contacto</p>
            </div>
            <div class="footer_redes">
                <h2>Redes</h2>
                <div><img src="assets/iconos/tik-tok.png" alt=""><a href="https://www.tiktok.com/es/">
                        <p>Tik-Tok</p>
                    </a>
                </div>
                <div><img src="assets/iconos/facebook.png" alt=""><a href="https://www.facebook.com/?locale=es_ES">
                        <p>Facebook</p>
                    </a>
                </div>
                <div><img src="assets/iconos/instagram.png" alt=""><a href="https://www.instagram.com">
                        <p>Instagram</p>
                    </a>
                </div>
                <div><img src="assets/iconos/twitter.png" alt=""><a href="https://x.com/?lang=es">
                        <p>Twitter</p>
                    </a>
                </div>
                <div><img src="assets/iconos/youtube.png" alt=""><a href="https://www.youtube.com">
                        <p>Youtube</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="subfooter">
            <p>© Todos los derechos reservados - </p>
        </div>
    </footer>
    <script src="js/animacion.js"></script>
</body>

</html>
