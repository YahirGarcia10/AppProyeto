import 'package:flutter/material.dart';
import 'package:pdv2/controlador/venta_controller.dart';
import 'package:pdv2/modelo/Venta.dart';

class VentaPage extends StatefulWidget {
  const VentaPage({super.key});

  @override
  State<VentaPage> createState() => _VentaPageState();
}

class _VentaPageState extends State<VentaPage> {
  final VentaController ventaController = VentaController();
  final TextEditingController codigoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ventaController.productos.isEmpty
                  ? const Center(
                      child: Text('No hay productos'),
                    )
                  : ListView.builder(
                      itemCount: ventaController.productos.length,
                      itemBuilder: (context, index) {
                        var fila = ventaController.productos[index];
                        return ListTile(
                          title: Text(fila.producto.nombre),
                          subtitle: Text('\$${fila.subtotal}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.black87,
                                  ),
                                ),
                                onPressed: () {
                                  String salida =
                                      ventaController.agregarProducto(
                                    fila.producto.id,
                                    -1,
                                  );

                                  if (salida == 'No hay suficiente stock') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(salida),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Container(
                                width: 30,
                                alignment: Alignment.center,
                                child: Text(fila.cantidad.toString()),
                              ),
                              IconButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.black87,
                                  ),
                                ),
                                onPressed: () {
                                  String salida =
                                      ventaController.agregarProducto(
                                    fila.producto.id,
                                    1,
                                  );

                                  if (salida == 'No hay suficiente stock') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(salida),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  }
                                  setState(() {});
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                          onTap: () {
                            ventaController.eliminarProducto(fila.producto);
                            setState(() {});
                          },
                        );
                      },
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Buscar producto'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: codigoController,
                                    decoration: const InputDecoration(
                                      labelText: 'Nombre',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      String salida =
                                          ventaController.agregarProducto(
                                        codigoController.text,
                                        1,
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(salida),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                      codigoController.clear();
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Añadir',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Escanear producto',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Venta venta = ventaController.crearVenta();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: const Text('Pagar'),
                                ),
                                body: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: venta.productos.length,
                                          itemBuilder: (context, index) {
                                            var fila = venta.productos[index];
                                            return ListTile(
                                              leading: Text(
                                                  '\$${fila.producto.precio}'),
                                              title: Text(fila.producto.nombre),
                                              subtitle: Text(
                                                  'Subtotal: \$${fila.subtotal}'),
                                              trailing: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    alignment: Alignment.center,
                                                    child: Text(fila.cantidad
                                                        .toString()),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        'Total: \$${venta.total}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          ventaController.guardarVenta(venta);
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Aceptar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                        //
                      },
                      child: const Text(
                        'Ir a pagar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
