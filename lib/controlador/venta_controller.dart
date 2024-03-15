import 'package:hive/hive.dart';
import 'package:pdv2/modelo/Producto.dart';
import 'package:pdv2/modelo/Venta.dart';

class VentaController {
  final Box _ventaBox = Hive.box('ventas');

  eliminarVentas() {
    _ventaBox.clear();
  }

  List<Venta> get ventas =>
      _ventaBox.values.map((v) => Venta.fromJson(v)).toList();

  List<FilaVenta> productos = [];

  String agregarProducto(String id, int cantidad) {
    var productoBox = Hive.box('productos');

    if (!productoBox.containsKey(id)) {
      return 'Producto no encontrado';
    }

    Producto producto = Producto.fromJson(productoBox.get(id));

    var index = productos.indexWhere((p) => p.producto.id == producto.id);

    if (index == -1) {
      if (cantidad > producto.cantidad) {
        return 'No hay suficiente stock';
      }

      productos.add(FilaVenta(
        producto: producto,
        cantidad: cantidad,
      ));
    } else {
      if (productos[index].cantidad + cantidad < 1) {
        productos.removeAt(index);
        return 'Producto eliminado del carrito';
      }

      if (productos[index].cantidad + cantidad > producto.cantidad) {
        return 'No hay suficiente stock';
      }

      productos[index].cantidad += cantidad;
    }

    return 'Producto agregado al carrito';
  }

  void eliminarProducto(Producto producto) {
    productos.removeWhere((p) => p.producto.id == producto.id);
  }

  void vaciar() {
    productos.clear();
  }

  Venta crearVenta() {
    var venta = Venta(
      id: (ventas.length + 1).toString(),
      productos: productos,
      fecha: DateTime.now().toString(),
    );

    venta.calcularTotal();

    // _ventaBox.put(venta.id, venta.toJson());

    // Box productoBox = Hive.box('productos');

    // for (var fila in productos) {
    //   Producto producto = fila.producto;
    //   producto.cantidad -= fila.cantidad;
    //   productoBox.put(producto.id, producto.toJson());
    // }

    return venta;
  }

  guardarVenta(Venta venta) {
    _ventaBox.put(venta.id, venta.toJson());

    Box productoBox = Hive.box('productos');

    for (var fila in venta.productos) {
      Producto producto = fila.producto;
      producto.cantidad -= fila.cantidad;
      productoBox.put(producto.id, producto.toJson());
    }

    productos.clear();
  }
}
