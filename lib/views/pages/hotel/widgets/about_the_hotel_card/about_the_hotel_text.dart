import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///About The Hotel Text
class AboutTheHotelText extends StatelessWidget {
  ///Constructor
  const AboutTheHotelText({super.key});

  @override
  Widget build(BuildContext context) => Text(
        S.current.aboutTheHotel,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).color.mainText),
      );
}
