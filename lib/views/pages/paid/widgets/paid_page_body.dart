import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/paid/widgets/confirmation_of_order_text.dart';
import 'package:hotels_exploration/views/pages/paid/widgets/great_btn.dart';

///Paid Page Body
class PaidPageBody extends StatelessWidget {
  ///Constructor
  const PaidPageBody({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            buildAvatar(context),
            SizedBox(height: 32),
            buildYourOrderText(context),
            SizedBox(height: 20),
            ConfirmationOfOrderText(),
            Spacer(),
            GreatBtn(),
            SizedBox(height: 20),
          ],
        ),
      );

  ///build Your Order Text
  Text buildYourOrderText(BuildContext context) => Text(
        S.current.yourOrderHasBeenProcessed,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).color.mainText),
      );

  ///build Avatar
  CircleAvatar buildAvatar(BuildContext context) => CircleAvatar(
      radius: 45,
      backgroundColor: Theme.of(context).color.avatarBGColor,
      child: Image.asset(ViewsConstants.icOrderProcessed));
}
