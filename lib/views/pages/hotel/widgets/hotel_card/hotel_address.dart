import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/core/utilities/themes/theme_data_extension.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';

///Hotel Address
class HotelAddress extends StatelessWidget {
  ///Constructor
  const HotelAddress({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (_, HotelsUiLogicState hotelsUiLogicState) =>
            hotelsUiLogicState.maybeWhen(
          orElse: Container.new,
          actionSuccess: (HotelModel hotelModel, _, __) => TextButton(
            onPressed: () => false,
            child: Text(
              hotelModel.address ?? '',
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
