import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../classes/global_static.dart';
import 'small_categorie_card.dart';

class SmallCategoriesContainer extends StatefulWidget {
  const SmallCategoriesContainer({Key? key}) : super(key: key);

  @override
  State<SmallCategoriesContainer> createState() =>
      _SmallCategoriesContainerState();
}

onCategorie() {}

class _SmallCategoriesContainerState extends State<SmallCategoriesContainer> {
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
                  (e) => SmallCategorieCard(
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
