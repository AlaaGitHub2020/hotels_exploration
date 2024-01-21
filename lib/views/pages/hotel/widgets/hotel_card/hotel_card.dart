import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_data.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_image_slider.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_text.dart';

///Hotel Card
class HotelCard extends StatelessWidget {
  ///Constructor
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: buildBorder(),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: buildCardDecoration(context),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              HotelText(),
              SizedBox(height: 20),
              HotelImageSlider(),
              HotelData(),
            ],
          ),
        ),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      );
}
