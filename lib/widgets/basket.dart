import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../classes/global_static.dart';
import '../classes/main_page_controller.dart';
import '../classes/services/order_service.dart';
import '../consts/colors.dart';

class Basket extends StatelessWidget {
  const Basket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MainPageController.navigationTab(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: Orders().orders,
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            return StreamBuilder(
              stream: Orders().basketLinesStream,
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (Orders().basketLines.isEmpty) {
                  GlobalStatic.changeBasketToal(0);
                  return Image.asset(
                    color: GlobalStatic.mainPage.value == 5
                        ? webActiveMenuBar
                        : webInActiveMenuBar,
                    'image/basket.png',
                    width: 28,
                    alignment: Alignment.bottomCenter,
                  );
                }
                var nbArticles = Orders().basketLines.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue += element.quantity);
                GlobalStatic.changeBasketToal(Orders().basketLines.fold<double>(
                    0,
                    (previousValue, element) =>
                        previousValue += element.quantity * element.unitPrice));
                return Badge(
                  animationType: BadgeAnimationType.scale,
                  alignment: Alignment.center,
                  badgeColor: Colors.red,
                  badgeContent: Text(
                    nbArticles.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: Image.asset(
                    color: GlobalStatic.mainPage.value == 5
                        ? webActiveMenuBar
                        : webInActiveMenuBar,
                    'image/basket.png',
                    width: 28,
                    alignment: Alignment.bottomCenter,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
