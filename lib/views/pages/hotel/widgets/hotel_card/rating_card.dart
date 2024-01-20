import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Rating Card
class RatingCard extends StatelessWidget {
  ///Constructor
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 150,
        height: 30,
        decoration: buildCardDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Icon(Icons.star,
                size: 15, color: Theme.of(context).color.secondText),
            SizedBox(width: 4),
            buildRatingText(context),
          ],
        ),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).color.ratingNameTextColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      );

  ///Rating Text
  Expanded buildRatingText(BuildContext context) => Expanded(
        child: Text('5 Превосходно ',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).color.secondText,
                )),
      );
}
