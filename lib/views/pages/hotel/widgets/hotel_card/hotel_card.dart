import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_data.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_image_slider.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_text.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///Hotel Card
class HotelCard extends StatelessWidget {
  ///Constructor
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) => CustomCard(
        borderRadius: buildBorder(),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          HotelText(),
          SizedBox(height: 20),
          HotelImageSlider(),
          HotelData(),
        ],
      );

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      );
}
