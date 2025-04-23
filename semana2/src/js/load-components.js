document.addEventListener('DOMContentLoaded', async () => {
    console.log("✅ DOM completamente cargado");
  
    try {
      // Cambia esta ruta dependiendo de la estructura de tu proyecto
      const headerResponse = await fetch('./templates/header.html'); // o '/templates/header.html'
      if (!headerResponse.ok) throw new Error("Error 404: Header no encontrado");
      const headerHTML = await headerResponse.text();
  
      // Inyecta el contenido del header dentro del div con id "header"
      document.getElementById('header').innerHTML = headerHTML;
      console.log("✅ header cargado exitosamente");
  
      // Dispara el evento 'headerLoaded'
      setTimeout(() => {
        console.log("✅ headerLoaded disparado");
        const event = new CustomEvent('headerLoaded');
        document.dispatchEvent(event);
      }, 50);
  
    } catch (error) {
      console.error("Error crítico:", error);
      alert("Error al cargar el header.");
    }
  });
  
  
  
  
  
  
  // Sistema de valoración con estrellas
  document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.star').forEach(star => {
      star.addEventListener('click', function () {
        const value = this.dataset.value;
  
        // Resaltar las estrellas seleccionadas
        this.parentElement.querySelectorAll('.star').forEach((s, i) => {
          s.classList.toggle('text-yellow-400', i < value);
          s.classList.toggle('text-gray-300', i >= value);
        });
  
        // Guardar en localStorage
        localStorage.setItem('recipe-rating', value);
  
        console.log(`Valoración: ${value} estrellas`);
      });
    });
  });
  
  
  
  