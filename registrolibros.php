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
        <form action="registrolibros.php" method="get">
            <div class="container_buscador">
            <div>
                <label for="titulo">Titulo</label>
                <input type="text" name="titulo" id="titulo">

                <label for="id_autor">Autor</label>
                <input type="number" name="id_autor" id="id_autor">

                <label for="fecha_publicacion">Fecha Publicacion</label>
                <input type="date" name="fecha_publicacion" id="fecha_publicacion">
                </div>
                <div>
                <label for="numero_paginas">Numero Paginas</label>
                <input type="number" name="numero_paginas" id="numero_paginas">

                <label for="precio">Precio</label>
                <input type="number" name="precio" id="precio">

                <label for="id_editorial">Editorial</label>
                <input type="number" name="id_editorial" id="id_editorial">
                </div>
                <div>
                <label for="idioma">Pais</label>
                <select name="idioma" id="idioma">
                    <option value=""> </option>
                    <option value="Español">Español</option>
                    <option value="Ingles">Ingles</option>
                    <option value="Frances">Frances</option>
                    <option value="Aleman">Aleman</option>
                    <option value="Japones">Japones</option>
                    <option value="Rumano">Rumano</option>
                    <option value="Ruso">Ruso</option>
                    <option value="Hindu">Hindu</option>
                </select>

                <label for="genero">Genero</label>
                <select name="genero" id="genero">
                    <option value=""> </option>
                    <option value="Cuento">Cuento</option>
                    <option value="Misterio">Misterio</option>
                    <option value="Terror">Terror</option>
                    <option value="Juvenil">Juvenil</option>
                    <option value="Drama">Drama</option>
                    <option value="Aventura">Aventura</option>
                    <option value="Ficción">Ficción</option>
                    <option value="Fantasia">Fantasia</option>
                    <option value="Romance">Romance</option>
                    <option value="Romantasy">Romantasy</option>
                </select>
                </div>

            </div>
            <button type="submit">BUSCAR</button>
        </form>
    </div>
    <div class="container_items">
        <?php
        try {
            $pdo = new PDO("mysql:host=localhost;port=3309;dbname=versos_en_primavera", "consultar_productos", "consultar_productos");
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Verificar si las claves existen en $_GET
            $titulo = isset($_GET['titulo']) ? $_GET['titulo'] : '';
            $id_autor = isset($_GET['id_autor']) ? $_GET['id_autor'] : '';
            $fecha_publicacion = isset($_GET['fecha_publicacion']) ? $_GET['fecha_publicacion'] : '';
            $numero_paginas = isset($_GET['numero_paginas']) ? $_GET['numero_paginas'] : '';
            $idioma = isset($_GET['idioma']) ? $_GET['idioma'] : '';
            $genero = isset($_GET['genero']) ? $_GET['genero'] : '';
            $precio = isset($_GET['precio']) ? $_GET['precio'] : '';
            $id_editorial = isset($_GET['id_editorial']) ? $_GET['id_editorial'] : '';

            // Preparar la consulta SQL
            $sql = "CALL mostra_libros(:titulo, :id_autor, :fecha_publicacion, :numero_paginas, :idioma, :genero, :precio, :id_editorial)";

            // Preparar la sentencia
            $stmt = $pdo->prepare($sql);

            // Asignar parámetros
            $stmt->bindValue(':titulo', '%' . htmlspecialchars($titulo) . '%');
            $stmt->bindValue(':id_autor', htmlspecialchars($id_autor));
            $stmt->bindValue(':fecha_publicacion', htmlspecialchars($fecha_publicacion));
            $stmt->bindValue(':numero_paginas', htmlspecialchars($numero_paginas));
            $stmt->bindValue(':idioma', htmlspecialchars($idioma));
            $stmt->bindValue(':genero', htmlspecialchars($genero));
            $stmt->bindValue(':precio', htmlspecialchars($precio) );
            $stmt->bindValue(':id_editorial', htmlspecialchars($id_editorial));

            // Ejecutar la consulta
            $stmt->execute();

            // Mostrar resultados
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<div class="item">';
                echo '<figure><img src="' . htmlspecialchars($row['portada']) . '" alt="producto"></figure>';
                echo '<div class="info_productos">';
                echo '<p class="titulo">' . htmlspecialchars($row['titulo']) .'</p>';
                echo '<div>';
                echo '<p class="subtitulo">' . htmlspecialchars($row['genero']) . '</p>';
                echo '<p class="subtitulo">' . htmlspecialchars($row['idioma']) . '</p>';
                echo '</div>';
                echo '<p class="descripcion">' . htmlspecialchars($row['descripcion']) . '</p>';
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