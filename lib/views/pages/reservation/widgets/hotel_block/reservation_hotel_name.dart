import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';

///Reservation Hotel Name
class ReservationHotelName extends StatelessWidget {
  const ReservationHotelName({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) =>
            reservationUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (ReservationModel reservationModel, _, __, ___, ____,
                  _____, ______) =>
              Text(
            reservationModel.hotelName ?? '',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).color.mainText),
          ),
        ),
      );
}
