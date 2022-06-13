import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jardinemirativ2/models/categorie.dart';

import '../models/marque.dart';

class GlobalStatic {
  static ValueNotifier<int> mainPage = ValueNotifier(0);
  static ValueNotifier<double> basketTotal = ValueNotifier(0.0);
  static String? mentionsLegales;
  static MemoryImage? backgroundImage;
  //static Uint8List? currentDetailLogo;
  static Marque searchScreenMarque =
      const Marque(description: '', marqueId: '', name: '', photoUrl: '');
  static Categorie searchScreenCategorie =
      const Categorie(categorieId: '', description: '', name: '', photoUrl: '');
  static String searchScreenGenre = '';

  static List<Image> imageStore = [];
  static List<Size> imageSizes = [];
  static List<String> genres = ['Femme', 'Homme', 'Mixte', 'Tous'];
  static List<String> orderStatus = [
    'Ouvert',
    'Livré',
    'Annulé',
    'Payé',
    'Tous'
  ];

  static Function? onMarque;
  static Function? onCategorie;
  static Function? onGenre;
  static Function? onProduct;

  static changeBasketToal(value) async {
    await Future.delayed(Duration(microseconds: 1));
    basketTotal.value = value;
  }

  static Future<Set<Object>> getImage(String imgPath) async {
    final buffer = await rootBundle.load(imgPath);
    const Size imageSize = Size(0, 0);
    Image image = Image.memory(
      buffer.buffer.asUint8List(),
      fit: BoxFit.fill,
    );
    return {image, imageSize};
  }

  static initAssetImages() async {
    await rootBundle.load('image/rectangle.webp').then((byteData) {
      var dataImage = byteData.buffer.asUint8List();
      backgroundImage = MemoryImage(dataImage);
    });
  }

  // static setDetailLogo(String path) async {
  //   await rootBundle.load(path).then((byteData) {
  //     currentDetailLogo = byteData.buffer.asUint8List();
  //   });
  //   // NetworkAssetBundle(path as Uri).load(path).then((byteData) {
  //   //   var dataImage = byteData.buffer.asUint8List();
  //   //   backgroundImage = MemoryImage(dataImage);
  //   // });
  // }

  static loadMentionsLegales(String path) async {
    if (mentionsLegales == null || mentionsLegales!.isEmpty) {
      mentionsLegales =
          await rootBundle.loadString('text/mentions_legales.txt');
    }
  }

  static loadCarouselImages(List<String> images) {
    for (var i = 0; i < images.length; i++) {
      getImage(images[i]).then((value) {
        imageStore.add(value.first as Image);
        imageSizes.add(value.last as Size);
      });
    }
  }

  static pickImage(ImageSource source, double? maxSize) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file;
    if (maxSize != null && maxSize > 0) {
      file = await imagePicker.pickImage(
          source: source, maxHeight: maxSize, maxWidth: maxSize);
    } else {
      file = await imagePicker.pickImage(source: source);
    }
    if (file != null) {
      return await file.readAsBytes();
    }
  }

  static showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}

// class Marques {
//   static Stream<QuerySnapshot<Map<String, dynamic>>> marques =
//       FirebaseFirestore.instance.collection('marques').snapshots();
//   static dynamic marquesEvent = marques.listen((event) {
//     print("marques listend");
//     loadMarques(event.docs);
//   });

//   static List<Marque> listMarques = [];
//   static List<String> listNomMarques = [];

//   static loadMarques(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
//     listMarques.clear();
//     listNomMarques.clear();
//     for (var element in docs) {
//       var m = Marque.fromSnap(element);
//       listMarques.add(m);
//       listNomMarques.add(m.name);
//     }
//   }
// }




