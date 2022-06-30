import 'package:flutter/foundation.dart';

enum Tecnologia {
  Radiofrecuencia,
  Alambrico,
  Rj,
  NoAplica,
}
enum Boton {
  Tactil,
  Mecanico,
  NoAplica,
}

enum Fabricante {
  Boris,
  Somfy,
  Farz,
  NoAplica,
}

class Product {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> decripcion;
  final List<String> accesorios;
  final List<String> medidas;
  final String modoOperacion;
  final List<String> tejido;
  final bool isAutomated;
  final bool isManual;
  final bool isBlackout;
  final bool isTraslucido;
  final bool isSomfy;
  final double ancho;
  final double alto;
  final int lienzos;
  final List<String> precio;
  final int rpm;
  final double torque;
  final Tecnologia tecnologia;
  final Boton boton;
  final Fabricante fabricante;

  const Product({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.decripcion,
    this.accesorios,
    this.medidas,
    this.modoOperacion,
    this.tejido,
    this.isAutomated,
    this.isManual,
    this.isBlackout,
    this.isTraslucido,
    this.isSomfy,
    this.ancho,
    this.alto,
    this.lienzos,
    @required this.precio,
    this.rpm,
    this.torque,
    @required this.tecnologia,
    this.boton,
    @required this.fabricante,
  });
}
