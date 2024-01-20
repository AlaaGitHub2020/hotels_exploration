import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Minimal Price
class MinimalPrice extends StatelessWidget {
  ///Constructor
  const MinimalPrice({super.key});

  @override
  Widget build(BuildContext context) => Text('от 134 673 ₽',
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: Theme.of(context).color.mainText));
}
