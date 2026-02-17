# 🌱 Jardín Digital

**Jardín Digital** es una aplicación móvil desarrollada en **Flutter** diseñada para ayudar a los amantes de las plantas a gestionar el cuidado de sus cultivos, explorar nuevas especies y llevar un registro de riego.

Actualmente, el proyecto se encuentra en una fase de prototipo funcional con datos locales (Dummy Data).

---

## 📂 Estructura del Proyecto

El código está organizado de forma modular dentro de la carpeta `lib/` para facilitar el mantenimiento y la escalabilidad. Aquí tienes la guía de dónde encontrar cada cosa:

### 1. Raíz (`lib/`)
- **`main.dart`**: Es el punto de entrada de la aplicación. Configura el tema visual (colores, fuentes) y define qué pantalla se muestra primero (actualmente la *Splash Screen*).

### 2. Modelos (`lib/models/`)
- **`plant_model.dart`**: El "cerebro" de los datos.
  - Define la clase `Plant` (con atributos como nombre, foto, frecuencia de riego, etc.).
  - Contiene las **listas de datos de prueba**:
    - `demoPlants`: Plantas que aparecen en el explorador.
    - `myGardenPlants`: Plantas que el usuario ya tiene en su colección personal.

### 3. Pantallas (`lib/screens/`)
Aquí están las interfaces visuales de la app:

- **`splash_screen.dart`**: Pantalla de carga inicial. Muestra el logo durante 3 segundos y redirige automáticamente al Login.
- **`login_screen.dart`**: Pantalla de inicio de sesión. Incluye navegación hacia el registro.
- **`register_screen.dart`**: Formulario para crear una cuenta nueva (Nombre, correo, contraseña, términos).
- **`home_screen.dart`**: **Pantalla Principal**.
  - Gestiona la barra de navegación inferior (BottomNavigationBar).
  - Contiene la pestaña de "Inicio" con el buscador, filtros por categoría y la rejilla (Grid) de plantas sugeridas.
- **`plant_details_screen.dart`**: Ficha técnica de la planta. Se abre al tocar una planta del inicio y permite **agregarla a "Mi Jardín"**.
- **`add_plant_screen.dart`**: Formulario (botón central `+`) para que el usuario registre manualmente una planta nueva, seleccionando tipo y fecha de último riego.
- **`my_garden_screen.dart`**: Pestaña "Mi Jardín". Muestra la lista de plantas del usuario con barras de progreso de riego. *(Nota: Actualmente en modo visualización).*

### 4. Widgets Reutilizables (`lib/widgets/`)
- **`custom_widgets.dart`**: Componentes de diseño compartidos para evitar repetir código, como:
  - `LogoJardin`: El logo circular.
  - `CustomTextField`: Las cajas de texto grises redondeadas.
  - Estilos de botones y tarjetas.

---

## 🚀 Características Actuales

* **Splash Screen Animada:** Entrada suave a la aplicación.
* **Autenticación (UI):** Interfaces limpias para Login y Registro.
* **Explorador de Plantas:** Carrusel de categorías y visualización en cuadrícula.
* **Gestión de "Mi Jardín":**
    * Visualización del estado de riego mediante barras de progreso.
    * Cálculo automático de días restantes para el próximo riego.
* **Agregar Plantas:**
    * Desde el explorador (botón "Agregar a mi jardín").
    * Manualmente mediante formulario con selector de fecha.

---

## 🛠️ Tecnologías

* **Framework:** Flutter (Dart).
* **Diseño:** Material Design 3.
* **Iconos:** Material Icons.

---

## 📝 Próximos Pasos (To-Do)

* [ ] Conectar con una Base de Datos real (Firebase/Supabase).
* [ ] Implementar la función de **Eliminar planta** en la pantalla "Mi Jardín".
* [ ] Añadir lógica real a los botones de "Regar" y "Fertilizar".
* [ ] Sistema de notificaciones Push para avisar del riego.

---
