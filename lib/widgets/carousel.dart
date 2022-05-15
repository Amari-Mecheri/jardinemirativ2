import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Carousel extends StatefulWidget {
  final List<String> images;
  final double height;

  const Carousel({Key? key, required this.images, required this.height})
      : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<Image> imageStore = [];
  List<Size> imageSizes = [];
  Timer? _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  Future<Set<Object>> getImage(String imgPath) async {
    final buffer = await rootBundle.load(imgPath);
    const Size imageSize = Size(0, 0);
    Image image = Image.memory(
      buffer.buffer.asUint8List(),
      fit: BoxFit.fill,
    );
    return {image, imageSize};
  }

  @override
  void dispose() {
    super.dispose();

    if (_timer != null) {
      _timer!.cancel();
    }
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.images.length; i++) {
      getImage(widget.images[i]).then((value) => setState(() {
            imageStore.add(value.first as Image);
            imageSizes.add(value.last as Size);
          }));
    }
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInSine,
      );
    });
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
            int pagePosition = index % imageStore.length;
            return imageStore.length > pagePosition
                ? imageStore[pagePosition]
                : const Text('');
          }),
    );
  }
}
