import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
const SignUpScreen({super.key});

@override
Widget build(BuildContext context) {
Widget buildTextField(String hint, {bool obscure = false}) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 16),
decoration: BoxDecoration(
border: Border.all(color: Colors.white70, width: 1),
borderRadius: BorderRadius.circular(24),
),
child: TextField(
obscureText: obscure,
style: const TextStyle(color: Colors.white),
decoration: InputDecoration(
hintText: hint,
hintStyle: const TextStyle(color: Colors.white70),
border: InputBorder.none,
),
),
);
}


return Scaffold(
  backgroundColor: const Color(0xFF0D1117),
  body: Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Crear Cuenta",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),

          buildTextField("Nombre"),
          const SizedBox(height: 20),
          buildTextField("Apellido Paterno"),
          const SizedBox(height: 20),
          buildTextField("Apellido Materno"),
          const SizedBox(height: 20),
          buildTextField("Correo"),
          const SizedBox(height: 20),
          buildTextField("Teléfono"),
          const SizedBox(height: 20),
          buildTextField("Contraseña", obscure: true),
          const SizedBox(height: 20),
          buildTextField("Confirmar Contraseña", obscure: true),
          const SizedBox(height: 40),

          GestureDetector(
            onTap: () {

            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFF3333),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Registrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              "Volver",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);
}
}



