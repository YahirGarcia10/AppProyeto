import 'package:flutter/material.dart';
import 'package:pdv2/vistas/homepage.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdv2/vistas/inicio.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('productos');

  await Hive.openBox('categorias');

  await Hive.openBox('ventas');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool inicio = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          // New code
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey[700]),
          ),
        ),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () => 'Cargando...'),
        builder: (context, snapshot) {
          if (inicio == false &&
              snapshot.connectionState == ConnectionState.waiting) {
            inicio = true;
            return const InicioPage();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
