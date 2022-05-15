import 'package:flutter/material.dart';
import 'package:jardinemirativ2/screens/home_screen.dart';

const minScreenSize = 900;
const midScreenSize = 1200;

List<Widget> homeScreenItems = [
  const HomeScreen(),
  const Text('Boutique'),
  const Text('Mon compte'),
  const Text('Mentions légales'),
  const Text('Pas niais'),
];

enum Gender {
  hommes,
  femmes,
  mixte,
}
