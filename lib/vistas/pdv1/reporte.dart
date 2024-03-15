import 'package:flutter/material.dart';
import 'package:pdv2/controlador/venta_controller.dart';

class ReportePage extends StatefulWidget {
  const ReportePage({super.key});

  @override
  State<ReportePage> createState() => _ReportePageState();
}

class _ReportePageState extends State<ReportePage> {
  VentaController ventaController = VentaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ventaController.ventas.isEmpty
          ? const Center(
              child: Text('No hay ventas'),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: ventaController.ventas.length,
                itemBuilder: (context, index) {
                  var venta = ventaController.ventas[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.grey[700],
                    ),
                    child: ListTile(
                      title: Text('Venta #${venta.id}'),
                      leading: Text('\$${venta.total}'),
                      trailing: Text(venta.fecha.split('.')[0]),
                      onTap: () {
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
                                      Text(
                                        'Venta #${venta.id}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        'Fecha: ${venta.fecha.split('.')[0]}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(height: 20),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: venta.productos.length,
                                          itemBuilder: (context, index) {
                                            var fila = venta.productos[index];
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                color: Colors.grey[700],
                                              ),
                                              child: ListTile(
                                                leading: Text(
                                                    '\$${fila.producto.precio}'),
                                                title:
                                                    Text(fila.producto.nombre),
                                                subtitle: Text(
                                                    'Subtotal: \$${fila.subtotal}'),
                                                trailing: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(fila.cantidad
                                                          .toString()),
                                                    ),
                                                  ],
                                                ),
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
