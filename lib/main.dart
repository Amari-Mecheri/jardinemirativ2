import 'package:flutter/material.dart';
import 'package:jardinemirativ2/utils/global_variables.dart';
import 'package:url_strategy/url_strategy.dart';

import 'widgets/menu_bar.dart';

void main() {
  setPathUrlStrategy();
  runApp(const JardinEmirati());
}

class JardinEmirati extends StatefulWidget {
  const JardinEmirati({Key? key}) : super(key: key);

  @override
  State<JardinEmirati> createState() => _JardinEmiratiState();
}

class _JardinEmiratiState extends State<JardinEmirati> {
//  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    //getUsername();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTab(int page) {
    pageController.jumpToPage(page);
  }

  // void onPageChanged(int page) {
  //   setState(() {
  //     _page = page;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Jardin Emirati",
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MenuBar(
          pageController: pageController,
        ),
        body: PageView(
          controller: pageController,
          //onPageChanged: onPageChanged,
          children: homeScreenItems,
        ),
      ),
    );
  }
}
