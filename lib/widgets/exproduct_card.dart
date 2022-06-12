import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/services/categorie_service.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:jardinemirativ2/models/product.dart';

import '../classes/services/marque_service.dart';
import '../classes/services/order_service.dart';
import '../consts/colors.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double width = 200;
    double height = 320;
    double imageHeight = 200;
    double priceSpace = 30;
    double nameFontSize = 14;
    if (MediaQuery.of(context).size.width < minScreenSize) {
      width = 150;
      height = 270;
      imageHeight = 150;
      priceSpace = 10;
      nameFontSize = 12;
    }
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: Colors.grey.shade100,
        shadowColor: Colors.brown,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(
              widget.product.photoUrl,
              height: imageHeight,
              width: width,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 45,
                child: ListView(
                  padding: EdgeInsets.zero,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        widget.product.name,
                        style: TextStyle(
                            fontSize: nameFontSize,
                            fontWeight: FontWeight.bold,
                            color: webActiveMenuBar2),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.marqueId.isNotEmpty
                              ? Marques()
                                  .listMarques
                                  .fromId(widget.product.marqueId)
                                  .name
                              : '',
                          style: const TextStyle(
                              fontSize: 10, color: Colors.blueGrey),
                        ),
                        widget.product.likes.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    '${widget.product.likes.length} ',
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.blueGrey),
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    size: 12,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.categorieId.isNotEmpty
                            ? Categories()
                                .listCategories
                                .fromId(widget.product.categorieId)
                                .name
                            : '',
                        style: const TextStyle(
                            fontSize: 10, color: Colors.blueGrey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.genre == "Tous"
                            ? ""
                            : widget.product.genre,
                        style: const TextStyle(
                            fontSize: 10, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.product.title,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: nameFontSize - 1),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.product.price.toStringAsFixed(2)}€",
                      style: const TextStyle(
                          fontSize: 16, color: Colors.redAccent),
                    ),
                    SizedBox(
                      width: priceSpace,
                    ),
                    Row(
                      children: [
                        const VerticalDivider(
                          width: 10,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: priceSpace,
                        ),
                        InkWell(
                            onTap: () {
                              Orders().addToBasket(widget.product);
                            },
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
