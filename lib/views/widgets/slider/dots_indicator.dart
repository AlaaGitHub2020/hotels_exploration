import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///DotsIndicator
class DotsIndicator extends StatelessWidget {
  ///Constructor
  const DotsIndicator(
      {required this.controller,
      required this.currentIndex,
      required this.imgList,
      super.key});

  ///Carousel Controller
  final CarouselController controller;

  ///current Index
  final int currentIndex;

  ///images List
  final List<String?> imgList;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 4, right: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).color.mainBackground,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                      .color
                      .mainText
                      .withOpacity(currentIndex == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      );
}
