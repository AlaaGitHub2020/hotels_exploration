import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';

///Hotel Description
class HotelDescription extends StatelessWidget {
  ///Constructor
  const HotelDescription({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (_, HotelsUiLogicState hotelsUiLogicState) {
          return hotelsUiLogicState.maybeWhen(
            orElse: Container.new,
            actionSuccess: (HotelModel hotelModel, __, ___) => Text(
              hotelModel.aboutTheHotel?.description ?? '',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          );
        },
      );
}
