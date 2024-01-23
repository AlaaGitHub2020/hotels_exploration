import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_address.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_name.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_rating_card.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/minimal_price.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/price_for_it.dart';

///Hotel Data
class HotelData extends StatelessWidget {
  ///Constructor
  const HotelData({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildVerticalGap(),
            const HotelRatingCard(),
            buildVerticalGap(),
            const HotelName(),
            const HotelAddress(),
            buildSmallVerticalGap(),
            buildPrice(),
            buildVerticalGap(),
          ],
        ),
      );

  SizedBox buildSmallVerticalGap() => const SizedBox(height: 5);

  SizedBox buildVerticalGap() => const SizedBox(height: 20);

  ///Price
  Row buildPrice() => const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MinimalPrice(),
          SizedBox(width: 8),
          PriceForIt(),
        ],
      );
}
