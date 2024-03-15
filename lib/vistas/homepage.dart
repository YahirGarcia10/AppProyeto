import 'package:flutter/material.dart';
import 'package:pdv2/vistas/pdv1/categorias.dart';
import 'package:pdv2/vistas/pdv1/productos.dart';
import 'package:pdv2/vistas/pdv1/reporte.dart';
import 'package:pdv2/vistas/pdv1/venta.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = const <Widget>[
    VentaPage(),
    ProductosPage(),
    CategoriasPage(),
    ReportePage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black87,
        title: const Text(
          'Punto de Venta',
          // style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
      ),
      body: _children.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Venta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reporte',
          ),
        ],
      ),
    );
  }
}
