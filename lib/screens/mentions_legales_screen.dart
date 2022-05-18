import 'package:flutter/material.dart';

import '../classes/global_static.dart';
import '../widgets/footer.dart';

class MentionsLegalesScreen extends StatelessWidget {
  const MentionsLegalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                              image: GlobalStatic.backgroundImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 90,
                          ),
                          const Center(
                            child: Text(
                              'Mentions légales',
                              style: TextStyle(
                                  fontSize: 28, color: Color(0xFFa97c53)),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            GlobalStatic.mentionsLegales ?? '',
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xFF707070)),
                          ),
                          const SizedBox(
                            height: 68,
                          ),
                        ],
                      ),
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

// class MentionsLegalesScreen extends StatefulWidget {
//   const MentionsLegalesScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MentionsLegalesScreen> createState() => _MentionsLegalesScreenState();
// }

// class _MentionsLegalesScreenState extends State<MentionsLegalesScreen> {
//   //String? data;

//   void _loadData() async {
//     if (data == null || data!.isEmpty) {
//       final loadedData =
//           await rootBundle.loadString('text/mentions_legales.txt');
//       setState(() {
//         data = loadedData;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
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
//                               image: GlobalStatic.backgroundImage!,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.1,
//                         right: MediaQuery.of(context).size.width * 0.1,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           const SizedBox(
//                             height: 90,
//                           ),
//                           const Center(
//                             child: Text(
//                               'Mentions légales',
//                               style: TextStyle(
//                                   fontSize: 28, color: Color(0xFFa97c53)),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 24,
//                           ),
//                           Text(
//                             GlobalStatic.mentionsLegales ?? '',
//                             style: const TextStyle(
//                                 fontSize: 10, color: Color(0xFF707070)),
//                           ),
//                           const SizedBox(
//                             height: 68,
//                           ),
//                         ],
//                       ),
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
