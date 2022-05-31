import 'package:flutter/material.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:jardinemirativ2/widgets/carousel.dart';
import 'package:jardinemirativ2/widgets/gender_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _images = [
  //   "image/header/1.png",
  //   "image/header/2.png",
  //   "image/header/3.png",
  //   "image/header/4.png",
  //   "image/header/5.png",
  // ];

  @override
  Widget build(BuildContext context) {
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
          ClipRect(
            child: Transform.scale(
              scaleX: 1.18,
              scaleY: 1.19,
              origin: const Offset(0.49, 0.56),
              child: Container(
                //constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/rectangle.webp'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          GenderButton(
                            gender: Gender.femme,
                          ),
                          GenderButton(
                            gender: Gender.mixte,
                          ),
                          GenderButton(
                            gender: Gender.homme,
                          ),
                        ],
                        // children: const [
                        //   Text('Femmes'),
                        //   Text('Mixtes'),
                        //   Text('Hommes'),
                        // ],
                      ),
                    ),
                    Column(
                      children: const [
                        Text('Salem 1'),
                        Text('Salem 1'),
                        Text('Salem 1'),
                        Text('Salem 1'),
                        Text('Salem 1'),
                        Text('Salem 1'),
                        Text('Salem 1'),
                        Text('Salem 1'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
.genre {
    margin: 0 0 0 11.5px; //TRBL
    padding: 18px 43.5px 17.5px 64.5px; //TRBL
    border-radius: 23px; //
    box-shadow: 0 5px 3px 0 rgba(0, 0, 0, 0.16); //
    background-color: #fff; //
    transform: translateY(-50%);
    font-family: HelveticaNeue; //
    font-size: 16px; //
    font-weight: bold; //
    font-stretch: normal;
    font-style: normal;
    line-height: normal;
    letter-spacing: normal;
    text-align: left; //
    color: #b88a57; //
    top: 0;
    z-index: 0;

    @media screen and (max-width: 900px) {
        box-shadow: none;
        background-color: transparent;
        transform: translateY(-70%);
        padding-left: 0px;
    }

}
*/