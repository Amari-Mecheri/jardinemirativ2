import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CategorieButton extends StatelessWidget {
  final String text;
  final bool activated;
  final void Function()? onTap;
  const CategorieButton({
    Key? key,
    required this.text,
    required this.activated,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineGradientButton(
      onTap: onTap,
      backgroundColor: activated ? Colors.amber.shade100 : Colors.white,
      gradient: const LinearGradient(
        stops: [0, 0.5, 0.5, 1],
        colors: [
          Colors.brown,
          Colors.amber,
          Colors.amber,
          Colors.brown,
        ],
      ),
      strokeWidth: 4,
      corners: const Corners(
        topLeft: Radius.elliptical(16, 14),
        bottomRight: Radius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 4.0, bottom: 4.0, left: 16.0, right: 16.0),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
