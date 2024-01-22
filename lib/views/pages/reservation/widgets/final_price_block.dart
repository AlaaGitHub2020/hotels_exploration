import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Final Price Block
class FinalPriceBlock extends StatelessWidget {
  ///Constructor
  const FinalPriceBlock({super.key});

  @override
  Widget build(BuildContext context) => Material(
        elevation: 10,
        borderRadius: buildBorder(),
        child: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          width: MediaQuery.sizeOf(context).width,
          decoration: buildCardDecoration(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Table(
                children: [
                  buildTableRow(context, 'Тур', '186 600 ₽'),
                  buildTableVerticalGap(),
                  buildTableRow(context, 'Топливный сбор', '9 300 ₽'),
                  buildTableVerticalGap(),
                  buildTableRow(context, 'Сервисный сбор', '2 136 ₽'),
                  buildTableVerticalGap(),
                  buildTableRow(context, 'К оплате', '198 036 ₽',
                      colored: true),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  TableRow buildTableRow(
      BuildContext context, String firstCell, String secondCell,
      {bool? colored}) {
    return TableRow(children: [
      Text(firstCell,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).color.priceForItTextColor)),
      Text(secondCell,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: (colored ?? false)
                  ? Theme.of(context).color.mainButton
                  : Theme.of(context).color.mainText)),
    ]);
  }

  TableRow buildTableVerticalGap() {
    return TableRow(children: [SizedBox(height: 16), SizedBox(height: 16)]);
  }

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));
}
