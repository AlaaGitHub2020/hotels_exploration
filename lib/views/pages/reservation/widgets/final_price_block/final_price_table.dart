import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/widgets/decoration_mixin.dart';

///Final Price Table
class FinalPriceTable extends StatelessWidget with DecorationMixin {
  ///Constructor
  const FinalPriceTable({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess:
                  (ReservationModel reservationModel, _, __, ___, ____) {
                final int totalAmount = (reservationModel.tourPrice ?? 0) +
                    (reservationModel.fuelCharge ?? 0) +
                    (reservationModel.serviceCharge ?? 0);
                return Table(
                  children: [
                    buildTableRow(
                      context,
                      S.current.tour,
                      formatNumberString('${reservationModel.tourPrice ?? ''}'),
                    ),
                    buildTableVerticalGap(),
                    buildTableRow(
                      context,
                      S.current.fuelSurcharge,
                      formatNumberString(
                          '${reservationModel.fuelCharge ?? ''}'),
                    ),
                    buildTableVerticalGap(),
                    buildTableRow(
                      context,
                      S.current.serviceFee,
                      formatNumberString(
                          '${reservationModel.serviceCharge ?? ''}'),
                    ),
                    buildTableVerticalGap(),
                    buildTableRow(context, S.current.toPay,
                        formatNumberString('$totalAmount'),
                        colored: true),
                  ],
                );
              });
        },
      );

  ///build Table Vertical Gap
  TableRow buildTableVerticalGap() =>
      TableRow(children: [SizedBox(height: 16), SizedBox(height: 16)]);

  ///build Table Row
  TableRow buildTableRow(
          BuildContext context, String firstCell, String secondCell,
          {bool? colored}) =>
      TableRow(children: [
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
