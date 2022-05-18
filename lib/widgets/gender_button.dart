//import 'package:enum_to_string/enum_to_string.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/consts/colors.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';

class GenderButton extends StatelessWidget {
  final Gender gender;

  const GenderButton({required this.gender, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 28;
    double left = -108;
    double leftText = -63;
    double top = -27;
    Color color = Colors.white;
    double paddingLeft = 64.5;
    bool boxShadow = true;
    if (MediaQuery.of(context).size.width < midScreenSize) {
      height = 56;
      leftText = -16;
      left = -30;
      top = 20;
      color = Colors.transparent;
      paddingLeft = 0;
      boxShadow = false;
    }
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 56,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: leftText,
              top: top,
              child: Container(
                padding: EdgeInsets.fromLTRB(paddingLeft, 18, 43.5, 17.5),
                margin: const EdgeInsets.only(left: 11.5),
                decoration: BoxDecoration(
                  color: color,
                  boxShadow: boxShadow
                      ? [
                          const BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            offset: Offset(0.0, 5.0), //(x,y)
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                          )
                        ]
                      : null,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Text(
                  EnumToString.convertToString(gender, camelCase: true),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: webActiveMenuBar2,
                    fontFamily: 'HelveticaNeue',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            (gender == Gender.mixte)
                ? Positioned(
                    top: -28,
                    left: left,
                    child: Image.asset(
                      'image/homme.png',
                      width: 56,
                    ),
                  )
                : const Text(''),
            Positioned(
              top: -28,
              left: left + 28,
              child: (gender == Gender.mixte) || (gender == Gender.femmes)
                  ? Image.asset(
                      'image/femme.png',
                      width: 56,
                    )
                  : Image.asset(
                      'image/homme.png',
                      width: 56,
                    ),
            ),
          ],
          // child: Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     const Text(""),
          //     Positioned(
          //       left: -32,
          //       top: top,
          //       child: Container(
          //         padding: EdgeInsets.fromLTRB(paddingLeft, 18, 43.5, 17.5),
          //         margin: const EdgeInsets.only(left: 11.5),
          //         decoration: BoxDecoration(
          //           color: color,
          //           boxShadow: boxShadow
          //               ? [
          //                   const BoxShadow(
          //                     color: Color.fromARGB(41, 0, 0, 0),
          //                     offset: Offset(0.0, 5.0), //(x,y)
          //                     blurRadius: 3.0,
          //                     spreadRadius: 0.0,
          //                   )
          //                 ]
          //               : null,
          //           borderRadius: BorderRadius.circular(23),
          //         ),
          //         child: Text(
          //           EnumToString.convertToString(gender, camelCase: true),
          //           textAlign: TextAlign.left,
          //           style: const TextStyle(
          //             color: webActiveMenuBar2,
          //             fontFamily: 'HelveticaNeue',
          //             fontWeight: FontWeight.bold,
          //             fontSize: 16,
          //           ),
          //         ),
          //       ),
          //     ),
          //     (gender == Gender.mixte) || (gender == Gender.hommes)
          //         ? Positioned(
          //             top: -28,
          //             left: gender == Gender.hommes ? 29 : 0,
          //             child: SizedBox(
          //               width: 56,
          //               child: Image.asset('image/homme.png'),
          //             ),
          //           )
          //         : const Text(''),
          //     (gender == Gender.mixte) || (gender == Gender.femmes)
          //         ? Positioned(
          //             top: -28,
          //             left: 29,
          //             child: SizedBox(
          //               width: 56,
          //               child: Image.asset('image/femme.png'),
          //             ),
          //           )
          //         : const Text(''),
          //   ],
          // ),
        ),
      ),
    );
  }
}
