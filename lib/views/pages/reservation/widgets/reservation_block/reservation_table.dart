import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
import 'package:hotels_exploration/generated/l10n.dart';

class ReservationTable extends StatelessWidget {
  const ReservationTable({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (BuildContext context,
            ReservationUiLogicState reservationUiLogicState) {
          return reservationUiLogicState.maybeWhen(
            orElse: Container.new,
            actionSuccess:
                (ReservationModel reservationModel, _, __, ___, ____) {
              return Table(
                columnWidths: {1: FlexColumnWidth(1.7)},
                children: [
                  buildTableRow(context, S.current.departure,
                      reservationModel.departure ?? ''),
                  buildTableGap(),
                  buildTableRow(context, S.current.countryCity,
                      reservationModel.arrivalCountry ?? ''),
                  buildTableGap(),
                  buildTableRow(context, S.current.dates,
                      '${reservationModel.tourDateStart ?? ''} - ${reservationModel.tourDateStop ?? ''}'),
                  buildTableGap(),
                  buildTableRow(context, S.current.numberOfNights,
                      '${reservationModel.numberOfNights ?? ' '} ${S.current.nights}'),
                  buildTableGap(),
                  buildTableRow(context, S.current.hotel,
                      reservationModel.hotelName ?? ''),
                  buildTableGap(),
                  buildTableRow(
                      context, S.current.room, reservationModel.room ?? ''),
                  buildTableGap(),
                  buildTableRow(context, S.current.nutrition,
                      reservationModel.nutrition ?? ''),
                  buildTableGap(),
                ],
              );
            },
          );
        },
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
}
