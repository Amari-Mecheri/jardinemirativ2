import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/widgets/admin/product_row_detail.dart';

import '../../classes/services/product_service.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

//onProduct() {}

class _ProductsListState extends State<ProductsList> {
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
        return Padding(
          padding: const EdgeInsets.only(bottom: 28, top: 28),
          child: Column(
            children: Products()
                .listProducts
                .map(
                  (e) => ProductRowDetail(
                    product: e,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
