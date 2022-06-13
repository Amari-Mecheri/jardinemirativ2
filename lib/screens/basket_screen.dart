import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/widgets/product_basket_card.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../classes/global_static.dart';
import '../classes/services/categorie_service.dart';
import '../classes/services/marque_service.dart';
import '../classes/services/order_service.dart';
import '../classes/services/product_service.dart';
import '../models/product.dart';
import '../widgets/footer.dart';
import '../widgets/grid_datasources/product_datagrid.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IntrinsicHeight(
                child: Stack(
                  children: [
                    ClipRect(
                      child: Transform.scale(
                        scaleX: 1.18,
                        scaleY: 1.19,
                        origin: const Offset(0.49, 0.56),
                        child: Container(
                          //constraints: const BoxConstraints.expand(),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: GlobalStatic.backgroundImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                        bottom: 20,
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 28,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 28, top: 28),
                              child: StreamBuilder(
                                  stream: Products().products,
                                  builder: (context,
                                      AsyncSnapshot<
                                              QuerySnapshot<
                                                  Map<String, dynamic>>>
                                          snapshot) {
                                    return Products().listProducts.isEmpty
                                        ? const SizedBox(
                                            height: 16,
                                            child: CircularProgressIndicator())
                                        : StreamBuilder(
                                            stream: Orders()
                                                .basketLinesStream, //FirebaseFirestore.instance.collection('products').snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<
                                                        QuerySnapshot<
                                                            Map<String,
                                                                dynamic>>>
                                                    snapshot) {
                                              if (Orders()
                                                      .basketLines
                                                      .isEmpty &&
                                                  (snapshot.connectionState ==
                                                      ConnectionState
                                                          .waiting)) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              return Wrap(
                                                direction: Axis.horizontal,
                                                alignment:
                                                    WrapAlignment.spaceAround,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: Orders()
                                                    .basketLines
                                                    .map((bl) {
                                                  Product p = Products()
                                                      .listProducts
                                                      .fromId(bl.productId);
                                                  return ProductBasketCard(
                                                      product: p);
                                                }).toList(),
                                              );
                                            },
                                          );
                                  }),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const SizedBox(
                              height: 68,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Footer(),
        ],
      ),
    );
  }
}
