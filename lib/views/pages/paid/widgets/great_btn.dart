import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';

///Great Button
class GreatBtn extends StatelessWidget {
  ///Constructor
  const GreatBtn({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.router.popUntilRoot();
        },
        child: Text(
          S.current.great,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).color.mainBackground),
        ),
      );
}
