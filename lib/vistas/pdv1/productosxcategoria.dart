import 'package:flutter/material.dart';
import 'package:pdv2/modelo/Producto.dart';
import 'package:pdv2/vistas/pdv1/infoproducto.dart';

class ProductoCategoriaPage extends StatefulWidget {
  final String categoria;
  final List<Producto> productos;
  const ProductoCategoriaPage(
      {super.key, required this.productos, required this.categoria});

  @override
  State<ProductoCategoriaPage> createState() => _ProductoCategoriaPageState();
}

class _ProductoCategoriaPageState extends State<ProductoCategoriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria),
      ),
      body: widget.productos.isEmpty
          ? const Center(
              child: Text('No hay productos'),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.productos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return InfoProductoPage(
                          producto: widget.productos[index],
                        );
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.productos[index].nombre,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Precio: ${widget.productos[index].precio}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
