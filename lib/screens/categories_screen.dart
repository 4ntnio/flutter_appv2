import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Automatización Farz'),
      ),
      body: Container(
        child: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map(
                (catData) =>
                    CategoryItem(catData.id, catData.producto, catData.color),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 3, //3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
      //Image.asset('assets/images/logoFarz1.png'),
    );
  }
}
