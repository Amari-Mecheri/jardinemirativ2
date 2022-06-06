import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/services/categorie_service.dart';
import 'package:jardinemirativ2/models/product.dart';

import '../classes/services/marque_service.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      //height: 500,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                widget.product.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: widget.product.marqueId.isNotEmpty
                  ? Text(
                      Marques()
                          .listMarques
                          .fromId(widget.product.marqueId)
                          .name,
                      style: const TextStyle(color: Colors.blueGrey),
                    )
                  : const Text(""),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: widget.product.categorieId.isNotEmpty
                  ? Text(
                      Categories()
                          .listCategories
                          .fromId(widget.product.categorieId)
                          .name,
                      style: const TextStyle(color: Colors.blueGrey),
                    )
                  : const Text(""),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  widget.product.genre == "Tous" ? "" : widget.product.genre),
            ),
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
                widget.product.title,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // ButtonBar(
            //   alignment: MainAxisAlignment.start,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         // Perform some action
            //       },
            //       child: const Text('Ajouter au panier'),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         if (GlobalStatic.onMarque != null) {
            //           GlobalStatic.onProduct!(widget.product);
            //         }
            //       },
            //       child: const Text('Informations complémentaires'),
            //     ),
            //   ],
            // ),
            Image.network(widget.product.photoUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.product.price.toStringAsFixed(2)}€",
                      style: const TextStyle(
                          fontSize: 16, color: Colors.redAccent),
                    ),
                    Row(
                      children: [
                        const VerticalDivider(
                          width: 10,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Icon(Icons.add_shopping_cart,
                                color: Colors.green)),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
