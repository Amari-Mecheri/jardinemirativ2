import 'package:flutter/material.dart';
import 'package:jardinemirativ2/screens/products_marque_screen.dart';
import 'package:jardinemirativ2/screens/home_screen.dart';
import 'package:jardinemirativ2/screens/mentions_legales_screen.dart';

import '../screens/admin_screen.dart';
import '../screens/products_genre_screen.dart';

const minScreenSize = 900;
const midScreenSize = 1200;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const AdminScreen(),
  const Text('Mon compte'),
  const MentionsLegalesScreen(),
  const Text('Pas niais'),
  const ProductsMarqueScreen(),
  const ProductsGenreScreen(),
];

enum Gender {
  homme,
  femme,
  mixte,
  tous,
}

extension GenderTool on String {
  Gender fromString() {
    if (toUpperCase() == 'HOMME') return Gender.homme;
    if (toUpperCase() == 'FEMME') return Gender.femme;
    if (toUpperCase() == 'MIXTE') return Gender.mixte;
    return Gender.tous;
  }
}

final carouselImages = [
  "image/header/1.png",
  "image/header/2.png",
  "image/header/3.png",
  "image/header/4.png",
  "image/header/5.png",
];
