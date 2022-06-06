import 'package:flutter/material.dart';
import 'package:jardinemirativ2/screens/home_screen.dart';
import 'package:jardinemirativ2/screens/mentions_legales_screen.dart';
import 'package:jardinemirativ2/screens/products_search.dart';

import '../screens/admin_screen.dart';

const minScreenSize = 900;
const midScreenSize = 1200;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const AdminScreen(),
  const Text('Mon compte'),
  const MentionsLegalesScreen(),
  const Text('Pas niais'),
  // const ProductsMarqueScreen(),
  // const ProductsGenreScreen(),
  // const ProductsCategorieScreen(),
  const ProducsSearch(),
];

enum Gender {
  homme,
  femme,
  mixte,
  tous,
}

extension GenderTool on String {
  Gender genderFromString() {
    if (toUpperCase() == 'HOMME') return Gender.homme;
    if (toUpperCase() == 'FEMME') return Gender.femme;
    if (toUpperCase() == 'MIXTE') return Gender.mixte;
    return Gender.tous;
  }
}

enum OrderStatus {
  ouvert,
  livre,
  annule,
  paye,
  tous,
}

extension OrderStatusTool on String {
  OrderStatus orderStatusFromString() {
    if (toUpperCase() == 'OUVERT') return OrderStatus.ouvert;
    if (toUpperCase() == 'LIVRE') return OrderStatus.ouvert;
    if (toUpperCase() == 'ANNULE') return OrderStatus.annule;
    if (toUpperCase() == 'PAYE') return OrderStatus.paye;
    return OrderStatus.tous;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

final carouselImages = [
  "image/header/1.png",
  "image/header/2.png",
  "image/header/3.png",
  "image/header/4.png",
  "image/header/5.png",
];
