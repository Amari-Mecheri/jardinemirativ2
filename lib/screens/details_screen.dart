import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/global_static.dart';
import 'package:jardinemirativ2/widgets/categorie_button.dart';
import 'package:jardinemirativ2/widgets/categorie_card.dart';
import '../widgets/footer.dart';

class Categorie {
  late String name;
  late bool activated;

  Categorie(this.name, this.activated);
}

class Produit {
  late String path;
  late String label;

  Produit(this.path, this.label);
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  onCategorie() {}
  List<Categorie> categories = [
    Categorie('Tous les produits', true),
    Categorie('Les parfums', false),
    Categorie('Les parfums cheveux', false),
    Categorie('Soins du corps', false),
    Categorie('Encens', false),
    Categorie('Parfums d' 'ambiance', false),
    Categorie('Coffrets', false),
  ];
  List<Produit> produits = [
    Produit('image/categories/1.png', 'Produit 1'),
    Produit('image/categories/2.png', 'Produit 2'),
    Produit('image/categories/3.png', 'Produit 3'),
    Produit('image/categories/4.png', 'Produit 4'),
    Produit('image/categories/5.png', 'Produit 5'),
    Produit('image/categories/6.png', 'Produit 6'),
    Produit('image/categories/1.png', 'Produit 7'),
    Produit('image/categories/2.png', 'Produit 8'),
    Produit('image/categories/3.png', 'Produit 9'),
    Produit('image/categories/4.png', 'Produit 10'),
    Produit('image/categories/5.png', 'Produit 11'),
    Produit('image/categories/6.png', 'Produit 12'),
  ];
  @override
  Widget build(BuildContext context) {
    int indexOfTrue = categories.indexWhere((element) => element.activated);
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
                            // const SizedBox(
                            //   height: 90,
                            // ),

                            Center(
                              child: Container(
                                width: 202.5,
                                height: 130,
                                margin: const EdgeInsets.only(bottom: 28),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: MemoryImage(
                                        GlobalStatic.currentDetailLogo!),
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
                              children: categories
                                  .map(
                                    (e) => CategorieButton(
                                      text: e.name,
                                      activated: e.activated,
                                      onTap: () {
                                        setState(() {
                                          if (indexOfTrue > -1) {
                                            categories[indexOfTrue].activated =
                                                false;
                                          }
                                          categories[categories.indexOf(e)]
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
                                children: produits
                                    .map(
                                      (e) => CategorieCard(
                                        logo: DecorationImage(
                                          image: AssetImage(e.path),
                                        ),
                                        onTap: onCategorie,
                                        categorieName: e.label,
                                      ),
                                    )
                                    .toList(),
//[
                                // CategorieCard(
                                //   logo: const DecorationImage(
                                //     image:
                                //         AssetImage('image/categories/1.png'),
                                //   ),
                                //   onTap: onCategorie,
                                //   categorieName: "Categorie 1",
                                // ),
                                // CategorieCard(
                                //   logo: const DecorationImage(
                                //     image:
                                //         AssetImage('image/categories/2.png'),
                                //   ),
                                //   onTap: onCategorie,
                                //   categorieName: "Categorie 1",
                                // ),
                                // CategorieCard(
                                //   logo: const DecorationImage(
                                //     image:
                                //         AssetImage('image/categories/3.png'),
                                //   ),
                                //   onTap: onCategorie,
                                //   categorieName: "Categorie 1",
                                // ),
                                // CategorieCard(
                                //   logo: const DecorationImage(
                                //     image:
                                //         AssetImage('image/categories/4.png'),
                                //   ),
                                //   onTap: onCategorie,
                                //   categorieName: "Categorie 1",
                                // ),
                                // CategorieCard(
                                //   logo: const DecorationImage(
                                //     image:
                                //         AssetImage('image/categories/5.png'),
                                //   ),
                                //   onTap: onCategorie,
                                //   categorieName: "Categorie 1",
                                // ),
                                // CategorieCard(
                                //   logo: const DecorationImage(
                                //     image:
                                //         AssetImage('image/categories/6.png'),
                                //   ),
                                //   onTap: onCategorie,
                                //   categorieName: "Categorie 1",
                                // ),
                                //],
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
