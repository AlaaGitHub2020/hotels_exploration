import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/widgets/slider/custom_slider.dart';
import 'package:hotels_exploration/views/widgets/slider/dots_indicator.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    required this.controller,
    required this.currentIndex,
    required this.imgList,
    required this.onPageChanged,
    super.key,
  });

  ///Carousel Controller
  final CarouselController controller;

  ///current Index
  final int currentIndex;

  ///images List
  final List<String?> imgList;

  ///onPageChanged Function
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomSlider(
            controller: controller,
            imageList: imgList,
            onPageChanged: onPageChanged,
          ),
          DotsIndicator(
            controller: controller,
            currentIndex: currentIndex,
            imgList: imgList,
          ),
        ],
      );
}
