import 'package:flutter/material.dart';

import 'categorie_card.dart';

class CategoriesContainer extends StatefulWidget {
  const CategoriesContainer({Key? key}) : super(key: key);

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

onCategorie() {}

class _CategoriesContainerState extends State<CategoriesContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28, top: 28),
      child: Wrap(
        direction: Axis.horizontal,

        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const [
          CategorieCard(
            logo: DecorationImage(
              image: AssetImage('image/categories/1.png'),
            ),
            onTap: onCategorie,
            categorieName: "Categorie 1",
          ),
          CategorieCard(
            logo: DecorationImage(
              image: AssetImage('image/categories/2.png'),
            ),
            onTap: onCategorie,
            categorieName: "Categorie 1",
          ),
          CategorieCard(
            logo: DecorationImage(
              image: AssetImage('image/categories/3.png'),
            ),
            onTap: onCategorie,
            categorieName: "Categorie 1",
          ),
          CategorieCard(
            logo: DecorationImage(
              image: AssetImage('image/categories/4.png'),
            ),
            onTap: onCategorie,
            categorieName: "Categorie 1",
          ),
          CategorieCard(
            logo: DecorationImage(
              image: AssetImage('image/categories/5.png'),
            ),
            onTap: onCategorie,
            categorieName: "Categorie 1",
          ),
          CategorieCard(
            logo: DecorationImage(
              image: AssetImage('image/categories/6.png'),
            ),
            onTap: onCategorie,
            categorieName: "Categorie 1",
          ),
        ],
      ),
    );
  }
}
