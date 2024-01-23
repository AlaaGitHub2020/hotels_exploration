import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/reservation_block/reservation_table.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///Reservation Block
class ReservationBlock extends StatelessWidget {
  ///Constructor
  const ReservationBlock({super.key});

  @override
  Widget build(BuildContext context) => CustomCard(
        children: [
          SizedBox(height: 16),
          ReservationTable(),
        ],
      );
}
