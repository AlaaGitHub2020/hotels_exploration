import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/generated/l10n.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/error_widget.dart';
import 'package:hotels_exploration/views/pages/hotel/widgets/hotel_body.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<HotelsUiLogicBloc, HotelsUiLogicState>(
          builder: (_, HotelsUiLogicState hotelsUiLogicState) {
            return hotelsUiLogicState.maybeWhen(
              orElse: Container.new,
              loading: () => const Center(child: CircularProgressIndicator()),
              actionFailure: (ModelsFailure failure) => FailureWidget(
                failure: failure.map(
                  unexpected: (_) => null,
                  fetchHotelDataFailure: (_) =>
                      S.current.errorFetchHotelDataFailure,
                  fetchRoomsListFailure: (_) =>
                      S.current.errorFetchReservationDataFailure,
                  fetchReservationDataFailure: (_) =>
                      S.current.errorFetchRoomsListFailure,
                ),
              ),
              actionSuccess: (_, __, ___) => const HotelBody(),
            );
          },
        ),
      ),
    );
  }
}
