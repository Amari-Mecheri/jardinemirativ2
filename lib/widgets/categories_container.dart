import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../classes/global_static.dart';
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
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 28, top: 28),
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: snapshot.data!.docs
                .map(
                  (e) => CategorieCard(
                    logo: DecorationImage(
                        image: NetworkImage(e.data()['photoUrl'])),
                    onTap: () {
                      if (GlobalStatic.onCategorie != null) {
                        GlobalStatic.onCategorie!(e.data());
                      }
                    },
                    categorieName: e.data()['name'],
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
