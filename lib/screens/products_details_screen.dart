import 'package:flutter/material.dart';
import '../dummy_data.dart';

class ProductsDetailScreen extends StatelessWidget {
  static const routeName = '/products-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final selectProduct =
        DUMMY_DESCRIPTION.firstWhere((product) => product.id == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectProduct.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Descripción'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Text(selectProduct.decripcion[index])),
                ),
                itemCount: selectProduct.decripcion.length,
              ),
            ),
            buildSectionTitle(context, 'Accesorios'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectProduct.accesorios[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectProduct.accesorios.length,
              ),
            ),
            buildSectionTitle(context, 'Precios'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectProduct.precio[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectProduct.precio.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
