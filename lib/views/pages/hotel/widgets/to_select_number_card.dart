import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';

///To Select Number Card Button
class ToSelectNumberCard extends StatelessWidget {
  ///Constructor
  const ToSelectNumberCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 88,
        width: MediaQuery.sizeOf(context).width,
        decoration: buildCardDecoration(context),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: buildBtn(context),
        ),
      );

  ///Button
  ElevatedButton buildBtn(BuildContext context) => ElevatedButton(
        onPressed: () {
          context.router.push(RoomRoute());
        },
        child: buildToSelectANumberText(context),
      );

  ///To Select A Number Text
  Text buildToSelectANumberText(BuildContext context) =>
      Text(S.current.toSelectANumber,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).color.mainBackground));

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).color.mainBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      );
}
