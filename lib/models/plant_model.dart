class Plant {
  final String name;
  final String category;
  final String imageUrl;
  
  // DATOS PARA "MI JARDÍN"
  final double waterProgress;
  final int daysUntilWater;
  final bool isReadyToWater;

  // NUEVOS DATOS PARA DETALLES
  final String description;
  final List<String> careInstructions; // Lista de puntos (riego, luz, etc.)

  Plant({
    required this.name, 
    required this.category, 
    required this.imageUrl,
    this.waterProgress = 0.5,
    this.daysUntilWater = 0,
    this.isReadyToWater = false,
    this.description = '', // Valor por defecto vacío
    this.careInstructions = const [], // Lista vacía por defecto
  });
}

// ------------------------------------------
// DATOS DE PRUEBA (DUMMY DATA)
// ------------------------------------------

List<Plant> demoPlants = [
  // 1. FICUS
  Plant(
    name: 'Ficus lira', 
    category: 'Interior', 
    imageUrl: 'https://images.unsplash.com/photo-1614594975525-e45190c55d0b?auto=format&fit=crop&w=600&q=80',
    description: 'El Ficus Lyrata es conocido por sus grandes hojas en forma de violín. Es una planta escultural ideal para interiores luminosos.',
    careInstructions: [
      'Luz: Necesita mucha luz indirecta.',
      'Riego: Esperar a que el sustrato se seque.',
      'Humedad: Agradece ser pulverizada.'
    ]
  ),
  
  // 2. AZUCENA (Con los datos de tu foto)
  Plant(
    name: 'Azucena', 
    category: 'Bulbosas', 
    imageUrl: 'https://images.unsplash.com/photo-1596726694668-3e28c3565eb6?auto=format&fit=crop&w=600&q=80',
    description: 'Es una planta bulbosa de la familia de las liliáceas, reconocida principalmente por sus flores grandes en forma de trompeta y su fragancia intensa.',
    careInstructions: [
      'Riego: Riego frecuente para mantener el sustrato húmedo.',
      'Luz: Pleno sol (mínimo 6 horas) o luz brillante indirecta.',
      'Temperatura: Rango ideal de 18°C a 24°C durante crecimiento. Son sensibles a las heladas.',
      'Humedad: Pulverizar hojas si el ambiente es muy seco.',
      'Abonado: Fertilizar dos veces en primavera.'
    ]
  ),

  // 3. IRIS
  Plant(
    name: 'Iris', 
    category: 'Exterior', 
    imageUrl: 'https://images.unsplash.com/photo-1563241527-3075c3f309b5?auto=format&fit=crop&w=600&q=80',
    description: 'El Iris es apreciado por sus flores complejas y coloridas. Simboliza la sabiduría y el valor.',
    careInstructions: ['Luz: Pleno sol.', 'Riego: Moderado.']
  ),
  
  // 4. PALO DE BRASIL
  Plant(
    name: 'Palo de Brasil', 
    category: 'Interior', 
    imageUrl: 'https://images.unsplash.com/photo-1596515867496-e24eb2f86235?auto=format&fit=crop&w=600&q=80',
    description: 'Planta tropical muy resistente, ideal para oficinas y hogares por su capacidad de purificar el aire.',
    careInstructions: ['Luz: Sombra o luz indirecta.', 'Riego: Escaso, sensible al encharcamiento.']
  ),
];

// LISTA DE "MI JARDÍN" (Vaciaremos los datos extra por ahora para no ocupar mucho)
List<Plant> myGardenPlants = [
  demoPlants[1], // Azucena
  demoPlants[0], // Ficus
];