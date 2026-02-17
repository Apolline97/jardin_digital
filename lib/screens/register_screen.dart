import 'package:flutter/material.dart';
// Importamos nuestros widgets personalizados
import 'package:jardin_digital/widgets/custom_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _aceptoTerminos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF33691E)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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
                    const LabelText('Nombre'),
                    const CustomTextField(hintText: ''),
                    const SizedBox(height: 15),

                    const LabelText('Correo'),
                    const CustomTextField(hintText: ''),
                    const SizedBox(height: 15),

                    const LabelText('Contraseña'),
                    const CustomTextField(hintText: '', obscureText: true),
                    const SizedBox(height: 15),

                    const LabelText('Fecha de nacimiento'),
                    const CustomTextField(hintText: ''),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: _aceptoTerminos,
                            activeColor: const Color(0xFF689F38),
                            onChanged: (value) {
                              setState(() {
                                _aceptoTerminos = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Acepto términos y condiciones',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {}, 
                        style: buttonStyle(),
                        child: const Text('Registrame', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}