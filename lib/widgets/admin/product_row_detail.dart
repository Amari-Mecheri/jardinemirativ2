import 'package:flutter/material.dart';
import 'package:jardinemirativ2/models/product.dart';

import '../../classes/global_static.dart';
import '../../classes/services/categorie_service.dart';
import '../../classes/services/marque_service.dart';

class ProductRowDetail extends StatelessWidget {
  final Product product;
  const ProductRowDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (GlobalStatic.onProduct != null) {
          GlobalStatic.onProduct!(product);
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                border: Border.all(),
                image: DecorationImage(
                  image: NetworkImage(product.photoUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   decoration: BoxDecoration(border: Border.all()),
            //   child: Text(product.productId),
            // ),
            Container(
              width: 200,
              height: 64,
              //padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child:
                  Align(alignment: Alignment.center, child: Text(product.name)),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                  alignment: Alignment.center, child: Text(product.title)),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(product.description)),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(product.price.toString())),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                alignment: Alignment.center,
                //Marques().distinct('marqueId', data.marqueId).first.name;
                child: product.marqueId.isEmpty
                    ? const Text('')
                    : Text(Marques()
                        .listMarques
                        .distinct('marqueId', product.marqueId)
                        .first
                        .name),
              ),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                alignment: Alignment.center,
                child: Text(product.genre),
              ),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                alignment: Alignment.center,
                child: product.categorieId.isEmpty
                    ? const Text('')
                    : Text(Categories()
                        .listCategories
                        .distinct('categorieId', product.categorieId)
                        .first
                        .name),
              ),
            ),
            Container(
              width: 200,
              height: 64,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all()),
              child: Align(
                alignment: Alignment.center,
                child: Text(product.likes.length.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
