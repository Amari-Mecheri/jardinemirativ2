import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalStatic {
  static String? mentionsLegales;
  static MemoryImage? backgroundImage;
  static Uint8List? currentDetailLogo;
  static String? currentDetailTitle;

  static initAssetImages() async {
    await rootBundle.load('image/rectangle.webp').then((byteData) {
      var dataImage = byteData.buffer.asUint8List();
      backgroundImage = MemoryImage(dataImage);
    });
  }

  static setDetailLogo(String path) async {
    await rootBundle.load(path).then((byteData) {
      currentDetailLogo = byteData.buffer.asUint8List();
    });
  }

  static loadMentionsLegales(String path) async {
    if (mentionsLegales == null || mentionsLegales!.isEmpty) {
      mentionsLegales =
          await rootBundle.loadString('text/mentions_legales.txt');
    }
  }
}
