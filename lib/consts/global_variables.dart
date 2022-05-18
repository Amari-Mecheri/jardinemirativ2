import 'package:flutter/material.dart';
import 'package:jardinemirativ2/screens/details_screen.dart';
import 'package:jardinemirativ2/screens/home_screen.dart';
import 'package:jardinemirativ2/screens/mentions_legales_screen.dart';

const minScreenSize = 900;
const midScreenSize = 1200;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const Text('Boutique'),
  const Text('Mon compte'),
  const MentionsLegalesScreen(),
  const Text('Pas niais'),
  const DetailsScreen(),
];

enum Gender {
  hommes,
  femmes,
  mixte,
}
