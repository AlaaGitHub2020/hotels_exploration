import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/widgets/image_card.dart';
import 'package:hotels_exploration/views/widgets/loading_image_error.dart';

///Image Slider
class ImageSlider extends StatelessWidget {
  ///Constructor
  const ImageSlider({
    required this.controller,
    required this.imageList,
    required this.onPageChanged,
    super.key,
  });

  ///Images List
  final List<String?> imageList;

  /// controller
  final CarouselController? controller;

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
