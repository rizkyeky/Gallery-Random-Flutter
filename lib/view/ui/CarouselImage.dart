import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final bool autoPlay;
  final double height;

  const CarouselImage({
    Key key,
    this.itemBuilder,
    this.itemCount,
    this.height,
    this.autoPlay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: autoPlay,
        height: 200,
        viewportFraction: 1.0,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}