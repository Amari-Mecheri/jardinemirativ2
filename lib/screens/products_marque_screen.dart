import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/global_static.dart';
import 'package:jardinemirativ2/classes/services/product_service.dart';
import 'package:jardinemirativ2/widgets/categorie_button.dart';
import '../classes/services/categorie_service.dart';
import '../models/categorie.dart';
import '../models/product.dart';
import '../widgets/footer.dart';
import '../widgets/product_card.dart';

class CategorieLabel {
  late Categorie categorie;
  late bool activated;

  CategorieLabel(this.categorie, this.activated);
}

class ProductsMarqueScreen extends StatefulWidget {
  const ProductsMarqueScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsMarqueScreen> createState() => _ProductsMarqueScreenState();
}

class _ProductsMarqueScreenState extends State<ProductsMarqueScreen> {
  List<CategorieLabel> categorieLabels = [];
  List<Product> produits = [];
  _ProductsMarqueScreenState() {
    // print('_DetailsScreenState');
    Products().products.listen((event) {
      // print('_DetailsScreenState event');
      setCategorieButtons();
    });
    //   setCategorieButtons();
  }

  setCategorieButtons() {
    categorieLabels = [
      CategorieLabel(
          const Categorie(
              description: '',
              categorieId: '',
              name: 'Toute catégorie',
              photoUrl: ''),
          true)
    ];
    produits = Products()
        .distinct('marqueId', GlobalStatic.detailScreenMarque.marqueId);
    List<Categorie> availableCategories =
        Categories().fromListIds(produits.distinctValues('categorieId'));
    for (var c in availableCategories) {
      categorieLabels.add(CategorieLabel(c, false));
    }
    //produits.clear();
    setState(() {
      // print('salem');
    });
  }

  onCategorie() {}
  @override
  void initState() {
    //print('initState');
    setCategorieButtons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int indexOfTrue =
        categorieLabels.indexWhere((element) => element.activated);
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
                        top: 80,
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
                            Center(
                              child: Container(
                                width: 202.5,
                                height: 130,
                                margin: const EdgeInsets.only(bottom: 28),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(GlobalStatic
                                        .detailScreenMarque.photoUrl),
                                    // image: MemoryImage(
                                    //     GlobalStatic.currentDetailLogo!),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(23),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(41, 0, 0, 0),
                                      offset: Offset(0.0, 5.0), //(x,y)
                                      blurRadius: 3.0,
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.spaceAround,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: categorieLabels
                                  .map(
                                    (e) => CategorieButton(
                                      text: e.categorie.name,
                                      activated: e.activated,
                                      onTap: () {
                                        setState(() {
                                          if (indexOfTrue > -1) {
                                            categorieLabels[indexOfTrue]
                                                .activated = false;
                                          }
                                          categorieLabels[
                                                  categorieLabels.indexOf(e)]
                                              .activated = true;
                                        });
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 28, top: 28),
                              child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.spaceAround,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: produits.map((e) {
                                  String selectedCategorie =
                                      categorieLabels[indexOfTrue]
                                          .categorie
                                          .categorieId;
                                  if (selectedCategorie == "" ||
                                      e.categorieId == selectedCategorie) {
                                    return ProductCard(
                                      product: e,
                                    );
                                  }
                                  return Container();
                                }).toList(),
                              ),
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
