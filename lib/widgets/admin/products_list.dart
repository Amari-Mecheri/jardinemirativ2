import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
//import 'package:jardinemirativ2/widgets/admin/product_row_detail.dart';

import '../../classes/global_static.dart';
import '../../classes/services/product_service.dart';
import '../../models/product.dart';
import '../grid_datasources/product_datagrid.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

//onProduct() {}

class _ProductsListState extends State<ProductsList> {
  late PlutoGridStateManager stateManager;

  PlutoRow? lastRow;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Products()
          .products, //FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (Products().listProducts.isEmpty &&
            (snapshot.connectionState == ConnectionState.waiting)) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 600,
          child: PlutoGrid(
            onLoaded: (event) {
              stateManager = event.stateManager;
              stateManager.addListener(() {
                if (GlobalStatic.onProduct != null &&
                    stateManager.currentRow != null &&
                    stateManager.currentRow != lastRow &&
                    stateManager.currentRow!.cells['productId'] != null) {
                  GlobalStatic.onProduct!(Products()
                      .distinct('productId',
                          stateManager.currentRow!.cells['productId']!.value)
                      .first);
                }
                lastRow = stateManager.currentRow;
                if (!stateManager.hasFocus) lastRow = null;
              });
            },
            columns: ProductGridData().columns,
            rows: ProductGridData().getRows(),
          ),
        );
      },
    );
  }
}
