import 'package:flutter/material.dart';
import 'package:jardinemirativ2/models/marque.dart';

class MarqueRowDetail extends StatelessWidget {
  final Marque marque;
  const MarqueRowDetail({Key? key, required this.marque}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(),
              image: DecorationImage(
                image: NetworkImage(marque.photoUrl),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(marque.marqueId),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(marque.name),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(marque.description),
          ),
        ],
      ),
    );
  }
}
