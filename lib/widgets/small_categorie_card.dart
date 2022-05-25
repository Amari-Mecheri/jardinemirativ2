import 'package:flutter/material.dart';

class SmallCategorieCard extends StatefulWidget {
  final DecorationImage logo;
  final String categorieName;
  final void Function()? onTap;

  const SmallCategorieCard({
    Key? key,
    required this.logo,
    required this.categorieName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SmallCategorieCard> createState() => _SmallCategorieCardState();
}

class _SmallCategorieCardState extends State<SmallCategorieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 15 * 7,
        height: 30 * 7,
        margin: const EdgeInsets.only(bottom: 6 * 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: widget.logo,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: 12 * 7,
          height: 27.2 * 7,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              widget.categorieName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
