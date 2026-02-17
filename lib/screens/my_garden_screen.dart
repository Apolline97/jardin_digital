import 'package:flutter/material.dart';
import 'package:jardin_digital/models/plant_model.dart';

class MyGardenScreen extends StatelessWidget {
  const MyGardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false, // ESTO QUITA LA FLECHA DE ATRÁS
        centerTitle: true,
        title: const Text(
          'Mi Jardín', // Nuevo nombre corto
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: myGardenPlants.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final plant = myGardenPlants[index];
          return _MyPlantCard(plant: plant);
        },
      ),
    );
  }
}

class _MyPlantCard extends StatelessWidget {
  final Plant plant;
  const _MyPlantCard({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50], // Fondo gris muy clarito como en la foto
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CABECERA: Nombre y botón X
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plant.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 12,
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 10),

          // BARRA DE PROGRESO
          const Text("Proceso de cuidado", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: plant.waterProgress, // Aquí conectamos con el dato (0.0 a 1.0)
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: const Color(0xFF689F38), // Color verde
            ),
          ),
          
          // TEXTO DÍAS RESTANTES (Alineado a la derecha como en la foto)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12),
              child: Text(
                plant.daysUntilWater == 0 ? "¡Toca regar hoy!" : "Riego en ${plant.daysUntilWater} días",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
          ),

          // BOTONES DE ACCIÓN (Regar / Fertilizar)
          Row(
            children: [
              // Botón Regar
              Expanded(
                child: ElevatedButton(
                  // LÓGICA: Si isReadyToWater es false, onPressed es null (se pone gris solo)
                  onPressed: plant.isReadyToWater ? () {
                    // Acción de regar
                    print("Regando ${plant.name}...");
                  } : null, // null desactiva el botón visualmente
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF689F38),
                    disabledBackgroundColor: Colors.grey[300], // Color cuando está bloqueado
                    disabledForegroundColor: Colors.grey[500],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Regar", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 10),
              
              // Botón Fertilizar (Por ahora usa la misma lógica o una propia)
              Expanded(
                child: ElevatedButton(
                  onPressed: plant.isReadyToWater ? () {} : null, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF689F38),
                    disabledBackgroundColor: Colors.grey[300],
                    disabledForegroundColor: Colors.grey[500],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Fertilizar", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}