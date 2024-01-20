import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Price For It
class PriceForIt extends StatelessWidget {
  ///Constructor
  const PriceForIt({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: Text('за тур с перелётом ',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).color.priceForItTextColor)),
      );
}
