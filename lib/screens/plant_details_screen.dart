import 'package:flutter/material.dart';
import 'package:jardin_digital/models/plant_model.dart'; // Necesitamos esto para añadirla a la lista

class PlantDetailsScreen extends StatelessWidget {
  final Plant plant;

  const PlantDetailsScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar transparente
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF33691E)), // Flecha verde
        centerTitle: true,
        title: const Text(
          'JARDINDIGITAL',
          style: TextStyle(color: Color(0xFF33691E), fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. IMAGEN CON ETIQUETA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      plant.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (c, o, s) => Container(height: 250, color: Colors.grey[200], child: const Icon(Icons.image, color: Colors.grey)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF33691E).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      plant.name,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. DESCRIPCIÓN
                  const Text('Descripción', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    plant.description.isNotEmpty ? plant.description : 'Sin descripción disponible.',
                    style: TextStyle(color: Colors.grey[700], height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // 3. GUÍA DE CUIDADO (Si la tiene)
                  if (plant.careInstructions.isNotEmpty) ...[
                    const Text('Guía de cuidado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ...plant.careInstructions.map((instruction) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Expanded(child: Text(instruction, style: TextStyle(color: Colors.grey[800]))),
                        ],
                      ),
                    )),
                  ],

                  const SizedBox(height: 40),

                  // ==================================================
                  // 4. ¡EL NUEVO BOTÓN DE AGREGAR! ✅
                  // ==================================================
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // --- LA LÓGICA MÁGICA ---
                        
                        // 1. Añadimos la planta a la lista global de "Mi Jardín"
                        // (Como es una simulación, la añadimos tal cual está)
                        myGardenPlants.add(plant);

                        // 2. Mostramos un mensajito de confirmación (SnackBar)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('¡${plant.name} se ha unido a tu jardín! 🌱'),
                            backgroundColor: const Color(0xFF689F38),
                            duration: const Duration(seconds: 2),
                          )
                        );

                        // 3. Volvemos a la pantalla anterior
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF689F38), // Verde corporativo
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline),
                          SizedBox(width: 10),
                          Text('Agregar a Mi Jardín'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}