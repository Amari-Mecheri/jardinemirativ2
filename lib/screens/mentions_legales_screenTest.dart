import 'package:flutter/material.dart';

import '../widgets/footer.dart';

class MentionsLegalesScreenTest extends StatelessWidget {
  final DecorationImage backgroundImage;
  final String mentionsLegales;

  const MentionsLegalesScreenTest(
      {Key? key, required this.backgroundImage, required this.mentionsLegales})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: backgroundImage,
      ),
    );
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       Stack(
    //         clipBehavior: Clip.none,
    //         children: [
    //           IntrinsicHeight(
    //             child: Stack(
    //               children: [
    //                 ClipRect(
    //                   child: Transform.scale(
    //                     scaleX: 1.18,
    //                     scaleY: 1.19,
    //                     origin: const Offset(0.49, 0.56),
    //                     child: Container(
    //                       //constraints: const BoxConstraints.expand(),
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                           image: backgroundImage.image,
    //                           fit: BoxFit.fill,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                     left: MediaQuery.of(context).size.width * 0.1,
    //                     right: MediaQuery.of(context).size.width * 0.1,
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     mainAxisSize: MainAxisSize.max,
    //                     crossAxisAlignment: CrossAxisAlignment.stretch,
    //                     children: [
    //                       const SizedBox(
    //                         height: 90,
    //                       ),
    //                       const Center(
    //                         child: Text(
    //                           'Mentions légales',
    //                           style: TextStyle(
    //                               fontSize: 40, color: Color(0xFFa97c53)),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 24,
    //                       ),
    //                       Text(
    //                         mentionsLegales,
    //                         style: const TextStyle(
    //                             fontSize: 10, color: Color(0xFF707070)),
    //                       ),
    //                       const SizedBox(
    //                         height: 68,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       const Footer(),
    //     ],
    //   ),
    // );
  }
}
