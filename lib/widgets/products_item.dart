import 'package:catalogue_2020/models/products.dart';
import 'package:catalogue_2020/screens/products_details_screen.dart';
import 'package:flutter/material.dart';

class ProductsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  final double ancho;
  final double alto;
  final int lienzos;
  final Tecnologia tecnologia;
  final Boton boton;
  //final double precio;

  ProductsItem({
    @required this.title,
    @required this.imageUrl,
    @required this.id,
    @required this.ancho,
    @required this.alto,
    @required this.lienzos,
    @required this.tecnologia,
    @required this.boton,
    //@required this.precio,
  });

  String get tecnologiaText {
    switch (tecnologia) {
      case Tecnologia.Alambrico:
        return 'Alámbrico';
        break;
      case Tecnologia.Radiofrecuencia:
        return 'Radiofrecuencia';
        break;
      case Tecnologia.Rj:
        return 'RJ';
        break;
      default:
        return 'Unknown';
    }
  }

  // ignore: missing_return
  String get botonText {
    switch (boton) {
      case Boton.Mecanico:
        return 'Botón mecánico';
        break;
      case Boton.Tactil:
        return 'Táctil';
        break;
      case Boton.NoAplica:
        break;
      default:
        return 'Unknown';
    }
  }

  void selectProduct(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ProductsDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  //para posicionar el texto en la imagen donde yo quiero
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      //Si los textos son demasiados largos, se usan las siguientes
                      //instrucciones para "acomodar" un poco
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      if (ancho == null)
                        Icon(
                          Icons.android,
                          color: Colors.teal,
                        )
                      else
                        Icon(
                          Icons.border_top,
                          color: Colors.teal,
                        ),
                      SizedBox(
                        width: 6,
                      ),
                      if (ancho == null)
                        Text(tecnologiaText)
                      else
                        Text('$ancho m'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      if (alto == null)
                        Icon(
                          Icons.fingerprint,
                          color: Colors.teal,
                        )
                      else
                        Icon(Icons.border_vertical),
                      SizedBox(
                        width: 6,
                      ),
                      if (ancho == null) Text(botonText) else Text('$alto m'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      if (lienzos == null)
                        Icon(Icons.loyalty)
                      else
                        Icon(Icons.crop_square),
                      SizedBox(
                        width: 6,
                      ),
                      if (lienzos == null)
                        Text('.')
                      else
                        Text('$lienzos lienzos')
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
