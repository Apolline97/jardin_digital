import 'package:flutter/material.dart';
import 'package:jardin_digital/models/plant_model.dart';
import 'package:jardin_digital/screens/my_garden_screen.dart'; // Importamos la nueva pantalla
import 'package:jardin_digital/screens/plant_details_screen.dart';
import 'package:jardin_digital/screens/add_plant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // AQUÍ DEFINIMOS QUÉ PANTALLA SE MUESTRA EN CADA PESTAÑA
final List<Widget> _pages = [
    const HomeContent(),      
    const AddPlantScreen(), // <--- ¡AQUÍ ESTÁ EL CAMBIO! ✅
    const MyGardenScreen(),   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // El cuerpo cambia según el índice seleccionado
      body: _pages[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF689F38), // Verde activo
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40), label: ''), // Botón grande
          BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: 'Mi Jardín'),
        ],
      ),
    );
  }
}

// =================================================================
// ESTE ES EL CONTENIDO DE LA PANTALLA DE INICIO (BUSCADOR + REJILLA)
// Lo hemos separado para que el código esté ordenado
// =================================================================

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<String> categories = ['Destacada', 'Pequeñas', 'Bulbosas', 'Interior'];
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0, // Esto evita que se ponga gris al hacer scroll
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // Quita la flecha de atrás si vinieras del login
        title: const Text(
          'JARDINDIGITAL',
          style: TextStyle(
            color: Color(0xFF33691E),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. BARRA DE BÚSQUEDA
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Busca Plantas...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 2. FILTROS (CARRUSEL HORIZONTAL)
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.grey[300] : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 3. TÍTULO "EXPLORAR PLANTAS"
            const Text(
              'Explorar plantas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),

            // 4. REJILLA DE PLANTAS (GRID)
            Expanded(
              child: GridView.builder(
                itemCount: demoPlants.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columnas
                  childAspectRatio: 0.75, // Proporción
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final plant = demoPlants[index];
                  return _PlantCard(plant: plant);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// WIDGET PARA LA TARJETA DE CADA PLANTA EN LA REJILLA
// WIDGET PARA LA TARJETA DE CADA PLANTA EN LA REJILLA
class _PlantCard extends StatelessWidget {
  final Plant plant;

  const _PlantCard({required this.plant});

  @override
  Widget build(BuildContext context) {
    // 1. ENVOLVEMOS TODO EN UN GESTURE DETECTOR PARA DETECTAR EL CLIC
    return GestureDetector(
      onTap: () {
        // 2. NAVEGAMOS A LA PANTALLA DE DETALLES PASANDO LA PLANTA ("this.plant")
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailsScreen(plant: plant),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  plant.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, o, s) => const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
                ),
              ),
            ),
            // Información
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      plant.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF689F38),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}