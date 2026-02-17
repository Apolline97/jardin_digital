import 'package:flutter/material.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  State<AddPlantScreen> createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  // Variables para guardar lo que escribe el usuario
  final _nameController = TextEditingController();
  String? _selectedType;
  DateTime? _lastWateredDate;

  // Lista de tipos de plantas (para el desplegable)
  final List<String> _plantTypes = ['Interior', 'Exterior', 'Cactus', 'Bulbosa', 'Suculenta'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Nueva Planta',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ZONA DE IMAGEN (Placeholder)
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                    ),
                    child: Icon(Icons.camera_alt, size: 50, color: Colors.grey[400]),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF689F38),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 2. FORMULARIO
            const Text("Nombre de tu planta", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: _inputDecoration("Ej: Ficus del salón"),
            ),
            const SizedBox(height: 20),

            const Text("Tipo de planta", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: _inputDecoration("Selecciona el tipo"),
              value: _selectedType,
              items: _plantTypes.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
            const SizedBox(height: 20),

            const Text("¿Cuándo la regaste por última vez?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer( // Evita que salga el teclado, queremos que salga el calendario
                child: TextField(
                  controller: TextEditingController(
                    text: _lastWateredDate == null 
                        ? '' 
                        : "${_lastWateredDate!.day}/${_lastWateredDate!.month}/${_lastWateredDate!.year}"
                  ),
                  decoration: _inputDecoration("Seleccionar fecha").copyWith(
                    suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF689F38)),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 40),

            // 3. BOTÓN GUARDAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // AQUÍ IRÍA LA LÓGICA PARA GUARDAR EN LA BASE DE DATOS
                  // Por ahora solo mostramos un mensaje
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡Planta agregada a tu jardín! 🌱'),
                      backgroundColor: Color(0xFF689F38),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF689F38),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                ),
                child: const Text('Guardar en mi jardín', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para abrir el calendario
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF689F38), // Color verde del calendario
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _lastWateredDate) {
      setState(() {
        _lastWateredDate = picked;
      });
    }
  }

  // Estilo común para los inputs (para no repetir código)
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}