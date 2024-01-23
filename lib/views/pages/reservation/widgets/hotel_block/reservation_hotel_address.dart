import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';

///Reservation Hotel Address
class ReservationHotelAddress extends StatelessWidget {
  ///Constructor
  const ReservationHotelAddress({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (_, ReservationUiLogicState reservationUiLogicState) =>
            reservationUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess:
              (ReservationModel reservationModel, _, __, ___, ____) =>
                  TextButton(
            onPressed: () => false,
            child: Text(
              reservationModel.hotelAddress ?? '',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).color.addressTextColor),
            ),
          ),
        ),
      );
}
