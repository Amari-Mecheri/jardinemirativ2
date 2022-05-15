import 'package:flutter/material.dart';
import 'package:jardinemirativ2/utils/global_variables.dart';

class CategorieCard extends StatefulWidget {
  final DecorationImage logo;
  final String categorieName;
  final void Function()? onTap;

  const CategorieCard({
    Key? key,
    required this.logo,
    required this.categorieName,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CategorieCard> createState() => _CategorieCardState();
}

class _CategorieCardState extends State<CategorieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 15 * 14,
        height: 30 * 14,
        // height: MediaQuery.of(context).size.width > minScreenSize
        //     ? MediaQuery.of(context).size.width > midScreenSize
        //         ? 30 * 14
        //         : 20 * 14
        //     : 15 * 14,
        margin: const EdgeInsets.only(bottom: 6 * 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: widget.logo,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: 12 * 14,
          height: 27.2 * 14,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              widget.categorieName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

// .categoriesParents {
//     display: flex;
//     flex-direction: row;
//     flex-wrap: wrap;
//     justify-content: space-evenly;
//     align-items: center;
//     width: 80%;
//     margin: auto;
// }

// .categories {
//     display: flex;
//     flex-direction: column;
//     justify-content: center;
//     align-items: center;
//     width: 15em;
//     height: 30em;
//     position:relative;
//     z-index: 1;
//     font-family: HelveticaNeue;
//     font-weight: normal;
//     font-stretch: normal;
//     font-style: normal;
//     line-height: normal;
//     letter-spacing: normal;
//     color: #fff;
//     margin-bottom: 6em;

//     @media screen and (max-width: 900px) {
//         margin-bottom: 6em;
//     }

// }

// .imgRang {
//     width: 100%;
// }

// .textImg {
//     position: absolute;
//     top: 0;
//     width: 81%;
//     height: 98%;
//     z-index: 2;
//     display: flex;
//     flex-direction: column;
//     justify-content: center;
//     align-items: center;
//     font-family: HelveticaNeue;
//     font-size: 2em;
//     font-weight: normal;
//     font-stretch: normal;
//     font-style: normal;
//     line-height: normal;
//     letter-spacing: normal;
//     text-align: center;
//     color: #fff;
//     border: 1px solid;
//     border-radius: 30px;
// }