import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/reservation_hotel_address.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/reservation_hotel_name.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/reservation_rating_card.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///Hotel Block
class HotelBlock extends StatelessWidget {
  ///Constructor
  const HotelBlock({super.key});

  @override
  Widget build(BuildContext context) => CustomCard(
        children: [
          SizedBox(height: 16),
          ReservationRatingCard(),
          SizedBox(height: 8),
          ReservationHotelName(),
          SizedBox(height: 8),
          ReservationHotelAddress(),
          SizedBox(height: 16),
        ],
      );
}
