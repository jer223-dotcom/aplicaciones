import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'custom_button.dart';
import 'login.dart';
import 'sign_up.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  String locationText = "Presiona 'Obtener ubicación' para mostrarla";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getLocation() async {
    try {
      setState(() => locationText = "Obteniendo ubicación...");

      // Verifica si el servicio de ubicación está activo
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => locationText = "El GPS está desactivado");
        return;
      }

      // Verifica permisos
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => locationText = "Permiso de ubicación denegado");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => locationText =
            "Permiso permanentemente denegado. Actívalo desde ajustes.");
        return;
      }

      // Obtener la ubicación actual
      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        locationText = "Lat: ${pos.latitude.toStringAsFixed(6)}, "
            "Lon: ${pos.longitude.toStringAsFixed(6)}";
      });
    } catch (e) {
      setState(() => locationText = "Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slide,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Bienvenido",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff333333),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Texto donde se muestra la ubicación
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      locationText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff666666),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Botón personalizado para obtener ubicación
                  CustomButton(
                    texto: "Obtener ubicación",
                    colorFondo: const Color(0xff3333FF),
                    colorTexto: const Color(0xffffffff),
                    onPressed: _getLocation,
                  ),

                  const SizedBox(height: 40),

                  CustomButton(
                    texto: "Iniciar Sesión",
                    colorFondo: const Color(0xff3333FF),
                    colorTexto: const Color(0xffffffff),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 25),

                  CustomButton(
                    texto: "Registrarse",
                    colorFondo: const Color(0xff333333),
                    colorTexto: const Color(0xffffffff),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



