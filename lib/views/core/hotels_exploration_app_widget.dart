import 'package:flutter/material.dart';
import 'package:hotels_exploration/views/core/hotels_exploration_application.dart';

///Hotels Exploration App
class HotelsExplorationAppWidget extends StatelessWidget {
  ///Constructor
  const HotelsExplorationAppWidget({super.key});

  //TODO add MultiBlocProvider here after build the app logic
  @override
  Widget build(BuildContext context) => const HotelsExplorationApplication();
}
