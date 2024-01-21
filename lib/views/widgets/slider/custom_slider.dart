import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/widgets/slider/image_card.dart';
import 'package:hotels_exploration/views/widgets/slider/loading_image_error.dart';

/// Slider
class CustomSlider extends StatelessWidget {
  ///Constructor
  const CustomSlider({
    required this.controller,
    required this.imageList,
    required this.onPageChanged,
    super.key,
  });

  /// controller
  final CarouselController? controller;

  ///Images List
  final List<String?> imageList;

  ///onPageChanged Function
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) => CarouselSlider(
        items: imageList
            .map((url) =>
                url != null ? ImageCard(url: url) : LoadingImageError())
            .toList(),
        carouselController: controller,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2,
          viewportFraction: 1.0,
          onPageChanged: onPageChanged,
        ),
      );
}
