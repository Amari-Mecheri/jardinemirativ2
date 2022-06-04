import 'package:flutter/material.dart';

import '../../classes/global_static.dart';
import '../../widgets/admin/product_editor.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Stack(
                children: [
                  ClipRect(
                    child: Transform.scale(
                      scaleX: 1.18,
                      scaleY: 1.19,
                      origin: const Offset(0.49, 0.56),
                      child: Container(
                        //constraints: const BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image: AssetImage('image/rectangle.webp'),
                            image: GlobalStatic.backgroundImage!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      SizedBox(
                        height: 54,
                      ),
                      ProductEditor(),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //     left: MediaQuery.of(context).size.width * 0.1,
                      //     right: MediaQuery.of(context).size.width * 0.1,
                      //   ),
                      //   child: const CategoriesContainer(),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
