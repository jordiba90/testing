// CORRECCIÓN: Se añade https:// para evitar el error de conexión
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
        const datos = await llamarBackend(nombre);
        resultado.textContent = datos.resultado;
    } catch (error) {
        console.error(error);
        resultado.textContent = "Error al conectar con el backend.";
    }
}

document.addEventListener("DOMContentLoaded", () => {
    console.log("testing.cat cargado");
});
