import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_exploration/app_logic/hotels_ui_logic/hotels_ui_logic_bloc.dart';
import 'package:hotels_exploration/injection.dart';
import 'package:hotels_exploration/views/core/hotels_exploration_application.dart';

///Hotels Exploration App
class HotelsExplorationAppWidget extends StatelessWidget {
  ///Constructor
  const HotelsExplorationAppWidget({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<HotelsUiLogicBloc>(
            create: (BuildContext context) => getIt<HotelsUiLogicBloc>()
              ..add(HotelsUiLogicEvent.getHotelData()),
          ),
        ],
        child: const HotelsExplorationApplication(),
      );
}
