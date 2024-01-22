import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/views/pages/reservation/widgets/pay_block/pay_aAmount_text.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';

///Pay Block
class PayBlock extends StatelessWidget {
  ///Constructor
  const PayBlock({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: buildBorder(),
        child: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          width: MediaQuery.sizeOf(context).width,
          decoration: buildCardDecoration(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildVerticalGap(),
              buildPayBtn(context),
              buildVerticalGap(),
            ],
          ),
        ),
      );

  SizedBox buildVerticalGap() => SizedBox(height: 16);

  ///build Pay Button
  ElevatedButton buildPayBtn(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.router.push(PaidRoute());
        },
        child: PayAmountText(),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      );
}
