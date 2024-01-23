import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/about_the_hotel_text.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/buttons_card.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/hotel_description.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/peculiarities_list.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///About The Hotel Card
class AboutTheHotelCard extends StatelessWidget {
  ///Constructor
  const AboutTheHotelCard({super.key});

  @override
  Widget build(BuildContext context) => const CustomCard(
        children: [
          SizedBox(height: 16),
          AboutTheHotelText(),
          SizedBox(height: 16),
          PeculiaritiesList(),
          SizedBox(height: 12),
          HotelDescription(),
          SizedBox(height: 16),
          ButtonsCard(),
        ],
      );
}
