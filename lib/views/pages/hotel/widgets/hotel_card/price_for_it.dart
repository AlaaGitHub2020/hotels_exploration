import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';

///Price For It
class PriceForIt extends StatelessWidget {
  ///Constructor
  const PriceForIt({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (_, HotelsUiLogicState hotelsUiLogicState) =>
            hotelsUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (HotelModel hotelModel, _, __) => Expanded(
            child: Text(hotelModel.priceForIt ?? '',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Theme.of(context).color.priceForItTextColor)),
          ),
        ),
      );
}
