import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/reservation_ui_logic/reservation_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
import 'package:hotels_exploration/views/widgets/rating_card.dart';

///Reservation Rating Card
class ReservationRatingCard extends StatelessWidget {
  ///Constructor
  const ReservationRatingCard({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ReservationUiLogicBloc, ReservationUiLogicState>(
        builder: (BuildContext context,
                ReservationUiLogicState reservationUiLogicState) =>
            reservationUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (ReservationModel reservationModel, _, __, ___, ____,
                  _____, ______) =>
              RatingCard(
                  ratingText:
                      '${reservationModel.hotelRating ?? ''} ${reservationModel.ratingName ?? ''}'),
        ),
      );
}
