import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';

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
            buildRatingText(),
          ],
        ),
      );

  ///Card Decoration
  BoxDecoration buildCardDecoration(BuildContext context) => BoxDecoration(
        color: Theme.of(context).color.ratingNameTextColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      );

  ///Rating Text
  BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState> buildRatingText() =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder:
            (BuildContext context, HotelsUiLogicState hotelsUiLogicState) =>
                hotelsUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (HotelModel hotelModel, _, __) => Expanded(
            child: Text(
                '${hotelModel.rating ?? ''} ${hotelModel.ratingName ?? ''}',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                      color: Theme.of(context).color.secondText,
                    )),
          ),
        ),
      );
}
