import 'package:flutter/material.dart';

import 'marque_card.dart';

class MarquesContainer extends StatefulWidget {
  const MarquesContainer({Key? key}) : super(key: key);

  @override
  State<MarquesContainer> createState() => _MarquesContainerState();
}

onMarque() {}

class _MarquesContainerState extends State<MarquesContainer> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28, top: 28),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            direction: Axis.horizontal,

            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: const [
              MarqueCard(
                logo: DecorationImage(image: AssetImage('image/marques/1.png')),
                onTap: onMarque,
              ),
              MarqueCard(
                logo: DecorationImage(
                  image: AssetImage('image/marques/2.png'),
                ),
                onTap: onMarque,
              ),
              MarqueCard(
                logo: DecorationImage(
                  image: AssetImage('image/marques/3.png'),
                ),
                onTap: onMarque,
              ),
              MarqueCard(
                logo: DecorationImage(
                  image: AssetImage('image/marques/4.png'),
                ),
                onTap: onMarque,
              ),
              MarqueCard(
                logo: DecorationImage(
                  image: AssetImage('image/marques/5.png'),
                ),
                onTap: onMarque,
              ),
              MarqueCard(
                logo: DecorationImage(
                  image: AssetImage('image/marques/6.png'),
                ),
                onTap: onMarque,
              ),
              MarqueCard(
                logo: DecorationImage(
                  image: AssetImage('image/marques/7.png'),
                ),
                onTap: onMarque,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
