<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>testing.cat</title>
    <style>
        /* Todo el CSS integrado para evitar problemas de rutas en SharePoint */
        body {
            margin: 0;
            padding: 0;
            width: 100vw;
            height: 100vh;
            background-color: #7CB9E8; /* Azul Aero */
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, sans-serif;
        }
        .window {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            width: 320px;
            overflow: hidden;
        }
        .titlebar {
            background-color: #f1f5f9;
            padding: 10px 16px;
            border-bottom: 1px solid #e2e8f0;
            font-size: 14px;
            font-weight: 600;
            color: #64748b;
        }
        .content {
            padding: 24px;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }
        .content input {
            padding: 10px 14px;
            border: 2px solid #cbd5e1;
            border-radius: 6px;
            font-size: 16px;
            outline: none;
        }
        .content button {
            background-color: #7CB9E8;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        #resultado {
            font-size: 14px;
            color: #334155;
            text-align: center;
            min-height: 20px;
        }
    </style>
</head>
<body>

    <main class="window">
        <header class="titlebar">
            <span>testing.cat</span>
        </header>
        <section class="content">
            <input type="text" id="nombre" placeholder="Escribe tu nombre">
            <button onclick="saludar()">Saludar</button>
            <div id="resultado"></div>
        </section>
    </main>

    <script>
        // JS integrado con la corrección de HTTPS
        const API_URL = "https://vercel.app";

        async function llamarBackend(nombre) {
            const response = await fetch(
                `${API_URL}/scripts?name=${encodeURIComponent(nombre)}`
            );
            if (!response.ok) {
                throw new Error(`HTTP ${response.status}`);
            }
            return await response.json();
        }

        async function saludar() {
            const nombre = document.getElementById("nombre").value;
            const resultado = document.getElementById("resultado");

            try {
                resultado.textContent = "Conectando...";
                const datos = await llamarBackend(nombre);
                resultado.textContent = datos.resultado;
            } catch (error) {
                console.error(error);
                resultado.textContent = "Error al conectar con el backend.";
            }
        }
    </script>
</body>
</html>
