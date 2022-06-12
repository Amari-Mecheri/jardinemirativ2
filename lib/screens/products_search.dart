import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/services/product_service.dart';
import 'package:jardinemirativ2/widgets/dropdowns/dropdown_categorie.dart';
import 'package:jardinemirativ2/widgets/dropdowns/dropdown_marque.dart';

import '../classes/global_static.dart';
import '../classes/services/categorie_service.dart';
import '../classes/services/marque_service.dart';
import '../consts/global_variables.dart';
import '../models/categorie.dart';
import '../models/marque.dart';
import '../models/product.dart';
import '../widgets/dropdowns/dropdown_genre.dart';
import '../widgets/footer.dart';
import '../widgets/product_card.dart';

class ProducsSearch extends StatefulWidget {
  const ProducsSearch({Key? key}) : super(key: key);

  @override
  State<ProducsSearch> createState() => _ProducsSearchState();
}

class _ProducsSearchState extends State<ProducsSearch> {
  void onMarque(Marque data) async {
    GlobalStatic.searchScreenMarque = data;
  }

  void onGenre(Gender data) async {
    GlobalStatic.searchScreenGenre = data.name.capitalize();
  }

  void onCategorie(Categorie data) async {
    GlobalStatic.searchScreenCategorie = data;
  }

  void setDropDowns() {
    GlobalStatic.onMarque = onMarque;
    GlobalStatic.onCategorie = onCategorie;
    GlobalStatic.onGenre = onGenre;
  }

  @override
  void initState() {
    setDropDowns();
    super.initState();
  }

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
                            Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              direction: Axis.horizontal,
                              runSpacing: 8.0,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceAround,
                              // mainAxisSize: MainAxisSize.max,
                              children: [
                                DropDownMarques(
                                    items: [
                                      const Marque(
                                          description: '',
                                          marqueId: '',
                                          name: 'Toutes les marques',
                                          photoUrl: ''),
                                      ...Marques().listMarques
                                    ],
                                    onChanged: (String marqueId) {
                                      if (GlobalStatic.onMarque != null) {
                                        setState(() {
                                          if (marqueId.isNotEmpty) {
                                            GlobalStatic.onMarque!(Marques()
                                                .listMarques
                                                .fromId(marqueId));
                                          } else {
                                            GlobalStatic.onMarque!(
                                              const Marque(
                                                  description: '',
                                                  marqueId: '',
                                                  name: 'Toutes les marques',
                                                  photoUrl: ''),
                                            );
                                          }
                                        });
                                      }
                                    }),
                                DropDownGenres(
                                    items: GlobalStatic.genres,
                                    onChanged: (genre) {
                                      if (GlobalStatic.onGenre != null) {
                                        setState(() {
                                          GlobalStatic.onGenre!(genre);
                                        });
                                      }
                                    }),
                                DropDownCategories(
                                    items: [
                                      const Categorie(
                                          categorieId: '',
                                          description: '',
                                          name: 'Toutes les catégories',
                                          photoUrl: ''),
                                      ...Categories().listCategories
                                    ],
                                    onChanged: (String categorieId) {
                                      if (GlobalStatic.onCategorie != null) {
                                        setState(() {
                                          if (categorieId.isNotEmpty) {
                                            GlobalStatic.onCategorie!(
                                                Categories()
                                                    .listCategories
                                                    .fromId(categorieId));
                                          } else {
                                            GlobalStatic.onCategorie!(
                                              const Categorie(
                                                  description: '',
                                                  categorieId: '',
                                                  name: 'Toutes les catégories',
                                                  photoUrl: ''),
                                            );
                                          }
                                        });
                                      }
                                    }),
                              ],
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
                                    if (Products().listProducts.isEmpty &&
                                        (snapshot.connectionState ==
                                            ConnectionState.waiting)) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    List<Product> produits = searchProducts();
                                    return Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.spaceAround,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: produits
                                          .map((e) => ProductCard(
                                                product: e,
                                              ))
                                          .toList(),
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

  List<Product> searchProducts() {
    List<Product> produits = Products().listProducts;
    if (GlobalStatic.searchScreenMarque.marqueId.isNotEmpty) {
      produits = produits
          .where((p) => p.marqueId == GlobalStatic.searchScreenMarque.marqueId)
          .toList();
    }
    if (GlobalStatic.searchScreenCategorie.categorieId.isNotEmpty) {
      produits = produits
          .where((p) =>
              p.categorieId == GlobalStatic.searchScreenCategorie.categorieId)
          .toList();
    }
    if (GlobalStatic.searchScreenGenre.isNotEmpty &&
        GlobalStatic.searchScreenGenre.toUpperCase() != 'TOUS') {
      produits = produits
          .where((p) => p.genre == GlobalStatic.searchScreenGenre)
          .toList();
    }
    return produits;
  }
}
