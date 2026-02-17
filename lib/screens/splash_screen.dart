import 'package:flutter/material.dart';
import 'package:jardin_digital/screens/login_screen.dart';
import 'package:jardin_digital/widgets/custom_widgets.dart'; // Para reusar tu logo

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Esta función es el temporizador
  void _startTimer() async {
    // 1. Esperamos 3 segundos
    await Future.delayed(const Duration(seconds: 3));

    // 2. Comprobamos si la pantalla sigue activa (por seguridad)
    if (!mounted) return;

    // 3. Navegamos al Login (eliminando la Splash del historial para no poder volver atrás)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );

    // NOTA: En el futuro, aquí pondremos un "if" para ver si ya estaba logueado
    // y mandarlo directamente al Home.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Usamos un Transform.scale para hacer el logo un poco más grande aquí
            Transform.scale(
              scale: 1.5, 
              child: const LogoJardin(),
            ),
            const SizedBox(height: 80),
            // Animación de carga (opcional, pero queda bonito)
            const CircularProgressIndicator(
              color: Color(0xFF689F38),
            ),
          ],
        ),
      ),
    );
  }
}