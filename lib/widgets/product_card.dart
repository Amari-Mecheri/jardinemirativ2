import 'package:flutter/material.dart';

import '../classes/services/categorie_service.dart';
import '../classes/services/marque_service.dart';
import '../classes/services/order_service.dart';
import '../consts/colors.dart';
import '../consts/global_variables.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

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
              product.photoUrl,
              height: imageHeight,
              width: width,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 50,
                child: ListView(
                  padding: EdgeInsets.zero,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        product.name,
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
                          product.marqueId.isNotEmpty
                              ? Marques()
                                  .listMarques
                                  .fromId(product.marqueId)
                                  .name
                              : '',
                          style: const TextStyle(
                              fontSize: 10, color: Colors.blueGrey),
                        ),
                        product.likes.isNotEmpty
                            ? Row(
                                children: [
                                  Text(
                                    '${product.likes.length} ',
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
                        product.categorieId.isNotEmpty
                            ? Categories()
                                .listCategories
                                .fromId(product.categorieId)
                                .name
                            : '',
                        style: const TextStyle(
                            fontSize: 10, color: Colors.blueGrey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.genre == "Tous" ? "" : product.genre,
                        style: const TextStyle(
                            fontSize: 10, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Text(
                product.title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: nameFontSize - 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${product.price.toStringAsFixed(2)}€",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.redAccent),
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
                              Orders().addToBasket(product);
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
  }
}
