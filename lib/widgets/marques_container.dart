import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/global_static.dart';

import '../classes/services/marque_service.dart';
import 'marque_card.dart';

class MarquesContainer extends StatefulWidget {
  const MarquesContainer({Key? key}) : super(key: key);

  @override
  State<MarquesContainer> createState() => _MarquesContainerState();
}

class _MarquesContainerState extends State<MarquesContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Marques()
          .marques, //FirebaseFirestore.instance.collection('marques').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        //if (snapshot.connectionState == ConnectionState.waiting) {
        if (Marques().listMarques.isEmpty &&
            (snapshot.connectionState == ConnectionState.waiting)) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 28, top: 28),
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              direction: Axis.horizontal,

              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              alignment: WrapAlignment.spaceAround,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: Marques()
                  .listMarques
                  .map(
                    (e) => MarqueCard(
                      logo: DecorationImage(image: NetworkImage(e.photoUrl)),
                      onTap: () {
                        if (GlobalStatic.onMarque != null) {
                          GlobalStatic.onMarque!(e);
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

/*
[
            MarqueCard(
              logo: const DecorationImage(
                  image: AssetImage('image/marques/1.png')),
              onTap: () {
                onMarque('image/marques/1.png');
              },
            ),
            MarqueCard(
              logo: const DecorationImage(
                image: AssetImage('image/marques/2.png'),
              ),
              onTap: () {
                onMarque('image/marques/2.png');
              },
            ),
            MarqueCard(
              logo: const DecorationImage(
                image: AssetImage('image/marques/3.png'),
              ),
              onTap: () {
                onMarque('image/marques/3.png');
              },
            ),
            MarqueCard(
              logo: const DecorationImage(
                image: AssetImage('image/marques/4.png'),
              ),
              onTap: () {
                onMarque('image/marques/4.png');
              },
            ),
            MarqueCard(
              logo: const DecorationImage(
                image: AssetImage('image/marques/5.png'),
              ),
              onTap: () {
                onMarque('image/marques/5.png');
              },
            ),
            MarqueCard(
              logo: const DecorationImage(
                image: AssetImage('image/marques/6.png'),
              ),
              onTap: () {
                onMarque('image/marques/6.png');
              },
            ),
            MarqueCard(
              logo: const DecorationImage(
                image: AssetImage('image/marques/7.png'),
              ),
              onTap: () {
                onMarque('image/marques/7.png');
              },
            ),
          ],
*/
