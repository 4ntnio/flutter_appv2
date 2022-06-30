import 'package:flutter/material.dart';

class Category {
  final String id;
  final String producto;
  final Color color;

  const Category({
    @required this.id,
    @required this.producto,
    this.color = Colors.orange,
  });
}
