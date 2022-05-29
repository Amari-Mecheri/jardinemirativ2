import 'package:flutter/material.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:jardinemirativ2/widgets/carousel.dart';
import 'package:jardinemirativ2/widgets/gender_button.dart';

import '../classes/global_static.dart';
import '../classes/main_page_controller.dart';
import '../models/marque.dart';
import '../widgets/categories_container.dart';
import '../widgets/footer.dart';
import '../widgets/marques_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void onMarque(Marque data) async {
    //await GlobalStatic.setDetailLogo(data['photoUrl']);
    GlobalStatic.detailScreenMarque = data;
    MainPageController.navigationTab(5);
  }

  @override
  Widget build(BuildContext context) {
    GlobalStatic.onMarque = onMarque;
    return SingleChildScrollView(
      child: Column(
        children: [
          Carousel(
            //images: _images,
            height: MediaQuery.of(context).size.width > minScreenSize
                ? MediaQuery.of(context).size.width > midScreenSize
                    ? 700
                    : 420
                : 350,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IntrinsicHeight(
                child: Stack(
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
                      children: [
                        const SizedBox(
                          height: 54,
                        ),
                        const MarquesContainer(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: const CategoriesContainer(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    GenderButton(
                      gender: Gender.femmes,
                    ),
                    GenderButton(
                      gender: Gender.mixte,
                    ),
                    GenderButton(
                      gender: Gender.hommes,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Footer(),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Carousel(
//             //images: _images,
//             height: MediaQuery.of(context).size.width > minScreenSize
//                 ? MediaQuery.of(context).size.width > midScreenSize
//                     ? 700
//                     : 420
//                 : 350,
//           ),
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               IntrinsicHeight(
//                 child: Stack(
//                   children: [
//                     ClipRect(
//                       child: Transform.scale(
//                         scaleX: 1.18,
//                         scaleY: 1.19,
//                         origin: const Offset(0.49, 0.56),
//                         child: Container(
//                           //constraints: const BoxConstraints.expand(),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               //image: AssetImage('image/rectangle.webp'),
//                               image: GlobalStatic.backgroundImage!,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         const SizedBox(
//                           height: 54,
//                         ),
//                         const MarquesContainer(),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: MediaQuery.of(context).size.width * 0.1,
//                             right: MediaQuery.of(context).size.width * 0.1,
//                           ),
//                           child: const CategoriesContainer(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   mainAxisSize: MainAxisSize.max,
//                   children: const [
//                     GenderButton(
//                       gender: Gender.femmes,
//                     ),
//                     GenderButton(
//                       gender: Gender.mixte,
//                     ),
//                     GenderButton(
//                       gender: Gender.hommes,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const Footer(),
//         ],
//       ),
//     );
//   }
// }
