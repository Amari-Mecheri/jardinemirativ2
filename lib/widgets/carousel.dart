import 'dart:async';

import 'package:flutter/material.dart';

import '../classes/global_static.dart';

class Carousel extends StatefulWidget {
  //final List<String> images;
  final double height;

  const Carousel({Key? key, required this.height}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // List<Image> imageStore = [];
  // List<Size> imageSizes = [];
  Timer? _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  // Future<Set<Object>> getImage(String imgPath) async {
  //   final buffer = await rootBundle.load(imgPath);
  //   const Size imageSize = Size(0, 0);
  //   Image image = Image.memory(
  //     buffer.buffer.asUint8List(),
  //     fit: BoxFit.fill,
  //   );
  //   return {image, imageSize};
  // }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // for (var i = 0; i < widget.images.length; i++) {
    //   getImage(widget.images[i]).then((value) {
    //     imageStore.add(value.first as Image);
    //     imageSizes.add(value.last as Size);
    //   });
    // }
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInSine,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: PageView.builder(
          controller: _pageController,
          pageSnapping: true,
          itemBuilder: (context, index) {
            int pagePosition = index % GlobalStatic.imageStore.length;
            return GlobalStatic.imageStore.length > pagePosition
                ? GlobalStatic.imageStore[pagePosition]
                : const Text('');
          }),
    );
  }
}
