import 'package:flutter/material.dart';
import 'package:pdv2/vistas/pdv1/almacen.dart';
import 'package:pdv2/vistas/pdv1/categorias.dart';
import 'package:pdv2/vistas/pdv1/productos.dart';
import 'package:pdv2/vistas/pdv1/reporte.dart';
import 'package:pdv2/vistas/pdv1/venta.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // texto STARBUCKS
              const Text(
                'STARBUCKS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  //#32170d
                  color: Color(0xFF41714f),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(250, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductosPage(),
                    ),
                  );
                },
                child: const Text('Productos'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(250, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriasPage(),
                    ),
                  );
                },
                child: const Text('Categorias'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(250, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AlmacenPage(),
                    ),
                  );
                },
                child: const Text('Almacen'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(250, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VentaPage(),
                    ),
                  );
                },
                child: const Text('Ventas'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(250, 50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReportePage(),
                    ),
                  );
                },
                child: const Text('Reporte de ventas'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
