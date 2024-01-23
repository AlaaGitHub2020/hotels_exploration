import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/views/widgets/rating_card.dart';

///Hotel Rating Card
class HotelRatingCard extends StatelessWidget {
  ///Constructor
  const HotelRatingCard({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder:
            (BuildContext context, HotelsUiLogicState hotelsUiLogicState) =>
                hotelsUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (HotelModel hotelModel, _, __) => RatingCard(
              ratingText:
                  '${hotelModel.rating ?? ''} ${hotelModel.ratingName ?? ''}'),
        ),
      );
}
