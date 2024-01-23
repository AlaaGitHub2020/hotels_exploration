import 'package:flutter/material.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Hotel Text
class HotelText extends StatelessWidget {
  ///Constructor
  const HotelText({super.key});

  @override
  Widget build(BuildContext context) => Text(
        S.current.hotel,
        style: Theme.of(context).textTheme.titleMedium,
      );
}
