import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';

///Page Title
class PageTitle extends StatelessWidget {
  ///Constructor
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (context, HotelsUiLogicState hotelsUiLogicState) {
          return hotelsUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess: (HotelModel hotelModel, _, __) => Text(
                    hotelModel.name ?? '',
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ));
        },
      );
}
