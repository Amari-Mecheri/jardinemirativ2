import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/global_static.dart';
import 'package:jardinemirativ2/consts/colors.dart';

import '../classes/services/order_service.dart';

class BasketTotal extends StatelessWidget {
  const BasketTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int qty = Orders().basketLines.fold<int>(
        0, (previousValue, element) => previousValue += element.quantity);
    return Container(
      height: 64,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Votre panier contient $qty article${qty > 1 ? 's' : ''}',
                      //style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Total :',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "${GlobalStatic.basketTotal.value.toStringAsFixed(2)}€",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.redAccent),
                        ),
                      ],
                    )
                  ]),
            ),
            Container(
              width: double.infinity,
              height: 24,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Center(
                child: InkWell(
                  onTap: () {},
                  //splashColor: Colors.amberAccent,
//            borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: const Text(
                    "Finaliser la commande",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
