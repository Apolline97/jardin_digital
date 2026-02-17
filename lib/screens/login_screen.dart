import 'package:flutter/material.dart';
import 'package:jardin_digital/screens/register_screen.dart';
import 'package:jardin_digital/widgets/custom_widgets.dart';
import 'package:jardin_digital/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoJardin(),
              const SizedBox(height: 16),
              const Text(
                'JARDINDIGITAL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF33691E),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: cardDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabelText('Correo'),
                    const CustomTextField(hintText: 'Juanma@gmail.com'),
                    const SizedBox(height: 20),

                    const LabelText('Contraseña'),
                    const CustomTextField(hintText: '••••••', obscureText: true),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                        }, 
                        style: buttonStyle(),
                        child: const Text('Iniciar Sesion', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿Has olvidado la contraseña? ', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const Text('| ', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(
                        color: Color(0xFF689F38), 
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}