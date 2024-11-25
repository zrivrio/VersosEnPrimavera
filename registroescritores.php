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
    <h1>BUSCADOR</h1>
    <div class="buscador_escritores">
        <form action="registroescritores.php" method="get">
            <div class="container_buscador_escritores">
                
                <label for="nombre">Nombre</label>
                <input type="text" name="nombre" id="nombre">
                
                <label for="apellido">Apellido</label>
                <input type="text" name="apellido" id="apellido">
                
                <label for="nacionalidad">Pais</label>
                <select name="nacionalidad" id="nacionalidad">
                    <option value=""> </option>
                    <option value="Mexico">Mexico</option>
                    <option value="Argentina">Argentina</option>
                    <option value="Colombia">Colombia</option>
                    <option value="Chile">Chile</option>
                    <option value="Peru">Peru</option>
                    <option value="Venezuela">Venezuela</option>
                    <option value="Uruguay">Uruguay</option>
                    <option value="Paraguay">Paraguay</option>
                    <option value="Bolivia">Bolivia</option>
                    <option value="Panama">Panama</option>
                    <option value="Salvador">Salvador</option>
                    <option value="Hondura">Hondura</option>
                    <option value="Costa Rica">Costa Rica</option>
                    <option value="Nicaragüa">Nicaragüa</option>
                    <option value="Guatemala">Guatemala</option>
                    <option value="Republica Dominicana">Republica Dominicana</option>
                    <option value="Puerto Rico">Puerto Rico</option>
                    <option value="España">España</option>
                    <option value="Cuba">Cuba</option>
                </select>
            </div>
            <button type="submit">BUSCAR</button>
        </form>
    </div>
    
    <h1>ESCRITORES DE VERSOS EN PRIMAVERA</h1>
    <div class="container_items">
        <?php
        try {
            $pdo = new PDO("mysql:host=localhost;port=3309;dbname=versos_en_primavera", "root", "");
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Verificar si las claves existen en $_GET
            $nombre = isset($_GET['nombre']) ? $_GET['nombre'] : '';
            $apellido = isset($_GET['apellido']) ? $_GET['apellido'] : '';
            $nacionalidad = isset($_GET['nacionalidad']) ? $_GET['nacionalidad'] : '';

            // Preparar la consulta SQL
            $sql = "CALL mostra_escritores(:nombre, :apellido, :nacionalidad)";

            // Preparar la sentencia
            $stmt = $pdo->prepare($sql);

            // Asignar parámetros
            $stmt->bindValue(':nombre', '%' . htmlspecialchars($nombre) . '%');
            $stmt->bindValue(':apellido', htmlspecialchars($apellido));
            $stmt->bindValue(':nacionalidad', htmlspecialchars($nacionalidad));

            // Ejecutar la consulta
            $stmt->execute();

            // Mostrar resultados
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo '<div class="item">';
                echo '<figure><img src="' . htmlspecialchars($row['fotografia']) . '" alt="producto"></figure>';
                echo '<div class="info_productos">';
                echo '<p class="titulo">' . htmlspecialchars($row['nombre']) . ' ' . htmlspecialchars($row['apellido']) . '</p>';
                echo '<p class="subtitulo">' . htmlspecialchars($row['nacionalidad']) . '</p>';
                echo '</div>';
                echo '</div>';
            }
        } catch (PDOException $e) {
            die("Error: " . $e->getMessage());
        }
        ?>

    </div>

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
    </footer>
    <div class="subfooter">
        <p>© Todos los derechos reservados - </p>
    </div>
    </footer>
    <script src="js/animacion.js"></script>
</body>

</html>