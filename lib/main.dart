import 'package:flutter/material.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:url_strategy/url_strategy.dart';

import 'classes/global_static.dart';
import 'classes/main_page_controller.dart';
import 'widgets/menu_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalStatic.loadMentionsLegales('text/mentions_legales.txt');
  await GlobalStatic.initAssetImages();
  //print(MainPageController.backgroundImage);
  setPathUrlStrategy();
  runApp(const JardinEmirati());
}

class JardinEmirati extends StatefulWidget {
  const JardinEmirati({Key? key}) : super(key: key);

  @override
  State<JardinEmirati> createState() => _JardinEmiratiState();
}

class _JardinEmiratiState extends State<JardinEmirati> {
  @override
  void dispose() {
    super.dispose();
    MainPageController.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Jardin Emirati",
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const MenuBar(),
        body: PageView(
          controller: MainPageController.pageController,
          onPageChanged: MainPageController.onPageChanged,
          children: homeScreenItems,
        ),
      ),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Image backgroundImage = Image.memory(
//       (await rootBundle.load("image/rectangle.webp")).buffer.asUint8List());
//   DecorationImage decorationImage = DecorationImage(
//     image: backgroundImage.image,
//     fit: BoxFit.fill,
//   );
//   String mentionsLegales =
//       await rootBundle.loadString('text/mentions_legales.txt');

//   List<Widget> homeScreenItems = [
//     HomeScreen(backgroundImage: backgroundImage),
//     const Text('Boutique'),
//     const Text('Mon compte'),
//     MentionsLegalesScreen(
//       backgroundImage: decorationImage,
//       mentionsLegales: mentionsLegales,
//     ),
//     const Text('Pas niais'),
//   ];

//   setPathUrlStrategy();
//   runApp(JardinEmirati(
//     homeScreenItems: homeScreenItems,
//   ));
// }