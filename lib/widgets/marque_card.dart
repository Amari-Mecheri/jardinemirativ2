import 'package:flutter/material.dart';

class MarqueCard extends StatefulWidget {
  final DecorationImage logo;
  final void Function()? onTap;
  const MarqueCard({
    Key? key,
    required this.logo,
    required this.onTap,
  }) : super(key: key);

  @override
  State<MarqueCard> createState() => _MarqueCardState();
}

class _MarqueCardState extends State<MarqueCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 6.125 * 14,
        height: 5.344 * 14,
        margin: const EdgeInsets.only(bottom: 28),
        decoration: BoxDecoration(
          image: widget.logo,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(41, 0, 0, 0),
              offset: Offset(0.0, 5.0), //(x,y)
              blurRadius: 3.0,
              spreadRadius: 0.0,
            )
          ],
        ),
      ),
    );
  }
}

// .divMarque {
//     display: flex;
//     flex-direction: row;
//     justify-content: space-around;
//     align-items: center;
//     width: 100%;
//     margin-top: 2em;
//     margin-bottom: 2em;
//     flex-wrap: wrap;
// }

// .marque {
//     width: 6.125em;
//     height: 5.344em;
//     object-fit: contain;
//     border-radius: 30px;
//     box-shadow: 0 5px 3px 0 rgba(0, 0, 0, 0.16);
//     margin-bottom: 2em;

// }