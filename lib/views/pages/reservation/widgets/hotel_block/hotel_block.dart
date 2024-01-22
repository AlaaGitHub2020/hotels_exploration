import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/reservation_hotel_address.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/reservation_hotel_name.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/reservation_rating_card.dart';

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
              ReservationRatingCard(),
              SizedBox(height: 8),
              ReservationHotelName(),
              SizedBox(height: 8),
              ReservationHotelAddress(),
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
