import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/about_the_hotel_card/peculiarities_card.dart';

///Peculiarities List
class PeculiaritiesList extends StatelessWidget {
  ///Constructor
  const PeculiaritiesList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
        builder: (_, HotelsUiLogicState hotelsUiLogicState) {
          return hotelsUiLogicState.maybeWhen(
              orElse: Container.new,
              actionSuccess: (HotelModel hotelModel, __, ___) {
                final List<String?>? peculiarities =
                    hotelModel.aboutTheHotel?.peculiarities;
                final List<Widget> peculiaritiesWidgets =
                    peculiarities?.map((text) {
                          return PeculiaritiesCard(text: text!);
                        }).toList() ??
                        [];

                return Wrap(children: peculiaritiesWidgets);
              });
        },
      );
}
