import 'package:flutter/material.dart';
import 'package:jardinemirativ2/models/product.dart';

class ProductRowDetail extends StatelessWidget {
  final Product product;
  const ProductRowDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(product.marqueId),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(product.marqueId),
          ),
        ],
      ),
    );
  }
}
