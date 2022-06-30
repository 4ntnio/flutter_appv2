//import 'package:catalogue_2020/models/products.dart';
import 'package:catalogue_2020/widgets/products_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryProductsScreen extends StatelessWidget {
  static const routeName = '/category-products';
  // final String categoryId;
  // final String categoryProduct;

  // CategoryProductsScreen(this.categoryId, this.categoryProduct);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryProduct = routeArgs['producto'];
    final categoryId = routeArgs['id'];
    final categoryProducts = DUMMY_DESCRIPTION.where((producto) {
      return producto.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryProduct),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ProductsItem(
            title: categoryProducts[index].title,
            imageUrl: categoryProducts[index].imageUrl,
            id: categoryProducts[index].id,
            ancho: categoryProducts[index].ancho,
            alto: categoryProducts[index].alto,
            lienzos: categoryProducts[index].lienzos,
            tecnologia: categoryProducts[index].tecnologia,
            boton: categoryProducts[index].boton,
          );
        },
        itemCount: categoryProducts.length,
      ),
    );
  }
}
