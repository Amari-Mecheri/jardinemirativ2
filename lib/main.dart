import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:jardinemirativ2/widgets/menu_bars/mobile_menu_bar.dart';
import 'package:url_strategy/url_strategy.dart';

import 'classes/global_static.dart';
import 'classes/main_page_controller.dart';
import 'widgets/menu_bars/web_menu_bar.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  //Categories.initCategories();
  // Marques.initMarques();
  // Products.initProducts();
  GlobalStatic.loadCarouselImages(carouselImages);
  GlobalStatic.loadMentionsLegales('text/mentions_legales.txt');
  await GlobalStatic.initAssetImages();
  //print(MainPageController.backgroundImage);
  runApp(const JardinEmirati());
}

Future<bool> initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyB5szaeCc4daBCO2_DUsytVtNydavfZeCA',
        appId: '1:268884334164:web:5ba2ad67a4ab89a5083fc1',
        messagingSenderId: '268884334164',
        projectId: 'jardin-emerati',
        storageBucket: 'jardin-emerati.appspot.com',
      ),
    );
    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();
    }
    return true;
  }
  return false;
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: (MediaQuery.of(context).size.width > minScreenSize
                    ? const WebMenuBar()
                    : const MobileMenuBar()) as PreferredSizeWidget,
                body: PageView(
                  controller: MainPageController.pageController,
                  onPageChanged: MainPageController.onPageChanged,
                  children: homeScreenItems,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          //FirebaseAuth.instance.signInAnonymously();
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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