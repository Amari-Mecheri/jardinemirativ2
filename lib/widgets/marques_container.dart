import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/global_static.dart';

import '../classes/main_page_controller.dart';
import 'marque_card.dart';

class MarquesContainer extends StatefulWidget {
  const MarquesContainer({Key? key}) : super(key: key);

  @override
  State<MarquesContainer> createState() => _MarquesContainerState();
}

onMarque(String path) async {
  await GlobalStatic.setDetailLogo(path);
  GlobalStatic.currentDetailTitle = "";
  MainPageController.navigationTab(5);
}

class _MarquesContainerState extends State<MarquesContainer> {
  @override
  Widget build(BuildContext context) {
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
          children: [
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
        ),
      ),
    );
  }
}
