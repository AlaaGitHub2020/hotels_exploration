import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/buyer_information_block/buyer_information_block.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/final_price_block/final_price_block.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/hotel_block/hotel_block.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/pay_block/pay_block.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/reservation_block/reservation_block.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/tourists_information_block/tourists_information_block.dart';

///Reservation Page Body
class ReservationPageBody extends StatelessWidget {
  const ReservationPageBody({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              buildVerticalGap(),
              const HotelBlock(),
              buildVerticalGap(),
              const ReservationBlock(),
              buildVerticalGap(),
              const BuyerInformationBlock(),
              buildVerticalGap(),
              const TouristsInformationBlock(),
              buildVerticalGap(),
              const FinalPriceBlock(),
              buildVerticalGap(),
              const PayBlock(),
              buildVerticalGap(),
            ],
          ),
        ),
      );

  SizedBox buildVerticalGap() => const SizedBox(height: 10);
}
