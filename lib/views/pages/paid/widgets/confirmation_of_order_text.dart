import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Confirmation Of Order Text
class ConfirmationOfOrderText extends StatelessWidget {
  ///Constructor
  const ConfirmationOfOrderText({super.key});

  @override
  Widget build(BuildContext context) {
    int randomOrderNumber = 100000 + Random().nextInt(900000);
    return Container(
      padding: EdgeInsets.only(right: 25, left: 25),
      child: Text(
        S.current.confirmationOfOrder(randomOrderNumber),
        softWrap: true,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Theme.of(context).color.priceForItTextColor),
      ),
    );
  }
}
