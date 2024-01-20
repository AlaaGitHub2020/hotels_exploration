import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

///Room Route
@RoutePage()
class RoomRoute extends StatelessWidget {
  ///Constructor
  const RoomRoute({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('RoomRoute'),
      );
}
