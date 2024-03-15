import 'package:flutter/material.dart';
import 'package:pdv2/controlador/producto_controlador.dart';
import 'package:pdv2/vistas/pdv1/addproducto.dart';
import 'package:pdv2/vistas/pdv1/infoproducto.dart';

class ProductosPage extends StatefulWidget {
  const ProductosPage({super.key});

  @override
  State<ProductosPage> createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  ProductoControlador controlador = ProductoControlador();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: controlador.productos.isEmpty
                  ? const Center(
                      child: Text('No hay productos'),
                    )
                  : ListView.builder(
                      itemCount: controlador.productos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.grey[700],
                          ),
                          child: ListTile(
                            // tileColor: Colors.grey[800],
                            textColor: Colors.white,
                            title: Text(controlador.productos[index].nombre),
                            subtitle:
                                Text(controlador.productos[index].categoria),
                            trailing: Text(
                              '\$${controlador.productos[index].precio}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoProductoPage(
                                    producto: controlador.productos[index],
                                  ),
                                ),
                              ).then((value) {
                                setState(() {});
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductoPage(),
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: const Text(
                  'Agregar un Producto',
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
