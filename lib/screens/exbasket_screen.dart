import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/services/order_service.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../classes/services/product_service.dart';
import '../classes/services/categorie_service.dart';
import '../classes/services/marque_service.dart';
import '../models/product.dart';
import '../widgets/grid_datasources/product_datagrid.dart';

class BasketScreen2 extends StatefulWidget {
  const BasketScreen2({Key? key}) : super(key: key);

  @override
  State<BasketScreen2> createState() => _BasketScreen2State();
}

class _BasketScreen2State extends State<BasketScreen2> {
  late PlutoGridStateManager stateManager;

  PlutoRow? lastRow;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders()
          .basketLinesStream, //FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (Orders().basketLines.isEmpty &&
            (snapshot.connectionState == ConnectionState.waiting)) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 600,
          child: PlutoGrid(
            // onLoaded: (event) {
            //   stateManager = event.stateManager;
            //   stateManager.addListener(() {
            //     if (GlobalStatic.onProduct != null &&
            //         stateManager.currentRow != null &&
            //         stateManager.currentRow != lastRow &&
            //         stateManager.currentRow!.cells['productId'] != null) {
            //       GlobalStatic.onProduct!(Products()
            //           .distinct('productId',
            //               stateManager.currentRow!.cells['productId']!.value)
            //           .first);
            //     }
            //     lastRow = stateManager.currentRow;
            //     if (!stateManager.hasFocus) lastRow = null;
            //   });
            // },
            columns: ProductGridData().columns,
            rows: Orders().basketLines.map(
              (bl) {
                Product p = Products().listProducts.fromId(bl.productId);
                return PlutoRow(
                  cells: {
                    'productId': PlutoCell(value: p.productId),
                    'name': PlutoCell(value: p.name),
                    'title': PlutoCell(value: p.title),
                    'description': PlutoCell(value: p.description),
                    'price': PlutoCell(value: p.price),
                    'marque': PlutoCell(
                      value: p.marqueId.isNotEmpty
                          ? Marques().listMarques.fromId(p.marqueId).name
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
  }
}
