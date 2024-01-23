import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/final_price_block/final_price_table.dart';
import 'package:hotels_exploration/views/widgets/custom_card.dart';

///Final Price Block
class FinalPriceBlock extends StatelessWidget {
  ///Constructor
  const FinalPriceBlock({super.key});

  @override
  Widget build(BuildContext context) => CustomCard(
        children: [
          SizedBox(height: 16),
          FinalPriceTable(),
          SizedBox(height: 16),
        ],
      );
}
