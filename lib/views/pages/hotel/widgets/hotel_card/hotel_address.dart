import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Hotel Address
class HotelAddress extends StatelessWidget {
  ///Constructor
  const HotelAddress({super.key});

  @override
  Widget build(BuildContext context) => Text(
        'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).color.addressTextColor),
      );
}
