import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/about_the_hotel_text.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/buttons_card.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/hotel_description.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/peculiarities_list.dart';

///About The Hotel Card
class AboutTheHotelCard extends StatelessWidget {
  ///Constructor
  const AboutTheHotelCard({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: buildCardDecoration(context),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).color.mainBackground,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      );
}
