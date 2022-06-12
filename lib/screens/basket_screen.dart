import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../classes/services/categorie_service.dart';
import '../classes/services/marque_service.dart';
import '../classes/services/order_service.dart';
import '../classes/services/product_service.dart';
import '../models/product.dart';
import '../widgets/grid_datasources/product_datagrid.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Products().products,
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          return Products().listProducts.isEmpty
              ? const SizedBox(height: 16, child: CircularProgressIndicator())
              : StreamBuilder(
                  stream: Orders()
                      .basketLinesStream, //FirebaseFirestore.instance.collection('products').snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (Orders().basketLines.isEmpty &&
                        (snapshot.connectionState == ConnectionState.waiting)) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      height: 600,
                      child: PlutoGrid(
                        columns: ProductGridData().columns,
                        rows: Orders().basketLines.map(
                          (bl) {
                            Product p =
                                Products().listProducts.fromId(bl.productId);
                            return PlutoRow(
                              cells: {
                                'productId': PlutoCell(value: p.productId),
                                'name': PlutoCell(value: p.name),
                                'title': PlutoCell(value: p.title),
                                'description': PlutoCell(value: p.description),
                                'price': PlutoCell(value: p.price),
                                'marque': PlutoCell(
                                  value: p.marqueId.isNotEmpty
                                      ? Marques()
                                          .listMarques
                                          .fromId(p.marqueId)
                                          .name
                                      : '',
                                ),
                                'categorie': PlutoCell(
                                  value: p.categorieId.isNotEmpty
                                      ? Categories()
                                          .listCategories
                                          .fromId(p.categorieId)
                                          .name
                                      : '',
                                ),
                                'genre': PlutoCell(value: p.genre),
                                'likes': PlutoCell(value: p.likes.length),
                              },
                            );
                          },
                        ).toList(),
                      ),
                    );
                  },
                );
        });
  }
}
