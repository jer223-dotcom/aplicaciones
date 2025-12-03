import 'package:flutter/material.dart';
import 'custom_button.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slide = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff222222)),
        title: const Text(
          'Nueva pantalla',
          style: TextStyle(color: Color(0xff222222)),
        ),
        centerTitle: true,
      ),
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
                    "¡Hola! Esta es la nueva pantalla ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      "Aquí puedes colocar información adicional o acciones relacionadas.",
                      style: TextStyle(fontSize: 14, color: Color(0xff666666)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    texto: "Volver",
                    colorFondo: const Color(0xFFFF3333),
                    colorTexto: const Color(0xFFFFFFFF),
                    onPressed: _goBack,
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
