import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/about_the_hotel_card.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_card/hotel_card.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/to_select_number_card.dart';

///Hotel Body
class HotelBody extends StatelessWidget {
  ///Constructor
  const HotelBody({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const HotelCard(),
            SizedBox(height: 10),
            const AboutTheHotelCard(),
            SizedBox(height: 8),
            const ToSelectNumberCard(),
          ],
        ),
      );
}
