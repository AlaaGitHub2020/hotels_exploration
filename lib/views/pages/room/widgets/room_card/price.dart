import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Price
class Price extends StatelessWidget {
  ///Constructor
  const Price({required this.roomPrice, required this.roomPricePer, super.key});

  ///Room Price
  final String roomPrice;

  ///Room PricePer
  final String roomPricePer;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            roomPrice,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).color.mainText),
          ),
          const SizedBox(width: 8),
          Text(
            roomPricePer,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Theme.of(context).color.priceForItTextColor),
          ),
        ],
      );
}
