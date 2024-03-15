import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const Image(
                image: AssetImage('assets/logo.png'),
                width: 200,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Punto de Venta',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            'Cargando...',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          const CircularProgressIndicator(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
