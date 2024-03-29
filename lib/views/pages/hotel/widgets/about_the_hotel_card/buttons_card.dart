import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/facilities_btn.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/whats_included_btn.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/whats_not_included_btn.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Buttons Card
class ButtonsCard extends StatelessWidget with DecorationMixin {
  ///Constructor
  const ButtonsCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        decoration: buildDecoration(context),
        child: Column(
          children: [
            const FacilitiesBtn(),
            buildDivider(),
            const WhatsIncludedBtn(),
            buildDivider(),
            const WhatsNotIncludedBtn(),
          ],
        ),
      );

  Divider buildDivider() => const Divider(height: 1, endIndent: 15, indent: 50);
}
