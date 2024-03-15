import 'package:flutter/material.dart';
import 'package:pdv2/controlador/categoria_controlador.dart';
import 'package:pdv2/vistas/pdv1/productosxcategoria.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  CategoriaControlador categoriaControlador = CategoriaControlador();
  TextEditingController nombreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        body: Column(
          children: [
            categoriaControlador.categorias.isEmpty
                ? const Center(
                    child: Text('No hay categorías'),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: categoriaControlador.categorias.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        categoriaControlador.categorias[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Total: ${categoriaControlador.productos(categoriaControlador.categorias[index]).length} productos',
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductoCategoriaPage(
                                          categoria: categoriaControlador
                                              .categorias[index],
                                          productos:
                                              categoriaControlador.productos(
                                            categoriaControlador
                                                .categorias[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ).then(
                                    (value) {
                                      setState(() {});
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Agregar Categoría'),
                        content: TextField(
                          controller: nombreController,
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              categoriaControlador
                                  .agregarCategoria(nombreController.text);
                              setState(() {});
                              nombreController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Agregar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                  // Navigator.pop(context);
                },
                child: const Text(
                  'Agregar Categoría',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
