import 'package:flutter/material.dart';
import 'package:jardinemirativ2/models/product.dart';

import '../classes/global_static.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // var heading = '\$2300 per month';
    // var subheading = '2 bed, 1 bath, 1300 sqft';
    // var cardImage = Image.asset('image/products/1.jpg').image;
    // var supportingText =
    //     'Beautiful home to rent, recently refurbished with modern appliances...';
    return SizedBox(
      width: 300,
      //height: 500,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ListTile(
            //   leading: const Icon(Icons.add),
            //   title: const Text('Card title 1'),
            //   subtitle: Text(
            //     'Secondary Text',
            //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.product.description,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Ajouter au panier'),
                ),
                TextButton(
                  onPressed: () {
                    if (GlobalStatic.onMarque != null) {
                      GlobalStatic.onProduct!(widget.product);
                    }
                  },
                  child: const Text('Informations complémentaires'),
                ),
              ],
            ),
            Image.network(widget.product.photoUrl),
          ],
        ),
      ),
    );
    // Card(
    //   elevation: 4.0,
    //   child: SizedBox(
    //     width: 200,
    //     height: 300,
    //     child: Column(
    //       children: [
    //         ListTile(
    //           title: Text(heading),
    //           subtitle: Text(subheading),
    //           trailing: const Icon(Icons.favorite_outline),
    //         ),
    //         Center(
    //           child: Ink.image(
    //             image: cardImage,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.all(16.0),
    //           alignment: Alignment.centerLeft,
    //           child: Text(supportingText),
    //         ),
    //         ButtonBar(
    //           children: [
    //             TextButton(
    //               child: const Text('Ajouter au panier'),
    //               onPressed: () {/* ... */},
    //             ),
    //             TextButton(
    //               child: const Text('En savoir plus'),
    //               onPressed: () {/* ... */},
    //             )
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Image.asset(
    //       'image/products/1.jpg',
    //       height: 140,
    //       width: 70,
    //     ),
    //     const Text(
    //         'Glory de Ahmed al maghribi un parfum oriental/fruité très chic et séduisant à la longue tenue !'),
    //   ],
    // );
  }
}
