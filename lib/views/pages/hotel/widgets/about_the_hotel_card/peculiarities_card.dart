import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Peculiarities Card
class PeculiaritiesCard extends StatelessWidget {
  ///Constructor
  const PeculiaritiesCard({required this.text, super.key});

  ///Text
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).color.cardBGColor,
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).color.priceForItTextColor),
        ),
      );
}
