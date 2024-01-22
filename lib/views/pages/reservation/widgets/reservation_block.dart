import 'package:flutter/material.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';

///Reservation Block
class ReservationBlock extends StatelessWidget {
  ///Constructor
  const ReservationBlock({super.key});

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
                columnWidths: {1: FlexColumnWidth(1.7)},
                children: [
                  buildTableRow(context, 'Вылет из', 'Санкт-Петербург'),
                  buildTableGap(),
                  buildTableRow(context, 'Страна, город', 'Египет, Хургада'),
                  buildTableGap(),
                  buildTableRow(context, 'Даты', '19.09.2023 – 27.09.2023'),
                  buildTableGap(),
                  buildTableRow(context, 'Кол-во ночей', '7 ночей'),
                  buildTableGap(),
                  buildTableRow(context, 'Отель', 'Steigenberger Makadi'),
                  buildTableGap(),
                  buildTableRow(context, 'Номер',
                      'Стандартный с видом на бассейн или сад'),
                  buildTableGap(),
                  buildTableRow(context, 'Питание', 'Все включено'),
                  buildTableGap(),
                ],
              ),
            ],
          ),
        ),
      );

  ///build Table Gap
  TableRow buildTableGap() =>
      TableRow(children: [SizedBox(height: 16), SizedBox(height: 16)]);

  /// buildTableRow
  TableRow buildTableRow(
          BuildContext context, String firstCell, String secondCell) =>
      TableRow(children: [
        Text(
          firstCell,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).color.priceForItTextColor),
        ),
        Text(
          secondCell,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).color.mainText),
        )
      ]);

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).color.mainBackground,
      borderRadius: buildBorder());

  ///BorderRadius
  BorderRadius buildBorder() => const BorderRadius.all(Radius.circular(15));
}
