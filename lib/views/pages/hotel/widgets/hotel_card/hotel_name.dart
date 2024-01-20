import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Hotel Name
class HotelName extends StatelessWidget {
  const HotelName({super.key});

  @override
  Widget build(BuildContext context) => Text(
        'Steigenberger Makadi',
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).color.mainText),
      );
}
