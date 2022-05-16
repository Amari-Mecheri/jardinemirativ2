import 'package:flutter/material.dart';
import 'package:jardinemirativ2/screens/home_screen.dart';
import 'package:jardinemirativ2/screens/mentions_legales_screen.dart';

const minScreenSize = 900;
const midScreenSize = 1200;

final Image backgroundImage = Image.asset("image/rectangle.webp");

List<Widget> homeScreenItems = [
  HomeScreen(backgroundImage: backgroundImage),
  const Text('Boutique'),
  const Text('Mon compte'),
  MentionsLegalesScreen(backgroundImage: backgroundImage),
  const Text('Pas niais'),
];

enum Gender {
  hommes,
  femmes,
  mixte,
}
