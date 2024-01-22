import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_address.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_name.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_rating_card.dart';

///Hotel Block
class HotelBlock extends StatelessWidget {
  ///Constructor
  const HotelBlock({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: buildBorder(),
        child: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          width: MediaQuery.sizeOf(context).width,
          decoration: buildCardDecoration(context),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              //TODO
              HotelRatingCard(),
              SizedBox(height: 8),
              //TODO
              HotelName(),
              SizedBox(height: 8),
              //TODO
              HotelAddress(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));
}
